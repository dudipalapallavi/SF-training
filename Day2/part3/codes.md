# codes
# 💻 Day 5 - Sprint 5
# Apex Code Implementation

---

# 1. StudentService.cls

```apex
public class StudentService {

    public static Student__c getStudent(Id studentId) {

        return [
            SELECT Id,
                   Name,
                   CGPA__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];
    }
}
```

---

# 2. JobService.cls

```apex
public class JobService {

    public static Job__c getJob(Id jobId) {

        return [
            SELECT Id,
                   Name,
                   Minimum_CGPA__c,
                   Last_Date__c
            FROM Job__c
            WHERE Id = :jobId
            LIMIT 1
        ];
    }
}
```

---

# 3. ApplicationService.cls

```apex
public class ApplicationService {

    public static void applyForJob(Id studentId, Id jobId) {

        // Retrieve Student Details
        Student__c student = StudentService.getStudent(studentId);

        // Retrieve Job Details
        Job__c job = JobService.getJob(jobId);

        // Check Duplicate Application
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

        // Eligibility Validation
        if (student.CGPA__c < job.Minimum_CGPA__c) {
            System.debug('Student is not eligible.');
            return;
        }

        // Create Application
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

---

# 4. Execute Anonymous - Test StudentService

```apex
Student__c s = [
    SELECT Id
    FROM Student__c
    LIMIT 1
];

Student__c student = StudentService.getStudent(s.Id);

System.debug(student);
```

---

# 5. Execute Anonymous - Test JobService

```apex
Job__c j = [
    SELECT Id
    FROM Job__c
    LIMIT 1
];

Job__c job = JobService.getJob(j.Id);

System.debug(job);
```

---

# 6. Execute Anonymous - Apply for Job

```apex
Student__c s = [
    SELECT Id
    FROM Student__c
    LIMIT 1
];

Job__c j = [
    SELECT Id
    FROM Job__c
    LIMIT 1
];

ApplicationService.applyForJob(s.Id, j.Id);
```

---

# Expected Results

✅ Student record retrieved successfully.

✅ Job record retrieved successfully.

✅ Duplicate applications prevented.

✅ Student eligibility validated.

✅ Application record created successfully.

✅ Status set to **Applied**.

---

# Objects Used

- Student__c
- Job__c
- Application__c

---

# Fields Used

## Student__c

- Name
- CGPA__c

## Job__c

- Name
- Minimum_CGPA__c
- Last_Date__c

## Application__c

- Student__c
- Job__c
- Status__c
- Application_Date__c

---

# Concepts Covered

- Apex Classes
- SOQL Queries
- DML (Insert)
- Business Validation
- Duplicate Record Checking
- Execute Anonymous
- Debug Logs
