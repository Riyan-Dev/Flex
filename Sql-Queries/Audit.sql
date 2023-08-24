
-- Student
create trigger std_insert
on student
for insert
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from inserted

insert into Auditlog values
('New Student inserted with roll No' + cast(@rollNo as nvarchar(8)) + 'at' + cast(GetDate()as nvarchar(20)))

end

--Faculty
Go
create trigger Fcl_insert
on faculty
for insert
AS
Begin 

Declare @facultyID varchar(15)
Select @facultyID =  FacultyID from inserted

insert into Auditlog values
('New faculty inserted with ID' + cast(@facultyID as nvarchar(15)) + 'at' + cast(GetDate()as nvarchar(20)))

end

-- marks
create trigger marks_insert
on marks
for insert
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from inserted
Declare @CID varchar(6)
Select @CID =  CourseID from inserted
Declare @Sem varchar(20)
Select @Sem =  Semester from inserted


insert into Auditlog values
('New Marks inserted for'
+  cast(@rollNo as nvarchar(8))
+ ' ' + cast(@CID as nvarchar(6))
+ ' ' + cast(@Sem as nvarchar(20))
+ ' at ' + cast(GetDate()as nvarchar(20)))

end






--courses

create trigger courses_insert
on courses
for insert
AS
Begin 

Declare @cname varchar(30)
Select @cname =  CName from inserted
Declare @CID varchar(6)
Select @CID =  CourseID from inserted



insert into Auditlog values
('New course '  
+  cast(@cname as nvarchar(30))
+ ' inserted with Course ID ' + cast(@CID as nvarchar(6))
+ ' at ' + cast(GetDate()as nvarchar(20)))

end


--Course Register
Go
create trigger Coursereg_insert
on CourseReg
for insert
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from inserted
Declare @CID varchar(6)
Select @CID =  CID from inserted
Declare @Sem varchar(20)
Select @Sem =  Semester from inserted
Declare @Sec varchar(1)
Select @Sec =  secID from inserted


insert into Auditlog values
('New Course Register by '
+  cast(@rollNo as nvarchar(8))
+ ' in ' + cast(@CID as nvarchar(6))
+ ' in ' + cast(@Sem as nvarchar(20))
+ ' in ' + cast(@Sec as nvarchar(1))
+ ' at ' + cast(GetDate()as nvarchar(20)))

end


--Course Allocation
Go
create trigger CourseAlloc_insert
on CourseAlloc
for insert
AS
Begin 

Declare @FID varchar(15)
Select @FID =  FacultyID from inserted
Declare @CID varchar(6)
Select @CID =  CourseID from inserted
Declare @Sem varchar(20)
Select @Sem =  Semester from inserted
Declare @Sec varchar(1)
Select @Sec =  secID from inserted


insert into Auditlog values
('New Course Allocated to '
+  cast(@FID as nvarchar(15))
+ ' in ' + cast(@CID as nvarchar(6))
+ ' in ' + cast(@Sem as nvarchar(20))
+ ' in ' + cast(@Sec as nvarchar(1))
+ ' at ' + cast(GetDate()as nvarchar(20)))

end


--Grades Insert 
Go
create trigger grade_insert
on grades
for insert
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from inserted
Declare @CID varchar(6)
Select @CID =  CourseID from inserted
Declare @Sem varchar(20)
Select @Sem =  Semester from inserted



insert into Auditlog values
('New Grade Generate for '
+  cast(@rollNo as nvarchar(8))
+ ' in ' + cast(@CID as nvarchar(6))
+ ' in ' + cast(@Sem as nvarchar(20))
+ ' at ' + cast(GetDate()as nvarchar(20)))

end


-- Attendance 
Go
create trigger Attendance_insert
on attendance
for insert
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from inserted
Declare @CID varchar(6)
Select @CID =  CourseID from inserted
Declare @Sem varchar(20)
Select @Sem =  Semester from inserted



insert into Auditlog values
('New Attendance ionserted for '
+  cast(@rollNo as nvarchar(8))
+ ' in ' + cast(@CID as nvarchar(6))
+ ' in ' + cast(@Sem as nvarchar(20))
+ ' at ' + cast(GetDate()as nvarchar(20)))

end


-- Feedback Log
Go
create trigger feedback_insert
on feedback
for insert
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from inserted
Declare @CID varchar(6)
Select @CID =  CourseID from inserted
Declare @Sem varchar(20)
Select @Sem =  Semester from inserted



insert into Auditlog values
('New Feedback inserted by '
+  cast(@rollNo as nvarchar(8))
+ ' in ' + cast(@CID as nvarchar(6))
+ ' in ' + cast(@Sem as nvarchar(20))
+ ' at ' + cast(GetDate()as nvarchar(20)))

end




