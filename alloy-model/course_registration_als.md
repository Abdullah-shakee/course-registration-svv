# Course Registration System
## Alloy Specification
### Structural Verification Model

---

# 1. Signatures

sig Student {}

sig Course {
    capacity: one Int
}

sig Enrollment {
    student: one Student,
    course: one Course
}

---

# 2. System Constraints (Facts)

---

## Fact 1: Course Capacity Rule

fact CourseCapacityRule {
    all c: Course |
        #(e: Enrollment | e.course = c) <= c.capacity
}

---

## Fact 2: No Duplicate Registration

fact NoDuplicateRegistration {
    all disj e1, e2: Enrollment |
        not (e1.student = e2.student and e1.course = e2.course)
}

---

## Fact 3: Student Course Limit

fact StudentCourseLimit {
    all s: Student |
        #(e: Enrollment | e.student = s) <= 5
}

---

# 3. Structural Validity Rule

fact ValidEnrollment {
    all e: Enrollment |
        e.student in Student and
        e.course in Course
}

---

# 4. Assertions (Verification)

---

## Assertion 1: No Over Capacity

assert NoOverCapacity {
    all c: Course |
        #(e: Enrollment | e.course = c) <= c.capacity
}

check NoOverCapacity for 5

---

## Assertion 2: No Duplicate Registration

assert NoDuplicate {
    all e1, e2: Enrollment |
        (e1 != e2 and
         e1.student = e2.student and
         e1.course = e2.course)
        implies false
}

check NoDuplicate for 5

---

# 5. Model Execution

run {} for 5

---

# 6. Verification Summary

- Ensures course capacity is never exceeded  
- Prevents duplicate student-course enrollment  
- Enforces maximum course load per student (≤ 5)  
- Validates structural correctness of enrollment relation  

---

# 7. Counterexample Purpose (Important for SVV Viva)

If any fact is removed:

- Alloy can generate a **counterexample**
- Example: course overfilled or duplicate enrollment appears

👉 This proves why constraints are necessary

---