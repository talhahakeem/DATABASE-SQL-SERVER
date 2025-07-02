Create database hopital_management_system
--patient table
create table patients(
patient_id int primary key not null,
first_name varchar(50) not null,
last_name varchar(50) not null,
gender varchar(50) not null,
DOB nchar not null,
contact_num nchar not null,
);

--Doctor table
 create table Doctors(Doctorid int primary key not null,
 First_name varchar(50) not null,
 Last_name  varchar(50) not null,
 Specialization varchar(50) not null,
 Contact_NO nchar not null
 );

 --Nurses table
 create table Nurses(nurseid int primary key not null,
 First_name varchar(50) not null,
 Last_name  varchar(50) not null,
 Shifts     varchar(50) not null,
 Contact_NO nchar not null
 );

  -- Department table
  create table Department(Departmentid int primary key not null,
 Department_name varchar(50) not null,
 Head_of_Doctor  int  not null,
 );
