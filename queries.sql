-- Insert statement for Student Table 
INSERT INTO Students (StudentID, Name, Email, DepartmentID, EnrollmentDate, ContactNumber, Address) VALUES
(31, 'mahesh', 'ssmb_29@university.com', 1, '2024-01-01', '+91-8919884738', 'Bangalore, Indiranagar');

-- Insert statement for Attendance Table
INSERT INTO Attendance (StudentID, CourseID, Date, Status)  VALUES
  (31, 114, '2024-01-17', 'Present'), 
 (31, 106, '2024-01-19', 'Absent'),
  (31, 115, '2024-01-20', 'Present');

-- Update Statement for Courses Table:
UPDATE Courses  SET CourseName = 'Advanced Data Structures'  WHERE CourseID = 101;

-- Update Statement for Academic History Table:
UPDATE AcademicHistory 
 SET Semester = 'Fall',
      Year = 2025,  
      GPA = 8.5 
 WHERE StudentID = 1 AND CourseID = 113;

-- Delete Statement for Instructor Courses Table:
DELETE FROM Instructor_Courses  WHERE InstructorID = 601 AND CourseID = 109;

-- Simple Select Statement from Departments Table:
 SELECT DepartmentID, DepartmentName  FROM Departments  WHERE DepartmentName LIKE 'C%';

-- Select Statement Joining Student and Department Table:
SELECT Students.StudentID, Students.Name, Departments.DepartmentName  
FROM Students  
JOIN Departments  
ON Students.DepartmentID = Departments.DepartmentID;

-- Join Statement Joining Courses and Departments Table:
SELECT Courses.CourseID, Courses.CourseName, Departments.DepartmentName  
FROM Courses  
JOIN Departments  
ON Courses.DepartmentID = Departments.DepartmentID;

-- Summary Function for Total Students in each Department:
SELECT DepartmentID, COUNT(*) AS TotalStudents  
FROM Students  
GROUP BY DepartmentID;

-- Summary Function for Average Credits of Courses by their Department IDs:
SELECT DepartmentID, AVG(Credits) AS AvgCredits
FROM Courses
GROUP BY DepartmentID;

-- Multi-table Query (Joining Four Tables):
SELECT  
    Students.Name,  
    Courses.CourseName,  
    Instructors.Name AS InstructorName,  
    Departments.DepartmentName  
FROM Students  
JOIN Courses ON Students.DepartmentID = Courses.DepartmentID  
JOIN Instructors ON Courses.DepartmentID = Instructors.DepartmentID  
JOIN Departments ON Students.DepartmentID = Departments.DepartmentID;

-- Query of our Choice(Finds the students with the Highest score in Final exam):
SELECT g.ExamTypeID, g.StudentID, s.Name, MAX(g.FinalExamScore) AS HighestScore  
FROM Grades g  
JOIN Students s ON g.StudentID = s.StudentID  
GROUP BY g.ExamTypeID, g.StudentID, s.Name  
ORDER BY g.ExamTypeID;
