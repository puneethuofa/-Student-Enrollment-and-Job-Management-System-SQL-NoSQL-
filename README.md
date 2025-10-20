# 🎓 Student Enrollment and Job Management System (SQL & NoSQL)

### 📚 Overview

The **Student Enrollment and Job Management System** is a hybrid **SQL/NoSQL database project** designed to streamline academic and employment data management for universities. It enables the efficient handling of **student registrations, course enrollments, faculty assignments, and job placements**, while providing robust analytical capabilities for administrators and advisors.

This project was developed as part of the **INFO 579: SQL/NoSQL Databases for Data and Information Sciences** course, focusing on **database design, implementation, and query optimization** across relational and document-oriented architectures.

---

## 🧩 Project Objectives

* Create a **normalized SQL schema** to manage student, faculty, department, and job data.
* Implement **sample datasets and queries** for academic and employment reporting.
* Design **NoSQL equivalents** for efficient retrieval of embedded data structures.
* Build **stored procedures and functions** for automated updates and analytics.
* Demonstrate integration between **academic performance tracking** and **student job placement** systems.

---

## 🗃️ Data Architecture

### 🔹 Relational (SQL) Schema

The SQL database is composed of several normalized tables interconnected through primary and foreign keys:

| **Table**              | **Purpose**                                                              |
| ---------------------- | ------------------------------------------------------------------------ |
| **Students**           | Stores personal information, enrollment date, and department affiliation |
| **Departments**        | Maintains department codes, names, and associated faculty                |
| **Courses**            | Details course ID, title, credits, and assigned faculty                  |
| **Faculty**            | Contains faculty identifiers, names, and departmental roles              |
| **StudentCourseGrade** | Links students and courses, tracking performance and grades              |
| **StudentJob**         | Manages job placements, including employer, role, and work hours         |

Relationships are defined through **1–N and N–M mappings**:

* Each **department** has many **students** and **faculty**.
* Each **student** may enroll in multiple **courses** and hold multiple **jobs**.
* Each **course** may be taught by one **faculty** member but taken by many **students**.

---

### 🔸 NoSQL Data Model

The **NoSQL implementation** leverages a document-oriented approach (e.g., MongoDB) to optimize read performance and simplify data retrieval.

Each **student document** embeds key substructures:

* **Department** → major and advisor info
* **Courses** → course IDs, names, credits, and grades
* **Jobs** → job type, company, hours/week, and duration

This design minimizes join operations by co-locating academic and employment data in a single record, improving query efficiency for dashboards and analytics such as:

> “Fetch all CS majors with GPA ≥ 3.5 and > 10 hours/week jobs.”

---

## ⚙️ Implementation Details

### 1️⃣ **Database Creation**

All DDL operations are implemented in:

```
database_implementation.sql
```

This script defines:

* Table creation with keys and constraints
* Data insertion for sample records
* Referential integrity enforcement

### 2️⃣ **Single-Table Queries**

Implemented in:

```
single_table.sql
```

Includes:

* Aggregate functions (`AVG`, `COUNT`, `MAX`)
* String manipulation and formatting
* Sorting and filtering by GPA, department, or hire date
* Limiting results using `FETCH FIRST N ROWS`
* Use of conditional selection (`CASE WHEN`, `COALESCE`)

### 3️⃣ **Multi-Table Queries**

Implemented in:

```
multiple_table.sql
```

Includes:

* `INNER JOIN` for student–course–faculty relationships
* `LEFT OUTER JOIN` for job assignments with optional faculty advising
* Set operations (`UNION`, `INTERSECT`)
* Subqueries and CTEs (`WITH` clause) for GPA aggregation
* Derived tables for performance summaries

### 4️⃣ **Stored Procedures & Functions**

Implemented in:

```
routines.sql
```

Examples:

* **Procedure:** `AssignAdvisor()` – assigns faculty advisors based on department size.
* **Function:** `CalculateGPA(student_id)` – computes GPA dynamically from course grades.
* **Function:** `JobCount(student_id)` – returns active job count per student.

---

## 📊 Analytics & Reporting

| **Report Type**               | **Purpose**                                          |
| ----------------------------- | ---------------------------------------------------- |
| **Student Enrollment Report** | Tracks enrollment counts per department and semester |
| **Course Demand Analysis**    | Lists courses with highest/lowest registration       |
| **Faculty Workload Report**   | Aggregates teaching load by faculty member           |
| **Student GPA Summary**       | Computes average and cumulative GPAs                 |
| **Employment Summary**        | Tracks job placements by type, pay, and duration     |

These reports support **academic planning**, **resource allocation**, and **career-placement decisions**.

---

## 🧠 Example Queries

```sql
-- Top 5 students by GPA in Computer Science
SELECT s.student_name, d.department_name, AVG(g.grade_points) AS GPA
FROM Students s
JOIN Departments d ON s.department_id = d.department_id
JOIN StudentCourseGrade g ON s.student_id = g.student_id
WHERE d.department_name = 'Computer Science'
GROUP BY s.student_name, d.department_name
ORDER BY GPA DESC
FETCH FIRST 5 ROWS ONLY;
```

```sql
-- Students currently employed more than 10 hours/week
SELECT s.student_name, j.job_title, j.hours_per_week
FROM Students s
JOIN StudentJob j ON s.student_id = j.student_id
WHERE j.hours_per_week > 10 AND j.end_date IS NULL;
```

---

## 🧩 NoSQL Sample Document (MongoDB)

```json
{
  "student_id": "S101",
  "name": "Ava Smith",
  "department": { "dept_id": "CS", "dept_name": "Computer Science", "advisor": "Dr. Ray" },
  "courses": [
    { "course_id": "CS501", "title": "Database Systems", "credits": 3, "grade": "A" },
    { "course_id": "CS520", "title": "Data Mining", "credits": 3, "grade": "A-" }
  ],
  "jobs": [
    { "job_id": "J201", "title": "Research Assistant", "type": "On-Campus", "hours_per_week": 15, "start_date": "2025-01-20" }
  ]
}
```

---

## 🧮 Tools & Technologies

| **Component**       | **Technology Used**                 |
| ------------------- | ----------------------------------- |
| Database Management | PostgreSQL / MySQL (SQL)            |
| Document Storage    | MongoDB (NoSQL)                     |
| Query Development   | SQL scripts (`.sql` files)          |
| ERD & Schema Design | Lucidchart / draw.io                |
| Data Validation     | Python & CSV imports                |
| Reporting           | SQL aggregation & stored procedures |

---

## 🧾 Deliverables

* `database_implementation.sql` — SQL DDL & data population
* `single_table.sql` — simple queries & filters
* `multiple_table.sql` — joins, subqueries, and CTEs
* `routines.sql` — stored functions and procedures
* `collection.json` — MongoDB collection schema (NoSQL design)
* `info579_project02.pdf` — project report and documentation

---

## 🚀 Outcomes

* Reduced query latency by embedding related data in NoSQL documents.
* Improved academic analytics (GPA trends, enrollment demand).
* Streamlined course, faculty, and job record management.
* Established a scalable hybrid data architecture supporting both transactional and analytical workloads.

---

## 👨‍💻 Author

**Puneeth Vijay Krishna Samarla**
📍 *M.S. in Information Science (Machine Learning), University of Arizona*
📧 [puneethvks9@email.com](mailto:puneethvks9@email.com)
🔗 [LinkedIn](https://www.linkedin.com/in/puneeth-samarla)
💻 [GitHub Repository](https://github.com/puneethuofa/-Student-Enrollment-and-Job-Management-System-SQL-NoSQL-)

