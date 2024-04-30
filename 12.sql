-- 1. Course table
CREATE TABLE Course (
    course_no VARCHAR(10) PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    credits INTEGER NOT NULL,
    syllabus TEXT,
    pre_requisites VARCHAR(255) CHECK (pre_requisites IS NULL OR pre_requisites ~ '^[A-Z0-9,]+$'), -- Regular expression for comma-separated course numbers (optional)
    CONSTRAINT _course_prereq FOREIGN KEY (pre_requisites) REFERENCES Course(course_no) ON DELETE SET NULL -- Optional foreign key if pre_requisites is implemented as a separate table
);

-- 2. Course_Offering table
CREATE TABLE Course_Offering (
    course_no VARCHAR(10) NOT NULL,
    year INTEGER NOT NULL,
    semester VARCHAR(10) NOT NULL CHECK (semester IN ('Spring', 'Summer', 'Fall')),
    section_no INTEGER NOT NULL,
    instructor_id VARCHAR(10) NOT NULL,
    timings VARCHAR(50),
    classroom VARCHAR(20),
    PRIMARY KEY (course_no, year, semester, section_no),
    CONSTRAINT _course_offering_course FOREIGN KEY (course_no) REFERENCES Course(course_no),
    CONSTRAINT _course_offering_instructor FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

-- 3. Student table
CREATE TABLE Student (
    student_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    program VARCHAR(50) NOT NULL
);

-- 4. Instructor table
CREATE TABLE Instructor (
    instructor_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    title VARCHAR(50)
);

-- 5. Enrollment table
CREATE TABLE Enrollment (
    student_id VARCHAR(10) NOT NULL,
    course_no VARCHAR(10) NOT NULL,
    year INTEGER NOT NULL,
    semester VARCHAR(10) NOT NULL,
    section_no INTEGER NOT NULL,
    PRIMARY KEY (student_id, course_no, year, semester, section_no),
    CONSTRAINT _enrollment_student FOREIGN KEY (student_id) REFERENCES Student(student_id),
    CONSTRAINT _enrollment_course_offering FOREIGN KEY (course_no, year, semester, section_no) REFERENCES Course_Offering(course_no, year, semester, section_no)
);

-- 6. Grade table
CREATE TABLE Grade (
    student_id VARCHAR(10) NOT NULL,
    course_no VARCHAR(10) NOT NULL,
    year INTEGER NOT NULL,
    semester VARCHAR(10) NOT NULL,
    section_no INTEGER NOT NULL,
    grade VARCHAR(5) CHECK (grade IN ('A', 'B', 'C', 'D', 'F')),
    PRIMARY KEY (student_id, course_no, year, semester, section_no),
    CONSTRAINT _grade_enrollment FOREIGN KEY (student_id, course_no, year, semester, section_no) REFERENCES Enrollment(student_id, course_no, year, semester, section_no)
);
