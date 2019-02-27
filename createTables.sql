-- This file should create the tables
-- An example follows, replace it with your own commands.
-- SQL files can be executed from command-line using psql -d THE_DATABASE_NAME -f THE_FILENAME
-- Notice the UNLOGGED option, which drastically increases performance and reduces space usage
CREATE UNLOGGED TABLE Students(StudentID int, StudentName varchar(50), Address varchar(200), BirthyearStudent int, Gender char);
CREATE UNLOGGED TABLE StudentRegistrationsToDegrees(StudentRegistrationID int, StudentID int, DegreeId int, RegistrationYear int);
CREATE UNLOGGED TABLE Degrees(DegreeID int, Dept varchar(50), DegreeDescription varchar(200), TotalECTS int);
CREATE UNLOGGED TABLE Teachers(TeacherID int, TeacherName varchar(50), Address varchar(200), BirthyearTeacher int, Gender char);
CREATE UNLOGGED TABLE Courses(CourseID int, CourseName varchar(50), CourseDescription varchar(200), DegreeID int, ECTS int);
CREATE UNLOGGED TABLE CourseOffers(CourseOfferId int, CourseId int, Year int, Quartile int);
CREATE UNLOGGED TABLE TeacherAssignmentsToCourses(CourseOfferId int, TeacherId int);
CREATE UNLOGGED TABLE StudentAssistants(CourseOfferId int, StudentRegistrationId int);
CREATE UNLOGGED TABLE CourseRegistrations(CourseOfferId int, StudentRegistrationId int, Grade int);
