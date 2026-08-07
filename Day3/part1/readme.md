# 📘 Day 6 - Part 1
# Chapter 6 - Making Software Respond Automatically

## 📌 Sprint 6: Discovering the Power of Apex Triggers

---

# 🎯 Learning Objectives

After completing this sprint, I learned to:

- Understand why enterprise software responds automatically to business events.
- Learn the role of Apex Triggers in Salesforce.
- Identify situations where automation improves business efficiency.
- Understand different Trigger events.
- Design clean and maintainable Trigger architecture.
- Keep business logic inside Service classes instead of Triggers.
- Think like an enterprise Salesforce developer.

---

# 📖 Introduction

Until the previous sprint, the Placement Management System could:

- Retrieve student information.
- Retrieve job information.
- Validate business rules.
- Create applications.
- Update application records.

However, every operation required user interaction.

In this sprint, the application learns to respond automatically whenever an important business event occurs.

---

# 💡 What is an Apex Trigger?

An Apex Trigger is a piece of code that automatically executes when a specific event occurs on a Salesforce object.

Instead of waiting for a user to perform every action, Salesforce automatically responds when records are created, updated, deleted, or restored.

Triggers make Salesforce applications event-driven.

---

# 🏢 Why Automation Matters

Enterprise applications manage thousands of records every day.

Performing every task manually is inefficient and increases the risk of human error.

Automation helps by:

- Reducing repetitive work.
- Ensuring business rules are followed consistently.
- Improving productivity.
- Reducing administrative effort.
- Providing reliable business processes.

---

# 📌 Business Events

A Trigger responds whenever an important business event occurs.

Examples include:

- A new student registers.
- A company posts a new job.
- A student submits an application.
- An application status changes.
- A recruiter selects a candidate.

These events automatically start business processes without requiring additional user actions.

---

# 🔄 Event-Driven Software

Traditional software waits for user instructions.

Event-driven software automatically reacts when business data changes.

Examples:

- Automatic placement status updates.
- Sending notification emails.
- Updating dashboards.
- Refreshing reports.
- Recording audit information.

---

# 🧩 Trigger Responsibilities

A Trigger should have only one responsibility:

✔ Observe the business event.

✔ Notify the appropriate Service class.

A Trigger should NOT contain:

- Business validation
- SOQL queries
- DML operations
- Complex calculations
- Notification logic

Keeping Triggers small makes applications easier to maintain.

---

# ⚙ Trigger Events

Salesforce supports several Trigger events.

Common examples include:

### Before Events

- Before Insert
- Before Update
- Before Delete

These events are generally used for validation before records are saved.

### After Events

- After Insert
- After Update
- After Delete

These events are generally used when additional actions are required after records have been successfully saved.

---

# 🏗 Clean Architecture

Professional Salesforce applications separate responsibilities.

### Trigger

- Detects the business event.
- Calls the appropriate Service class.

### Service Class

- Performs business validation.
- Executes SOQL.
- Performs DML.
- Applies business rules.

This separation improves readability, maintainability, and scalability.

---

# ⭐ Engineering Principles

- Automation begins with business events.
- Keep Triggers simple.
- Place business logic inside Service classes.
- One Trigger should observe one event.
- One business event can trigger multiple business processes.

---

# 📌 Real-World Example

Business Event:

A student's application status changes to **Selected**.

Automatic Actions:

- Update placement status.
- Notify the Placement Officer.
- Refresh placement dashboard.
- Send a congratulatory email.
- Record placement statistics.

The user performs only one action, while Salesforce completes the remaining tasks automatically.

---

# 📝 Key Takeaways

- Apex Triggers automate business processes.
- Triggers respond to business events.
- Business logic belongs inside Service classes.
- Clean Trigger architecture improves maintainability.
- Enterprise software relies heavily on automation.

---

# 🚀 Sprint Outcome

After completing Sprint 6, I understood how Salesforce Triggers respond automatically to business events and how clean Trigger architecture helps build scalable and maintainable enterprise applications.
