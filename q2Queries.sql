Select C.CourseName, coursreg.Grade from CourseRegistrations as coursreg, Courses as C, CourseOffers as CO,  (select StudentRegistrationId, StudentId, DegreeId from StudentRegistrationsToDegrees where StudentId = %1% and DegreeId = %2%) as reg where coursreg.StudentRegistrationID = reg.StudentRegistrationID and Grade > 4 and coursreg.CourseOfferId = CO.CourseOfferId and CO.CourseId = C.CourseId order by Year, Quartile, CO.CourseId;
select distinct (StudentId) from GPAperStudentRegistrationId as short, Degrees as D, (select GPAperStudentRegistrationId.StudentRegistrationId from GPAperStudentRegistrationId except select StudentRegistrationId from CourseRegistrations where Grade<5) as no_fails where short.DegreeId = D.DegreeId and short.TotECTS >= D.TotalECTS and short.StudentRegistrationId = no_fails.StudentRegistrationId and short.GPA > %1% order by StudentId;
SELECT 0;
select (femalecount/totalcount) as percentage from (SELECT count(Students.StudentId)+0.0 as femalecount,dept FROM Degrees, StudentRegistrationsToDegrees, Students where Degrees.DegreeId=StudentRegistrationsToDegrees.DegreeId AND StudentRegistrationsToDegrees.StudentId=Students.StudentId AND Gender='F', group by dept) as t1, (SELECT count(Studentregistrationstodegrees.StudentId)+0.0 as totalcount, dept FROM Degrees, StudentRegistrationsToDegrees where Degrees.DegreeId=StudentRegistrationsToDegrees.DegreeId group by dept) as t2 where t1.dept= %1% and t2.dept= %1%;
select CourseId, AVG((c2*100)/c1) as percentage from (select CourseOfferId, COUNT(StudentRegistrationId) as c2 from CourseRegistrations where grade>%1% GROUP BY(CourseOfferId)) as t1 INNER JOIN (select CourseOfferId, COUNT(StudentRegistrationId) as c1 from CourseRegistrations GROUP BY(CourseOfferId)) as t2 ON t1.CourseOfferId=t2.CourseOfferId, CourseOffers WHERE CourseOffers.CourseOfferId= t1.CourseOfferId GROUP BY(CourseId) ORDER BY CourseId;
select t1.StudentId, t1.count from (select StudentId, count(c2.CourseOfferId) from (select StudentRegistrationId, CourseOfferId, Grade from CourseRegistrations) AS c2 INNER JOIN (select CourseOfferId, MAX(Grade) from CourseRegistrations GROUP BY(CourseOfferId)) as c3 ON c2.Grade=c3.MAX AND c2.CourseOfferId= c3.CourseOfferId, StudentRegistrationsToDegrees, CourseOffers WHERE StudentRegistrationsToDegrees.StudentRegistrationId = c2.StudentRegistrationId AND CourseOffers.CourseOfferId = c2.CourseOfferId AND Year=2018 AND Quartile=1 GROUP BY StudentId ORDER BY StudentId) as t1 where t1.count>%1%;
select short.DegreeId, BirthyearStudent, Gender, avg(short.GPA) as avgGrade from GPAperStudentRegistrationId as short, Degrees as D where short.DegreeId = D.DegreeId and short.TotECTS < D.TotalECTS GROUP BY CUBE(short.DegreeId, BirthyearStudent, Gender) ORDER BY short.DegreeId asc, BirthyearStudent, Gender;
SELECT 0;