-- Package specification
CREATE OR REPLACE PACKAGE CollegeDBPackage AS
    PROCEDURE update_course(p_old_course_id IN VARCHAR2, p_new_course_id IN VARCHAR2);
    PROCEDURE delete_student(p_student_id IN VARCHAR2);
END CollegeDBPackage;
/

-- Package body
CREATE OR REPLACE PACKAGE BODY CollegeDBPackage AS

    PROCEDURE update_course(p_old_course_id IN VARCHAR2, p_new_course_id IN VARCHAR2) IS
    BEGIN
        IF p_old_course_id = p_new_course_id THEN
            DBMS_OUTPUT.PUT_LINE('Error: Old and new CourseID cannot be the same.');
            RETURN;
        END IF;

        UPDATE courses
        SET CourseID = p_new_course_id
        WHERE CourseID = p_old_course_id;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Error: Enrollment with Old CourseID not found.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END update_course;

    PROCEDURE delete_student(p_student_id IN VARCHAR2) IS
    BEGIN
        DELETE FROM students
        WHERE StudentID = p_student_id;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Error: StudentID not found.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END delete_student;

END CollegeDBPackage;
/