

insert into Faculty (FacultyID, FirstName, LastName, Email, PhoneNumber, CNIC, DOB, JoiningDate, Password) Values
('ISB100-101','Fatima','Bahsrat','amna.basharat@nu.edu.pk','0331-4567890','31010-1357924-9','1995-10-01','2020-01-01', '123456')
('ISB100-100','Amna','Bahsrat','amna.basharat@nu.edu.pk','0331-4567890','31010-1357924-9','1995-10-01','2020-01-01', '123456')




insert into section(secID) values
('A'),
('B'),
('C'),
('D'),
('E'),
('F'),
('G'),
('H'),
('I'),
('J'),
('K'),
('L'),
('M'),
('N'),
('O'),
('P'),
('Q'),
('R'),
('S'),
('T'),
('U'),
('V'),
('W'),
('X'),
('Y'),
('Z');


insert into Degree (DegreeID, DegreeName) values
('1', 'BS-CS'),
('2', 'BS-DS'),
('3', 'BS-AI'),
('4', 'BS-CYS'),
('5', 'BS-SE'),
('6', 'BBA'),
('7', 'BS-BA'),
('8', 'BS-EE'),
('9', 'BS-ACF'),
('10', 'BS-FT'),
('11', 'BS-CE');



insert into student( ROLLNO,FirstName,LastName,DateOfBirth,Email,CNIC,PhoneNumber,ADDRESS,CITY,COUNTRY,Password,DegreeID,secID) values 
('21I-5550', 'Sana', 'Aslam', '2003-06-04', 'i215550@nu.edu.pk', '35202-9876543-9', '0345-2109876', 'G-12', 'Islamabad', 'Pakistan', '12345678', '4', 'A'),
('21I-0410', 'Mohammad', 'Attique', '2002-09-01', 'i210410@nu.edu.pk', '35202-0917076-9', '0331-3994297', 'DHA-V', 'Islamabad', 'Pakistan', '12345678', '1', 'E'),
('21i-0725', 'Fatima', 'Khan', '2003-10-14', 'i20725@nu.edu.pk', '35202-0876542-1', '0347-5713628', 'GULBERG', 'Islamabad', 'Pakistan', '12345678', '10', 'G'),
('21I-0050', 'Ayesha', 'Malik', '2003-02-22', 'i210050@nu.edu.pk', '35202-1234567-8', '0312-1234567', 'I-9', 'Islamabad', 'Pakistan', '12345678', '2', 'G'),
('21I-0125', 'Ali', 'Raza', '2001-11-12', 'i210125@nu.edu.pk', '35202-7654321-0', '0333-3456789', 'DHA-II', 'Islamabad', 'Pakistan', '12345678', '6', 'E'),
('21I-0190', 'Syed', 'Ahmed', '2002-05-12', 'i210190@nu.edu.pk', '35202-0987654-3', '0315-9876543', 'F-8', 'Islamabad', 'Pakistan', '12345678', '9', 'B'),
('21I-0265', 'Maryam', 'Ali', '2001-04-05', 'i210265@nu.edu.pk', '35202-0765432-1', '0341-9876543', 'I-10', 'Islamabad', 'Pakistan', '12345678', '5', 'A'),
('21I-0310', 'Ahmed', 'Rafique', '2002-07-17', 'i210310@nu.edu.pk', '35202-6789012-3', '0336-7890123', 'G-9', 'Islamabad', 'Pakistan', '12345678', '10', 'G'),
('21I-0450', 'Sana', 'Khan', '2001-09-30', 'i210450@nu.edu.pk', '35202-2109876-5', '0321-8765432', 'DHA-VI', 'Islamabad', 'Pakistan', '12345678', '4', 'C'),
('21I-0500', 'Fatima', 'Rasheed', '2003-05-19', 'i210500@nu.edu.pk', '35202-1098765-4', '0316-5432109', 'G-11', 'Islamabad', 'Pakistan', '12345678', '2', 'G');

INSERT INTO semester (SemesterName, StartDate, EndDate)
VALUES 
    ('Fall 2022', '2022-08-15', '2022-12-15'),
    ('Spring 2023', '2023-01-10', '2023-05-10'),
    ('Summer 2023', '2023-05-15', '2023-08-15');

