Select C.CourseName, coursreg.Grade from CourseRegistrations as coursreg, Courses as C, CourseOffers as CO,  (select StudentRegistrationId, StudentId, DegreeId from StudentRegistrationsToDegrees where StudentId = 3149214 and DegreeId = 3708) as reg where coursreg.StudentRegistrationID = reg.StudentRegistrationID and Grade > 4 and coursreg.CourseOfferId = CO.CourseOfferId and CO.CourseId = C.CourseId order by Year, Quartile, CO.CourseId;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
