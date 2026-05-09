# Course Registration System
## Z Notation Specification

---

# 1. System State

```z
[STUDENT, COURSE]
```

---

## CourseRegistrationState

```z
students   : ℙ STUDENT
courses    : ℙ COURSE
enrollment : STUDENT ↔ COURSE
capacity   : COURSE → ℕ
```

---

# 2. Invariants

---

## INV1: Course Load Limit

For every student:

```z
∀ s : STUDENT •
#({ c : COURSE | (s, c) ∈ enrollment }) ≤ 5
```

---

## INV2: Course Capacity Limit

For every course:

```z
∀ c : COURSE •
#({ s : STUDENT | (s, c) ∈ enrollment }) ≤ capacity(c)
```

---

# 3. Explanation

- **students** → set of all students
- **courses** → set of all courses
- **enrollment** → relation between students and courses
- **capacity** → maximum seats per course

---

## Invariant Meaning

- **Invariant 1:** A student can register in maximum 5 courses
- **Invariant 2:** Registered students in a course cannot exceed capacity

---

# 4. Operations

---

# Operation 1: RegisterCourse

## State Change

```z
ΔCourseRegistrationState

s? : STUDENT
c? : COURSE
```

---

## Preconditions

- s? ∈ students
- c? ∈ courses
- (s?, c?) ∉ enrollment
- Student has fewer than 5 courses
- Course is not full

---

## Formally

```z
#({ x : COURSE | (s?, x) ∈ enrollment }) < 5

#({ x : STUDENT | (x, c?) ∈ enrollment }) < capacity(c?)
```

---

## State Update

```z
enrollment' = enrollment ∪ { s? ↦ c? }

students' = students
courses'  = courses
capacity' = capacity
```

---

# Operation 2: DropCourse

## State Change

```z
ΔCourseRegistrationState

s? : STUDENT
c? : COURSE
```

---

## Preconditions

```z
(s?, c?) ∈ enrollment
```

---

## State Update

```z
enrollment' = enrollment \ { s? ↦ c? }

students' = students
courses'  = courses
capacity' = capacity
```

---

# 5. State Transition Example

---

## Before Operation

```text
students = {S1, S2}

courses = {C1, C2}

enrollment = {S1 ↦ C1}
```

---

## Operation

```text
RegisterCourse(S2, C1)
```

---

## After Operation

```text
enrollment' = {S1 ↦ C1, S2 ↦ C1}
```

---

# 6. Invalid Transition Example

---

## Operation

```text
RegisterCourse(S1, C1)
```

---

## Reason

Student already enrolled in course.

---

## Result

- ❌ Precondition fails
- ❌ No state change

---

# 7. Error Operation (Optional)

```z
ΞCourseRegistrationState

s? : STUDENT
c? : COURSE
```

---

## Error Condition

```z
(s?, c?) ∈ enrollment
```

---

## Meaning

- Ξ means **no state change**
- Used for invalid operations
- Helps formal verification tools detect rejected cases

---