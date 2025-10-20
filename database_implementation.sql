
#DROP DATABASE UniversityDB;

CREATE DATABASE UniversityDB;
USE UniversityDB;


# Creating Department Table
CREATE TABLE Department (
    DepartmentId INT PRIMARY KEY  NOT NULL,
    DepartmentName VARCHAR(45)  NOT NULL,
    DepartmentAbbreviation CHAR(5)  NOT NULL
);

# Creating StudentDetails Table
CREATE TABLE StudentDetails (
    StudentId INT PRIMARY KEY NOT NULL,
    StudentFirstName VARCHAR(45) NOT NULL,
    StudentLastName VARCHAR(45) NOT NULL,
    Address VARCHAR(45) NOT NULL,
    City VARCHAR(45) NOT NULL,
    State VARCHAR(45) NOT NULL,
    ZipCode VARCHAR(45) NOT NULL,
    StudentContact VARCHAR(45) NOT NULL,
    EnrollmentDate DATE NOT NULL,
    Department_DepartmentId INT  NOT NULL,
    FOREIGN KEY (Department_DepartmentId) REFERENCES Department(DepartmentId)
);


# Creating Courses Table
CREATE TABLE Courses (
    CourseId VARCHAR(10) NOT NULL,
    CourseSectionNbr TINYINT NOT NULL,
    CourseName VARCHAR(100) NOT NULL,
    CoursesCredits TINYINT NOT NULL,
    PRIMARY KEY (CourseId, CourseSectionNbr)  -- Composite Primary Key
);
# Creating StudentDetails_Courses Table (Many-to-Many Relationship)
CREATE TABLE StudentDetails_Courses (
    StudentId INT  NOT NULL,
    CourseId VARCHAR(10)  NOT NULL,
    CourseSectionNbr TINYINT  NOT NULL,
    Grade CHAR(1)  NOT NULL,
    PRIMARY KEY (StudentId, CourseId, CourseSectionNbr),
    FOREIGN KEY (StudentId) REFERENCES StudentDetails(StudentId),
    FOREIGN KEY (CourseId, CourseSectionNbr) REFERENCES Courses(CourseId, CourseSectionNbr)
);


# Creating FacultyDetails Table
CREATE TABLE FacultyDetails (
    FacultyId INT PRIMARY KEY  NOT NULL,
    FacultyFirstName VARCHAR(50)  NOT NULL,
    FacultyLastName VARCHAR(50)  NOT NULL,
    FacultyContact VARCHAR(15)  NOT NULL
);

# Creating FacultyDetails_Courses Table (Many-to-Many Relationship)
CREATE TABLE FacultyDetails_Courses (
    FacultyId INT NOT NULL,
    CourseId VARCHAR(10)  NOT NULL,
    CourseSectionNbr TINYINT  NOT NULL,
    PRIMARY KEY (FacultyId, CourseId, CourseSectionNbr),
    FOREIGN KEY (FacultyId) REFERENCES FacultyDetails(FacultyId),
    FOREIGN KEY (CourseId, CourseSectionNbr) REFERENCES Courses(CourseId, CourseSectionNbr)
);

# Creating JobDetails Table
CREATE TABLE JobDetails (
    JobId INT PRIMARY KEY  NOT NULL,
    JobTitle VARCHAR(45)  NOT NULL,
    JobType VARCHAR(10)  NOT NULL
);

# Creating StudentDetails_JobDetails Table (Many-to-Many Relationship)
CREATE TABLE StudentDetails_JobDetails (
    JobId INT NOT NULL,
    StudentId INT NOT NULL,
    HoursPerWeek TINYINT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    PRIMARY KEY (JobId, StudentId),
    FOREIGN KEY (JobId) REFERENCES JobDetails(JobId),
    FOREIGN KEY (StudentId) REFERENCES StudentDetails(StudentId)
);



## INSERT DATA ##

# Insert Departments
INSERT INTO Department (DepartmentId, DepartmentName, DepartmentAbbreviation) VALUES
(1, 'Computer Science', 'CS'),
(2, 'Mathematics', 'MATH'),
(3, 'Physics', 'PHYS'),
(4, 'Biology', 'BIO'),
(5, 'Electrical Engg', 'EE'),
(6, 'Mechanical Engg', 'MECH'),
(7, 'Civil Engg', 'CIVIL'),
(8, 'Chemistry', 'CHEM'),
(9, 'Business Admin', 'BUS'),
(10, 'Economics', 'ECON');

# Insert Courses
INSERT INTO Courses (CourseId, CourseSectionNbr, CourseName, CoursesCredits) VALUES
('CS101', 1, 'Intro to CS', 3),
('CS102', 1, 'Data Structures', 4),
('MATH201', 1, 'Calculus I', 3),
('MATH202', 1, 'Linear Algebra', 3),
('PHYS101', 1, 'Mechanics', 4),
('BIO101', 1, 'Cell Biology', 3),
('EE101', 1, 'Circuits I', 3),
('ME101', 1, 'Thermodynamics', 4),
('CHEM101', 1, 'Organic Chem', 3),
('BUS101', 1, 'Intro to Marketing', 3);

