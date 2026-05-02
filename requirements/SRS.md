# Software Requirements Specification (SRS)
## Course Registration System

---

## 1. System Overview

**System Name:** Course Registration System  

The system manages student enrollment in courses with strict constraints on:
- Course capacity
- Duplicate registration prevention
- Student course load limits

---

## 2. Definitions

| Term | Description |
|------|------------|
| StudentID | Unique identifier for each student |
| CourseID | Unique identifier for each course |
| Registration | Relation between StudentID and CourseID |

---

## 3. Functional Requirements

### FR1: Register Course
A student can register for a course if all conditions are satisfied.

**Conditions:**
- Student must exist  
- Course must exist  
- Course must not be full  
- Student must not already be registered in the course  
- Student must have fewer than 5 registered courses  

---

### FR2: Drop Course
A student can drop a registered course.

**Condition:**
- Student must already be registered in the course  

---

### FR3: Maintain Course Capacity
- Each course has a fixed maximum capacity  
- Default capacity = 30 students per course  
- The system shall not allow registrations beyond capacity  

---

### FR4: Prevent Duplicate Registration
- A student cannot register in the same course more than once  

---

### FR5: Limit Course Load
- A student can register in a maximum of 5 courses simultaneously  

---

## 4. Non-Functional Requirements

### NFR1: Consistency
- The system shall maintain a consistent state after every operation  
- No invalid state (e.g., over-capacity, duplicate entries) is allowed  

---

### NFR2: Verifiability
- All requirements must be expressible using formal logic  
- Each operation must define preconditions and postconditions  

---

### NFR3: Input Validation
- Invalid StudentID or CourseID shall be rejected  
- Null or undefined inputs are not allowed  

---

## 5. System State Representation

Let:

- **Students** = set of StudentID  
- **Courses** = set of CourseID  
- **Registered** ⊆ Students × Courses  

---

## 6. System Invariants (CRITICAL)

These must ALWAYS hold:

### INV1: Capacity Constraint
For every course:  
Number of registered students ≤ capacity  

---

### INV2: No Duplicate Registration
Registered relation is a set → no duplicate pairs allowed  

---

### INV3: Course Load Limit
For every student:  
Number of registered courses ≤ 5  

---

### INV4: Valid Registration
All registrations must involve valid students and courses  

---

## 7. Assumptions

- Students and courses are pre-defined  
- Capacity is fixed and known  
- No concurrency (only one operation executes at a time)  

---

## 8. Traceability (Important for SVV)

| Requirement | Related Invariant |
|------------|------------------|
| FR1 | INV1, INV2, INV3, INV4 |
| FR2 | INV4 |
| FR3 | INV1 |
| FR4 | INV2 |
| FR5 | INV3 |

---

## 9. Acceptance Criteria

| Requirement | Acceptance Condition |
|------------|---------------------|
| FR1 | Registration succeeds only if all conditions hold |
| FR3 | No course exceeds capacity |
| FR4 | Duplicate registration is rejected |
| FR5 | Student cannot exceed 5 courses |

---
