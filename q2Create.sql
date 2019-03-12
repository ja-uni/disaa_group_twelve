CREATE INDEX stud_reg_id_coursereg ON CourseRegistrations (StudentRegistrationId);
create index courseid_courseoffers on CourseOffers (CourseId);
CREATE MATERIALIZED VIEW GPAperStudentRegistrationId (StudentRegistrationId, GPA, totECTS, StudentId, DegreeId, BirthyearStudent, Gender) as select res. StudentRegistrationId, (res.weight/res.totECTS)+0.0 as GPA, totECTS, S.StudentId, DegreeId, BirthyearStudent, Gender from (select passed.StudentRegistrationId, (sum(ECTS)+0.0) as totECTS, (sum(grade*ECTS)+0.0) as weight from CourseOffers as Co, Courses as C, (select StudentRegistrationId, CourseOfferId, Grade from CourseRegistrations where grade>=5) as passed where passed.CourseOfferId = CO.CourseOfferId and CO.CourseId = C.CourseId group by passed.StudentRegistrationId) as res, StudentRegistrationsToDegrees as SRTD, Students as S where res.StudentRegistrationId = SRTD.StudentRegistrationId and S.StudentId = SRTD.StudentId order by res.StudentRegistrationId;
create materialized view MaxGrade (CourseOfferId, maxGrade) as select CourseOfferId, max(Grade) from CourseRegistrations group by CourseOfferId;
CREATE MATERIALIZED VIEW noFailsAlumni (StudentRegistrationId) as select short.studentregistrationid from gpaperstudentregistrationid as short, degrees as D where  short.DegreeId = D.DegreeId and short.TotECTS >= D.TotalECTS except select studentregistrationid from CourseRegistrations where Grade<5
