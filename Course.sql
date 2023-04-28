create database Course

use Course

create table Students(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(255),
	[Surname] nvarchar(255),
	[Address] nvarchar(255),
	[Age] int,
	[Email] nvarchar(255),
)

insert into Students(Name,Surname,Age,Email,Address)
values ('Lana', 'Reynold', 22, 'lanadelrey@jsj.com', 'USA'),
('Kim', 'Tjung', 24, 'tjunhd122@msn.com.sk', 'Seoul'),
('Mary', 'Smith', 18, 'marylin18@mail.uk', 'UK'),
('Scartlet', 'Johansonn', 32, 'jphans@gmail.com', 'USA'),
('Fredrick', 'Swartz', 26, 'swart22z@bt.edu.uk', 'Great Britain')

create table StudentArchives(
	[Id] int primary key identity(1,1),
	[StudentId] int,
	[Date] datetime
)
select*from Students
select*from StudentArchives

CREATE TRIGGER tgr_ArchiveTrigger
ON Students
AFTER delete
AS
BEGIN
INSERT INTO StudentArchives (StudentId, [Date])
SELECT d.Id,GETDATE()
FROM deleted d
DELETE FROM StudentArchives WHERE StudentId = (SELECT TOP 2 Id FROM deleted)
END

create procedure uspp_DeletedDatas @id int
as
begin
delete from Students where Id = @id
end

exec uspp_DeletedDatas @id = 2