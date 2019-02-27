-- ATTENTION: Remove the comments and the example before submitting
-- This file should contain exactly 8 lines, without any comment. Each line will correspond to one of the 8 sub-questions of question 2.
-- Do not break long queries to more than one line, and do not leave empty lines between them. 
-- If you do not know the answer to one of the sub-questions, then write SELECT 0;
SELECT with StudentGrade (StudentId, StudentGender, StudentRegistrationId, StudentDegreeId, CourseName, CourseOfferId, CourseId, grade, ECTS) as (select  S.studentId, S.Gender, SRTD.StudentRegistrationId, SRTD.DegreeId, C.CourseName, CO.CourseOfferId, C.CourseId, CR.Grade, C.ECTS from Students as S, StudentRegistrationsToDegrees as SRTD, CourseRegistrations as CR, CourseOffers as CO, Courses as C where S.StudentId = SRTD.STudentId and CR.StudentRegistrationId = SRTD.StudentRegistrationId and CO.CourseOfferId = CR.CourseOfferId and CO.CourseId = C.CourseId) select  CourseName, grade, studentDegreeId from StudentGrades where grade > 4 and studentDegreeId = 2;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
