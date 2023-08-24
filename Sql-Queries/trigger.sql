------------marks deelete-----------------------
create trigger marks_Delete
on marks
for delete
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from deleted
Declare @CID varchar(6)
Select @CID =  CourseID from deleted
Declare @Sem varchar(20)
Select @Sem =  Semester from deleted


insert into Auditlog values
('Marks deleted for '
+  cast(@rollNo as nvarchar(8))
+ ' ' + cast(@CID as nvarchar(6))
+ ' ' + cast(@Sem as nvarchar(20))
+ 'at' + cast(GetDate()as nvarchar(20)))
end

-- Update

create trigger marks_Update
on marks
for update
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from inserted
Declare @CID varchar(6)
Select @CID =  CourseID from inserted
Declare @Sem varchar(20)
Select @Sem =  Semester from inserted


insert into Auditlog values
('Marks Update for '
+  cast(@rollNo as nvarchar(8))
+ ', ' + cast(@CID as nvarchar(6))
+ ', ' + cast(@Sem as nvarchar(20))
+ 'at' + cast(GetDate()as nvarchar(20)))

end




select * from auditLog

--------------student update--------------
create trigger std_Update
on student
for update
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from inserted

insert into Auditlog values
('Student updated with roll No: ' + cast(@rollNo as nvarchar(8)) + ' at ' + cast(GetDate()as nvarchar(20)))

end

--------------student deleted-------------
create trigger std_Delete
on student
for delete
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from deleted

insert into Auditlog values
('Student deleted with roll No: ' + cast(@rollNo as nvarchar(8)) + ' at ' + cast(GetDate()as nvarchar(20)))

end

-----------faculty update----------------
Go
create trigger Fcl_Update
on faculty
for update
AS
Begin 

Declare @facultyID varchar(15)
Select @facultyID =  FacultyID from inserted

insert into Auditlog values
('faculty updated with ID: ' + cast(@facultyID as nvarchar(15)) + ' at ' + cast(GetDate()as nvarchar(20)))

end

------------faculty delete-------------
Go
create trigger Fcl_Delete
on faculty
for delete
AS
Begin 

Declare @facultyID varchar(15)
Select @facultyID =  FacultyID from deleted

insert into Auditlog values
('faculty deleted with ID: ' + cast(@facultyID as nvarchar(15)) + ' at ' + cast(GetDate()as nvarchar(20)))

end

--------------------courses update--------------
create trigger courses_Update
on courses
for update
AS
Begin 

Declare @cname varchar(30)
Select @cname =  CName from inserted
Declare @CID varchar(6)
Select @CID =  CourseID from inserted



insert into Auditlog values
('course '  
+  cast(@cname as nvarchar(30))
+ ' updated with Course ID ' + cast(@CID as nvarchar(6))
+ ' at ' + cast(GetDate()as nvarchar(20)))

end
--------------------courses delete--------------
create trigger courses_Delete
on courses
for delete
AS
Begin 

Declare @cname varchar(30)
Select @cname =  CName from deleted
Declare @CID varchar(6)
Select @CID =  CourseID from deleted



insert into Auditlog values
('course '  
+  cast(@cname as nvarchar(30))
+ ' deleted with Course ID ' + cast(@CID as nvarchar(6))
+ ' at ' + cast(GetDate()as nvarchar(20)))

end

------coursereg update-----------
Go
create trigger Coursereg_update
on CourseReg
for update
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
('Course updated by '
+  cast(@rollNo as nvarchar(8))
+ ' in ' + cast(@CID as nvarchar(6))
+ ' in ' + cast(@Sem as nvarchar(20))
+ ' in ' + cast(@Sec as nvarchar(1))
+ 'at' + cast(GetDate()as nvarchar(20)))

end
------coursereg delete-----------
Go
create trigger Coursereg_delete
on CourseReg
for delete
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from deleted
Declare @CID varchar(6)
Select @CID =  CID from deleted
Declare @Sem varchar(20)
Select @Sem =  Semester from deleted
Declare @Sec varchar(1)
Select @Sec =  secID from deleted


insert into Auditlog values
('Course deleted by '
+  cast(@rollNo as nvarchar(8))
+ ' in ' + cast(@CID as nvarchar(6))
+ ' in ' + cast(@Sem as nvarchar(20))
+ ' in ' + cast(@Sec as nvarchar(1))
+ 'at' + cast(GetDate()as nvarchar(20)))

end

