# 📖 Day 2 - Part 2
# Sprint 5 - Revision Notes & Interview Questions

## 📌 Sprint Summary

Sprint 5 focuses on retrieving and managing Salesforce data using **SOQL** and **DML**. Before changing any data, the application retrieves the required information, validates business rules, and then performs the appropriate DML operation.

---

# 📚 Quick Revision

## 🔹 SOQL (Salesforce Object Query Language)

### Purpose

Retrieve records from Salesforce Objects.

### Used For

- Reading data
- Searching records
- Retrieving specific fields
- Filtering records using conditions

### Example Business Questions

- What is the student's CGPA?
- Which students belong to the CSE branch?
- Has the student already applied?
- Which jobs are currently open?

---

## 🔹 DML (Data Manipulation Language)

### Purpose

Modify Salesforce records.

### DML Operations

- Insert
- Update
- Delete
- Undelete (Platform Supported)

### Examples

Create Application

Update Application Status

Delete Old Records

---

# 🔄 Business Transaction Flow

```
Student Clicks Apply
        │
        ▼
Retrieve Student
        │
        ▼
Retrieve Job
        │
        ▼
Validate Eligibility
        │
        ▼
Check Duplicate
        │
        ▼
Create Application
        │
        ▼
Save Record
        │
        ▼
Return Confirmation
```

---

# 📋 SOQL vs DML

| SOQL | DML |
|------|-----|
| Retrieves Data | Modifies Data |
| Used to Read Records | Used to Insert/Update/Delete Records |
| Does Not Change Data | Changes Data |
| Executed Before Validation | Executed After Validation |

---

# ⭐ Engineering Principles

✅ Retrieve information before making decisions.

✅ Every SOQL query should answer one business question.

✅ Retrieve only the required fields.

✅ Never perform DML before business validation.

✅ Technology should support business requirements.

---

# 🎯 Best Practices

- Query only the fields you need.
- Avoid unnecessary SOQL queries.
- Validate all business rules before DML.
- Keep methods small and reusable.
- Write clean and readable Apex code.

---

# ❓ Interview Questions

### 1. What is SOQL?

SOQL (Salesforce Object Query Language) is used to retrieve records from Salesforce objects.

---

### 2. Why do we use SOQL?

To fetch the required business information before making decisions.

---

### 3. What is DML?

DML (Data Manipulation Language) is used to create, update, delete, or restore Salesforce records.

---

### 4. Why should SOQL execute before DML?

Because the application must retrieve data and validate business rules before modifying records.

---

### 5. What is the difference between SOQL and DML?

SOQL retrieves data, while DML changes data.

---

### 6. Why should we retrieve only required fields?

To improve application performance and reduce unnecessary resource usage.

---

### 7. What happens if DML is executed before validation?

Incorrect or invalid data may be stored in Salesforce.

---

### 8. What is a business transaction?

A sequence of steps where software retrieves information, validates business rules, updates data, and returns a result.

---

# 📝 One-Minute Revision

✔ SOQL retrieves data.

✔ DML modifies data.

✔ Retrieve → Validate → Save.

✔ Every query should solve one business problem.

✔ Never change business data before validation.

✔ Think about business requirements before writing code.

---

# 🚀 Sprint Outcome

At the end of Sprint 5, I understood how Salesforce applications retrieve information using SOQL, validate business rules, and use DML to complete real-world business transactions in a Placement Management System.
