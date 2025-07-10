-- Create Students table
CREATE TABLE students (
    StudentID VARCHAR2(20) PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    Department VARCHAR2(50),
    Age NUMBER
);

-- Sample data for students
INSERT INTO students (StudentID, FirstName, LastName, Department, Age) VALUES ('S001', 'Alice', 'Smith', 'Electronics and Communications', 20);
INSERT INTO students (StudentID, FirstName, LastName, Department, Age) VALUES ('S002', 'Bob', 'Johnson', 'Electronics and Communications', 19);
INSERT INTO students (StudentID, FirstName, LastName, Department, Age) VALUES ('S003', 'Carol', 'Williams', 'Electronics and Communications', 21);
INSERT INTO students (StudentID, FirstName, LastName, Department, Age) VALUES ('S004', 'David', 'Brown', 'Electronics and Communications', 20);
INSERT INTO students (StudentID, FirstName, LastName, Department, Age) VALUES ('S005', 'Eve', 'Davis', 'Economics', 20);

-- Create Courses table
CREATE TABLE courses (
    CourseID VARCHAR2(20) PRIMARY KEY,
    CourseName VARCHAR2(50),
    Department VARCHAR2(50),
    Professor VARCHAR2(50)
);

-- Sample data for courses
INSERT INTO courses (CourseID, CourseName, Department, Professor) VALUES ('BIO F111', 'General Biology', 'Biology', 'Prof. A');
INSERT INTO courses (CourseID, CourseName, Department, Professor) VALUES ('CS F212', 'Database Management', 'Computer Science', 'Prof. B');
INSERT INTO courses (CourseID, CourseName, Department, Professor) VALUES ('CS F232', 'Foundations of DS and Algo', 'Computer Science', 'Prof. C');
INSERT INTO courses (CourseID, CourseName, Department, Professor) VALUES ('MATH F111', 'Calculus', 'Mathematics', 'Prof. D');
INSERT INTO courses (CourseID, CourseName, Department, Professor) VALUES ('PHY F111', 'Mechanics', 'Physics', 'Prof. E');

-- Create Enrollments table
CREATE TABLE enrollments (
    EnrollmentID NUMBER PRIMARY KEY,
    StudentID VARCHAR2(20),
    CourseID VARCHAR2(20),
    CONSTRAINT fk_enrollments_students FOREIGN KEY (StudentID) REFERENCES students(StudentID),
    CONSTRAINT fk_enrollments_courses FOREIGN KEY (CourseID) REFERENCES courses(CourseID)
);

-- Sample enrollments
INSERT INTO enrollments (EnrollmentID, StudentID, CourseID) VALUES (1, 'S004', 'CS F212');
INSERT INTO enrollments (EnrollmentID, StudentID, CourseID) VALUES (2, 'S002', 'MATH F111');
INSERT INTO enrollments (EnrollmentID, StudentID, CourseID) VALUES (3, 'S003', 'PHY F111');
INSERT INTO enrollments (EnrollmentID, StudentID, CourseID) VALUES (4, 'S001', 'CS F232');
INSERT INTO enrollments (EnrollmentID, StudentID, CourseID) VALUES (5, 'S005', 'BIO F111');
INSERT INTO enrollments (EnrollmentID, StudentID, CourseID) VALUES (6, 'S004', 'BIO F111');
INSERT INTO enrollments (EnrollmentID, StudentID, CourseID) VALUES (7, 'S002', 'CS F232');