# Insert StudentDetails
INSERT INTO StudentDetails (StudentId, StudentFirstName, StudentLastName, Address, City, State, ZipCode, StudentContact, EnrollmentDate, Department_DepartmentId) VALUES
(1001, 'Alice', 'Smith', '123 Elm St', 'Tucson', 'AZ', '85701', '5551110001', '2024-08-01', 1),
(1002, 'Bob', 'Jones', '234 Oak St', 'Tucson', 'AZ', '85702', '5551110002', '2024-08-01', 2),
(1003, 'Carol', 'White', '345 Pine St', 'Phoenix', 'AZ', '85001', '5551110003', '2024-08-01', 3),
(1004, 'David', 'Lee', '456 Maple St', 'Phoenix', 'AZ', '85002', '5551110004', '2024-08-01', 4),
(1005, 'Eva', 'Taylor', '567 Cedar St', 'Mesa', 'AZ', '85201', '5551110005', '2024-08-01', 5),
(1006, 'Frank', 'Harris', '678 Birch St', 'Mesa', 'AZ', '85202', '5551110006', '2024-08-01', 6),
(1007, 'Grace', 'Martin', '789 Walnut St', 'Tempe', 'AZ', '85281', '5551110007', '2024-08-01', 7),
(1008, 'Henry', 'Clark', '890 Ash St', 'Tempe', 'AZ', '85282', '5551110008', '2024-08-01', 8),
(1009, 'Ivy', 'Lewis', '901 Spruce St', 'Chandler', 'AZ', '85224', '5551110009', '2024-08-01', 9),
(1010, 'Jack', 'Walker', '1010 Fir St', 'Chandler', 'AZ', '85225', '5551110010', '2024-08-01', 10);

# Insert FacultyDetails
INSERT INTO FacultyDetails (FacultyId, FacultyFirstName, FacultyLastName, FacultyContact) VALUES
(2001, 'Dr. Alan', 'Nguyen', '5552220001'),
(2002, 'Dr. Brenda', 'Kim', '5552220002'),
(2003, 'Dr. Charles', 'Young', '5552220003'),
(2004, 'Dr. Dana', 'Hall', '5552220004'),
(2005, 'Dr. Ethan', 'Wright', '5552220005'),
(2006, 'Dr. Fiona', 'Green', '5552220006'),
(2007, 'Dr. George', 'Adams', '5552220007'),
(2008, 'Dr. Hannah', 'Baker', '5552220008'),
(2009, 'Dr. Ian', 'Scott', '5552220009'),
(2010, 'Dr. Julia', 'Moore', '5552220010');

# Insert FacultyDetails_Courses
INSERT INTO FacultyDetails_Courses (FacultyId, CourseId, CourseSectionNbr) VALUES
(2001, 'CS101', 1),
(2002, 'CS102', 1),
(2003, 'MATH201', 1),
(2004, 'MATH202', 1),
(2005, 'PHYS101', 1),
(2006, 'BIO101', 1),
(2007, 'EE101', 1),
(2008, 'ME101', 1),
(2009, 'CHEM101', 1),
(2010, 'BUS101', 1);

# Insert StudentDetails_Courses (Enrollment)
INSERT INTO StudentDetails_Courses (StudentId, CourseId, CourseSectionNbr, Grade) VALUES
(1001, 'CS101', 1, 'A'),
(1002, 'MATH201', 1, 'B'),
(1003, 'PHYS101', 1, 'C'),
(1004, 'BIO101', 1, 'A'),
(1005, 'EE101', 1, 'B'),
(1006, 'ME101', 1, 'A'),
(1007, 'CIVIL101', 1, 'B'),  
(1008, 'CHEM101', 1, 'C'),
(1009, 'BUS101', 1, 'A'),
(1010, 'MATH202', 1, 'B');

# Insert JobDetails
INSERT INTO JobDetails (JobId, JobTitle, JobType) VALUES
(3001, 'TA - CS', 'Part-time'),
(3002, 'RA - Math', 'Part-time'),
(3003, 'Library Assistant', 'Part-time'),
(3004, 'Lab Assistant', 'Part-time'),
(3005, 'Tech Support', 'Part-time'),
(3006, 'Admin Intern', 'Full-time'),
(3007, 'Marketing Intern', 'Part-time'),
(3008, 'Counseling Aid', 'Part-time'),
(3009, 'Tutor - Physics', 'Part-time'),
(3010, 'Tutor - Econ', 'Part-time');

# Insert StudentDetails_JobDetails
INSERT INTO StudentDetails_JobDetails (JobId, StudentId, HoursPerWeek, StartDate, EndDate) VALUES
(3001, 1001, 10, '2024-09-01', '2024-12-15'),
(3002, 1002, 12, '2024-09-01', '2024-12-15'),
(3003, 1003, 8,  '2024-09-01', '2024-12-15'),
(3004, 1004, 10, '2024-09-01', '2024-12-15'),
(3005, 1005, 15, '2024-09-01', '2024-12-15'),
(3006, 1006, 20, '2024-09-01', '2024-12-15'),
(3007, 1007, 10, '2024-09-01', '2024-12-15'),
(3008, 1008, 12, '2024-09-01', '2024-12-15'),
(3009, 1009, 10, '2024-09-01', '2024-12-15'),
(3010, 1010, 8,  '2024-09-01', '2024-12-15');
