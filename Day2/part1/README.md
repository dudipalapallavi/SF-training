# 📘 Day 2 - Part 1
# Sprint 5: Making Software Talk to Data

## 📌 Topic

**Making Software Talk to Data – Retrieving and Managing Information with SOQL and DML**

---

# 🎯 Learning Objectives

By the end of this sprint, I learned to:

- Understand why enterprise software retrieves data before making decisions.
- Understand the role of SOQL in Salesforce applications.
- Understand when and why DML operations are required.
- Retrieve Salesforce records using Apex.
- Create and update Salesforce records using DML.
- Think of data as a business asset rather than just database rows.
- Write clean, efficient, and reusable data access code.

---

# 📖 Introduction

In the previous sprint, the application learned how to validate business rules.

In this sprint, the application learns how to retrieve information from Salesforce and perform business transactions.

A software application cannot make correct decisions without first retrieving the required information.

---

# 💡 Engineering Principle

**Retrieve information first. Decide afterwards.**

Professional developers always ask:

> "What information is required before making this business decision?"

Every SOQL query should answer one business question.

---

# 📂 Why Data Matters

A Salesforce record is more than just stored information.

### Student Record

Represents:

- Academic performance
- Career goals
- Placement opportunities

### Job Record

Represents:

- Company requirements
- Employment opportunities
- Recruitment process

Good software engineers respect data because every record represents real business information.

---

# 🔍 What is SOQL?

**SOQL (Salesforce Object Query Language)** is used to retrieve records from Salesforce objects.

SOQL helps software ask questions such as:

- What is the student's CGPA?
- Which department does the student belong to?
- Has the student already applied?
- What is the company's eligibility criteria?

SOQL retrieves only the information required by the business.

---

# ✍️ What is DML?

**DML (Data Manipulation Language)** is used to change Salesforce data.

It performs operations such as:

- Create Records
- Update Records
- Delete Records
- Restore Records (where supported)

DML is executed only after all business validations are completed.

---

# 🔄 Business Transaction Flow

A complete Placement Management transaction follows this sequence:

1. Retrieve Student Information
2. Retrieve Job Information
3. Validate Eligibility
4. Check Duplicate Applications
5. Create Application Record
6. Save Record using DML
7. Display Confirmation

---

# ⭐ Best Practices

- Retrieve only the required fields.
- Avoid unnecessary SOQL queries.
- Perform validations before DML.
- Keep business logic clean and reusable.
- Think about business requirements before writing code.

---

# 📝 Key Takeaways

- Software must retrieve information before making decisions.
- SOQL is used to retrieve Salesforce data.
- DML is used to create and update Salesforce records.
- Every query should solve one business problem.
- Every data change should follow business validation.

---

# 📚 Sprint Outcome

After completing this sprint, I understood how SOQL, DML, and Apex work together to build a complete business transaction in a Salesforce application.
