// 1. Find all students whose first name starts with “A”, but only project name and dept
db.students.find(
  { firstName: { $regex: "^A", $options: "i" } },
  { firstName: 1, lastName: 1, "department.abbreviation": 1, _id: 0 }
);

// 2. Find students with at least one course graded “A”
db.students.find(
  { courses: { $elemMatch: { grade: "A" } } },
  { studentId: 1, firstName: 1, lastName: 1, "courses.$": 1, _id: 0 }
);

// 3. Find all Computer Science majors
db.students.find(
  { "department.abbreviation": "CS" },
  { studentId: 1, firstName: 1, lastName: 1, "department.departmentName": 1, _id: 0 }
);

// 4. Find students who have an “Intern” type job with more than 10 hrs/week
db.students.find(
  { jobs: { $elemMatch: { jobType: "Intern", hoursPerWeek: { $gt: 10 } } } },
  { studentId: 1, firstName: 1, lastName: 1, "jobs.$": 1, _id: 0 }
);

// 5. Find students who are neither Physics majors nor working full-time
db.students.find(
  {
    $nor: [
      { "department.abbreviation": "PHYS" },
      { "jobs.jobType": "Full-Time" }
    ]
  },
  { studentId: 1, firstName: 1, lastName: 1, "department.abbreviation": 1, jobs: 1, _id: 0 }
);

// 6. Find students who have taken the course with ID "CSE200"
db.students.find(
  { "courses.courseId": "CSE200" },
  { studentId: 1, firstName: 1, lastName: 1, "courses.$": 1, _id: 0 }
);

// 7. Find students with more than 2 courses
db.students.find(
  { $expr: { $gt: [ { $size: "$courses" }, 2 ] } },
  { studentId: 1, firstName: 1, lastName: 1, courses: 1, _id: 0 }
);

// 8. Find students who started any job before January 1, 2021
db.students.find(
  { "jobs.startDate": { $lt: ISODate("2021-01-01") } },
  { studentId: 1, firstName: 1, lastName: 1, "jobs.$": 1, _id: 0 }
);

// 9. Find all students living in Tucson
db.students.find(
  { city: "Tucson" },
  { studentId: 1, firstName: 1, lastName: 1, city: 1, _id: 0 }
);

// 10. Find students whose department is either CS or MATH
db.students.find(
  { "department.abbreviation": { $in: ["CS", "MATH"] } },
  { studentId: 1, firstName: 1, lastName: 1, "department.abbreviation": 1, _id: 0 }
);
