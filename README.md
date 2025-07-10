# 📚 Centralized College Database – Oracle PL/SQL

A mini-project simulating a centralized college database using Oracle SQL and PL/SQL. Includes schema design, procedures using packages, and integrity enforcement via triggers.

---

## 🔧 Key Features

- Core tables: `students`, `courses`, and `enrollments`
- PL/SQL package (`CollegeDBPackage`) implementing:
  - `update_course`: updates course IDs with validation
  - `delete_student`: removes a student with error handling
- Triggers to maintain integrity:
  - ‘Before’ and ‘After’ triggers for `UPDATE` on the `courses` table
  - ‘Before’ and ‘After’ triggers for `DELETE` on the `students` table


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
