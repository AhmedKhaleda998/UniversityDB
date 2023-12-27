-- Breakdown by Department
SELECT 
    DepartmentName, 
    COUNT(*) AS EnrollmentCount
FROM Students
JOIN Departments ON Students.DepartmentID = Departments.DepartmentID
GROUP BY GROUPING SETS (DepartmentName, ());

-- Rollup by Year and Department
SELECT
    Year,
    DepartmentName,
    COUNT(*) AS EnrollmentCount,
    AVG(NumericGrade) AS AverageNumericGrade
FROM Students
JOIN Departments ON Students.DepartmentID = Departments.DepartmentID
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
GROUP BY ROLLUP (Year, DepartmentName);

-- Cube by Course, Year, and Department
SELECT
    CourseName,
    Year,
    DepartmentName,
    COUNT(*) AS EnrollmentCount,
    AVG(NumericGrade) AS AverageNumericGrade
FROM Students
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID
JOIN Departments ON Students.DepartmentID = Departments.DepartmentID
GROUP BY CUBE (CourseName, Year, DepartmentName);
