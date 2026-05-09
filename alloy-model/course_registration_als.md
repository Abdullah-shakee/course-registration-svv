# Alloy Structural Verification Model
## Course Registration System

---

# 1. Relational Model

## ✔ Signatures

```alloy
//--------------------------------
-- Course Registration System
//--------------------------------

sig Student {}

sig Course {
    capacity : one Int
}

sig Enrollment {
    student : one Student,
    course  : one Course
}
```

---

# 2. Constraints (Facts)

---

## ✔ Constraint 1: Course Capacity

```alloy
fact CourseCapacityRule {

    all c : Course |
        #(e : Enrollment | e.course = c)
            <= c.capacity
}
```

### Meaning

Total students enrolled in a course  
cannot exceed course capacity.

---

## ✔ Constraint 2: No Duplicate Registration

```alloy
fact NoDuplicateRegistration {

    all disj e1, e2 : Enrollment |

        not (
            e1.student = e2.student and
            e1.course  = e2.course
        )
}
```

### Meaning

Same student cannot register  
same course multiple times.

---

## ✔ Constraint 3: Maximum Course Load

```alloy
fact MaximumCourseLoad {

    all s : Student |

        #(e : Enrollment | e.student = s)
            <= 5
}
```

### Meaning

One student can register  
maximum 5 courses.

---

## ✔ Constraint 4: Valid Capacity

```alloy
fact PositiveCapacity {

    all c : Course |

        c.capacity > 0
}
```

### Meaning

Every course must have positive capacity.

---

# 3. Assertion-Based Verification

---

## ✔ Assertion 1: No Duplicate Enrollment

```alloy
assert UniqueEnrollment {

    all disj e1, e2 : Enrollment |

        not (
            e1.student = e2.student and
            e1.course  = e2.course
        )
}
```

---

## ✔ Assertion 2: Capacity Never Exceeded

```alloy
assert CapacitySafe {

    all c : Course |

        #(e : Enrollment | e.course = c)
            <= c.capacity
}
```

---

# 4. Run and Check Commands

```alloy
run {} for 5

check UniqueEnrollment for 5

check CapacitySafe for 5
```

---

# 5. Verification Purpose

This Alloy model verifies:

- course capacity constraints
- duplicate registration prevention
- maximum course load limits
- structural correctness of enrollment relations

---

# 6. Counterexample Analysis Idea

If any constraint is removed:

- Alloy can generate invalid states
- Example:
  - duplicate enrollment
  - course over-capacity
  - unlimited student registrations

This demonstrates why formal constraints are necessary.

---