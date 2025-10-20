
#  Show student names, course names, and grades.
SELECT s.StudentFirstName, s.StudentLastName, c.CourseName, sc.Grade
FROM StudentDetails_Courses sc
INNER JOIN StudentDetails s ON sc.StudentId = s.StudentId
INNER JOIN Courses c ON sc.CourseId = c.CourseId AND sc.CourseSectionNbr = c.CourseSectionNbr;

# List faculty assigned to each course section.
SELECT f.FacultyFirstName, f.FacultyLastName, c.CourseName, fdc.CourseSectionNbr
FROM FacultyDetails_Courses fdc
INNER JOIN FacultyDetails f ON fdc.FacultyId = f.FacultyId
INNER JOIN Courses c ON fdc.CourseId = c.CourseId AND fdc.CourseSectionNbr = c.CourseSectionNbr;

#Show all students and their job details (if any).
SELECT s.StudentFirstName, s.StudentLastName, jd.JobTitle, sj.HoursPerWeek
FROM StudentDetails s
LEFT JOIN StudentDetails_JobDetails sj ON s.StudentId = sj.StudentId
LEFT JOIN JobDetails jd ON sj.JobId = jd.JobId;

#Show all courses, and if no faculty is assigned, return NULL.
SELECT c.CourseId, c.CourseName, f.FacultyFirstName
FROM Courses c
LEFT JOIN FacultyDetails_Courses fdc ON c.CourseId = fdc.CourseId AND c.CourseSectionNbr = fdc.CourseSectionNbr
LEFT JOIN FacultyDetails f ON fdc.FacultyId = f.FacultyId;


#List students from Tucson and Phoenix using UNION.
SELECT StudentFirstName, StudentLastName, City FROM StudentDetails WHERE City = 'Tucson'
UNION
SELECT StudentFirstName, StudentLastName, City FROM StudentDetails WHERE City = 'Phoenix';

# Get the First and Last of Students who have Grade 'A' and currently working
SELECT StudentFirstName, StudentLastName
FROM StudentDetails
WHERE StudentId IN (
    SELECT StudentId FROM StudentDetails_Courses
    WHERE Grade = 'A'
)
AND StudentId IN (
    SELECT StudentId FROM StudentDetails_JobDetails
);


# Students who have job titles involving "TA"
SELECT StudentFirstName, StudentLastName
FROM StudentDetails
WHERE StudentId IN (
    SELECT StudentId
    FROM StudentDetails_JobDetails sj
    JOIN JobDetails j ON sj.JobId = j.JobId
    WHERE j.JobTitle LIKE '%TA%'
);


# Students in the course with the highest enrollment.
SELECT s.StudentFirstName, s.StudentLastName
FROM StudentDetails s
WHERE s.StudentId IN (
    SELECT sc.StudentId
    FROM StudentDetails_Courses sc
    WHERE (sc.CourseId, sc.CourseSectionNbr) IN (
        SELECT CourseId, CourseSectionNbr
        FROM StudentDetails_Courses
        GROUP BY CourseId, CourseSectionNbr
        ORDER BY COUNT(*) DESC
        LIMIT 1
    )
);

# Average credits per department.
WITH DeptAverageCredits AS (
    SELECT d.DepartmentName, AVG(c.CoursesCredits) AS AvgCredits
    FROM Department d
    JOIN StudentDetails s ON d.DepartmentId = s.Department_DepartmentId
    JOIN StudentDetails_Courses sc ON s.StudentId = sc.StudentId
    JOIN Courses c ON sc.CourseId = c.CourseId AND sc.CourseSectionNbr = c.CourseSectionNbr
    GROUP BY d.DepartmentName
)
SELECT * FROM DeptAverageCredits;

# Get students who held the most jobs.
WITH JobCounts AS (
    SELECT StudentId, COUNT(*) AS JobCount
    FROM StudentDetails_JobDetails
    GROUP BY StudentId
)
SELECT s.StudentFirstName, s.StudentLastName, jc.JobCount
FROM JobCounts jc
JOIN StudentDetails s ON jc.StudentId = s.StudentId
ORDER BY jc.JobCount DESC;



