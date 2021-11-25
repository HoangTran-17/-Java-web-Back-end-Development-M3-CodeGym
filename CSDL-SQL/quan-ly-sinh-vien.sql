create database QuanLySinhVien;
use QuanLySinhVien;
create table Class(
ClassID int primary key auto_increment,
ClassName varchar(60) not null,
StartDate Datetime not null,
Status bit
);

create table Student(
StudentID int primary key auto_increment,
StudentName varchar(30) not null,
Address varchar(50),
Phone varchar(20),
Status bit,
ClassID int not null,
foreign key (ClassID) references Class(ClassID)
);

create table Subject1(
SubID int primary key auto_increment,
Credit Tinyint not null default 1 check(Credit >= 1),
Status Bit default 1
);

create table Mark(
MarkID int primary key auto_increment,
SubID int not null unique key,
StudentID int not null unique key,
Mark float Default 1 check (Mark between 0 and 100),
ExamTimes Tinyint default 1,
foreign key (SubID) references Subject1(SubID),
foreign key (StudentID) references Student(StudentID)
);


use QuanLySinhVien;
insert into Class
values(1,'A1', '2008-12-20', 1);
insert into Class
values(2,'A2', '2008-12-22', 1);
insert into Class
values(3,'A3', current_date(), 0);

insert into student
values(1,'Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student(StudentID, StudentName,Address, Status, ClassID)
values(2,'Hoa', 'Hai Phong', 1, 1);
insert into student
values(3,'Manh', 'HCM', '0123123123', 0, 2);

ALTER TABLE Subject1 ADD SubName varchar(15) not null;
insert into Subject1
values(1, 5, 1, 'CF');
insert into Subject1
values(2, 6, 1, 'C');
insert into Subject1
values(3, 5, 1, 'HDJ');
insert into Subject1
values(4, 10, 1, 'RDBMS');
      
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
      
-- --'Exercise 1'--  
use QuanLySinhVien;
Select *
from Student;

-- -- 'Exercise 2'--
use QuanLySinhVien;
Select *
from Student
where status = 1;

-- Exercise 3
use QuanLySinhVien;
Select *
from Student
where Credit < 10;

-- Exercise 4
use QuanLySinhVien;
Select Student.StudentID, Student.StudentName, Class.ClassName
from Student 
join Class ON Student.ClassID = Class.ClassID
where Class.ClassName = 'A1';

-- Exercise 5
use QuanLySinhVien;
Select Student.StudentID, Student.StudentName, Subject1.SubName, Mark.Mark
from Student
join Mark ON Student.StudentID = Mark.StudentID
join Subject1 ON Mark.SubID = Subject1.SubID
where Subject1.SubName = 'CF';




