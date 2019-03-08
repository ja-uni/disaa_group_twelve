COPY Students(StudentId, StudentName, Address, BirthyearStudent, Gender) FROM 'mnt/ramdisk/tables/Students.table' DELIMITER ',' CSV HEADER;
COPY StudentRegistrationsToDegrees(StudentRegistrationId, StudentId, DegreeId, RegistrationYear) From 'mnt/ramdisk/tables/StudentRegistrationsToDegrees.table' DELIMITER ',' CSV HEADER;
COPY Degrees(DegreeId, Dept, DegreeDescription, TotalECTS) FROM 'mnt/ramdisk/tables/Degrees.table' DELIMITER ',' CSV HEADER;
COPY Teachers(TeacherId, TeacherName, Address, BirthyearTeacher, Gender) FROM 'mnt/ramdisk/tables/Teachers.table' DELIMITER ',' CSV HEADER;
COPY Courses(CourseId, CourseName, CourseDescription, DegreeId, ECTS) FROM 'mnt/ramdisk/tables/Courses.table' DELIMITER ',' CSV HEADER;
COPY CourseOffers(CourseOfferId, CourseId, Year, Quartile) FROM 'mnt/ramdisk/tables/CourseOffers.table' DELIMITER ',' CSV HEADER;
COPY TeacherAssignmentsToCourses(CourseOfferId, TeacherId) FROM 'mnt/ramdisk/tables/TeacherAssignmentsToCourses.table' DELIMITER ',' CSV HEADER;
COPY StudentAssistants(CourseOfferId, StudentRegistrationId) FROM 'mnt/ramdisk/tables/StudentAssistants.table' DELIMITER ',' CSV HEADER;
COPY CourseRegistrations(CourseOfferId, StudentRegistrationId, Grade) FROM 'mnt/ramdisk/tables/CourseRegistrations.table' DELIMITER ',' CSV HEADER NULL AS 'null';
delete from Courseregistrations where grade is null;
alter table Degrees add primary key (DegreeId);
alter table Students add primary key (StudentId);
alter table StudentRegistrationsToDegrees add primary key (StudentRegistrationId);
alter table Courses add primary key (CourseId);
alter table CourseOffers add primary key (CourseOfferId);
alter table CourseRegistrations add primary key (CourseOfferId, StudentRegistrationId);
alter table StudentAssistants add primary key (CourseOfferId, StudentRegistrationId);
ANALYZE VERBOSE
