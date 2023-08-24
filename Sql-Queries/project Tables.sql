

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
	CourseID varchar(9) not null primary key,
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
	CourseID varchar(6)	Foreign key references Courses(CourseID)  on delete cascade,
	rollNo varchar(8) Foreign key references Student(rollNo)  on delete no action,
	Semester varchar(20) Foreign key references semester(SemesterName)  on delete no action,

	constraint PKM primary key (marktype, CourseID, rollNo,Semester )


);



create Table grades( --can alter baad me
	
	grade varchar(2),
	CourseID varchar(6)	Foreign key references CourseS(CourseID)  on delete cascade,
	Semester varchar(20) Foreign key references semester(SemesterName) on delete no action,
	rollNo varchar(8) Foreign key references Student(rollNo)  on delete no action,

	constraint pkG primary key (rOLLnO, CourseID, Semester)

);




create Table Attendance(
	rollNo varchar(8) Foreign key references Student(rollNo) on delete no action,
	Semester varchar(20) Foreign key references semester(SemesterName) on delete no action,
	CourseID varchar(6)	Foreign key references Courses(CourseID) on delete cascade,
	Datee Date not null,
	Duration int,
	Presence varChar(1)

	constraint pkA primary key (datee, rollNo, CourseID, Semester)


);



CREATE TABLE feedback
(
    feedbackID INT IDENTITY(1,1) PRIMARY KEY,
    rollNo VARCHAR(8) FOREIGN KEY REFERENCES Student(rollNo),
    CourseID VARCHAR(6) FOREIGN KEY REFERENCES Courses(CourseID),
    Semester VARCHAR(20) FOREIGN KEY REFERENCES semester(SemesterName),
    q1 INT,
    q2 INT,
    q3 INT,
    q4 INT,
    q5 INT,
    q6 INT,
    q7 INT,
    q8 INT,
    q9 INT,
    q10 INT,
    q11 INT,
    q12 INT,
    q13 INT,
    q14 INT,
    q15 INT,
    q16 INT,
    q17 INT,
    q18 INT,
    q19 INT,
    q20 INT,

	constraint pkFB primary key (feedbackID, rollNo, CourseID,Semester)
)


create Table AuditLog(

  Id int identity(1,1) primary key,
  AuditData nvarchar(1000)


);

