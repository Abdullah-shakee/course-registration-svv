# Counterexample Analysis Report
## Course Registration System

---

# 1. Assertion Checked

```alloy
assert UniqueEnrollment
```

---

# 2. Problem Found

Alloy generated a counterexample where:

- Student **S1** enrolled in Course **C1** twice

---

## Example Counterexample

```text
Enrollment1 → (S1, C1)

Enrollment2 → (S1, C1)
```

---

# 3. Why Problem Occurred

The model originally did **NOT** contain a constraint preventing duplicate enrollments.

### Missing Constraint

```alloy
fact NoDuplicateRegistration
```

Without this rule:

- Alloy allowed duplicate enrollment objects
- System became structurally invalid

---

# 4. Fix Applied

The following constraint was added:

```alloy
fact NoDuplicateRegistration {

    all disj e1, e2 : Enrollment |

        not (
            e1.student = e2.student and
            e1.course  = e2.course
        )
}
```

---

# 5. Result After Fix

After adding the constraint:

```alloy
check UniqueEnrollment for 5
```

Alloy reported:

```text
No counterexample found
```

---

## Meaning

- duplicate registrations are no longer possible
- model became structurally correct

---

# 6. Final Summary

## Structural Verification Checks

| Verification | Result |
|-------------|--------|
| Course capacity rule | Passed |
| Duplicate registration prevention | Passed |
| Maximum course load | Passed |
| Positive course capacity | Passed |

---

# 7. Conclusion

The Alloy model successfully verified the structural correctness of the Course Registration System.

All critical constraints are now enforced:

- no duplicate registrations
- no over-capacity enrollment
- maximum course load maintained
- valid course capacities ensured

---