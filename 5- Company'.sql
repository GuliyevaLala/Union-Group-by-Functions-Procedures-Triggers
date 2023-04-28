create database Company

use Company

create table Employees(
	[Id] int primary key identity(1,1),
	[FullName] nvarchar(255),
	[Age] int,
	[Salary] decimal,
	[Position] nvarchar(100),
	[CityId] int foreign key references Cities(Id),
	[IsDeleted] bit default 0
)
insert into Employees(FullName, Age, Salary, Position, CityId, IsDeleted)
values ('Allen Anderson', 22, 1550, 'Reseption', 3, 1),
('Kim Ji Young', 34, 4900, 'CEO', 2, 0),
('Trivia Campell', 27, 1900, 'Assistent',3, 1),
('Barbara Baldwin', 25, 3500, 'HR', 4, 0)

ALTER TABLE Employees ADD Deleted bit not null;

create table Countries(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(255)
)

insert into Countries(Name)
values ('USA'),
('South Korea'),
('Australia')

create table Cities(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(255),
	[CountryId] int foreign key references Countries(Id)
)
insert into Cities(Name, CountryId)
values ('New Orleans', 1),
('Seoul', 2),
('Adelaide', 3),
('Albany', 1)


select * from Cities
select * from Countries
select * from Employees

--Ishcilerin ozlerini, yashadiqi sheherlerini ve olkelerini gosterin.
select emp.FullName as 'Full Name', ct.Name as 'City', cn.Name as 'Country' from Employees emp
inner join Cities ct 
on emp.CityId = ct.Id
inner join Countries cn
on ct.CountryId = cn.Id
order by cn.Name

--Maashi 2000-den yuxari olan ishcilerin adlari ve yashadiqi olkeleri gosterin.
select emp.FullName as 'Full Name', cn.Name as 'Country' from Employees emp
inner join Cities ct 
on emp.CityId = ct.Id and emp.Salary > 2000
inner join Countries cn
on ct.CountryId = cn.Id
order by cn.Name

--Hansi sheherin hansi olkeye aid olduqunu gosterin.
select ct.Name as 'City', cn.Name as 'Country' from Cities ct
inner join Countries cn
on ct.CountryId = cn.Id

-- Positioni "Reseption" olan ishcilerin table-larin id-leri daxil olmamaq sherti ile gostermek.

select emp.FullName, emp.Age, emp.Salary, emp.Position, ct.Name as 'City', cn.Name as 'Country' from Employees emp
inner join Cities ct 
on emp.CityId = ct.Id and emp.Position = 'Reseption'
inner join Countries cn
on ct.CountryId = cn.Id

-- Positioni "Reseption" olan ishcilerin table-larin id-leri daxil olmamaq sherti ile daxil olmamaq sherti ile butun melumatlarini                          gostermek.

select emp.FullName as 'Full Name', ct.Name as 'City', cn.Name as 'Country' from Employees emp
inner join Cities ct 
on emp.CityId = ct.Id and emp.IsDeleted = 0
inner join Countries cn
on ct.CountryId = cn.Id
order by cn.Name
