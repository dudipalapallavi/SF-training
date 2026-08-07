
# 💻 Day 6 - Sprint 6
# Apex Trigger Implementation

---

# 1. ApplicationTrigger (Basic Trigger)

```apex
trigger ApplicationTrigger on Application__c (before insert) {

    System.debug('Application Trigger Executed');

}
```

---

# 2. Using Trigger.new

```apex
trigger ApplicationTrigger on Application__c (before insert) {

    for(Application__c app : Trigger.new){

        System.debug('Application Created');

        System.debug(app);

    }

}
```

---

# 3. Auto Populate Application Date

```apex
trigger ApplicationTrigger on Application__c (before insert) {

    for(Application__c app : Trigger.new){

        if(app.Application_Date__c == null){

            app.Application_Date__c = Date.today();

        }

    }

}
```

---

# 4. Trigger Handler

```apex
public class ApplicationTriggerHandler {

    public static void beforeInsert(List<Application__c> applications){

        for(Application__c app : applications){

            if(app.Application_Date__c == null){

                app.Application_Date__c = Date.today();

                System.debug('Application Date Added Automatically');

            }

        }

    }

}
```

---

# 5. Final Trigger

```apex
trigger ApplicationTrigger on Application__c (before insert) {

    if(Trigger.isBefore && Trigger.isInsert){

        ApplicationTriggerHandler.beforeInsert(Trigger.new);

    }

}
```

---

# Trigger Context Variables Used

- Trigger.new
- Trigger.isBefore
- Trigger.isInsert

---

# Objects Used

- Application__c

---

# Fields Used

- Student__c
- Job__c
- Status__c
- Application_Date__c

---

# Expected Output

✔ Trigger executes automatically.

✔ Trigger Handler is called.

✔ Application Date is automatically populated.

✔ Debug log displays execution messages.

---

# Concepts Covered

- Apex Trigger
- Trigger Context Variables
- Trigger.new
- Trigger Handler Pattern
- Before Insert Trigger
- Event Driven Programming
- Automatic Data Population
