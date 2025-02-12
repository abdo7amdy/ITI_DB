-- ITI  Database Creation 

Create Database ITI

Use ITI

-- Tables Creation

Create Table Students
(
Id int primary key identity(1,1),
FName nvarchar(25) not null ,
LName nvarchar(25) ,
Age int default(18) ,
Address nvarchar(50) not null default('Cairo'),
Dept_Id int 
)

Create Table Departments
(
Id int primary key identity(1,1),
Name nvarchar(25) not null ,
Hiring_Date date ,
Inst_Id int 
)

Alter Table Students 
Add Foreign key (Dept_Id) references Departments(Id)

Create Table Instructors 
(
Id int primary key identity(1,1),
Name nvarchar(25) not null ,
Address nvarchar(45) not null default('Egy'),
Bouns int ,
Salary money ,
Hour_Rate float ,
Dept_Id int references Departments(Id)
)

Alter Table Departments 
Add Foreign key(Inst_Id) references Instructors(Id)

Create Table Courses 
(
Id int primary key identity(1,1),
Name nvarchar(25) not null ,
Duration int ,
Description nvarchar(250) not null,
Topic_Id int 
) 

Create Table Topics 
(
Id int primary key identity(1,1),
Name nvarchar(25) not null 
)

Alter Table Courses 
Add Foreign key(Topic_Id) references Topics(Id)

Create Table Std_Crs 
(
Std_Id int references Students(Id),
Crs_Id int references Courses(Id),
Grade int not null 
)

Create Table Crs_Inst
(
Crs_Id int references Courses(Id),
Inst_Id int references Instructors(Id),
Evalution float 
)
