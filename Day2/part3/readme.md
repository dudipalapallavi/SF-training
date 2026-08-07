# 💻 Day 2 - Part 3
# Sprint 5 - Practical Implementation

## 🎯 Objective

Implement a complete Placement Management business transaction using Apex, SOQL, and DML.

The application should:

- Retrieve student information
- Retrieve job information
- Validate eligibility
- Prevent duplicate applications
- Create a new application
- Update application status
- Return meaningful confirmation to the user

---

# 📌 User Stories

### US-7
Retrieve student information before processing applications.

**Status:** ✅ Completed

---

### US-8

Retrieve job eligibility details.

**Status:** ✅ Completed

---

### US-9

Check whether the student has already applied.

**Status:** ✅ Completed

---

### US-10

Create a new application using DML.

**Status:** ✅ Completed

---

### US-11

Update application status.

**Status:** ✅ Completed

---

### US-12

Return meaningful feedback.

**Status:** ✅ Completed

---

# 🏗 Business Transaction Flow

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
Update Status
        │
        ▼
Return Confirmation
```

---

# 📂 Files Created

- StudentService.cls
- JobService.cls
- ApplicationService.cls
- ApplicationController.cls

---

# 🧪 Test Scenarios

| Test Case | Expected Result |
|-----------|-----------------|
| Student Eligible | Application Created |
| Student Not Eligible | Validation Message |
| Duplicate Application | Duplicate Rejected |
| Different Company | Application Allowed |
| Recruiter Updates Status | Status Updated |

---

# 📸 Screenshots

The following screenshots are included inside the **screenshots** folder.

- Student Object
- Job Object
- Application Object
- SOQL Query
- Apex Classes
- Debug Logs
- Application Created
- Status Updated
- Test Results

---

# 🎯 Learning Outcome

After completing this practical task, I learned how SOQL retrieves information, how DML modifies Salesforce records, and how Apex combines both to implement a complete enterprise business transaction.
