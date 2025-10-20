// 1. Drop existing collection (if there are any) and create a fresh one
db.students.drop();
db.createCollection("students");

// 2. Insert all student profiles with embedded department, courses, and jobs
db.students.insertMany([
  {
    "studentId": 1,
    "firstName": "Alice",
    "lastName": "Smith",
    "address": "123 Maple St",
    "city": "Tucson",
    "state": "AZ",
    "zipCode": "85721",
    "contact": "555-1234",
    "enrollmentDate": "2020-08-20",
    "department": {
      "departmentId": 10,
      "departmentName": "Computer Science",
      "abbreviation": "CS"
    },
    "courses": [
      {
        "courseId": "CSE100",
        "courseSection": 1,
        "courseName": "Intro to Programming",
        "credits": 4,
        "grade": "A"
      },
      {
        "courseId": "MAT200",
        "courseSection": 1,
        "courseName": "Calculus I",
        "credits": 3,
        "grade": "B"
      }
    ],
    "jobs": [
      {
        "jobId": 501,
        "jobTitle": "Library Assistant",
        "jobType": "Part-Time",
        "hoursPerWeek": 10,
        "startDate": "2021-01-15",
        "endDate": "2021-05-15"
      }
    ]
  },
  {
    "studentId": 2,
    "firstName": "Bob",
    "lastName": "Johnson",
    "address": "456 Oak Ave",
    "city": "Tucson",
    "state": "AZ",
    "zipCode": "85719",
    "contact": "555-5678",
    "enrollmentDate": "2019-08-20",
    "department": {
      "departmentId": 20,
      "departmentName": "Mathematics",
      "abbreviation": "MATH"
    },
    "courses": [
      {
        "courseId": "MAT200",
        "courseSection": 1,
        "courseName": "Calculus I",
        "credits": 3,
        "grade": "A"
      },
      {
        "courseId": "STA300",
        "courseSection": 1,
        "courseName": "Statistics",
        "credits": 3,
        "grade": "A"
      }
    ],
    "jobs": []
  },
  {
    "studentId": 3,
    "firstName": "Carol",
    "lastName": "Nguyen",
    "address": "789 Pine Rd",
    "city": "Phoenix",
    "state": "AZ",
    "zipCode": "85001",
    "contact": "555-9012",
    "enrollmentDate": "2021-01-10",
    "department": {
      "departmentId": 10,
      "departmentName": "Computer Science",
      "abbreviation": "CS"
    },
    "courses": [
      {
        "courseId": "CSE200",
        "courseSection": 2,
        "courseName": "Data Structures",
        "credits": 4,
        "grade": "B"
      }
    ],
    "jobs": [
      {
        "jobId": 502,
        "jobTitle": "Lab Tutor",
        "jobType": "Intern",
        "hoursPerWeek": 15,
        "startDate": "2021-06-01",
        "endDate": "2021-08-01"
      }
    ]
  },
  {
    "studentId": 4,
    "firstName": "David",
    "lastName": "Lee",
    "address": "321 Birch Ln",
    "city": "Tucson",
    "state": "AZ",
    "zipCode": "85712",
    "contact": "555-3456",
    "enrollmentDate": "2018-08-20",
    "department": {
      "departmentId": 30,
      "departmentName": "Physics",
      "abbreviation": "PHYS"
    },
    "courses": [
      {
        "courseId": "PHY101",
        "courseSection": 1,
        "courseName": "General Physics",
        "credits": 4,
        "grade": "C"
      }
    ],
    "jobs": [
      {
        "jobId": 503,
        "jobTitle": "Research Assistant",
        "jobType": "Full-Time",
        "hoursPerWeek": 40,
        "startDate": "2020-05-01",
        "endDate": "2020-12-31"
      }
    ]
  },
  {
    "studentId": 5,
    "firstName": "Eva",
    "lastName": "Martinez",
    "address": "654 Cedar Blvd",
    "city": "Flagstaff",
    "state": "AZ",
    "zipCode": "86001",
    "contact": "555-7890",
    "enrollmentDate": "2020-08-20",
    "department": {
      "departmentId": 10,
      "departmentName": "Computer Science",
      "abbreviation": "CS"
    },
    "courses": [
      {
        "courseId": "CSE100",
        "courseSection": 1,
        "courseName": "Intro to Programming",
        "credits": 4,
        "grade": "A"
      },
      {
        "courseId": "CSE200",
        "courseSection": 2,
        "courseName": "Data Structures",
        "credits": 4,
        "grade": "A"
      }
    ],
    "jobs": []
  }
]);




