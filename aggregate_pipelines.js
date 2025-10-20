// 1: Unwind courses and count how many students took each course
db.students.aggregate([
  { $unwind: "$courses" },
  {
    $group: {
      _id: "$courses.courseId",
      countStudents: { $sum: 1 }
    }
  },
  { $sort: { countStudents: -1 } }
]);

// 2: Group by department and compute average number of courses per student
db.students.aggregate([
  {
    $project: {
      dept: "$department.abbreviation",
      numCourses: { $size: "$courses" }
    }
  },
  {
    $group: {
      _id: "$dept",
      avgCourses: { $avg: "$numCourses" },
      totalStudents: { $sum: 1 }
    }
  }
]);

// 3: Group by department and push student full names into an array
db.students.aggregate([
  {
    $project: {
      dept: "$department.abbreviation",
      fullName: { $concat: ["$firstName", " ", "$lastName"] }
    }
  },
  {
    $group: {
      _id: "$dept",
      students: { $push: "$fullName" }
    }
  }
]);

// 4: For each student, project only their courses with credits > 3
db.students.aggregate([
  {
    $project: {
      studentId: 1,
      firstName: 1,
      lastName: 1,
      highCreditCourses: {
        $filter: {
          input: "$courses",
          as: "c",
          cond: { $gt: ["$$c.credits", 3] }
        }
      }
    }
  }
]);

// : Reshape each student document to include fullName and dept only
db.students.aggregate([
  {
    $project: {
      _id: 0,
      fullName: { $concat: ["$firstName", " ", "$lastName"] },
      dept: "$department.departmentName",
      transcript: "$courses",
      jobs: 1
    }
  }
]);

// : Compute total credits per student, then sort descending
db.students.aggregate([
  { $unwind: "$courses" },
  {
    $group: {
      _id: { id: "$studentId", name: { $concat: ["$firstName", " ", "$lastName"] } },
      totalCredits: { $sum: "$courses.credits" }
    }
  },
  { $sort: { totalCredits: -1 } }
]);

// 7: Count how many jobs of each jobType exist
db.students.aggregate([
  { $unwind: "$jobs" },
  {
    $group: {
      _id: "$jobs.jobType",
      count: { $sum: 1 }
    }
  }
]);

// 8: Find the top 3 students by number of courses taken
db.students.aggregate([
  {
    $project: {
      studentId: 1,
      fullName: { $concat: ["$firstName", " ", "$lastName"] },
      numCourses: { $size: "$courses" }
    }
  },
  { $sort: { numCourses: -1 } },
  { $limit: 3 }
]);

// 9: Calculate each student’s average grade value (A=4, B=3, C=2, D=1)
db.students.aggregate([
  { $unwind: "$courses" },
  {
    $addFields: {
      gradeValue: {
        $switch: {
          branches: [
            { case: { $eq: ["$courses.grade", "A"] }, then: 4 },
            { case: { $eq: ["$courses.grade", "B"] }, then: 3 },
            { case: { $eq: ["$courses.grade", "C"] }, then: 2 },
            { case: { $eq: ["$courses.grade", "D"] }, then: 1 }
          ],
          default: 0
        }
      }
    }
  },
  {
    $group: {
      _id: { id: "$studentId", name: { $concat: ["$firstName", " ", "$lastName"] } },
      avgGradeValue: { $avg: "$gradeValue" }
    }
  },
  { $sort: { avgGradeValue: -1 } }
]);

// 10: For each department, compute total students and average courses per student
db.students.aggregate([
  {
    $project: {
      dept: "$department.abbreviation",
      numCourses: { $size: "$courses" }
    }
  },
  {
    $group: {
      _id: "$dept",
      totalStudents: { $sum: 1 },
      avgCourses: { $avg: "$numCourses" }
    }
  }
]);
