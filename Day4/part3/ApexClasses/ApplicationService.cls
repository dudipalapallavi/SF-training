public with sharing class ApplicationService {

    public static String submitApplication(Id studentId, Id jobId) {

        // Validate IDs
        if(studentId == null || jobId == null){
            return 'Student and Job are required.';
        }

        // Get Student
        Student__c student = [
            SELECT Id, Name, CGPA__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        // Get Job
        Job__c job = [
            SELECT Id, Name, Minimum_CGPA__c, Last_Date__c
            FROM Job__c
            WHERE Id = :jobId
            LIMIT 1
        ];

        // Check Last Date
        if(job.Last_Date__c < Date.today()){
            return 'Application deadline has passed.';
        }

        // Check CGPA
        if(student.CGPA__c < job.Minimum_CGPA__c){
            return 'Student is not eligible due to CGPA.';
        }

        // Duplicate Check
        List<Application__c> existingApplications = [
            SELECT Id
            FROM Application__c
            WHERE Student__c = :studentId
            AND Job__c = :jobId
            LIMIT 1
        ];

        if(!existingApplications.isEmpty()){
            return 'Application already exists.';
        }

        // Create Application
        Application__c application = new Application__c();

        application.Student__c = studentId;
        application.Job__c = jobId;
        application.Application_Date__c = Date.today();
        application.Status__c = 'Submitted';

        insert application;

        return 'Application submitted successfully.';
    }

    // -------------------------------
    // Bulk Validation Method (Chapter 7)
    // -------------------------------
    public static void validateApplications(List<Application__c> applications){

        Set<Id> studentIds = new Set<Id>();
        Set<Id> jobIds = new Set<Id>();

        // Collect Student and Job IDs
        for(Application__c app : applications){

            if(app.Student__c != null){
                studentIds.add(app.Student__c);
            }

            if(app.Job__c != null){
                jobIds.add(app.Job__c);
            }
        }

        // Get Students
        Map<Id, Student__c> studentMap = new Map<Id, Student__c>([
            SELECT Id, Name, CGPA__c
            FROM Student__c
            WHERE Id IN :studentIds
        ]);

        // Get Jobs
        Map<Id, Job__c> jobMap = new Map<Id, Job__c>([
            SELECT Id, Name, Minimum_CGPA__c, Last_Date__c
            FROM Job__c
            WHERE Id IN :jobIds
        ]);

        // Validate Applications
        for(Application__c app : applications){

            Student__c student = studentMap.get(app.Student__c);
            Job__c job = jobMap.get(app.Job__c);

            if(student == null || job == null){
                app.addError('Invalid Student or Job.');
                continue;
            }

            if(job.Last_Date__c < Date.today()){
                app.addError('Application deadline has passed.');
            }

            if(student.CGPA__c < job.Minimum_CGPA__c){
                app.addError('Student is not eligible due to CGPA.');
            }
        }
    }

}