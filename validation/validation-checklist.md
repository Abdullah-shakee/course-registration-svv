# Validation Checklist – Course Registration System

| ID | Requirement | Validation Criteria | Validation Method | Result |
|----|-------------|--------------------|------------------|--------|
| V1 | Student registration | Student can register successfully if all conditions are satisfied | Functional Testing | Pending |
| V2 | Prevent duplicate registration | Same student cannot register same course twice | Test Case | Pending |
| V3 | Course capacity limit | Registration denied when course capacity reaches 30 | Boundary Testing | Pending |
| V4 | Maximum course load | Student cannot register more than 5 courses | Functional Testing | Pending |
| V5 | Drop course | Student can drop already registered course | Functional Testing | Pending |
| V6 | Invalid student input | Invalid StudentID must be rejected | Input Validation Test | Pending |
| V7 | Invalid course input | Invalid CourseID must be rejected | Input Validation Test | Pending |
| V8 | System consistency | No invalid state after operations | Formal Verification | Pending |
| V9 | CI pipeline execution | Tests run automatically on push | GitHub Actions | Pending |
