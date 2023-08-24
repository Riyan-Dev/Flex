-- Procedures

-- Query 1
GO 
CREATE PROC updateAttendance(
@sem varchar(20),
@CID varchar (6),
@DT Date,
@A varchar(1),
@ROLLnO VARCHAR(8)

)
as
begin 
    Update Attendance set Presence = @A where semester = @sem AND CourseID = @CID AND rollNo = @ROLLno AND DATEE = @DT;

end


go 
create proc F_login 
(
@FacultyID varchar(15),
@Password varchar(20)
)
as
begin 
select * from Faculty where FacultyID = @FacultyID AND Password = @Password
end;



--exec F_login
--@FacultyID = 'ISB100-100', @Password = '123456'



go 
create proc getFName 
(
@FacultyID varchar(15)

)
as
begin 
select CONCAT(FirstName, ' ', LastName) from Faculty where FacultyID = @FacultyID
end;

-- Query to get Attendance 
go 
create proc getAttendance (
@sem varchar(20),
@CID varchar (6),
@S varchar(1),
@DT Date
--@A varchar(1),
--@ROLLnO VARCHAR(8)
)
as 
begin

	select student.rollNo, CONCAT(FirstName, ' ', LastName) AS Name, Duration, Presence  
	from student inner join Attendance on Student.rollNo = Attendance.rollNo 
	inner join CourseReg 
	on Student.rollNo = CourseReg.rollNo
	where Coursereg.Semester = @sem AND CourseReg.CID = @CID AND Coursereg.secID = @S AND (Datee = @DT);


end

	--select student.rollNo, CONCAT(FirstName, ' ', LastName) AS Name, Presence  from student left join Attendance on Student.rollNo = Attendance.rollNo right join CourseReg on
	--Student.rollNo = CourseReg.rollNo
	--where Coursereg.Semester = 'Fall 2022' AND CourseReg.CID = 'CS102' AND Coursereg.secID = 'G' AND (Datee = '2023-11-04' or datee is null);


--Query to generate 

go 
create proc generateAttendanceSheet
(
@rollNO varchar(8),
@sem varchar(20),
@CourseID varchar(6),
@DT Date,
@CH int
)
as
begin
	
	insert into attendance (rollNo, Semester, CourseID, Datee, Duration, Presence) values 
	(@rollNO, @sem, @CourseID, @DT, @CH, 'A');

end;


-- Query to get Roll No of student specific to a course and section
go 
create proc getStudentsforSC
(
@sec varchar(1),
@FID varchar(15),
@sem varchar(20)
)
as
begin
	select rollNo
	from CourseReg inner join courseAlloc
	on CourseReg.CID = courseAlloc.CourseID and CourseReg.Semester = courseAlloc.Semester and coursereg.secID = courseAlloc.secID 
	where courseReg.secID = @sec and courseAlloc.FacultyID = @FID and courseAlloc.Semester = @sem;
end;





-- Query to get allocated courses for a faculty
go 
create proc getAlocCourse
(
@FacultyID varchar(15),
@Sem varchar(20)
)
as
begin 
	select Distinct CName, courseAlloc.CourseID from courseAlloc inner join courses on courseAlloc.CourseID = Courses.CourseID where FacultyID = @FacultyID AND courseAlloc.Semester = @sem;
end;





-- to get the sections a specific faculty is teaching for a specific course

go
create proc getSection
(
@FacultyID varchar(15),
@CourseID varchar(6),
@Sem varchar(20)
)
as
begin 
	select Distinct secID from courseAlloc  where FacultyID = @FacultyID AND CourseID = @CourseID AND courseAlloc.Semester = @Sem;
end;




--Course Allocation View 


Go
Create Proc courseAllocView
(
@FacultyID varchar(15),
@sem varchar(20)
)
as
begin
	SELECT courseAlloc.CourseID, Courses.CName, courseAlloc.secID, courseAlloc.Semester 
	FROM courseAlloc INNER JOIN Courses
	ON courseAlloc.CourseID = Courses.CourseID WHERE courseAlloc.FacultyID = @FacultyID and courseAlloc.Semester = @sem;
end;


Go
create proc getRegisteredCourses
(
@RN varchar(8),
@Sem varchar(20)
)
as
begin
select * from courses inner join CourseReg on CourseReg.CID = Courses.CourseID where CourseReg.rollNo = @RN AND CourseReg.Semester = @Sem
end

