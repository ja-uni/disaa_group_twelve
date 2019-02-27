COPY Students(StudentID, StudentName, Address, BirthyearStudent, Gender) FROM '/home/student/Desktop/2ID70/sample_tables/tables/Students.table' DELIMITER ',' CSV HEADER;
COPY StudentRegistrationsToDegrees(StudentRegistrationID, StudentID, DegreeId, RegistrationYear) From '/home/student/Desktop/2ID70/sample_tables/tables/StudentRegistrationsToDegrees.table' DELIMITER ',' CSV HEADER;
COPY Degrees(DegreeID, Dept, DegreeDescription, TotalECTS) FROM '/home/student/Desktop/2ID70/sample_tables/tables/Degrees.table' DELIMITER ',' CSV HEADER;
COPY Teachers(TeacherID, TeacherName, Address, BirthyearTeacher, Gender) FROM '/home/student/Desktop/2ID70/sample_tables/tables/Teachers.table' DELIMITER ',' CSV HEADER;
COPY Courses(CourseID, CourseName, CourseDescription, DegreeID, ECTS) FROM '/home/student/Desktop/2ID70/sample_tables/tables/Courses.table' DELIMITER ',' CSV HEADER;
COPY CourseOffers(CourseOfferId, CourseId, Year, Quartile) FROM '/home/student/Desktop/2ID70/sample_tables/tables/CourseOffers.table' DELIMITER ',' CSV HEADER;
COPY TeacherAssignmentsToCourses(CourseOfferId, TeacherId) FROM '/home/student/Desktop/2ID70/sample_tables/tables/TeacherAssignmentsToCourses.table' DELIMITER ',' CSV HEADER;
COPY StudentAssistants(CourseOfferId, StudentRegistrationId) FROM '/home/student/Desktop/2ID70/sample_tables/tables/StudentAssistants.table' DELIMITER ',' CSV HEADER;
COPY CourseRegistrations(CourseOfferId, StudentRegistrationId, Grade) FROM '/home/student/Desktop/2ID70/sample_tables/tables/CourseRegistrations.table' DELIMITER ',' CSV HEADER NULL AS 'null';
ANALYZE VERBOSE
