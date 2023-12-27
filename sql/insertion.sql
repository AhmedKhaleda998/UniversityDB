-- Data Insertion

-- Add records to Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'Computer Science'),
    (2, 'Mathematics'),
    (3, 'Physics');

-- Add records to Students table
INSERT INTO Students (StudentID, StudentName, DepartmentID, GPA, BirthDate, Address)
VALUES
    (1, 'Alice Johnson', 1, 3.5, '1998-05-15', '123 Main St'),
    (2, 'Bob Smith', 2, 3.2, '1999-02-20', '456 Oak St'),
    (3, 'Charlie Brown', 3, 3.8, '1997-11-10', '789 Pine St');

-- Add records to Courses table
INSERT INTO Courses (CourseID, CourseName)
VALUES
    (101, 'Introduction to Programming'),
    (102, 'Database Management'),
    (201, 'Calculus I'),
    (202, 'Linear Algebra'),
    (301, 'Classical Mechanics'),
    (302, 'Electromagnetism');

-- Add records to Professors table
INSERT INTO Professors (ProfessorID, ProfessorName, DepartmentID)
VALUES
    (1, 'Dr. Smith', 1),
    (2, 'Dr. Johnson', 2),
    (3, 'Dr. Brown', 3);

-- Add records to CoursesOffered table
INSERT INTO CoursesOffered (CourseOfferedID, CourseID, ProfessorID, Semester, Year)
VALUES
    (1, 101, 1, 'Spring', 2022),
    (2, 102, 1, 'Fall', 2022),
    (3, 201, 2, 'Spring', 2022),
    (4, 202, 2, 'Fall', 2022),
    (5, 301, 3, 'Spring', 2022),
    (6, 302, 3, 'Fall', 2022);

-- Add records to Enrollments table with NumericGrade
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Grade, Semester, Year, NumericGrade)
VALUES
    (101, 1, 101, 'A', 'Spring', 2022, 4.0),
    (102, 1, 201, 'B', 'Spring', 2022, 3.0),
    (103, 2, 102, 'B+', 'Fall', 2022, 3.3),
    (104, 2, 202, 'A-', 'Fall', 2022, 3.7),
    (105, 3, 301, 'A', 'Spring', 2022, 4.0),
    (106, 3, 302, 'A', 'Fall', 2022, 4.0);

INSERT INTO Students (StudentID, StudentName, DepartmentID, GPA, BirthDate, Address)
VALUES
    (4, 'David Davis', 1, 3.6, '1998-08-25', '101 Elm St'),
    (5, 'Eva Evans', 2, 3.9, '1999-04-12', '202 Maple St'),
    (6, 'Frank Franklin', 3, 3.3, '1997-09-30', '303 Cedar St');

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (4, 'Chemistry'),
    (5, 'Biology');

INSERT INTO Courses (CourseID, CourseName)
VALUES
    (401, 'Organic Chemistry'),
    (402, 'Genetics'),
    (501, 'Data Structures'),
    (502, 'Algorithms');

INSERT INTO Professors (ProfessorID, ProfessorName, DepartmentID)
VALUES
    (4, 'Dr. White', 4),
    (5, 'Dr. Martinez', 5);

INSERT INTO CoursesOffered (CourseOfferedID, CourseID, ProfessorID, Semester, Year)
VALUES
    (7, 401, 4, 'Spring', 2022),
    (8, 402, 5, 'Fall', 2022),
    (9, 501, 1, 'Spring', 2023),
    (10, 502, 1, 'Fall', 2023);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Grade, Semester, Year, NumericGrade)
VALUES
    (107, 4, 401, 'B', 'Spring', 2022, 3.0),
    (108, 4, 501, 'A-', 'Spring', 2023, 3.7),
    (109, 5, 402, 'A', 'Fall', 2022, 4.0),
    (110, 5, 502, 'A+', 'Fall', 2023, 4.0),
    (111, 6, 401, 'B+', 'Spring', 2022, 3.3),
    (112, 6, 502, 'B-', 'Fall', 2023, 2.7);
