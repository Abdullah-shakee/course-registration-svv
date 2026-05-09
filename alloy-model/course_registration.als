-------------------------------
Course Registration System
Alloy Specification
Structural Verification Model
-------------------------------

sig Student {}

sig Course {
    capacity: one Int
}

sig Enrollment {
    student: one Student,
    course: one Course
}

-------------------------------
System Constraints (Facts)
-------------------------------

fact CourseCapacityRule {
    all c: Course |
        #(e: Enrollment | e.course = c) <= c.capacity
}

fact NoDuplicateRegistration {
    all disj e1, e2: Enrollment |
        not (e1.student = e2.student and e1.course = e2.course)
}

fact StudentCourseLimit {
    all s: Student |
        #(e: Enrollment | e.student = s) <= 5
}

-------------------------------
Structural Validity Rule
-------------------------------

fact ValidEnrollment {
    all e: Enrollment |
        e.student in Student and
        e.course in Course
}

-------------------------------
Assertions (Verification)
-------------------------------

-- Assertion 1: No course exceeds capacity
assert NoOverCapacity {
    all c: Course |
        #(e: Enrollment | e.course = c) <= c.capacity
}

check NoOverCapacity for 5

-- Assertion 2: No duplicate registration
assert NoDuplicate {
    all e1, e2: Enrollment |
        (e1 != e2 and
         e1.student = e2.student and
         e1.course = e2.course)
        implies false
}

check NoDuplicate for 5

-------------------------------
Model Execution
-------------------------------

run {} for 5
