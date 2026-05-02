# Defect Taxonomy

This document identifies issues in initial requirements and how they were fixed.

---

## Defect Table

| ID | Requirement | Issue Type | Problem | Fix |
|----|------------|------------|---------|-----|
| D1 | "Fast registration" | Ambiguous | No measurable meaning | Removed vague term |
| D2 | "Limited courses" | Non-verifiable | No number defined | Set limit = 5 courses |
| D3 | "Available seats" | Incomplete | Capacity undefined | Set capacity = 30 students |
| D4 | Input validation | Missing requirement | Not defined earlier | Added explicit validation rules |

---

## Summary

- Ambiguous requirements were clarified or removed  
- Non-verifiable requirements were converted into measurable constraints  
- Missing requirements were added for completeness  
- All fixes ensure compatibility with formal modeling (Z, VDM, Alloy)  

---

## Traceability

| Defect ID | Related Requirement |
|----------|--------------------|
| D1 | Removed (invalid requirement) |
| D2 | FR5 (Course Load Limit) |
| D3 | FR3 (Course Capacity) |
| D4 | NFR3 (Input Validation) |