--Query To Generate Mark Sheet
Go
create proc GenerateMarkSheet(
@MT varchar(20),
@TM	int,
@CID varchar(6),
@RN	varchar(8),
@SEM varchar(20)
)
as
begin 
	insert into Marks(marktype, Weightage, ObtainedMarks, TotalMarks, CourseID, rollNo, Semester) Values
	(@MT, 0, 0, @TM, @CID, @RN, @SEM);
end

select * from marks



go 
create proc getMarksSheet (
@sem varchar(20),
@CID varchar (6),
@S varchar(1),
@MT varchar(20)
--@A varchar(1),
--@ROLLnO VARCHAR(8)
)
as 
begin

	select student.rollNo, CONCAT(FirstName, ' ', LastName) AS Name, ObtainedMarks, TotalMarks  from Student inner join marks on Student.rollNo = marks.rollNo 
	inner join CourseReg 
	on marks.rollNo = CourseReg.rollNo AND marks.CourseID = CourseReg.CID and marks.Semester = CourseReg.Semester
	where Coursereg.Semester = @sem AND CourseReg.CID = @CID AND Coursereg.secID = @S AND marktype = @MT;

end

create proc getAssesments (
@sem varchar(20),
@CID varchar (6),
@S varchar(1)
--@A varchar(1),
--@ROLLnO VARCHAR(8)
)
as 
begin

	select distinct marktype, TotalMarks, Weightage  from Student inner join marks on Student.rollNo = marks.rollNo 
	inner join CourseReg 
	on marks.rollNo = CourseReg.rollNo AND marks.CourseID = CourseReg.CID and marks.Semester = CourseReg.Semester
	where Coursereg.Semester = @sem AND CourseReg.CID = @CID AND Coursereg.secID = @S;

end


GO 
CREATE PROC updateMarks(
@sem varchar(20),
@CID varchar (6),
@MT varchar(20),
@OM int,
@ROLLnO VARCHAR(8)

)
as
begin 
    Update Marks set ObtainedMarks = @OM where semester = @sem AND CourseID = @CID AND rollNo = @ROLLno AND marktype = @MT;
end

GO 
CREATE PROC deleteAssesment(
@sem varchar(20),
@CID varchar (6),
@MT varchar(20),
@s VARCHAR(8)

)
as
begin 
    Delete Marks where semester = @sem AND CourseID = @CID AND marktype = @MT AND rollNo in (select student.rollNo from Student inner join marks on Student.rollNo = marks.rollNo 
	inner join CourseReg 
	on marks.rollNo = CourseReg.rollNo AND marks.CourseID = CourseReg.CID and marks.Semester = CourseReg.Semester
	where Coursereg.Semester = @sem AND CourseReg.CID = @CID AND Coursereg.secID = @S AND marktype = @MT) ;
end
exec deleteAssesment @sem = 'Fall 2022', @CID = 'CS102', @MT = 'quiz2', @S = 'G'; 


GO
create proc updateWeightage(
@sem varchar(20),
@CID varchar (6),
@S varchar(1),
@MT varchar(20),
@w INT
)
as 
begin 

	UPDATE MARKS SET Weightage = @w WHERE semester = @sem AND CourseID = @CID AND marktype = @MT ANd rollNo IN (
	select student.rollNo  from Student inner join marks on Student.rollNo = marks.rollNo 
	inner join CourseReg 
	on marks.rollNo = CourseReg.rollNo AND marks.CourseID = CourseReg.CID and marks.Semester = CourseReg.Semester
	where Coursereg.Semester = @sem AND CourseReg.CID = @CID AND Coursereg.secID = @S AND marks.marktype = @MT)

end


create proc getTotalWeightage (
@sem varchar(20),
@CID varchar (6),
@S varchar(1)
--@A varchar(1),
--@ROLLnO VARCHAR(8)
)
as 
begin

	Select sum(A.weightage) As Total from (select distinct marktype, Weightage from marks  
	inner join CourseReg 
	on marks.rollNo = CourseReg.rollNo AND marks.CourseID = CourseReg.CID and marks.Semester = CourseReg.Semester
	where Coursereg.Semester = @sem AND CourseReg.CID = @CID AND Coursereg.secID = @S) As A


end

	

Go
Create proc getTotalObtained(
@sem varchar(20),
@CID varchar (6),
@RN varchar (8)
)
as
begin 



