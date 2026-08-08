# Chapter 7 – Bulk-Safe Apex

## 1. ApplicationTrigger.trigger

```apex
trigger ApplicationTrigger on Application__c (before insert) {

    if (Trigger.isBefore && Trigger.isInsert) {

        ApplicationTriggerHandler.beforeInsert(Trigger.new);

    }

}
```

## 2. ApplicationTriggerHandler.cls

```apex
public with sharing class ApplicationTriggerHandler {

    public static void beforeInsert(
        List<Application__c> applications
    ) {

        ApplicationService.validateApplications(applications);

    }

}
```

## 3. ApplicationService.cls

### Existing Application Logic

```apex
public class ApplicationService {

    public static void applyForJob(Id studentId, Id jobId) {

        Student__c student = StudentService.getStudent(studentId);

        Job__c job = JobService.getJob(jobId);

        List<Application__c> existingApplications = [
            SELECT Id
            FROM Application__c
            WHERE Student__c = :studentId
            AND Job__c = :jobId
        ];

        if (!existingApplications.isEmpty()) {
            System.debug('Student has already applied for this job.');
            return;
        }

        if (student.CGPA__c < job.Minimum_CGPA__c) {
            System.debug('Student is not eligible.');
            return;
        }

        Application__c app = new Application__c();
        app.Student__c = student.Id;
        app.Job__c = job.Id;
        app.Status__c = 'Applied';
        app.Application_Date__c = Date.today();

        insert app;

        System.debug('Application submitted successfully.');
    }
}
```

### Bulk Validation Method

```apex
public static void validateApplications(
    List<Application__c> applications
) {

    Set<Id> studentIds = new Set<Id>();
    Set<Id> jobIds = new Set<Id>();

    for (Application__c app : applications) {

        if (app.Student__c != null) {
            studentIds.add(app.Student__c);
        }

        if (app.Job__c != null) {
            jobIds.add(app.Job__c);
        }
    }

    Map<Id, Student__c> studentsById =
        new Map<Id, Student__c>(
            [
                SELECT Id, Name, CGPA__c
                FROM Student__c
                WHERE Id IN :studentIds
            ]
        );

    Map<Id, Job__c> jobsById =
        new Map<Id, Job__c>(
            [
                SELECT Id, Name, Minimum_CGPA__c, Last_Date__c
                FROM Job__c
                WHERE Id IN :jobIds
            ]
        );

    for (Application__c app : applications) {

        Student__c student =
            studentsById.get(app.Student__c);

        Job__c job =
            jobsById.get(app.Job__c);

        if (student == null) {
            app.addError('Student record not found.');
            continue;
        }

        if (job == null) {
            app.addError('Job record not found.');
            continue;
        }

        if (job.Last_Date__c != null &&
            job.Last_Date__c < Date.today()) {

            app.addError(
                'Application deadline has passed.'
            );
        }

        if (student.CGPA__c < job.Minimum_CGPA__c) {

            app.addError(
                'Student is not eligible due to CGPA.'
            );
        }
    }
}
```

## Bulk Processing Approach

```text
Trigger.new
    ↓
List<Application__c>
    ↓
Collect Student IDs → Set<Id>
    ↓
Collect Job IDs → Set<Id>
    ↓
Query Students once
    ↓
Query Jobs once
    ↓
Store records in Maps
    ↓
Validate Applications
```

## Bulk Tests

- 1 Application – Passed
- 50 Applications – Passed
- 200 Applications – Passed
