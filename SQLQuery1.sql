create database CourseAcademy

use CourseAcademy
create table Students(
	[Id] int primary key identity(1,1),
	[Fullname] nvarchar(255),
	[Email] nvarchar(255),
	[Age] int,
	[Address] nvarchar(255),
	[Phone] nvarchar(255),
	[CityId] int foreign key references Cities(Id)
)

create table Teachers(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(255),
	[Surname] nvarchar(255),
	[Age] int,
	[Email] nvarchar(255),
	[Salary] decimal,
	[CityId] int foreign key references Cities(Id)
)


create table Countries(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(255)
)

create table Cities(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(255),
	[CountryId] int foreign key references Countries(Id)
)


create table Educations(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(255)
)

create table Rooms(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(255),
	[Capacity] int
)

create table Groups(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(255),
	[Capacity] int,
	[RoomId] int foreign key references Rooms(Id),
	[EducationId] int foreign key references Educations(Id)
)

create table TeacherGroup(
	[Id] int primary key identity(1,1),
	[TeacherId] int foreign key references Teachers(Id),
	[GroupId] int foreign key references Groups(Id)
)

create table Seanses(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(255)
)

create table WeekDays(
	[Id] int primary key identity(1,1),
	[Day] nvarchar(255)
)

create table WeekDaySeans(
	[Id] int primary key identity(1,1),
	[WeekDayId] int foreign key references WeekDays(Id),
	[SeansId] int foreign key references Seanses(Id)
)

create table StaffMembers(
	[Id] int primary key identity(1,1),
	[FullName] nvarchar(255),
	[Email] nvarchar(255),
	[Address] nvarchar(255),
	[CityId] int foreign key references Cities(Id)
)

create table Roles(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(255)
)

create table MemRoles(
	[Id] int primary key identity(1,1),
	[StaffMemberId] int foreign key references StaffMembers(Id),
	[RoleId] int foreign key references Roles(Id)
)

create table StudentsGroups(
	[Id] int primary key identity(1,1),
	[GroupId] int foreign key references Groups(Id),
	[StudentId] int foreign key references Students(Id)
)

create table GroupWeekDaySeanses(
	[Id] int primary key identity(1,1),
	[GroupId] int foreign key references Groups(Id),
	[WeekDaySeansId] int foreign key references WeekDaySeans(Id)
)