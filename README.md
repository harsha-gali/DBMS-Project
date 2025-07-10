# 📚 Centralized College Database – Oracle PL/SQL

A mini-project simulating a centralized college database using Oracle SQL and PL/SQL. Includes schema design, procedures using packages, and integrity enforcement via triggers.

---

## 🔧 Key Features

- Student, Course, and Enrollment tables
- PL/SQL Package (`CollegeDBPackage`) with:
  - `update_course` procedure for updating course IDs with validation
  - `delete_student` procedure with exception handling
- BEFORE and AFTER triggers on UPDATE and DELETE operations
- Multi-row DML operations with output via `DBMS_OUTPUT`

---

## 🧩 Schema Design

- `students(StudentID, FirstName, LastName, Department, Age)`
- `courses(CourseID, CourseName, Department, Professor)`
- `enrollments(EnrollmentID, StudentID, CourseID)`

Relational integrity is enforced using primary and foreign key constraints.

---

## 🧱 Technologies

- Oracle SQL
- PL/SQL (Packages, Procedures, Triggers)

---

## 👨‍💻 Author

- **Harshavardhan Gali**

> Originally developed as an academic group project. This version is sanitized and published for professional showcasing.