('CS101', 'Introduction to Programming', 4, NULL),
('CS102', 'Data Structures and Algorithms', 4, 'CS101'),
('CS103', 'Computer Architecture', 3, 'CS102'),
('CS104', 'Operating Systems', 3, 'CS102'),
('CS201', 'Computer Networks', 3, 'CS102'),
('CS202', 'Database Systems', 3, 'CS101'),
('CS203', 'Software Engineering', 4, 'CS102'),
('CS204', 'Artificial Intelligence', 3, 'CS103'),

INSERT INTO courses (CourseID, CName, CCredHrs, prereq) 
VALUES 

('CS301', 'Web Development', 3, 'CS102'),
('CS302', 'Mobile Application Development', 3, 'CS102'),
('CS303', 'Computer Graphics', 3, 'CS104'),
('CS304', 'Distributed Systems', 3, 'CS104'),
('CS401', 'Computer Security', 3, 'CS201'),
('CS402', 'Cloud Computing', 3, 'CS204'),
('CS403', 'Human-Computer Interaction', 3, 'CS203'),
('CS404', 'Computer Vision', 3, 'CS204');


Insert into courseAlloc (FacultyID, secID, CourseID, Semester) values
('ISB100-101', 'D', 'CS102', 'Fall 2022'),
('ISB100-100', 'D', 'CS103', 'Spring 2023'),
('ISB100-100', 'E', 'CS103', 'Fall 2022'),
('ISB100-100', 'A', 'CS102', 'Fall 2022'),
('ISB100-100', 'G', 'CS102', 'Fall 2022')


Insert into courseReg (rollNo, CID, secID, Semester) values
('21I-0410', 'CS102', 'D', 'Fall 2022'),
('21I-5550', 'CS103', 'A', 'Fall 2022'),
('21I-5550', 'CS103', 'D', 'Spring 2023'),
('21I-5550', 'CS102', 'A', 'Fall 2022'),
('21I-0265', 'CS102', 'A', 'Fall 2022'),
('21i-0725', 'CS102', 'G', 'Fall 2022'),
('21I-0050', 'CS102', 'G', 'Fall 2022'),
('21I-0310', 'CS102', 'G', 'Fall 2022'),
('21I-0500', 'CS102', 'G', 'Fall 2022');

insert into attendance (rollNo, Semester, CourseID, Datee, Duration, Presence) values 
('21i-0725', 'Fall 2023', 'CS102', '2023-11-05', 3, 'P' ),
('21i-0725', 'Fall 2022', 'CS102', '2023-12-05', 3, 'P' ),
('21I-0050', 'Fall 2022', 'CS102', '2023-12-05', 3, 'P' ),
('21I-0050', 'Fall 2022', 'CS102', '2023-11-05', 3, 'P' ),
('21i-0725', 'Fall 2022', 'CS102', '2023-11-05', 3, 'P' )

insert into admin(AdminID, FirstName, LastName, Email, PhoneNumber, Cnic, Password) values 
('admin123', 'Muhammad Riyan', 'Aslam', 'riyan20riyan@fmail.com', '0323-5890386', '62901-3183841-1', '12345678')


--Alter Table attendance drop constraint pka

--alter table attendance alter column datee date not null

--Alter Table attendance 
--add constraint PKa primary key (Datee, rollNo, Semester, CourseID)


insert into Feedback(feedbackID, rollNo, CourseID, Semester, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20) values
(1, '21I-0410', 'CS102', 'Fall 2022', 1,4,3,5,4,3,4,3,5,2,3,4,5,1,2,3,4,2,4,3)
(1, '21I-0265', 'CS102', 'Fall 2022', 1,4,3,5,4,3,4,3,5,2,3,4,5,1,2,3,4,2,4,3)
(1, '21I-5550', 'CS103', 'Spring 2023', 1,4,3,5,4,3,4,3,5,2,3,4,5,1,2,3,4,2,4,3)
(1, '21I-0050', 'CS102', 'Fall 2022', 1,4,3,5,4,3,4,3,5,2,3,4,5,1,2,3,4,2,4,3)

