 create database Hospital_Management_System
 --patient table
 create table Patients(Patientid int primary key not null,
 First_name varchar(50) not null,
 Last_name  varchar(50) not null,
 Gender     varchar(50) not null,
 Date_of_Birth nchar not null,
 Contact_NO  nchar not null
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


 --Appointment table
 create table Appointments(Appointmentid int primary key not null,
 Patientid int not null,
 Doctorid int  not null,
 Appointmentdate date not null,
 Appointmenttime time not null,
 foreign key(Patientid) References Patients(Patientid),
 foreign key(Doctorid) References Doctors(Doctorid)
 );


 