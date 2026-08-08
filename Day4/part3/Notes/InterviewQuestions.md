# Sprint-04 Interview Questions

## 1. What is Business Logic?

Business logic is the set of rules that helps software make decisions according to business requirements.

---

## 2. Why should business logic be written in Apex?

Because Apex executes on the Salesforce platform and keeps business rules separate from the user interface.

---

## 3. Why do we use service classes?

To organize responsibilities and make code easier to understand, test, and maintain.

---

## 4. What is the responsibility of ApplicationService?

It handles the application process, including receiving applications, validating rules, and returning meaningful results.

---

## 5. Why should every class have one responsibility?

It improves readability, maintainability, and scalability.


# Chapter 7 – Interview Questions

## 1. What is Bulkification?

Bulkification means writing Apex that can process multiple records efficiently in one transaction.

## 2. What is Trigger.new?

Trigger.new is a collection containing the records involved in the current trigger transaction.

## 3. Why use Set?

A Set stores unique values. It is useful for collecting record IDs before performing bulk SOQL.

## 4. Why use Map?

A Map provides fast access to records using their Salesforce IDs.

## 5. Why avoid SOQL inside loops?

Salesforce has governor limits on the number of SOQL queries that can be executed in a transaction.

## 6. What is the Trigger Handler Pattern?

The trigger delegates processing to a handler class instead of containing business logic directly.

## 7. What is the Service Layer?

The service layer contains reusable business logic.

## 8. How did you make the Application validation bulk-safe?

I collected all Student and Job IDs into Sets, queried the related records once, stored them in Maps, and then processed the Application collection.

## 9. How did you test bulk processing?

I tested the implementation with 1, 50, and 200 Application records.

## 10. What is addError()?

addError() prevents a record from being saved and displays a validation error to the user.