INSERT INTO Student(ROLLNO, FirstName, LastNAME, DateOfBirth, EMAIL, CNIC, PhoneNumber, ADDRESS, CITY, COUNTRY, Password, DEGREEID, SECID) VALUES
	('21I-0645', 'Abdullah', 'Nawaz', '12/7/02', 'i210645@nu.edu.pk', '35202-9876543-2', '0334-0987654', 'DHA-I', 'Islamabad', 'Pakistan', '12345678', '8', 'E'),
	('21I-0705', 'Saad', 'Iqbal', '6/24/01', 'i210705@nu.edu.pk', '35202-0123456-7', '0342-3456789', 'F-10', 'Islamabad', 'Pakistan', '12345678', '3', 'C'),
	('21I-0830', 'Amna', 'Riaz', '1/28/03', 'i210830@nu.edu.pk', '35202-5678901-2', '0313-6789012', 'I-11', 'Islamabad', 'Pakistan', '12345678', '7', 'C'),
	('21I-0920', 'Kamran', 'Khan', '8/9/01', 'i210920@nu.edu.pk', '35202-7654321-0', '0333-4567890', 'DHA-II', 'Islamabad', 'Pakistan', '12345678', '10', 'G'),
	('21I-1010', 'Anum', 'Shahzad', '3/17/02', 'i211010@nu.edu.pk', '35202-0987654-3', '0344-9876543', 'G-6', 'Islamabad', 'Pakistan', '12345678', '5', 'C'),
	('21I-1165', 'Ahsan', 'Khalid', '2/19/01', 'i211165@nu.edu.pk', '35202-6543210-9', '0315-3210987', 'I-9', 'Islamabad', 'Pakistan', '12345678', '1', 'G'),
	('21I-1205', 'Zainab', 'Ali', '9/13/03', 'i211205@nu.edu.pk', '35202-1098765-4', '0334-2109876', 'F-7', 'Islamabad', 'Pakistan', '12345678', '9', 'E'),
	('21I-1360', 'Hassan', 'Abbas', '11/28/02', 'i211360@nu.edu.pk', '35202-6789012-3', '0345-7890123', 'G-10', 'Islamabad', 'Pakistan', '12345678', '4', 'B'),
	('21I-1450', 'Mehak', 'Saeed', '8/6/03', 'i211450@nu.edu.pk', '35202-7654321-0', '0312-3456789', 'DHA-I', 'Islamabad', 'Pakistan', '12345678', '6', 'A'),
	('21I-1525', 'Nimra', 'Ahmed', '7/19/01', 'i211525@nu.edu.pk', '35202-2109876-5', '0346-8765432', 'F-10', 'Islamabad', 'Pakistan', '12345678', '3', 'C'),
	('21I-1690', 'Ali', 'Raza', '1/24/03', 'i211690@nu.edu.pk', '35202-1098765-4', '0313-4321098', 'I-11', 'Islamabad', 'Pakistan', '12345678', '7', 'D'),
	('21I-1780', 'Farah', 'Khan', '10/14/01', 'i211780@nu.edu.pk', '35202-9876543-2', '0335-0987654', 'DHA-V', 'Islamabad', 'Pakistan', '12345678', '8', 'E'),
	('21I-1875', 'Humaira', 'Malik', '5/12/02', 'i211875@nu.edu.pk', '35202-0987654-3', '0347-9876543', 'G-9', 'Islamabad', 'Pakistan', '12345678', '9', 'B'),
	('21I-1930', 'Musa', 'Sohail', '4/28/01', 'i211930@nu.edu.pk', '35202-7654321-0', '0315-2345678', 'I-10', 'Islamabad', 'Pakistan', '12345678', '5', 'A'),
	('21I-2065', 'Aisha', 'Rehman', '3/1/02', 'i212065@nu.edu.pk', '35202-6543210-9', '0341-3210987', 'DHA-IV', 'Islamabad', 'Pakistan', '12345678', '2', 'F'),
	('21I-2110', 'Khizar', 'Khan', '12/18/01', 'i212110@nu.edu.pk', '35202-5678901-2', '0312-6789012', 'GULBERG', 'Islamabad', 'Pakistan', '12345678', '1', 'G'),
	('21I-2290', 'Salman', 'Riaz', '10/9/02', 'i212290@nu.edu.pk', '35202-2109876-5', '0331-8765432', 'F-11', 'Islamabad', 'Pakistan', '12345678', '10', 'G'),
	('21I-2345', 'Sadia', 'Mahmood', '7/2/03', 'i212345@nu.edu.pk', '35202-1098765-4', '0345-2109876', 'DHA-III', 'Islamabad', 'Pakistan', '12345678', '9', 'E'),
	('21I-2430', 'Nida', 'Fatima', '9/11/01', 'i212430@nu.edu.pk', '35202-9876543-2', '0316-0987654', 'I-9', 'Islamabad', 'Pakistan', '12345678', '8', 'D'),
	('21I-2505', 'Mohsin', 'Ahmed', '6/14/02', 'i212505@nu.edu.pk', '35202-8765432-1', '0332-9876543', 'G-7', 'Islamabad', 'Pakistan', '12345678', '7', 'B'),
	('21I-2670', 'Ammar', 'Ali', '5/15/01', 'i212670@nu.edu.pk', '35202-7654321-0', '0346-2345678', 'DHA-VI', 'Islamabad', 'Pakistan', '12345678', '3', 'A'),
	('21I-2805', 'Sara', 'Malik', '2/1/03', 'i212805@nu.edu.pk', '35202-6543210-1', '0321-4567890', 'Blue Area', 'Islamabad', 'Pakistan', '12345678', '4', 'A'),
	('21I-2950', 'Ali', 'Zafar', '11/20/01', 'i212950@nu.edu.pk', '35202-5432109-3', '0345-9876543', 'G-9', 'Islamabad', 'Pakistan', '12345678', '5', 'B'),
	('21I-3005', 'Ayesha', 'Ahmed', '8/15/02', 'i213005@nu.edu.pk', '35202-4321098-4', '0313-7654321', 'I-10', 'Islamabad', 'Pakistan', '12345678', '6', 'C'),
	('21I-3150', 'Ahmed', 'Raza', '7/17/01', 'i213150@nu.edu.pk', '35202-3210987-5', '0333-6543210', 'E-11', 'Islamabad', 'Pakistan', '12345678', '2', 'D'),
	('21I-3205', 'Anam', 'Malik', '4/29/03', 'i213205@nu.edu.pk', '35202-2109876-6', '0346-5432109', 'I-8', 'Islamabad', 'Pakistan', '12345678', '9', 'E'),
	('21I-3350', 'Hamza', 'Khan', '3/10/02', 'i213350@nu.edu.pk', '35202-1098765-7', '0315-4321098', 'I-7', 'Islamabad', 'Pakistan', '12345678', '10', 'G'),
	('21I-3405', 'Mariam', 'Ali', '12/31/01', 'i213405@nu.edu.pk', '35202-0987654-8', '0331-3210987', 'G-8', 'Islamabad', 'Pakistan', '12345678', '1', 'A'),
	('21I-3550', 'Hassan', 'Abbas', '10/22/02', 'i213550@nu.edu.pk', '35202-9876543-9', '0344-2109876', 'I-11', 'Islamabad', 'Pakistan', '12345678', '4', 'C'),
	('21I-3605', 'Fatima', 'Khalid', '9/13/01', 'i213605@nu.edu.pk', '35202-8765432-0', '0312-1098765', 'DHA-II', 'Islamabad', 'Pakistan', '12345678', '6', 'E'),
	('21I-3750', 'Usman', 'Akram', '6/24/02', 'i213750@nu.edu.pk', '35202-7654321-1', '0345-0987654', 'I-8', 'Islamabad', 'Pakistan', '12345678', '5', 'D'),
	('21I-3805', 'Maha', 'Irfan', '5/25/01', 'i213805@nu.edu.pk', '35202-6543210-2', '0316-9876543', 'DHA-I', 'Islamabad', 'Pakistan', '12345678', '3', 'B'),
	('21I-3950', 'Aqsa', 'Masood', '3/6/03', 'i213950@nu.edu.pk', '35202-5432109-3', '0333-8765432', 'G-10', 'Islamabad', 'Pakistan', '12345678', '2', 'A'),
	('21I-4005', 'Rafay', 'Aslam', '12/7/01', 'i214005@nu.edu.pk', '35202-4321098-4', '0346-7654321', 'DHA-VII', 'Islamabad', 'Pakistan', '12345678', '9', 'G'),
	('21I-4150', 'Kanza', 'Khan', '9/8/02', 'i214150@nu.edu.pk', '35202-3210987-5', '0315-6543210', 'I-14', 'Islamabad', 'Pakistan', '12345678', '8', 'E'),
	('21I-4205', 'Aliya', 'Siddiqui', '6/11/03', 'i214205@nu.edu.pk', '35202-2109876-6', '0331-5432109', 'G-11', 'Islamabad', 'Pakistan', '12345678', '3', 'C'),
	('21I-4350', 'Muhammad', 'Tariq', '8/12/01', 'i214350@nu.edu.pk', '35202-1098765-7', '0316-4321098', 'I-12', 'Islamabad', 'Pakistan', '12345678', '7', 'D'),
	('21I-4405', 'Asad', 'Saleem', '5/23/02', 'i214405@nu.edu.pk', '35202-0987654-8', '0344-3210987', 'G-9', 'Islamabad', 'Pakistan', '12345678', '10', 'G'),
	('21I-4550', 'Amina', 'Haider', '4/24/01', 'i214550@nu.edu.pk', '35202-9876543-9', '0313-2109876', 'F-10', 'Islamabad', 'Pakistan', '12345678', '4', 'A'),
	('21I-4605', 'Hamid', 'Akhtar', '2/5/03', 'i214605@nu.edu.pk', '35202-8765432-0', '0332-1098765', 'DHA-VI', 'Islamabad', 'Pakistan', '12345678', '5', 'B'),
	('21I-4750', 'Nashit', 'Kamran', '1/6/02', 'i214750@nu.edu.pk', '35202-7654321-1', '0345-0987654', 'I-9', 'Islamabad', 'Pakistan', '12345678', '6', 'C'),
	('21I-4805', 'Ayesha', 'Ali', '10/17/01', 'i214805@nu.edu.pk', '35202-6543210-2', '0312-9876543', 'DHA-IV', 'Islamabad', 'Pakistan', '12345678', '1', 'A'),
	('21I-4950', 'Zain', 'Abbas', '7/18/02', 'i214950@nu.edu.pk', '35202-5432109-3', '0346-8765432', 'I-8', 'Islamabad', 'Pakistan', '12345678', '2', 'D'),
	('21I-5005', 'Mariam', 'Shahid', '6/29/01', 'i215005@nu.edu.pk', '35202-4321098-4', '0333-7654321', 'E-9', 'Islamabad', 'Pakistan', '12345678', '9', 'G'),
	('21I-5150', 'Farhan', 'Ahmed', '4/30/02', 'i215150@nu.edu.pk', '35202-3210987-5', '0315-6543210', 'DHA-V', 'Islamabad', 'Pakistan', '12345678', '8', 'F'),
	('21I-5205', 'Humza', 'Khan', '3/31/01', 'i215205@nu.edu.pk', '35202-2109876-6', '0344-5432109', 'G-6', 'Islamabad', 'Pakistan', '12345678', '7', 'E'),
	('21I-5350', 'Soha', 'Malik', '12/2/02', 'i215350@nu.edu.pk', '35202-1098765-7', '0316-4321098', 'I-15', 'Islamabad', 'Pakistan', '12345678', '3', 'B'),
	('21I-5405', 'Fizza', 'Amir', '9/3/01', 'i215405@nu.edu.pk', '35202-0987654-8', '0331-3210987', 'I-16', 'Islamabad', 'Pakistan', '12345678', '10', 'G');


	INSERT INTO Faculty (FACULTYID, FirstNAME, LastNAME, EMAIL, PHONENumber,  CNIC, DOB, JOININGDATE) VALUES
	('ISB102-200', 'Aisha', 'Ali', 'aisha.ali@nu.edu.pk', '0333-5678901', '31101-6789012-3', '7/8/1996', '11/20/2021'),
	('FSD103-100', 'Ahmed', 'Malik', 'ahmed.malik@nu.edu.pk', '0332-6789012', '43526-7890123-4', '1/12/1997', '3/1/2022'),
	('ISB103-200', 'Fatima', 'Abbas', 'fatima.abbas@nu.edu.pk', '0332-7890123', '31010-8901234-5', '6/3/1999', '4/30/2023'),
	('FSD104-100', 'Saad', 'Ahmed', 'saad.ahmed@nu.edu.pk', '0331-8901234', '31101-9012345-6', '3/5/1998', '5/15/2022'),
	('ISB104-200', 'Usman', 'Malik', 'usman.malik@nu.edu.pk', '0331-9012345', '43526-0123456-7', '11/28/1996', '9/10/2021'),
	('FSD105-100', 'Sania', 'Khan', 'sania.khan@nu.edu.pk', '0336-0123456', '31010-1234567-8', '10/19/1995', '3/31/2023'),
	('ISB105-200', 'Hamza', 'Ahmed', 'hamza.ahmed@nu.edu.pk', '0336-1234567', '31101-2345678-9', '4/25/1999', '10/25/2021'),
	('FSD106-100', 'Maria', 'Aslam', 'maria.aslam@nu.edu.pk', '0333-2345678', '43526-3456789-0', '8/2/1997', '2/28/2022'),
	('ISB106-200', 'Ahmed', 'Khan', 'ahmed.khan@nu.edu.pk', '0333-3456789', '31010-4567890-1', '5/7/1998', '1/31/2023'),
	('FSD107-100', 'Anas', 'Ahmed', 'anas.ahmed@nu.edu.pk', '0332-4567890', '31101-5678901-2', '11/15/1995', '12/1/2021'),
	('ISB107-200', 'Sadia', 'Ali', 'sadia.ali@nu.edu.pk', '0332-5678901', '43526-6789012-3', '9/3/1996', '3/13/2015'),
	('FSD104-500', 'Olivia', 'Brown', 'olivia.brown@email.com', '0321-2468020', '45120-3647291-9', '2/14/1990', '2/28/2022'),
	('ISB105-600', 'William', 'Anderson', 'william.anderson@email.com', '0345-6789012', '31234-1564234-0', '7/9/1985', '10/1/2019'),
	('ISB106-700', 'Elizabeth', 'Taylor', 'elizabeth.taylor@email.com', '0333-9876543', '31234-5678910-1', '3/25/1989', '11/17/2021'),
	('FSD107-800', 'David', 'Jones', 'david.jones@email.com', '0322-1357902', '31102-7890123-4', '9/12/1978', '3/1/2022'),
	('ISB108-900', 'Sophia', 'Johnson', 'sophia.johnson@email.com', '0321-4567891', '31245-1234567-8', '12/28/1996', '4/20/2019'),
	('ISB109-1000', 'Christopher', 'Clark', 'christopher.clark@email.com', '0321-7890123', '31245-2468013-2', '4/7/1982', '4/30/2022'),
	('FSD110-2000', 'Ava', 'Martin', 'ava.martin@email.com', '0333-2468013', '31234-9023451-5', '8/16/1999', '6/15/2020'),
	('ISB111-3000', 'Matthew', 'Allen', 'matthew.allen@email.com', '0333-1234567', '31234-9012345-6', '5/18/1986', '9/15/2021'),
	('ISB112-4000', 'Ella', 'Young', 'ella.young@email.com', '0321-5678901', '31245-2345678-9', '1/24/1994', '12/25/2019'),
	('FSD113-5000', 'Andrew', 'Baker', 'andrew.baker@email.com', '0333-4567890', '31234-3456789-0', '11/3/1988', '5/1/2022'),
	('ISB114-6000', 'Mia', 'King', 'mia.king@email.com', '0321-2468013', '31245-6789012-3', '7/27/1991', '8/10/2020');


