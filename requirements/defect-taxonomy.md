# Defect Taxonomy

This document identifies defects found in the initial requirements and the corrections applied to improve clarity, consistency, and formal verifiability.

---

# Defect Classification Table

| ID | Requirement | Issue Type | Problem | Fix |
|----|-------------|------------|---------|-----|
| D1 | “Fast registration” | Ambiguous | No measurable meaning | Removed vague wording |
| D2 | “Limited courses” | Non-verifiable | Limit not specified | Maximum = 5 courses |
| D3 | “Available seats” | Incomplete | Capacity not defined | Capacity set to 30 |
| D4 | Input validation | Missing Requirement | Validation rules missing | Added validation constraints |

---

# Summary

The following improvements were made:

- Ambiguous requirements were clarified or removed
- Missing numerical constraints were formally defined
- Validation rules were explicitly specified
- All requirements were refined to support formal verification using:
  - Z Notation
  - VDM
  - Alloy

---

# Traceability

| Defect ID | Related Requirement |
|-----------|--------------------|
| D1 | Removed invalid requirement |
| D2 | FR5: Limit Course Load |
| D3 | FR3: Maintain Course Capacity |
| D4 | NFR3: Input Validation |

---