# Alloy Counterexample Analysis Report

---

## Scenario Tested
CourseCapacityRule removed

---

## Alloy Result

Generated invalid system instance:

- Course C1 capacity = 2  
- Enrollments:
  - S1 → C1  
  - S2 → C1  
  - S3 → C1 ❌ (overflow detected)

---

## Issue Identified

Course capacity constraint violation:
- System allows more students than permitted

---

## Root Cause

Missing constraint:
#(e: Enrollment | e.course = c) <= c.capacity

---

## Fix Applied

Reintroduced constraint:

fact CourseCapacityRule {
    all c: Course |
        #(e: Enrollment | e.course = c) <= c.capacity
}

---

## Conclusion

Alloy successfully detects structural inconsistency when constraints are removed, proving correctness of the formal model.