Select sum((ObtainedMarks/cast(TotalMarks As decimal(7,2)) * Weightage)) as Total_Obtained from marks where rollNo = @RN AND CourseID = @CID AND Semester = @sem
	
end

-- qUERY TO GENERATE GRADES

GO
CREATE PROC GENERATEGRADES(
@sem varchar(20),
@CID varchar (6),
@RN varchar (8),
@G VARCHAR(2)
)
AS 
BEGIN 
	INSERT INTO grades (grade,CourseID ,Semester , rollNo) VALUES 
	(@G, @CID, @SEM, @RN)
END


Go 
Create proc getGrades(
@sem varchar(20),
@CID varchar (6),

@Sec VARCHAR(1)
)
as
begin 

select S.rollNo, CONCAT(FirstName, ' ', lastName) AS Name, coursereg.secID, cast(Total_Obtained as decimal (7,2)) As Total_Obtained, grade 
from student S inner join grades 
on S.rollNo = grades.rollNo
inner join (
			Select sum((ObtainedMarks/cast(TotalMarks As decimal(7,2)) * Weightage)) as Total_Obtained, rollNo, CourseID, semester 
			from marks 
			where CourseID = @CID AND Semester = @SEM group by rollNo, CourseID, semester)
			as A 
			on grades.rollNo = A.rollNo AND grades.Semester = A.Semester AND grades.CourseID = A.CourseID 
			inner join CourseReg on CourseReg.rollNo = A.rollNo AND CourseReg.Semester = A.Semester And CourseReg.CID = A.CourseID where coursereg.secID = @sec;

end



Go 
Create proc DropGrades
(
@sem varchar(20),
@CID varchar (6),
@Sec VARCHAR(1),
@FID varchar(15)
)
as
begin 
	delete grades where grades.CourseID = @CID AND grades.Semester = @sem AND grades.rollNo in (select rollNo
	from CourseReg inner join courseAlloc
	on CourseReg.CID = courseAlloc.CourseID and CourseReg.Semester = courseAlloc.Semester and coursereg.secID = courseAlloc.secID 
	where courseReg.secID = @sec and courseAlloc.FacultyID = @FID and courseAlloc.Semester = @sem);
end 


--select * from grades

--exec DropGrades @sem = 'Fall 2022', @CID = 'CS102', @Sec = 'A', @FID = 'ISB100-100'

go 
create proc AttendanceReport (
@sem varchar(20),
@Sec VARCHAR(1),
@FID varchar(15)
)
as 
begin

Select Student.rollNo, Concat (FirstName, ' ', LastName) As Name, Presents, Absents, cast((cast(Presents As Decimal(7,2))/(Presents+Absents))*100 as decimal(7,2)) As Percentage 
From Student Inner join 

						(select rollNo, count(Presence) AS Presents 
						from Attendance
						where Presence = 'P' AND rollNo in 

															(select rollNo
															from CourseReg inner join courseAlloc
															on CourseReg.CID = courseAlloc.CourseID and CourseReg.Semester = courseAlloc.Semester and coursereg.secID = courseAlloc.secID 
															where courseReg.secID = @Sec and courseAlloc.FacultyID = @FID and courseAlloc.Semester = @sem)
															group by rollNo ) 
															As A
															on Student.rollNo = A.rollNo

						inner join 
															
						(select rollNo, count(Presence) AS Absents 
						from Attendance 
						where Presence = 'A' AND rollNo in (

															select rollNo
															from CourseReg inner join courseAlloc
															on CourseReg.CID = courseAlloc.CourseID and CourseReg.Semester = courseAlloc.Semester and coursereg.secID = courseAlloc.secID 
															where courseReg.secID = @Sec and courseAlloc.FacultyID = @FID and courseAlloc.Semester = @sem)
															group by rollNo )
															AS B
															on Student.rollNo = B.rollNo

end


go 
create proc gradeCount(
@sem varchar(20),
@CID varchar (6),
@Sec VARCHAR(1)
)
as
begin 

select grade AS Grade,  count(grade) As Count 
from student S inner join grades 
on S.rollNo = grades.rollNo 
inner join CourseReg
on CourseReg.CID = grades.CourseID AND CourseReg.rollNo = grades.rollNo AND CourseReg.Semester = grades.Semester
where grades.Semester = @sem And grades.CourseID = @CID AND coursereg.secID = @Sec group by grade


end


--exec gradeCount @sem = 'Fall 2022', @Sec = 'G', @CID = 'CS102';


