

# Given a student ID, return the full name.
DELIMITER $$

CREATE FUNCTION GetStudentFullName(p_StudentId INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE fullName VARCHAR(100);
    SELECT CONCAT(StudentFirstName, ' ', StudentLastName)
    INTO fullName
    FROM StudentDetails
    WHERE StudentId = p_StudentId;

    RETURN fullName;
END $$

# Given a student ID, return the number of jobs they are assigned.
CREATE FUNCTION GetJobCountForStudent(p_StudentId INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jobCount INT;
    SELECT COUNT(*) INTO jobCount
    FROM StudentDetails_JobDetails
    WHERE StudentId = p_StudentId;

    RETURN jobCount;
END $$

# Given a department name, list all students (ID + full name) in that department.
CREATE PROCEDURE GetStudentsByDepartment(IN deptName VARCHAR(45))
BEGIN
    SELECT 
        StudentId,
        CONCAT(StudentFirstName, ' ', StudentLastName) AS FullName
    FROM StudentDetails s
    JOIN Department d ON s.Department_DepartmentId = d.DepartmentId
    WHERE d.DepartmentName = deptName;
END $$

DELIMITER ;


#CALL GetStudentsByDepartment('Computer Science');
#SELECT GetStudentFullName(1001);
#SELECT GetJobCountForStudent(1001);