-------course allocation update------
Go
create trigger CourseAlloc_update
on CourseAlloc
for update
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
('updated Course Allocated to '
+  cast(@FID as nvarchar(15))
+ ' in ' + cast(@CID as nvarchar(6))
+ ' in ' + cast(@Sem as nvarchar(20))
+ ' in ' + cast(@Sec as nvarchar(1))
+ 'at' + cast(GetDate()as nvarchar(20)))

end
------- course allocation delete----------
Go
create trigger CourseAlloc_delete
on CourseAlloc
for delete
AS
Begin 

Declare @FID varchar(15)
Select @FID =  FacultyID from deleted
Declare @CID varchar(6)
Select @CID =  CourseID from deleted
Declare @Sem varchar(20)
Select @Sem =  Semester from deleted
Declare @Sec varchar(1)
Select @Sec =  secID from deleted


insert into Auditlog values
('Course Deleted at '
+  cast(@FID as nvarchar(15))
+ ' in ' + cast(@CID as nvarchar(6))
+ ' in ' + cast(@Sem as nvarchar(20))
+ ' in ' + cast(@Sec as nvarchar(1))
+ 'at' + cast(GetDate()as nvarchar(20)))
end

-----------attendance update-----------
Go
create trigger Attendance_update
on attendance
for update
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from inserted
Declare @CID varchar(6)
Select @CID =  CourseID from inserted
Declare @Sem varchar(20)
Select @Sem =  Semester from inserted



insert into Auditlog values
('Attendance updated for '
+  cast(@rollNo as nvarchar(8))
+ ' in ' + cast(@CID as nvarchar(6))
+ ' in ' + cast(@Sem as nvarchar(20))
+ ' at ' + cast(GetDate()as nvarchar(20)))

end
------attendence delete----------
Go
create trigger Attendance_delete
on attendance
for delete
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from deleted
Declare @CID varchar(6)
Select @CID =  CourseID from deleted
Declare @Sem varchar(20)
Select @Sem =  Semester from deleted



insert into Auditlog values
('Attendance deleted for '
+  cast(@rollNo as nvarchar(8))
+ ' in ' + cast(@CID as nvarchar(6))
+ ' in ' + cast(@Sem as nvarchar(20))
+ ' at ' + cast(GetDate()as nvarchar(20)))

end

-------------------feedback update-----------
Go
create trigger feedback_update
on feedback
for update
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from inserted
Declare @CID varchar(6)
Select @CID =  CourseID from inserted
Declare @Sem varchar(20)
Select @Sem =  Semester from inserted



insert into Auditlog values
('Feedback updated by '
+  cast(@rollNo as nvarchar(8))
+ ' in ' + cast(@CID as nvarchar(6))
+ ' in ' + cast(@Sem as nvarchar(20))
+ ' at ' + cast(GetDate()as nvarchar(20)))

end

-------feedback deleted -------
Go
create trigger feedback_delete
on feedback
for delete
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from deleted
Declare @CID varchar(6)
Select @CID =  CourseID from deleted
Declare @Sem varchar(20)
Select @Sem =  Semester from deleted



insert into Auditlog values
('Feedback deleted by '
+  cast(@rollNo as nvarchar(8))
+ ' in ' + cast(@CID as nvarchar(6))
+ ' in ' + cast(@Sem as nvarchar(20))
+ ' at ' + cast(GetDate()as nvarchar(20)))

end
---------------------------------------------


------Grade Update--------
Go
create trigger grade_Update
on grades
for Update
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from inserted
Declare @CID varchar(6)
Select @CID =  CourseID from inserted
Declare @Sem varchar(20)
Select @Sem =  Semester from inserted



insert into Auditlog values
(' Grade Update for '
+  cast(@rollNo as nvarchar(8))
+ ' in ' + cast(@CID as nvarchar(6))
+ ' in ' + cast(@Sem as nvarchar(20))
+ ' at ' + cast(GetDate()as nvarchar(20)))

end

-----Grade Delete ----------

Go
create trigger grade_Delete
on grades
for Delete
AS
Begin 

Declare @rollNo varchar(8)
Select @rollNo =  rollNo from Deleted
Declare @CID varchar(6)
Select @CID =  CourseID from Deleted
Declare @Sem varchar(20)
Select @Sem =  Semester from Deleted



insert into Auditlog values
(' Grade Deleted for '
+  cast(@rollNo as nvarchar(8))
+ ' in ' + cast(@CID as nvarchar(6))
+ ' in ' + cast(@Sem as nvarchar(20))
+ ' at ' + cast(GetDate()as nvarchar(20)))

end