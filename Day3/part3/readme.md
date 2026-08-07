#readme
# 💻 Day 6 - Part 3
# Sprint 6 - Apex Triggers Practical

## 🎯 Objective

The objective of this sprint is to understand how Apex Triggers automatically execute when a business event occurs.

Instead of waiting for user actions, Salesforce automatically performs operations whenever records are inserted, updated, or deleted.

---

# Practical Tasks Completed

## Task 1

Created the first Apex Trigger.

**Trigger Name**

ApplicationTrigger

**Object**

Application__c

Status

✅ Completed

---

## Task 2

Executed Trigger automatically when a new Application record was created.

Status

✅ Completed

---

## Task 3

Used Trigger.new to access newly inserted records.

Status

✅ Completed

---

## Task 4

Automatically populated the Application Date when the field was left empty.

Status

✅ Completed

---

## Task 5

Created a Trigger Handler class.

Status

✅ Completed

---

## Task 6

Connected Trigger with Trigger Handler.

Status

✅ Completed

---

# Business Flow

```
Create Application
        │
        ▼
Application Trigger Fires
        │
        ▼
ApplicationTriggerHandler
        │
        ▼
Validate Data
        │
        ▼
Populate Application Date
        │
        ▼
Save Record
```

---

# Files Created

- ApplicationTrigger.trigger
- ApplicationTriggerHandler.cls

---

# Concepts Covered

- Apex Trigger
- Trigger Events
- Trigger.new
- Trigger.isBefore
- Trigger.isInsert
- Trigger Handler
- Event Driven Programming
- Automation

---

# Expected Result

- Trigger executes automatically.
- Application Date is populated automatically.
- Trigger calls the Handler class.
- Business logic remains outside the Trigger.

---

# Screenshots

- 01_ApplicationTrigger_Created.png
- 02_Application_Record.png
- 03_Trigger_Executed.png
- 04_Trigger_New.png
- 05_Trigger_New_Output.png
- 06_ApplicationTriggerHandler.png
- 07_Final_ApplicationTrigger.png
- 08_Auto_ApplicationDate.png
- 09_Debug_Log.png

---

# Learning Outcome

After completing this sprint, I understood how Salesforce Triggers respond automatically to business events and how Trigger Handler architecture improves code maintainability.
