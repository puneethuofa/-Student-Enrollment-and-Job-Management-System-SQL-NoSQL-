

#  Display full name in uppercase and city in lowercase.
SELECT UPPER(CONCAT(StudentFirstName, ' ', StudentLastName)) AS FullName, LOWER(City) AS City
FROM StudentDetails;


#   Count number of jobs per job type.
SELECT JobType, COUNT(*) AS JobCount
FROM JobDetails
GROUP BY JobType;


# List faculty sorted by last name descending.
SELECT FacultyId, FacultyFirstName, FacultyLastName
FROM FacultyDetails
ORDER BY FacultyLastName DESC;



#  Get top 3 courses by course name.
SELECT CourseId, CourseName
FROM Courses
ORDER BY CourseName ASC
LIMIT 3;


# Classify students based on city
SELECT StudentId, City,
    CASE 
        WHEN City = 'Tucson' THEN 'South AZ'
        WHEN City = 'Phoenix' THEN 'Central AZ'
        ELSE 'Other'
    END AS Region
FROM StudentDetails;

# Average credit value of all courses.
SELECT AVG(CoursesCredits) AS AvgCredits
FROM Courses;


# Display last 4 digits of contact number and length of ZIP code.
SELECT StudentId, RIGHT(StudentContact, 4) AS Last4Digits, LENGTH(ZipCode) AS ZipLength
FROM StudentDetails;


# Top 5 faculty sorted by first name.
SELECT FacultyFirstName, FacultyLastName
FROM FacultyDetails
ORDER BY FacultyFirstName ASC
LIMIT 5;


# Find latest enrollment date.
SELECT MAX(EnrollmentDate) AS LatestEnrollment
FROM StudentDetails;


# Label jobs based on title.
SELECT JobTitle,
    CASE 
        WHEN JobTitle LIKE '%TA%' THEN 'Teaching Role'
        WHEN JobTitle LIKE '%RA%' THEN 'Research Role'
        ELSE 'Other Role'
    END AS JobCategory
FROM JobDetails;




