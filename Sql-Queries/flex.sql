create Table Section(
	secID varchar(1) not null primary key,

);



create table Degree(
	DegreeID varchar(10) not null primary key,
	DegreeName varchar(30) not null,

);

create table Student(
	rollNo varchar(8) not null primary key,
	FirstName varchar(50), 
	LastName varchar(50), 
	DateOfBirth Date,
	Email varchar(30), 
	CNIC varchar(20),
	PhoneNumber varchar(15), 
	Address varchar(255),
	city varchar(30),
	country varchar(30),
	Password varchar(30) ,
	DegreeID varchar(10) foreign key References Degree(DegreeID) on delete set null,
	secID varchar(1) foreign key References section(SecID)  on delete set null
);

create table Faculty(
	FacultyID varChar(15) not null primary key,
	FirstName varchar(50), 
	LastName varchar(50), 
	Email varchar(30), 
	PhoneNumber varchar(15),
	CNIC varchar(20),
	DOB Date,
	JoiningDate Date,
	Password varchar(30)



);

create Table Admin(
	AdminID varchar(15) not null primary key,
	FirstName varchar(50), 
	LastName varchar(50), 
	Email varchar(30), 
	PhoneNumber varchar(15),
	CNIC varchar(20),
	Password varchar(30)


);

create Table Courses(
	CourseID varchar(6) not null primary key,
	CName varchar(30) not null,
	CCredHrs int not null,
	prereq varchar(6) foreign key references Courses(CourseID) on delete no action

);



create Table semester(
	SemesterName varchar(20) not null primary key,
	StartDate Date, 
	EndDate Date
);

create Table CourseReg( -- for students
	rollNo varchar(8) Foreign key references Student(rollNo) on delete no action,
	CID varchar(6) Foreign key references Courses(CourseID) on delete cascade,
	secID varchar(1) Foreign key references section(SecID) on delete no action,
	Semester  varchar(20) Foreign key references semester(SemesterName)  on delete no action

	constraint pkCR primary key (rollNo, CID, SecID, Semester)

);

create Table courseAlloc( -- for Faculty
	FacultyID  varChar(15)  Foreign key references Faculty(FacultyID)  on delete no action, 
	secID varchar(1) Foreign key references section(SecID)  on delete no action, 
	CourseID varchar(6)	Foreign key references Courses(CourseID)  on delete cascade,
	Semester varchar(20) Foreign key references semester(SemesterName)  on delete no action
	constraint pkCA primary key (FacultyID, CourseID, SecID, Semester)
);



create Table marks(
    marktype varChar(20),
    Weightage int,
    ObtainedMarks int,
    TotalMarks int,
    CourseID varchar(6)    Foreign key references Courses(CourseID)  on delete cascade,
    rollNo varchar(8) Foreign key references Student(rollNo)  on delete no action,
    Semester varchar(20) Foreign key references semester(SemesterName)  on delete no action,
    constraint PKM primary key (marktype, CourseID, rollNo,Semester )


);



create Table grades( --can alter baad me
	
	grade varchar(2),
	gradeLB int,
	gradeUB int,
	CourseID varchar(6)	Foreign key references Courses(CourseID)  on delete cascade,
	Semester varchar(20) Foreign key references semester(SemesterName) on delete no action

	constraint pkG primary key (CourseID, Semester)

);



create Table Attendance(
    rollNo varchar(8) Foreign key references Student(rollNo) on delete no action,
    Semester varchar(20) Foreign key references semester(SemesterName) on delete no action,
    CourseID varchar(6)    Foreign key references Courses(CourseID) on delete cascade,
    Datee Date not null,
    Duration int,
    Presence varChar(1)

    constraint pkA primary key (datee, rollNo, CourseID, Semester)


);




--query to get the courses studied by the student
select * from Courses inner join CourseReg on CourseReg.CID = Courses.CourseID where CourseReg.rollNo = '21i-5550' AND CourseReg.Semester = 'Fall 2022'

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

Go
create proc getStudentAttendance
(
@RN varchar(8),
@Sem varchar(20),
@course varchar(6)
)
as
begin
select Datee, Duration, Presence from Attendance where rollNo = @RN AND Semester = @Sem AND CourseID = @course
end


Go
create proc getAttendancePercentage
(
@RN varchar(8),
@Sem varchar(20),
@course varchar(6)
)
as
begin
SELECT
    cast((SUM(CASE WHEN Presence = 'P' THEN Duration ELSE 0 END) / cast(SUM(Duration) as decimal(7,2))) * 100 AS Decimal(7,2)) AS Percentage
FROM
    Attendance
where rollNo = @RN AND Semester = @Sem AND CourseID = @course
end






Go
create proc getStudentMarks
(
@RN varchar(8),
@Sem varchar(20),
@course varchar(6)
)
as
begin
SELECT marktype, Weightage, CAST(Weightage * CAST(ObtainedMarks AS DECIMAL(7, 2)) / TotalMarks AS DECIMAL(7, 2)) AS ObtainedMarks, TotalMarks, ObtainedMarks FROM marks
    WHERE rollNo = @RN AND Semester = @Sem AND CourseID = @Course
end



go
create proc getTotalAbs
(
@RN varchar(8),
@Sem varchar(20),
@course varchar(6)
)
as
begin
Select sum(Weightage) from marks WHERE rollNo = @RN AND Semester = @Sem AND CourseID = @Course
end
