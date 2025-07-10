# 📚 Centralized College Database – Oracle SQL & PL/SQL

This project implements a centralized college database system using **Oracle SQL** and **PL/SQL**, developed as part of a university-level DBMS course. It showcases core concepts in **relational schema design**, **data integrity enforcement**, and **procedural programming** using packages and triggers.

---

## 🧩 Schema Overview

The system models a college database with the following primary entities:

- `students(StudentID, FirstName, LastName, Department, Age)`
- `courses(CourseID, CourseName, Department, Professor)`
- `enrollments(EnrollmentID, StudentID, CourseID)`

All relations are normalized and connected using **primary** and **foreign key constraints** to ensure referential integrity.

---

## 🔧 Key Features

- **PL/SQL Package (`CollegeDBPackage`)**  
  Implements two procedures:
  - `update_course`: Updates course ID with validation
  - `delete_student`: Deletes a student with error handling

- **Triggers**  
  Enforce business rules and data integrity:
  - `BEFORE` and `AFTER` triggers for `UPDATE` on the `courses` table
  - `BEFORE` and `AFTER` triggers for `DELETE` on the `students` table

---

## 🧱 Technologies Used

- **Oracle SQL** – for schema definition and constraints
- **PL/SQL** – for stored procedures, packages, and triggers

---

## 📂 Files Included

- `create_tables.sql` – Table definitions and key constraints
- `college_package.sql` – PL/SQL package and procedures
- `triggers.sql` – Trigger implementations
- `README.md` – Project overview and documentation
