drop DATABASE StudentDB;
CREATE DATABASE StudentDB;
USE StudentDB;
-- 1. Bảng Khoa
CREATE TABLE Department (
    DeptID CHAR(5) PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

-- 2. Bảng SinhVien
CREATE TABLE Student (
    StudentID CHAR(6) PRIMARY KEY,
    FullName VARCHAR(50),
    Gender VARCHAR(10),
    BirthDate DATE,
    DeptID CHAR(5),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- 3. Bảng MonHoc
CREATE TABLE Course (
    CourseID CHAR(6) PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT
);

-- 4. Bảng DangKy
CREATE TABLE Enrollment (
    StudentID CHAR(6),
    CourseID CHAR(6),
    Score FLOAT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
INSERT INTO Department VALUES
('IT','Information Technology'),
('BA','Business Administration'),
('ACC','Accounting');

INSERT INTO Student VALUES
('S00001','Nguyen An','Male','2003-05-10','IT'),
('S00002','Tran Binh','Male','2003-06-15','IT'),
('S00003','Le Hoa','Female','2003-08-20','BA'),
('S00004','Pham Minh','Male','2002-12-12','ACC'),
('S00005','Vo Lan','Female','2003-03-01','IT'),
('S00006','Do Hung','Male','2002-11-11','BA'),
('S00007','Nguyen Mai','Female','2003-07-07','ACC'),
('S00008','Tran Phuc','Male','2003-09-09','IT');

INSERT INTO Course VALUES
('C00001','Database Systems',3),
('C00002','C Programming',3),
('C00003','Microeconomics',2),
('C00004','Financial Accounting',3);

INSERT INTO Enrollment VALUES
('S00001','C00001',8.5),
('S00001','C00002',7.0),
('S00002','C00001',6.5),
('S00003','C00003',7.5),
('S00004','C00004',8.0),
('S00005','C00001',9.0),
('S00006','C00003',6.0),
('S00007','C00004',7.0),
('S00008','C00001',5.5),
('S00008','C00002',6.5);


-- PHẦN A – CƠ BẢN
-- Câu 1:  Tạo View View_StudentBasic hiển thị: StudentID, FullName , DeptName. Sau đó truy vấn toàn bộ View_StudentBasic;
create view View_StudentBasic 
as
select s.StudentID, s.FullName , d.DeptName  from student s
join Department  d on d.DeptID = s.DeptID
;


select * from View_StudentBasic;
-- Câu 2: Tạo Regular Index cho cột FullName của bảng Student.Câu
create index nameindx on student(FullName) ;
-- Câu 3: Viết Stored Procedure GetStudentsIT
delimiter //
create procedure GetStudentsIT()
	begin
		select s.StudentID, s.FullName , d.DeptName  from student s
        join Department  d on d.DeptID = s.DeptID;
        end//
delimiter ;


call GetStudentsIT();


-- Câu 4:
-- a)Tạo View View_StudentCountByDept hiển thị: DeptName, TotalStudents (số sinh viên mỗi khoa).
create view View_StudentCountByDept
as
select d.DeptName, count(s.DeptID) as TotalStudents 
from student s
join Department  d on d.DeptID = s.DeptID
group by d.DeptID
;


select * from View_StudentCountByDept;
-- b)Từ View trên, viết truy vấn hiển thị khoa có nhiều sinh viên nhất
create view View_StudentCountByDept
as
select d.DeptName, count(s.DeptID) as TotalStudents 
from student s
join Department  d on d.DeptID = s.DeptID
group by d.DeptID
;

select * from View_StudentCountByDept;

select DeptName, TotalStudents  from View_StudentCountByDept
where TotalStudents = 
(select  max((select d.DeptName, count(s.DeptID) as TotalStudents 
from student s
join Department  d on d.DeptID = s.DeptID
group by d.DeptID)
) as View_StudentCountByDept)
;

-- Câu 5: Viết Stored Procedure GetTopScoreStuden

delimiter //
create procedure GetTopScoreStudent(IN p_CourseID CHAR(6))
	begin
		select *   from student 
        where studentID = 
        (select StudentID from Enrollment where score = (select max(score) from Enrollment where CourseID = 'C00001'));
        end//
delimiter ;


call GetTopScoreStudent('C00001');


-- Câu 6 Nhà trường muốn quản lý việc cập nhật điểm cho mônDatabase Systems (C00001) theo quy tắc

-- a) – Tạo VIEW
create view View_IT_Enrollment_DB
as
select s.StudentID, s.FullName, d.DeptName
from Enrollment e
join student s on s.StudentID = e.StudentID
join Department d on d.DeptID = s.DeptID
where d.DeptID = 'IT' and e.CourseID = 'C00001'
with check option
;


select * from View_IT_Enrollment_DB;


