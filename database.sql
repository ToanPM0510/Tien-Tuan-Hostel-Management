CREATE DATABASE TienTuan
GO

USE TienTuan
GO

-- Student
-- Room
-- Account
-- Bill
-- BillInfo
-- Service

CREATE TABLE Room
(
	RoomId int primary key,
	RoomStatus nvarchar(100) not null default N'Empty',	-- empty|used 
	RoomType nvarchar(100) not null,
	RoomAmount int not null default 0,
	RoomPrice float not null
)
GO

CREATE TABLE Account
(
	UserName NVARCHAR(100) primary key,
	DisplayName NVARCHAR(100) not null default N'Thuy',
	PassWord NVARCHAR(1000) not null default 0,
	AccountType INT not null default 0 --1: admin && 0: staff
)
GO

CREATE TABLE Student
(
	StudentId int identity primary key,
	StudentName nvarchar(100) not null,
	StudentPhone nvarchar(100) not null,
	StudentDob date not null,
	StudentAddress nvarchar(100) not null,
	StudentCohort int not null
)
GO

CREATE TABLE Service
(
	ServiceId int identity primary key,
	ServiceName nvarchar(100) not null,
	ServicePrice float not null default 0
)
GO
CREATE TABLE Bill
(
	BillId int identity primary key,
	StudentId int not null,
	RoomId int not null,
	ServiceId int not null,
	
	foreign key(StudentId) references Student(StudentId),
	foreign key(RoomId) references Room(RoomId),
	foreign key(ServiceId) references Service(ServiceId)
)
GO

CREATE TABLE BillInfo
(
	BillInfoId int identity primary key,
	BillId int not null,
	BillTerm date not null default getdate(),
	BillStatus int not null default 0, -- paid||not pay
	foreign key(BillId) references Bill(BillId),
)
GO

