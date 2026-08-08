@isTest
public class ApplicationServiceTest {

    @isTest
    static void testSubmitApplicationSuccess() {

        // Create Student
        Student__c student = new Student__c(
            Name = 'Pallavi',
            CGPA__c = 9
        );
        insert student;

        // Create Job
        Job__c job = new Job__c(
            Name = 'Software Engineer',
            Minimum_CGPA__c = 7,
            Last_Date__c = Date.today().addDays(5)
        );
        insert job;

        Test.startTest();

        String result = ApplicationService.submitApplication(student.Id, job.Id);

        Test.stopTest();

        System.assertEquals('Application submitted successfully.', result);

        List<Application__c> apps = [
            SELECT Id, Status__c
            FROM Application__c
            WHERE Student__c = :student.Id
        ];

        System.assertEquals(1, apps.size());
        System.assertEquals('Submitted', apps[0].Status__c);
    }

    @isTest
    static void testLowCGPA() {

        Student__c student = new Student__c(
            Name='Rahul',
            CGPA__c=5
        );
        insert student;

        Job__c job = new Job__c(
            Name='Developer',
            Minimum_CGPA__c=8,
            Last_Date__c=Date.today().addDays(3)
        );
        insert job;

        Test.startTest();

        String result = ApplicationService.submitApplication(student.Id,job.Id);

        Test.stopTest();

        System.assertEquals(
            'Student is not eligible due to CGPA.',
            result
        );
    }

    @isTest
    static void testDeadlineExpired(){

        Student__c student = new Student__c(
            Name='Anu',
            CGPA__c=9
        );
        insert student;

        Job__c job = new Job__c(
            Name='Tester',
            Minimum_CGPA__c=7,
            Last_Date__c=Date.today().addDays(-1)
        );
        insert job;
        
        Test.startTest();

        String result = ApplicationService.submitApplication(student.Id,job.Id);

        Test.stopTest();

        System.assertEquals(
            'Application deadline has passed.',
            result
        );
    }

    @isTest
    static void testDuplicateApplication(){

        Student__c student = new Student__c(
            Name='Sai',
            CGPA__c=9
        );
        insert student;

        Job__c job = new Job__c(
            Name='Admin',
            Minimum_CGPA__c=8,
            Last_Date__c=Date.today().addDays(5)
        );
        insert job;

        Application__c app = new Application__c(
            Student__c=student.Id,
            Job__c=job.Id,
            Application_Date__c=Date.today(),
            Status__c='Submitted'
        );
        insert app;

        Test.startTest();

        String result = ApplicationService.submitApplication(student.Id,job.Id);

        Test.stopTest();

        System.assertEquals(
            'Application already exists.',
            result
        );
    }
}