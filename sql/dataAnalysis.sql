-- Data Analysis

-- Count of Students by Department
SELECT
    DepartmentName,
    COUNT(*) AS StudentCount
FROM Students
JOIN Departments ON Students.DepartmentID = Departments.DepartmentID
GROUP BY DepartmentName;

-- Total Enrollment by Year
SELECT
    Year AS AcademicYear,
    COUNT(*) AS TotalEnrollment,
    AVG(NumericGrade) AS AverageNumericGrade
FROM Enrollments
GROUP BY Year;

-- Average Course Grade by Course
SELECT
    Courses.CourseID,
    Courses.CourseName,
    AVG(NumericGrade) AS AverageCourseGrade
FROM Enrollments
JOIN Courses ON Enrollments.CourseID = Courses.CourseID
GROUP BY Courses.CourseID, Courses.CourseName;


-- Average GPA by Course
SELECT
    CourseName,
    AVG(GPA) AS AverageGPA
FROM Students
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID
GROUP BY CourseName;

-- Average GPA and Numeric Grade by Course
SELECT
    CourseName,
    AVG(GPA) AS AverageGPA,
    AVG(NumericGrade) AS AverageNumericGrade
FROM Students
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID
GROUP BY CourseName;
