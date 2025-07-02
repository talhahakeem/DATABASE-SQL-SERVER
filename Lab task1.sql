create database Hospital_Management_System

--Task # 01:DDL(Create)
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender CHAR(1) NOT NULL,
    DateOfBirth DATE NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL
);

CREATE TABLE Nurses (
    NurseID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Shift VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY NOT NULL,
    DepartmentName VARCHAR(100) NOT NULL,
    HeadDoctorID INT,
    FOREIGN KEY (HeadDoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY NOT NULL,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

--Task # 01:DDL(Drop)
DROP TABLE Departments;
DROP TABLE Patients;
DROP TABLE Nurses;
DROP TABLE Wards;

--Task # 01:DDL(Alter)
ALTER TABLE Patients
ADD MiddleName VARCHAR(50);

ALTER TABLE Doctors
ADD ConsultationFee DECIMAL(10, 2);

ALTER TABLE Wards
ADD WardFloor INT;

ALTER TABLE Nurses
ADD Qualification VARCHAR(100);

ALTER TABLE Wards
DROP COLUMN Capacity;

ALTER TABLE Appointments
DROP COLUMN AppointmentTime;

ALTER TABLE Departments
DROP COLUMN HeadDoctorID;
