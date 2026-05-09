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

//--------------------------------
// Constraints
//--------------------------------

fact CourseCapacityRule {

    all c : Course |

        #(e : Enrollment | e.course = c)
            <= c.capacity
}

fact NoDuplicateRegistration {

    all disj e1, e2 : Enrollment |

        not (
            e1.student = e2.student and
            e1.course  = e2.course
        )
}

fact MaximumCourseLoad {

    all s : Student |

        #(e : Enrollment | e.student = s)
            <= 5
}

fact PositiveCapacity {

    all c : Course |

        c.capacity > 0
}

//--------------------------------
// Assertions
//--------------------------------

assert UniqueEnrollment {

    all disj e1, e2 : Enrollment |

        not (
            e1.student = e2.student and
            e1.course  = e2.course
        )
}

assert CapacitySafe {

    all c : Course |

        #(e : Enrollment | e.course = c)
            <= c.capacity
}

//--------------------------------
// Commands
//--------------------------------

run {} for 5

check UniqueEnrollment for 5

check CapacitySafe for 5