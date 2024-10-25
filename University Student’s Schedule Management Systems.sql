-- Part II: Insert data

CREATE DATABASE UniversitySchedule;
USE UniversitySchedule;


-- STUDENTS Table
CREATE TABLE Students (
	StudentID Int PRIMARY Key,
    Name VARCHAR(100),
    Email VARCHAR (100)
);


-- Classes Table
CREATE TABLE Classes (
	ClassID INT PRIMARY KEY,
	ClassName VARCHAR(100),
    Instructor VARCHAR(100),
    Time VARCHAR(50),
    Location VARCHAR(100)
);


-- WorkSchedules Table
CREATE TABLE WorkSchedules (
	WorkID INT PRIMARY KEY,
    StudentID INT,
    JobTitle VARCHAR(100),
    WorkTime VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Exams Table
CREATE TABLE Exams (
	ExamID INT PRIMARY KEY,
    ClassID INT,
    ExamDate DATE,
    ExamTime TIME,
    ExamLocation VARCHAR(100),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- ExtraCurricularActivities table
CREATE TABLE ExtracurricularActivitites (
	ActivityID INT PRIMARY KEY,
    StudentID INT,
    ActivityName VARCHAR(100),
    ActivityTime VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- PersonalDates table
CREATE TABLE PersonalDates (
    DateID INT PRIMARY KEY,
    StudentID INT,
    DateName VARCHAR(100),
    DateDescription TEXT,
    Date DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
-- Insert data into Students table
INSERT INTO Students (StudentID, Name, Email) VALUES
(1, 'Alizeh Murtaza', 'alizeh@gmail.com'),
(2, 'Makda Asgedom', 'makda@gmail.com'),
(3, 'Arsema Techane', 'arsema@gmail.com');

-- Insert data into Classes table
INSERT INTO Classes (ClassID, ClassName, Instructor, Time, Location) VALUES
(101, 'CDS', 'Dr. Bob Johnson', '09:00-10:30', 'Room 111'),
(102, 'Econ', 'Dr. Talia Smith', '11:00-12:30', 'Room 222'),
(103, 'Math', 'Dr. Robert Kent', '3:00-5:30', 'Room 333');

-- Insert data into WorkSchedules table
INSERT INTO WorkSchedules (WorkID, StudentID, JobTitle, WorkTime) VALUES
(1, 1, 'Front DEsk Manager', '10:00-12:00'),
(2, 2, 'Teacher Assistant', '7:00-8:00'),
(3, 3, 'Tutor', '8:30-9:00');

-- Insert data into Exams table
INSERT INTO Exams (ExamID, ClassID, ExamDate, ExamTime, ExamLocation) VALUES
(1, 111, '2024-06-20', '09:00:00', 'Room 101'),
(2, 222, '2024-06-21', '11:00:00', 'Room 102'),
(3, 333, '2024-06-22', '03:00:00', 'Room 103');

-- Insert data into Assignments table
INSERT INTO Assignments (AssignmentID, ClassID, StudentID, Title, Description, DueDate, Type, Priority) VALUES
(1, 111, 1, 'Homework 1', 'CDS', '2024-06-15', 'Homework', 'High'),
(2, 222, 2, 'Project 1', 'Econ', '2024-06-16', 'Project', 'Medium'),
(3, 333, 3, 'Quiz 1', 'Math', '2024-06-17', 'Quiz', 'High');

-- Insert data into ExtracurricularActivities table
INSERT INTO ExtracurricularActivities (ActivityID, StudentID, ActivityName, ActivityTime) VALUES
(1, 1, 'Basketball', '8:00-9:30'),
(2, 2, 'Music Club', '7:00-7:30'),
(3, 3, 'Drama Club', '3:00-4:30');

-- Insert data into PersonalDates table
INSERT INTO PersonalDates (DateID, StudentID, DateName, DateDescription, Date) VALUES
(1, 1, 'Birthday', 'Alizeh\'s Birthday', '2024-06-25'),
(2, 2, 'Anniversary', 'Makda\'s Anniversary', '2024-07-01'),
(3, 3, 'Doctor Appointment', 'Arsema\'s Doctor Appointment', '2024-06-30');


-- Part III: SQL Queries

SELECT * FROM Students;

SELECT * FROM Classes

SELECT ClassID, ExamDate, ExamTime, ExamLocation FROM Exams;

SELECT WorkSchedules.JobTitle, WorkSchedules.WorkTime
FROM WorkSchedules
JOIN Students ON WorkSchedules.StudentID = Students.StudentID
WHERE Students.Name = 'Alizeh Murtaza';

SELECT ActivityName, ActivityTime
FROM ExtracurricularActivities
WHERE StudentID = 3; 

SELECT Classes.ClassName, COUNT(Assignments.StudentID) AS NumberOfStudents
FROM Classes
JOIN Assignments ON Classes.ClassID = Assignments.ClassID
GROUP BY Classes.ClassName;


SELECT Students.Name, Assignments.Title, Assignments.DueDate
FROM Students
JOIN Assignments ON Students.StudentID = Assignments.StudentID
WHERE Assignments.DueDate = '2024-06-15';

SELECT DateName, DateDescription, Date
FROM PersonalDates
WHERE StudentID = 2;

SELECT Students.Name, WorkSchedules.JobTitle
FROM Students
JOIN WorkSchedules ON Students.StudentID = WorkSchedules.StudentID
WHERE WorkSchedules.JobTitle = 'Teacher Assistant';

SELECT Title, Description, DueDate
FROM Assignments
WHERE ClassID = 101;




