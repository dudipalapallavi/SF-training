
# Sprint 17 - Story 1

## Files Created

### ApplicationTrigger.trigger

```apex
trigger ApplicationTrigger on Application__c (before insert) {

    if (Trigger.isBefore && Trigger.isInsert) {
        ApplicationTriggerHandler.beforeInsert(Trigger.new);
    }

}
```

### ApplicationTriggerHandler.cls

```apex
public with sharing class ApplicationTriggerHandler {

    public static void beforeInsert(List<Application__c> applications) {

        ApplicationService.validateApplications(applications);

    }

}
```

### ApplicationService.cls (New Method)

```apex
public static void validateApplications(List<Application__c> applications) {

    System.debug('Validating Applications...');

}
```