Go 
Create proc gradeReport(
@sem varchar(20),
@CID varchar (6),
@FID varchar (15)
)
as
begin 

select S.rollNo, CONCAT(FirstName, ' ', lastName) AS Name, courseReg.secID, cast(Total_Obtained as decimal (7,2)) As Total_Obtained, grade 
from student S inner join grades 
on S.rollNo = grades.rollNo
inner join (
			Select sum((ObtainedMarks/cast(TotalMarks As decimal(7,2)) * Weightage)) as Total_Obtained, marks.rollNo, marks.CourseID, marks.semester 
			from marks 
			where marks.CourseID = @CID AND marks.Semester = @sem  group by marks.rollNo, marks.CourseID, marks.semester)
			as A 
			on grades.rollNo = A.rollNo AND grades.Semester = A.Semester AND grades.CourseID = A.CourseID
			inner join courseAlloc on grades.CourseID = courseAlloc.CourseID And grades.Semester = courseAlloc.Semester inner join 
			CourseReg on CourseReg.CID = courseAlloc.CourseID and CourseReg.Semester = courseAlloc.Semester and coursereg.secID = courseAlloc.secID and CourseReg.rollNo = A.rollNo
			where facultyId = @FID order by CourseReg.secID; 

end
 --inner join courseAlloc on marks.CourseID = courseAlloc.CourseID And marks.Semester = courseAlloc.Semester inner join 
	--		CourseReg on CourseReg.CID = courseAlloc.CourseID and CourseReg.Semester = courseAlloc.Semester and coursereg.secID = courseAlloc.secID 

--exec gradereport @sem = 'Fall 2022', @CID = 'CS102', @FID = 'ISB100-101'

--select * from grades



exec getAssesments @Sem = 'Fall 2022', @CID = 'CS102', @S = 'G'

create table temp(
	Name varchar(100),
	rollNo varchar(8)
	
	
);

go 
create proc insertRandN(
@sec varchar(1),
@FID varchar(15),
@sem varchar(20)
)
as
begin 
	
	insert into temp 
	select concat(FirstName, ' ', LastName), student.rollNo
	from student inner join CourseReg on Student.rollNo = CourseReg.rollNo inner join courseAlloc
	on CourseReg.CID = courseAlloc.CourseID and CourseReg.Semester = courseAlloc.Semester and coursereg.secID = courseAlloc.secID 
	where courseReg.secID = @sec and courseAlloc.FacultyID = @FID and courseAlloc.Semester = @sem;

end

--exec insertRandN @sem = 'Fall 2022', @Sec = 'G', @FID = 'ISB100-100'
--Select * from temp

--alter table temp add quiz1 int



--update temp set quiz1 = 
--	marks.ObtainedMarks  from temp inner join  marks on temp.rollNo = marks.rollNo
--	inner join CourseReg 
--	on marks.rollNo = CourseReg.rollNo AND marks.CourseID = CourseReg.CID and marks.Semester = CourseReg.Semester
--	where Coursereg.Semester = 'Fall 2022' AND CourseReg.CID = 'CS102' AND Coursereg.secID = 'G' AND marktype = 'quiz1' 

Go
Create proc insertGT
(
@CID varchar(6),
@sem varchar(20)
)
as
begin 

update temp 
set Grand_Total = Total_Obtained 
from temp inner join (
					select cast(sum((ObtainedMarks/cast(TotalMarks As decimal(7,2)) * Weightage)) as decimal(7,2)) as Total_Obtained, rollNo
					from marks where CourseID = @CID AND Semester = @sem group by rollNo) 
					AS A on temp.rollNo = A.rollNo

end


-- Get Admin 
create proc getadmin(@adminid varchar(15))
as
begin
SELECT FirstName, LastName, Email, PhoneNumber, CNIC FROM Admin where AdminID=@adminid
end


--select * from marks



--Select sum(q1)/count(q1) As Rating from feedback inner join CourseReg on 
--CourseReg.CID = feedback.CourseID and CourseReg.Semester = feedback.Semester and CourseReg.rollNo = feedback.rollNo inner join courseAlloc 
--on CourseReg.CID = courseAlloc.CourseID and CourseReg.Semester = courseAlloc.Semester and coursereg.secID = courseAlloc.secID 
--where feedback.CourseID = @CID AND feedback.Semester = @SEM and FacultyID = @FID;

