CREATE DATABASE OFFICE_MANAGEMENTSYSTEM;
USE  OFFICE_MANAGEMENTSYSTEM;
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Marketing'),
(3, 'Finance'),
(4, 'IT'),
(5, 'Operations'),
(6, 'Customer Service'),
(7, 'Research and Development'),
(8, 'Sales'),
(9, 'Quality Assurance'),
(10, 'Legal');
SELECT * FROM DEPARTMENTS;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    CONSTRAINT fk_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Position, Salary) VALUES
(1, 'John Doe', 1, 'HR Manager', 60000.00),
(2, 'Jane Smith', 1, 'HR Assistant', 45000.00),
(3, 'Alex Johnson', 2, 'Marketing Specialist', 55000.00),
(4, 'Emma Brown', 3, 'Financial Analyst', 60000.00),
(5, 'Michael Clark', 4, 'Systems Analyst', 65000.00),
(6, 'Sarah Turner', 4, 'Software Engineer', 70000.00),
(7, 'David White', 5, 'Operations Manager', 62000.00),
(8, 'Olivia Green', 5, 'Logistics Coordinator', 48000.00),
(9, 'William Harris', 1, 'HR Coordinator', 50000.00),
(10, 'Sophia Martinez', 2, 'Marketing Manager', 65000.00);
CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY,
    TaskDescription TEXT,
    AssignedTo INT,
    Deadline DATE,
    Status VARCHAR(20),
    CONSTRAINT fk_Employee FOREIGN KEY (AssignedTo) REFERENCES Employees(EmployeeID)
);
INSERT INTO Tasks (TaskID, TaskDescription, AssignedTo, Deadline, Status) VALUES
(1, 'Prepare monthly reports', 4, '2023-01-15', 'In Progress'),
(2, 'Recruitment process', 1, '2023-02-28', 'Pending'),
(3, 'Social media campaign', 3, '2023-03-10', 'Completed'),
(4, 'Network upgrade', 5, '2023-02-20', 'Pending'),
(5, 'Product launch plan', 10, '2023-03-25', 'In Progress'),
(6, 'Financial audit', 4, '2023-04-05', 'Pending'),
(7, 'Website redesign', 6, '2023-02-15', 'Completed'),
(8, 'Inventory optimization', 7, '2023-03-18', 'In Progress'),
(9, 'Employee training program', 2, '2023-04-30', 'Pending'),
(10, 'Operations efficiency analysis', 8, '2023-02-28', 'Completed');
CREATE TABLE Meetings (
    MeetingID INT PRIMARY KEY,
    Title VARCHAR(100),
    DateAndTime DATETIME,
    Location VARCHAR(100),
    Organizer INT,
    CONSTRAINT fk_Organizer FOREIGN KEY (Organizer) REFERENCES Employees(EmployeeID)
);
INSERT INTO Meetings (MeetingID, Title, DateAndTime, Location, Organizer) VALUES
(1, 'HR Meeting', '2023-01-10 09:00:00', 'Conference Room A', 1),
(2, 'Marketing Strategy Discussion', '2023-02-20 14:00:00', 'Board Room', 3),
(3, 'IT Infrastructure Review', '2023-03-05 11:00:00', 'IT Department', 5),
(4, 'Operations Planning Session', '2023-04-12 10:30:00', 'Operations Office', 7),
(5, 'Finance Quarterly Review', '2023-02-28 13:00:00', 'Finance Department', 4),
(6, 'Team Building Workshop', '2023-03-15 10:00:00', 'Training Room', 9),
(7, 'Product Launch Meeting', '2023-04-02 15:00:00', 'Conference Room B', 10),
(8, 'Marketing Campaign Review', '2023-01-25 09:30:00', 'Marketing Office', 2),
(9, 'IT Security Briefing', '2023-02-10 12:00:00', 'Board Room', 5),
(10, 'Operations Efficiency Discussion', '2023-03-28 14:00:00', 'Operations Office', 8);

SELECT * FROM Employees WHERE DepartmentID = 1;
SELECT Employees.Name AS EmployeeName, Departments.DepartmentName 
FROM Employees 
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
SELECT Tasks.TaskID, Tasks.TaskDescription, Employees.Name AS AssignedTo, Departments.DepartmentName 
FROM Tasks 
INNER JOIN Employees ON Tasks.AssignedTo = Employees.EmployeeID 
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;



