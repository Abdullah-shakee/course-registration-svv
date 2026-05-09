# Software Requirements Specification (SRS)
## Course Registration System

---

# 1. System Overview

## System Name
Course Registration System

## Description
The Course Registration System manages student enrollment in courses while enforcing strict constraints such as:

- course capacity limits
- no duplicate registration
- maximum course load per student

The system ensures consistency and correctness of registrations.

---

# 2. Definitions

| Term | Meaning |
|------|---------|
| StudentID | Unique identifier for each student |
| CourseID | Unique identifier for each course |
| Registration | Relationship between StudentID and CourseID |

---

# 3. Functional Requirements

## FR1: Register Course

The system shall allow a student to register for a course if all required conditions are satisfied.

### Conditions
- Student must exist
- Course must exist
- Course must not be full
- Student must not already be registered in the course
- Student must have fewer than 5 registered courses

---

## FR2: Drop Course

The system shall allow a student to drop a registered course.

### Conditions
- Student must already be registered in the course

---

## FR3: Maintain Course Capacity

Each course shall have a fixed maximum capacity.

### Rules
- Default capacity = 30 students
- Registration beyond capacity shall not be allowed

---

## FR4: Prevent Duplicate Registration

The system shall not allow a student to register in the same course more than once.

---

## FR5: Limit Course Load

A student shall be allowed to register in a maximum of 5 courses simultaneously.

---

# 4. Non-Functional Requirements

## NFR1: Consistency

The system shall maintain a consistent state after every operation.

### Rules
- No over-capacity registration allowed
- No duplicate registration allowed
- No invalid state permitted

---

## NFR2: Verifiability

All requirements shall be expressible using formal logic.

### Rules
Every operation must define:
- preconditions
- postconditions

---

## NFR3: Input Validation

The system shall reject:
- invalid StudentID
- invalid CourseID
- null inputs
- undefined values

---

# 5. System State Representation

Let:

- Students = set of StudentID
- Courses = set of CourseID
- Registered ⊆ Students × Courses

---

# 6. System Invariants

These conditions must ALWAYS remain true.

---

## INV1: Capacity Constraint

For every course:

Number of registered students ≤ course capacity

---

## INV2: No Duplicate Registration

The Registered relation shall not contain duplicate pairs.

---

## INV3: Course Load Limit

For every student:

Number of registered courses ≤ 5

---

## INV4: Valid Registration

Every registration must involve:
- a valid student
- a valid course

---

# 7. Assumptions

- Students are pre-defined
- Courses are pre-defined
- Course capacity is fixed
- Single operation executes at a time
- No concurrent registrations occur

---

# 8. Traceability Matrix

| Requirement | Related Invariant |
|-------------|------------------|
| FR1 | INV1, INV2, INV3, INV4 |
| FR2 | INV4 |
| FR3 | INV1 |
| FR4 | INV2 |
| FR5 | INV3 |

---

# 9. Acceptance Criteria

| Requirement | Acceptance Condition |
|-------------|---------------------|
| FR1 | Registration succeeds only if all conditions hold |
| FR2 | Student can drop registered course |
| FR3 | No course exceeds capacity |
| FR4 | Duplicate registration is rejected |
| FR5 | Student cannot exceed 5 courses |

---