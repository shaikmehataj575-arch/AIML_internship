CREATE TABLE Students3909 (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Gender VARCHAR(10),
    Department VARCHAR(20),
    Age INT
);

INSERT INTO Students3909 VALUES
(101,'Aisha','Female','CSE',20),
(102,'Rahul','Male','ECE',21),
(103,'Priya','Female','CSE',19),
(104,'Arjun','Male','MECH',22),
(105,'Sana','Female','ECE',20),
(106,'Kiran','Male','CSE',21),
(107,'Neha','Female','MECH',22),
(108,'Imran','Male','CSE',20),
(109,'Pooja','Female','ECE',21),
(110,'Rohit','Male','CSE',19);

select * from Students3909;

-- Grouping based on gender
select Gender,count(*) as Total_students
from Students3909
group by Gender;

-- Grouping based on Department
select Department,count(*) as Total_students
from Students3909
group by Department;

-- Grouping based on Age
select Age,count(*) as Total_students
from Students3909
group by Age;

-- USING HAVING 
SELECT Department, COUNT(*) AS Total_Students
FROM Students3909
GROUP BY Department
HAVING COUNT(*) > 2;

-- FIltering based on age>22
SELECT Age, COUNT(*) AS Total_Students
FROM Students3909
GROUP BY Age
HAVING COUNT(*) > 2;

-- CREATING ANOTHER TABLE
CREATE TABLE Marks1 (
    MarkID INT PRIMARY KEY,
    StudentID INT,
    Subject VARCHAR(20),
    Marks INT,
    FOREIGN KEY (StudentID) REFERENCES Students3909(StudentID)
);
INSERT INTO Marks1 VALUES
(1,101,'Python',85),
(2,102,'Python',72),
(3,103,'Python',91),
(4,104,'Python',65),
(5,105,'Python',88),
(6,106,'Python',79),
(7,107,'Python',82),
(8,108,'Python',90),
(9,109,'Python',75);
select * from Marks1;

-- JOINS
-- INNER JOIN
SELECT s.StudentID,
       s.StudentName,
       s.Department,
       m.Subject,
       m.Marks
FROM Students3909 s
INNER JOIN Marks1 m
ON s.StudentID = m.StudentID;

-- Left Join
SELECT s.StudentID,
       s.StudentName,
       m.Subject,
       m.Marks
FROM Students3909 s
LEFT JOIN Marks1 m
ON s.StudentID = m.StudentID;

-- Right Join
SELECT s.StudentID,
       s.StudentName,
       m.Subject,
       m.Marks
FROM Students3909 s
RIGHT JOIN Marks1 m
ON s.StudentID = m.StudentID;

-- CROSS JOIN
SELECT s.StudentName,
       m.Subject
FROM Students3909 s
CROSS JOIN Marks1 m;

-- Showing student names and their marks.
SELECT s.StudentName, m.Marks
FROM Students3909 s
JOIN Marks1 m
ON s.StudentID = m.StudentID;

-- Find average marks department-wise.
SELECT s.Department,
       AVG(m.Marks) AS Avg_Marks
FROM Students3909 s
JOIN Marks1 m
ON s.StudentID = m.StudentID
GROUP BY s.Department;

-- Find departments with average marks greater than 80.
SELECT s.Department,
       AVG(m.Marks) AS Avg_Marks
FROM Students3909 s
JOIN Marks1 m
ON s.StudentID = m.StudentID
GROUP BY s.Department
HAVING AVG(m.Marks) > 80;

-- Find the highest scorer.
SELECT s.StudentName,
       m.Marks
FROM Students3909 s
JOIN Marks1 m
ON s.StudentID = m.StudentID
ORDER BY m.Marks DESC
LIMIT 1;