# 📖 Day 6 - Part 2
# Sprint 6 - Revision Notes & Interview Questions

---

# 📌 Sprint Summary

Sprint 6 introduces **Apex Triggers**, which enable Salesforce to respond automatically whenever important business events occur.

Instead of requiring users to perform every task manually, Triggers automate business processes by executing code when records are inserted, updated, deleted, or restored.

The main objective of this sprint is to understand **when automation should occur** and **how to design clean Trigger architecture**.

---

# 📚 Quick Revision

## 🔹 What is an Apex Trigger?

An Apex Trigger is a piece of Apex code that executes automatically when a specific event occurs on a Salesforce object.

It allows Salesforce to respond automatically to changes in business data.

---

## 🔹 Why do we use Triggers?

Triggers help automate business processes.

Benefits include:

- Reduce manual work
- Improve business efficiency
- Enforce business rules
- Maintain data consistency
- Improve user productivity

---

# 🔹 Business Events

A Trigger starts when a business event occurs.

Examples include:

- New Student Registration
- New Job Posting
- Student Application Submission
- Application Status Update
- Placement Offer Accepted

These events automatically start business processes.

---

# 🔹 Trigger Responsibilities

A Trigger should:

- Observe the business event
- Call the appropriate Service class

A Trigger should NOT:

- Perform complex business logic
- Execute large SOQL queries
- Contain DML operations
- Send emails directly
- Perform calculations

Business logic should always remain inside Service classes.

---

# 🔹 Trigger Events

## Before Triggers

Used before records are saved.

Examples:

- before insert
- before update
- before delete

Purpose:

- Validation
- Data modification before save

---

## After Triggers

Used after records are saved.

Examples:

- after insert
- after update
- after delete

Purpose:

- Notifications
- Dashboard updates
- Statistics updates
- Email alerts

---

# 📊 Before Trigger vs After Trigger

| Before Trigger | After Trigger |
|---------------|--------------|
| Executes before saving records | Executes after saving records |
| Used for validation | Used for post-save actions |
| Modify field values | Send notifications |
| Prevent invalid data | Update reports and dashboards |

---

# 🔄 Trigger Architecture

```
Business Event
        │
        ▼
 Apex Trigger
        │
        ▼
 Service Class
        │
        ▼
 Business Logic
        │
        ▼
 Salesforce Database
```

---

# ⭐ Engineering Principles

✔ Every Trigger begins with a business event.

✔ Trigger should observe, not decide.

✔ Business logic belongs inside Service classes.

✔ Keep Triggers short and readable.

✔ One business event can trigger multiple services.

---

# 🎯 Best Practices

- Keep one Trigger per object.
- Move business logic to Service classes.
- Write reusable code.
- Avoid duplicate logic.
- Use Trigger context variables properly.
- Keep Triggers easy to understand.

---

# ❓ Interview Questions

### 1. What is an Apex Trigger?

An Apex Trigger is Apex code that executes automatically when a record event occurs in Salesforce.

---

### 2. Why do we use Triggers?

To automate business processes whenever records are created, updated, or deleted.

---

### 3. What is the difference between Before and After Triggers?

Before Triggers execute before records are saved and are mainly used for validation.

After Triggers execute after records are saved and are mainly used for post-save actions such as notifications and dashboard updates.

---

### 4. Why should business logic not be written inside Triggers?

Keeping business logic inside Service classes improves maintainability, readability, and code reuse.

---

### 5. What is a business event?

A business event is an important change in business data that requires Salesforce to respond automatically.

Example:

- Student applies for a job.
- Student gets selected.

---

### 6. Why is Trigger architecture important?

Good Trigger architecture keeps the application scalable, reusable, and easy to maintain.

---

### 7. Can one business event trigger multiple actions?

Yes.

One Trigger event can call multiple Service classes to perform different business activities independently.

---

### 8. What are some examples of automatic actions performed by Triggers?

- Update placement status
- Send email notifications
- Update dashboards
- Refresh reports
- Record audit information

---

# 📝 One-Minute Revision

✔ Trigger = Automatic Execution

✔ Trigger starts with a Business Event

✔ Trigger observes the event

✔ Service class performs business logic

✔ Before Trigger → Validation

✔ After Trigger → Notifications & Updates

✔ Keep Triggers small and maintainable

---

# 🚀 Sprint Outcome

After completing Sprint 6, I understood how Apex Triggers respond automatically to business events, why Triggers should remain lightweight, and how Service classes help build clean, scalable, and maintainable Salesforce applications.
