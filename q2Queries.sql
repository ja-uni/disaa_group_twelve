select C.CourseName, CR.Grade from (select * from CourseRegistrations where grade >=5) as CR, Courses as C, CourseOffers as CO, (select StudentRegistrationId from StudentRegistrationsToDegrees where StudentId = %1% and DegreeId = %2%) as reg where CR.StudentRegistrationId = reg.StudentRegistrationId and CR.CourseOfferId = CO.CourseOfferId and CO.CourseId = C.CourseId order by CO.Year, CO.Quartile, CO.CourseOfferId;
select distinct (StudentId) from GPAperStudentRegistrationId as short, Degrees as D, (select GPAperStudentRegistrationId.StudentRegistrationId from GPAperStudentRegistrationId where GPA > %1% except select StudentRegistrationId from CourseRegistrations where Grade<5) as no_fails where short.DegreeId = D.DegreeId and short.TotECTS >= D.TotalECTS and short.StudentRegistrationId = no_fails.StudentRegistrationId order by StudentId;
select ActiveFemales.DegreeId, (ActiveFemales.totfem/TotalActiveStudents.tottot) as percentage from (select Active.DegreeId, cast(count(Active.fem) as decimal) as totfem from (select SRTD.DegreeId, SRTD.StudentRegistrationId as fem from StudentRegistrationsToDegrees as SRTD, Students as S where SRTD.StudentId = S.StudentId and 	S.Gender = 'F' except select  short.DegreeId, short.StudentRegistrationId as fem from GPAperStudentRegistrationId as short, Degrees as D where short.DegreeId = D.DegreeId and short.totECTS >= D.TotalECTS and Gender = 'F') as Active group by Active.DegreeId) as ActiveFemales, (select TotActive.DegreeId, cast(count(TotActive.tot) as decimal) as tottot from (select SRTD.DegreeId, SRTD.StudentRegistrationId as tot from StudentRegistrationsToDegrees as SRTD except select short.DegreeId, short.StudentRegistrationId as tot from GPAperStudentRegistrationId as short, Degrees as D where short.DegreeId = D.DegreeId and short.totECTS >= D.TotalECTS) as TotActive group by TotActive.DegreeId) as TotalActiveStudents where ActiveFemales.DegreeId = TotalActiveStudents.DegreeId order by ActiveFemales.DegreeId;
with correctDegree (degreeId) as (select degreeid from degrees where Dept = %1%),correctstudents (StudentId) as (select StudentId from StudentRegistrationsToDegrees, correctDegree where correctDegree.DegreeId=StudentRegistrationsToDegrees.DegreeId) select (femalecount/(totalCount)) as percentage from (SELECT count(Students.StudentId)+0.0 as femalecount FROM correctstudents, Students where correctstudents.StudentId = Students.studentid AND Gender='F') as t1, (SELECT totalCount FROM correctDegree, StudentsDegrees where  correctDegree.degreeId = StudentsDegrees.degreeId ) as t2;                    
Select totstudents.CourseId, (passed.passedstudents/totstudents.allstudents) as percentagePassing from (select CourseId, count(StudentRegistrationId)+0.0 as allstudents from CourseRegistrations as CR, CourseOffers as CO where CR.CourseOfferId = CO.CourseOfferId and Grade > 0 group by  CourseId) as totstudents,  (select CourseId, count(StudentRegistrationId)+0.0 as passedstudents from CourseRegistrations as CR, CourseOffers as CO where CR.CourseOfferId = CO.CourseOfferId and Grade>=%1% group by CourseId) as passed where totstudents.CourseId = passed.CourseId order by totstudents.CourseId;
select StudentId, excellent.amount from (select StudentId, count(MaxGrade.CourseOfferId) as amount from MaxGrade, StudentRegistrationsToDegrees as SRTD, CourseRegistrations as CR, CourseOffers as CO where MaxGrade.CourseOfferId = CR.CourseOfferId and SRTD.StudentRegistrationId = CR.StudentRegistrationId and MaxGrade.maxGrade = CR.Grade and CO.CourseOfferId = MaxGrade.CourseOfferId and Year= 2018 and Quartile=1 group by StudentId) as excellent where excellent.amount >=%1%;
select short.DegreeId, BirthyearStudent, Gender, avg(short.GPA) as avgGrade from GPAperStudentRegistrationId as short, Degrees as D where short.DegreeId = D.DegreeId and short.TotECTS < D.TotalECTS GROUP BY CUBE(short.DegreeId, BirthyearStudent, Gender) ORDER BY short.DegreeId asc, BirthyearStudent, Gender;
select solution.CourseName, solution.Year, solution.Quartile from ((select CO.CourseOfferId, C.CourseName, CO.Year, CO.Quartile from (select CourseOfferId, cast(count(StudentRegistrationId) as decimal) as tutorcount from StudentAssistants group by CourseOfferId) as tutors, (select CourseOfferId, cast(count(StudentRegistrationId) as decimal) as studentcount from CourseRegistrations group by CourseOfferId) as students, CourseOffers as CO, Courses as C where tutors.CourseOfferId = students.CourseOfferId and students.CourseOfferId = CO.CourseOfferId and CO.CourseId = C.CourseId and (students.studentcount/tutors.tutorcount) > 50) union (select CO.CourseOfferId, C.CourseName, CO.Year, CO.Quartile from (select CourseOfferId from CourseOffers except (select CourseOfferId from StudentAssistants)) as NoSA, Courses as C, CourseOffers as CO where NoSA.CourseOfferId = CO.CourseOfferId and CO.CourseId = C.CourseId)) as solution order by solution.CourseOfferId;
