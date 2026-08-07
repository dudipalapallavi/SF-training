# 📖 Day 7 - Part 2
# Chapter 7 - Revision Notes & Interview Questions

---

#  Chapter Summary

Chapter 7 introduces the concept of **Bulk Processing** and **Governor Limits** in Salesforce.

Apex code should not be written only for a single record. It must be designed to process hundreds of records efficiently while staying within Salesforce Governor Limits.

The main goal is to think like an engineer and design scalable applications.

---

# 📚 Quick Revision

## 🔹 What is Scalability?

Scalability is the ability of an application to process a large number of records efficiently without performance issues or failures.

Example:

- 1 Student Record ✅
- 200 Student Records ✅
- 10,000 Student Records ✅

A good Salesforce application should work correctly in all these scenarios.

---

## 🔹 What are Governor Limits?

Governor Limits are restrictions enforced by Salesforce to ensure fair usage of shared platform resources.

Since Salesforce is a multi-tenant platform, every organization shares the same infrastructure.

Governor Limits prevent one application from consuming excessive resources.

---

## 🔹 Common Governor Limits

| Resource | Typical Limit |
|----------|---------------|
| SOQL Queries | 100 |
| Records Retrieved | 50,000 |
| DML Statements | 150 |
| DML Records | 10,000 |
| CPU Time | 10,000 ms |
| Heap Size | 6 MB |

> **Note:** Focus on understanding why these limits exist rather than memorizing every value.

---

# 🔹 What is Bulkification?

Bulkification is the process of designing Apex code that can safely process multiple records in one transaction.

Bulkified code:

- Processes collections.
- Uses fewer database operations.
- Improves performance.
- Prevents Governor Limit exceptions.

---

# 🔹 Collections in Apex

## List

Stores an ordered collection of records.

Example:

```apex
List<Application__c> applications;
```

Used when processing multiple records together.

---

## Set

Stores unique values.

Example:

```apex
Set<Id> studentIds;
```

Used to collect unique Student IDs before querying Salesforce.

---

## Map

Stores key-value pairs.

Example:

```apex
Map<Id, Student__c> studentsById;
```

Used to quickly retrieve records without additional SOQL queries.

---

# 🔹 Bulk Processing Pattern

Professional Salesforce developers follow this sequence:

```
Receive Records
        │
        ▼
Collect IDs
        │
        ▼
Bulk SOQL
        │
        ▼
Store in Maps
        │
        ▼
Process in Memory
        │
        ▼
Collect Records
        │
        ▼
Bulk DML
```

---

# 🔹 Dangerous Coding Patterns

## SOQL Inside Loop ❌

```apex
for(Application__c app : Trigger.new){

    Student__c student = [
        SELECT Id
        FROM Student__c
        WHERE Id = :app.Student__c
    ];

}
```

Problem:

One query executes for every record.

---

## Bulk SOQL ✅

Collect all Student IDs first.

Run one SOQL query.

Store results in a Map.

Process records using the Map.

---

## DML Inside Loop ❌

```apex
for(Application__c app : Trigger.new){

    update app;

}
```

Problem:

One DML statement executes for every record.

---

## Bulk DML ✅

Collect records first.

Execute one update statement outside the loop.

---

# 📊 Record Thinking vs Collection Thinking

| Record Thinking | Collection Thinking |
|-----------------|--------------------|
| One Record | Many Records |
| Query Repeatedly | Query Once |
| Update One by One | Update Together |
| High Resource Usage | Efficient Resource Usage |

---

# ⭐ Engineering Principles

✔ Think about 200 records instead of one.

✔ Never place SOQL inside loops.

✔ Never place DML inside loops.

✔ Use Lists, Sets, and Maps.

✔ Query once and process in memory.

✔ Save records together.

---

# 🎯 Best Practices

- Write bulk-safe Apex.
- Minimize database operations.
- Reuse queried data.
- Process collections efficiently.
- Keep Trigger logic lightweight.
- Use Service classes for business logic.

---

# ❓ Interview Questions

### 1. What are Governor Limits?

Governor Limits are Salesforce-enforced limits that control resource usage in a transaction to ensure fair use of the multi-tenant platform.

---

### 2. Why does Salesforce have Governor Limits?

To ensure that one organization's code does not negatively affect other organizations sharing the same platform.

---

### 3. What is Bulkification?

Bulkification is the practice of writing Apex code that processes multiple records efficiently in a single transaction.

---

### 4. Why is SOQL inside a loop dangerous?

Because one query executes for every record, which can exceed the SOQL Governor Limit.

---

### 5. Why is DML inside a loop dangerous?

Because one DML statement executes for every record, which can exceed the DML Governor Limit.

---

### 6. Why do we use Sets?

Sets remove duplicate values and help prepare efficient bulk SOQL queries.

---

### 7. Why do we use Maps?

Maps allow quick access to records already retrieved, avoiding repeated database queries.

---

### 8. What is the difference between record thinking and collection thinking?

Record thinking processes one record at a time.

Collection thinking processes multiple records together using bulk-safe architecture.

---

### 9. What is the Bulk Processing Pattern?

Receive records → Collect IDs → Bulk SOQL → Store in Maps → Process in Memory → Bulk DML.

---

### 10. Why is bulkification important?

Bulkification improves scalability, performance, and ensures Apex code stays within Governor Limits.

---

# 📝 One-Minute Revision

✔ Salesforce is a multi-tenant platform.

✔ Governor Limits protect shared resources.

✔ Bulkification = Process multiple records safely.

✔ Lists store records.

✔ Sets store unique values.

✔ Maps provide fast record lookup.

✔ Avoid SOQL inside loops.

✔ Avoid DML inside loops.

✔ Think in collections, not individual records.

---

# 🚀 Chapter Outcome

After completing Chapter 7, I understood how to design scalable Apex applications using bulk processing techniques, Governor Limits, Lists, Sets, Maps, Bulk SOQL, and Bulk DML while following Salesforce engineering best practices.
