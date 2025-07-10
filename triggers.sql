-- Before Update Trigger
CREATE OR REPLACE TRIGGER before_update_courses_trigger
BEFORE UPDATE ON courses
FOR EACH ROW
DECLARE
    v_enrollment_count NUMBER;
BEGIN
    IF :NEW.CourseID != :OLD.CourseID THEN
        SELECT COUNT(*) INTO v_enrollment_count
        FROM enrollments
        WHERE CourseID = :OLD.CourseID;

        DBMS_OUTPUT.PUT_LINE('BEFORE UPDATE:');
        DBMS_OUTPUT.PUT_LINE('OLD CourseID: ' || :OLD.CourseID || ', NEW CourseID: ' || :NEW.CourseID);
        DBMS_OUTPUT.PUT_LINE('Number of Enrollments to be updated: ' || v_enrollment_count);
    END IF;
END;
/

-- After Update Trigger
CREATE OR REPLACE TRIGGER after_update_courses_trigger
AFTER UPDATE ON courses
FOR EACH ROW
BEGIN
    IF :NEW.CourseID != :OLD.CourseID THEN
        DBMS_OUTPUT.PUT_LINE('AFTER UPDATE:');
        DBMS_OUTPUT.PUT_LINE('The following enrollments are updated:');
        FOR enrollment_rec IN (SELECT * FROM enrollments WHERE CourseID = :OLD.CourseID) LOOP
            DBMS_OUTPUT.PUT_LINE('Enrollment ID: ' || enrollment_rec.EnrollmentID || ', Student ID: ' || enrollment_rec.StudentID);
        END LOOP;

        UPDATE enrollments
        SET CourseID = :NEW.CourseID
        WHERE CourseID = :OLD.CourseID;
    END IF;
END;
/

-- Before Delete Trigger
CREATE OR REPLACE TRIGGER before_delete_student_trigger
BEFORE DELETE ON students
FOR EACH ROW
DECLARE
    v_enrollment_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_enrollment_count
    FROM enrollments
    WHERE StudentID = :OLD.StudentID;

    IF v_enrollment_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('BEFORE DELETE:');
        DBMS_OUTPUT.PUT_LINE('Student ID: ' || :OLD.StudentID || ', Name: ' || :OLD.FirstName || ' ' || :OLD.LastName);
        DBMS_OUTPUT.PUT_LINE('Number of Enrollments associated: ' || v_enrollment_count);
    END IF;
END;
/

-- After Delete Trigger
CREATE OR REPLACE TRIGGER after_delete_student_trigger
AFTER DELETE ON students
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('AFTER DELETE:');
    DBMS_OUTPUT.PUT_LINE('The following enrollments are deleted:');
    FOR enrollment_rec IN (SELECT * FROM enrollments WHERE StudentID = :OLD.StudentID) LOOP
        DBMS_OUTPUT.PUT_LINE('Enrollment ID: ' || enrollment_rec.EnrollmentID || ', Course ID: ' || enrollment_rec.CourseID);
    END LOOP;

    DELETE FROM enrollments
    WHERE StudentID = :OLD.StudentID;
END;
/