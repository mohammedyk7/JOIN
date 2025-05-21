SELECT 
    D.DeptID,
    D.Name AS DepartmentName,
    I.Name AS ManagerName
FROM 
    Department D
JOIN 
    Instructor I ON D.ManagerID = I.InstID;


SELECT 
    C.Title AS ProgramName,
    D.Name AS DepartmentName
FROM 
    Course C
JOIN 
    Department D ON C.DeptID = D.DeptID;

	SELECT * FROM Department;

	SELECT * FROM Course;

	INSERT INTO Course (CourseID, Title, Credits, DeptID)
VALUES 
(101, 'Intro to Programming', 3, 1),
(102, 'Data Structures', 4, 1),
(201, 'Microeconomics', 3, 2);

	--check if theres any match
	SELECT DISTINCT DeptID FROM Course;
SELECT DeptID FROM Department;

-- Step 1: Nullify ManagerID that points to InstID you're deleting
UPDATE Department
SET ManagerID = NULL
WHERE ManagerID IN (SELECT InstID FROM Instructor WHERE DeptID IN (1, 2));

-- Step 2: Now delete instructors safely
DELETE FROM Instructor
WHERE DeptID IN (1, 2);

-- Step 3: Delete departments now that no one references them
DELETE FROM Department
WHERE DeptID IN (1, 2);

-- Step 4: Re-insert cleanly
INSERT INTO Department (DeptID, Name, Building)
VALUES
(1, 'Computer Science', 'A'),
(2, 'Economics', 'B');

--3.
ALTER TABLE Student
ADD AdvisorID INT FOREIGN KEY REFERENCES Instructor(InstID);

SELECT 
    S.StudentID,
    S.Name AS StudentName,
    S.DOB,
    S.MajorDeptID,
    I.Name AS AdvisorName
FROM 
    Student S
LEFT JOIN 
    Instructor I ON S.AdvisorID = I.InstID;

	INSERT INTO Student (StudentID, Name, DOB, MajorDeptID, AdvisorID)
VALUES 
(1, 'Amal Said', '2001-05-12', 1, 1),
(2, 'Salim Nasser', '2000-10-03', 2, NULL);

UPDATE Student
SET AdvisorID = 1
WHERE StudentID = 2;

INSERT INTO Instructor (InstID, Name, HireDate, DeptID)
VALUES (1, 'Dr. Ahmed Hassan', '2015-09-01', 1);

--5.
SELECT *
FROM Course
WHERE Title LIKE 'I%';

--8.
SELECT 
    S.Name AS StudentName,
    I.Name AS AdvisorName
FROM 
    Student S
JOIN 
    Instructor I ON S.AdvisorID = I.InstID
WHERE 
    I.Name = 'Dr. Ahmed Hassan';

	--11.
SELECT 
    I.InstID,
    I.Name AS FacultyName,
    D.Name AS ManagedDepartment
FROM 
    Instructor I
JOIN 
    Department D ON D.ManagerID = I.InstID;
	--12.
	SELECT 
    S.Name AS StudentName,
    I.Name AS AdvisorName
FROM 
    Student S
LEFT JOIN 
    Instructor I ON S.AdvisorID = I.InstID;

