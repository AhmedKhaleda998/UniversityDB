# University Database Analysis Project

## Introduction

The "University Database Analysis Project" is designed to evaluate proficiency in SQL, database creation, restoration, data analysis, and result reporting. The project allows flexibility in choosing any database for analysis. The examples and tasks are based on a hypothetical university database named "UniversityDB."

I am using Microsoft SQL Server database, but feel free to substitute it with a database of your choice.

## Database Creation or Restoration

### a. Create a new database:

- Create a new database using the SQL commands in creation.sql file in sql directory.

- Use the SQL commands in insertion.sql file in sql directory to insert some dummy data to get started.

### b. Restore an existing database:

- Use the backup.sql file in backup directory to restore the database using the UniversityDB.bak file. 

## Data Analysis

### a. Count of Students by Department:

- Input: 

        -- Count of Students by Department
        SELECT
            DepartmentName,
            COUNT(*) AS StudentCount
        FROM Students
        JOIN Departments ON Students.DepartmentID = Departments.DepartmentID
        GROUP BY DepartmentName;

- Output:
        
        DepartmentName      StudentCount
        Computer Science         2
        Mathematics              2
        Physics                  2

### b. Total Enrollment by Year:

- Input: 

        -- Total Enrollment by Year
        SELECT
            Year AS AcademicYear,
            COUNT(*) AS TotalEnrollment,
            AVG(NumericGrade) AS AverageNumericGrade
        FROM Enrollments
        GROUP BY Year;

- Output:

        AcademicYear    TotalEnrollment     AverageNumericGrade
            2022               9                3.588888
            2023               3                3.466666

### c. Average GPA by Course:

**Average GPA and Numeric Grade by Course**

- Input:

        -- Average GPA and Numeric Grade by Course
        SELECT
            CourseName,
            AVG(GPA) AS AverageGPA,
            AVG(NumericGrade) AS AverageNumericGrade
        FROM Students
        JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
        JOIN Courses ON Enrollments.CourseID = Courses.CourseID
        GROUP BY CourseName;


- Output:

        CourseName                   AverageGPA     AverageNumericGrade
        Algorithms	                3.600000        3.350000
        Calculus I	                3.500000        3.000000
        Classical Mechanics	        3.800000        4.000000
        Data Structures	            3.600000        3.700000
        Database Management	        3.200000        3.300000
        Electromagnetism	            3.800000        4.000000
        Genetics	                    3.900000        4.000000
        Introduction to Programming	3.500000        4.000000
        Linear Algebra	            3.200000        3.700000
        Organic Chemistry	            3.450000        3.150000

**Average Course Grade by Course**

- Input:

        -- Average Course Grade by Course
        SELECT
            Courses.CourseID,
            Courses.CourseName,
            AVG(NumericGrade) AS AverageCourseGrade
        FROM Enrollments
        JOIN Courses ON Enrollments.CourseID = Courses.CourseID
        GROUP BY Courses.CourseID, Courses.CourseName;

- Output:

        CourseID        CourseName                  AverageCourseGrade
        101	        Introduction to Programming	        4.000000
        102	        Database Management	                3.300000
        201	        Calculus I	                        3.000000
        202	        Linear Algebra	                    3.700000
        301	        Classical Mechanics	                4.000000
        302	        Electromagnetism	                4.000000
        401	        Organic Chemistry	                3.150000
        402	        Genetics	                        4.000000
        501	        Data Structures	                    3.700000
        502	        Algorithms	                        3.350000

## Query (Breakdown, Rollup, or Cube)

### a. Breakdown by Department:

- Input:

        -- Breakdown by Department
        SELECT 
        DepartmentName, 
        COUNT(*) AS EnrollmentCount
        FROM Students
        JOIN Departments ON Students.DepartmentID = Departments.DepartmentID
        GROUP BY GROUPING SETS (DepartmentName, ());

- Output:

        DepartmentName      EnrollmentCount
        Computer Science	        2
        Mathematics	            2
        Physics	                2
        Total                     6

### b. Rollup by Year and Department:

