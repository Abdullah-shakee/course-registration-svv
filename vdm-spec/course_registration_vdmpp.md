# Course Registration System
## VDM Functional Specification

---

# 1. Data Types

STUDENT = token  
COURSE  = token  

---

# 2. System State (Abstract Model)

- state CourseSystem of
    - students : set of STUDENT
    - courses  : set of COURSE
    - enroll   : set of (STUDENT * COURSE)
    - capacity : COURSE -> nat
- end

---

# 3. Invariants (System Rules)

inv CourseSystem ==

    forall s in set students & card({ c | (s, c) in set enroll }) <= 5
    and
    forall c in set courses & card({ s | (s, c) in set enroll }) <= capacity(c)

---

# 4. Functional Specification

---

## Operation 1: Register Course

### Function Signature

registerCourse : STUDENT * COURSE * CourseSystem -> CourseSystem

---

### Preconditions

pre registerCourse(s, c, sys) ==

    s in set sys.students and
    c in set sys.courses and
    (s, c) not in set sys.enroll and
    card({ x | (s, x) in set sys.enroll }) < 5 and
    card({ x | (x, c) in set sys.enroll }) < sys.capacity(c)

---

### Postconditions

post registerCourse(s, c, sys) ==

    let newSys = RESULT in
        newSys.enroll =
            sys.enroll union { (s, c) } and

        newSys.students = sys.students and
        newSys.courses  = sys.courses and
        newSys.capacity = sys.capacity

---

### Functional Behavior

registerCourse(s, c, sys) == sys mu (enroll |-> sys.enroll union { (s, c) })

---

## Operation 2: Drop Course

---

### Function Signature

dropCourse : STUDENT * COURSE * CourseSystem -> CourseSystem

---

### Preconditions

pre dropCourse(s, c, sys) == (s, c) in set sys.enroll

---

### Postconditions

post dropCourse(s, c, sys) ==

    let newSys = RESULT in
        newSys.enroll =
            sys.enroll \ { (s, c) } and
            
        newSys.students = sys.students and
        newSys.courses  = sys.courses and
        newSys.capacity = sys.capacity

---

### Functional Behavior

dropCourse(s, c, sys) == sys mu (enroll |-> sys.enroll \ { (s, c) })

---

# 5. Contract-Based Verification Example

---

## RegisterCourse Contract

### Precondition Check
- s ∈ students  
- c ∈ courses  
- (s, c) ∉ enroll  
- student has < 5 courses  
- course is not full  

---

### Postcondition Guarantee
- enroll' = enroll ∪ {(s, c)}  

---

## Verification Idea

If precondition holds:

✔ student exists  
✔ course exists  
✔ no duplicate registration  
✔ capacity not exceeded  

👉 Then postcondition MUST hold:

✔ enrollment updated correctly  
✔ system remains consistent  

---

# 6. Key Contract Rule

precondition true + correct function logic  
⇒ postcondition is guaranteed true  

---