- Input:

        -- Rollup by Year and Department and Average Course Grades
        SELECT
            Year,
            DepartmentName,
            COUNT(*) AS EnrollmentCount,
            AVG(NumericGrade) AS AverageNumericGrade
        FROM Students
        JOIN Departments ON Students.DepartmentID = Departments.DepartmentID
        JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
        GROUP BY ROLLUP (Year, DepartmentName);

- Output:

        Year  DepartmentName  EnrollmentCount     AverageCourseGrade
        2022	Computer Science	3	                3.333333
        2022	Mathematics	        3	                3.666666
        2022	Physics	            3	                3.766666
        2022	    	            9	                3.588888
        2023	Computer Science	1	                3.700000
        2023	Mathematics	        1	                4.000000
        2023	Physics	            1	                2.700000
        2023	    	            3	                3.466666
        Total	    	            12	                3.558333

### c. Cube by Course, Year, and Department:

- Input:

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

- Output:

        CourseName                    Year    DepartmentName      EnrollmentCount     AverageCourseGrade
        Calculus I	                2022	Computer Science	1	3.000000
        Introduction to Programming	2022	Computer Science	1	4.000000
        Organic Chemistry	            2022	Computer Science	1	3.000000
            	                        2022	Computer Science	3	3.333333
        Data Structures	            2023	Computer Science	1	3.700000
            	                        2023	Computer Science	1	3.700000
            	                            	Computer Science	4	3.425000
        Database Management	        2022	Mathematics	        1	3.300000
        Genetics	                    2022	Mathematics	        1	4.000000
        Linear Algebra	            2022	Mathematics	        1	3.700000
            	                        2022	Mathematics	        3	3.666666
        Algorithms	                2023	Mathematics	        1	4.000000
            	                        2023	Mathematics	        1	4.000000
            	                            	Mathematics	        4	3.750000
        Classical Mechanics	        2022	Physics	            1	4.000000
        Electromagnetism	            2022	Physics	            1	4.000000
        Organic Chemistry	            2022	Physics	            1	3.300000
            	                        2022	Physics	            3	3.766666
        Algorithms	                2023	Physics	            1	2.700000
            	                        2023	Physics	            1	2.700000
            	                            	Physics	            4	3.500000
            	                            	    	            12	3.558333
        Algorithms	                    	Mathematics	        1	4.000000
        Algorithms	                    	Physics	            1	2.700000
        Algorithms	                    	    	            2	3.350000
        Calculus I	                    	Computer Science	1	3.000000
        Calculus I	                    	    	            1	3.000000
        Classical Mechanics	            	Physics	            1	4.000000
        Classical Mechanics	            	    	            1	4.000000
        Data Structures	                	Computer Science	1	3.700000
        Data Structures	                	    	            1	3.700000
        Database Management	            	Mathematics	        1	3.300000
        Database Management	            	    	            1	3.300000
        Electromagnetism	                	Physics	            1	4.000000
        Electromagnetism	                	    	            1	4.000000
        Genetics	                        	Mathematics	        1	4.000000
        Genetics	                        	    	            1	4.000000
        Introduction to Programming	    	Computer Science	1	4.000000
        Introduction to Programming	    	    	            1	4.000000
        Linear Algebra	                	Mathematics	        1	3.700000
        Linear Algebra	                	    	            1	3.700000
        Organic Chemistry	                	Computer Science	1	3.000000
        Organic Chemistry	                	Physics	            1	3.300000
        Organic Chemistry	                	    	            2	3.150000
        Calculus I	                2022	    	            1	3.000000
        Classical Mechanics	        2022	    	            1	4.000000
        Database Management	        2022	    	            1	3.300000
        Electromagnetism	            2022	    	            1	4.000000
        Genetics	                    2022	    	            1	4.000000
        Introduction to Programming	2022	    	            1	4.000000
        Linear Algebra	            2022	    	            1	3.700000
        Organic Chemistry	            2022	    	            2	3.150000
            	                        2022	    	            9	3.588888
        Algorithms	                2023	    	            2	3.350000
        Data Structures	            2023	    	            1	3.700000
            	                        2023	    	            3	3.466666