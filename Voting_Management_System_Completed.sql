-- Create the database
CREATE DATABASE Voting_Management_System;

-- Create tables
CREATE TABLE Address (
  DistrictID INTEGER NOT NULL PRIMARY KEY,
  Locality VARCHAR(30) NOT NULL,
  City VARCHAR(30) NOT NULL,
  State VARCHAR(30) NOT NULL,
  Zip VARCHAR(10) NOT NULL
);

CREATE TABLE Voter_Table (
  CNIC CHAR(15) NOT NULL PRIMARY KEY,
  FirstName VARCHAR(30) NOT NULL,
  Lastname VARCHAR(50) NOT NULL,
  MotherName VARCHAR(30),
  FatherName VARCHAR(30),
  Sex CHAR(7) NOT NULL,
  Birthday DATE NOT NULL,
  Age INT NOT NULL,
  DistrictID INTEGER NOT NULL REFERENCES Address(DistrictID),
  Phone NUMERIC NOT NULL
);

CREATE TABLE Candidate_Type (
  CandidateTypeID INT NOT NULL PRIMARY KEY,
  CandidateType VARCHAR(20) NOT NULL
);

CREATE TABLE Election_Table (
  ElectionID INT NOT NULL PRIMARY KEY,
  ElectionType VARCHAR(20) NOT NULL
);

CREATE TABLE Party_Table (
  PartyID INT NOT NULL PRIMARY KEY,
  PartyName VARCHAR(20) NOT NULL UNIQUE,
  Symbol VARCHAR(20) NOT NULL UNIQUE,
  PartyLeader VARCHAR(50) NOT NULL
);

CREATE TABLE User_Type (
  UserTypeID INT NOT NULL PRIMARY KEY,
  UserType VARCHAR(20) NOT NULL
);

CREATE TABLE Candidate_Table (
  CandidateID INT NOT NULL PRIMARY KEY,
  CNIC CHAR(15) NOT NULL REFERENCES Voter_Table(CNIC),
  CandidateTypeID INT NOT NULL REFERENCES Candidate_Type(CandidateTypeID),
  PartyID INT NOT NULL REFERENCES Party_Table(PartyID),
  ElectionID INT NOT NULL REFERENCES Election_Table(ElectionID),
  DistrictID INT NOT NULL REFERENCES Address(DistrictID)
);

CREATE TABLE User_Table (
  VoterID VARCHAR(10) NOT NULL PRIMARY KEY,
  Def_Password VARCHAR(50) NOT NULL,
  isActive BIT NOT NULL,
  CNIC CHAR(15) NOT NULL REFERENCES Voter_Table(CNIC),
  UserTypeID INT NOT NULL REFERENCES User_Type(UserTypeID)
);

CREATE TABLE Vote_Table (
  VoteID VARCHAR(7) NOT NULL PRIMARY KEY,
  VoterID VARCHAR(10) NOT NULL UNIQUE REFERENCES User_Table(VoterID),
  PartyID INT NOT NULL REFERENCES Party_Table(PartyID),
  CandidateID INT NOT NULL REFERENCES Candidate_Table(CandidateID),
  DistrictID INT NOT NULL REFERENCES Address(DistrictID),
  Def_Password VARCHAR(50) NOT NULL,
  password_entered VARCHAR(50) NOT NULL,
  CHECK (Def_Password = password_entered)
);

CREATE TABLE Result (
  ResultID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  CandidateID INT NOT NULL REFERENCES Candidate_Table(CandidateID),
  PartyID INT NOT NULL REFERENCES Party_Table(PartyID),
  DistrictID INT NOT NULL REFERENCES Address(DistrictID),
  Vote_Count INT NOT NULL
);

-- Insert Data into Tables:
-- User Types
INSERT INTO User_Type VALUES 
(1, 'Voter'),
(2, 'Admin');

-- Candidate Types
INSERT INTO Candidate_Type VALUES 
(100, 'National'),
(101, 'Provincial');

-- Election Types
INSERT INTO Election_Table VALUES 
(200, 'General'),
(201, 'By-Election');

-- Political Parties
INSERT INTO Party_Table VALUES 
(11, 'PTI', 'Bat', 'Imran Khan'),
(12, 'PMLN', 'Lion', 'Nawaz Sharif'),
(13, 'PPP', 'Arrow', 'Bilawal Bhutto'),
(14, 'MQM', 'Kite', 'Altaf Hussain'),
(15, 'JUI', 'Book', 'Fazlur Rehman');

-- Insert Address data
INSERT INTO Address VALUES
(234, 'Model Town', 'Lahore', 'Punjab', '54000'),
(235, 'Clifton', 'Karachi', 'Sindh', '75600'),
(261, 'Zamzama', 'Karachi', 'Sindh', '75000'),
(262, 'F-8', 'Islamabad', 'Capital Territory', '44010'),
(263, 'E-11', 'Islamabad', 'Capital Territory', '44020'),
(264, 'Gulshan-e-Iqbal', 'Karachi', 'Sindh', '75300'),
(265, 'H-9', 'Islamabad', 'Capital Territory', '44030'),
(266, 'Khalid Market', 'Lahore', 'Punjab', '54010'),
(267, 'Iqbal Town', 'Lahore', 'Punjab', '54050'),
(268, 'Bahria Town', 'Islamabad', 'Capital Territory', '44060'),
(269, 'Bakeri Road', 'Karachi', 'Sindh', '74600'),
(270, 'Defence Road', 'Lahore', 'Punjab', '54320'),
(271, 'Rawat', 'Rawalpindi', 'Punjab', '47010'),
(272, 'Park Road', 'Islamabad', 'Capital Territory', '44070'),
(273, 'Saddar Bazar', 'Peshawar', 'Khyber Pakhtunkhwa', '25110'),
(274, 'Sargodha Road', 'Faisalabad', 'Punjab', '38060'),
(275, 'Shahrah-e-Faisal', 'Karachi', 'Sindh', '74800'),
(276, 'Cantt. Rawalpindi', 'Rawalpindi', 'Punjab', '46050'),
(277, 'Azizabad', 'Karachi', 'Sindh', '74500'),
(278, 'Zia Colony', 'Faisalabad', 'Punjab', '38070');

-- Insert Voter data 
INSERT INTO Voter_Table VALUES
('3520-1345-9877', 'Hassan', 'Ali', 'Amna', 'Shahzad', 'Male', '1986-02-14', 38, 234, 03212223456),
('4210-7895-2346', 'Muneeb', 'Iqbal', 'Ayesha', 'Khan', 'Male', '1991-11-30', 33, 235, 03317654322),
('3310-8855-6678', 'Sara', 'Mujtaba', 'Rubina', 'Akram', 'Female', '1988-05-12', 36, 234, 03412345679),
('4310-5555-3345', 'Tariq', 'Mehmood', 'Sadia', 'Jamil', 'Male', '1992-03-08', 32, 235, 03215678902),
('3120-9087-1123', 'Kamran', 'Raza', 'Nadia', 'Ilyas', 'Male', '1984-07-24', 40, 234, 03461231235),
('4200-5674-3342', 'Sana', 'Iftikhar', 'Amina', 'Shah', 'Female', '1990-09-10', 34, 235, 03124561279),
('3321-5445-9989', 'Usman', 'Nashit', 'Asma', 'Shahid', 'Male', '1995-08-02', 29, 234, 03161238946),
('3412-6754-9989', 'Raza', 'Gulzar', 'Shehla', 'Ali', 'Male', '1993-06-14', 31, 235, 03331554790),
('3564-8392-1291', 'Madiha', 'Ali', 'Sarah', 'Khan', 'Female', '1991-12-11', 33, 234, 03471239877),
('4219-9874-6453', 'Sami', 'Rehman', 'Kiran', 'Akram', 'Male', '1987-04-18', 37, 235, 03151230099),
('4532-7654-1235', 'Zahra', 'Bukhari', 'Sumaira', 'Hussain', 'Female', '1990-11-06', 34, 234, 03215879236),
('5678-3211-8766', 'Adeel', 'Zafar', 'Saba', 'Ishaq', 'Male', '1986-01-30', 38, 235, 03321234568),
('6789-2345-1123', 'Raheel', 'Nawaz', 'Jameela', 'Shahzad', 'Male', '1988-08-13', 36, 234, 03434567891),
('7890-5678-9013', 'Mariam', 'Saeed', 'Nida', 'Tariq', 'Female', '1994-05-23', 30, 235, 03134567891),
('8901-2345-6790', 'Asim', 'Raza', 'Lubna', 'Shahzad', 'Male', '1987-02-14', 37, 234, 03256789013),
('9012-3456-7891', 'Nazia', 'Shah', 'Anusha', 'Ahmed', 'Female', '1991-09-03', 33, 235, 03341234568),
('1122-2334-4456', 'Bilal', 'Khan', 'Rashida', 'Anwar', 'Male', '1993-12-21', 31, 234, 03412345680),
('2233-4455-6678', 'Faisal', 'Shah', 'Saba', 'Amir', 'Male', '1986-06-25', 38, 235, 03234567891),
('3321-5445-9990', 'Nida', 'Iqbal', 'Hira', 'Khan', 'Female', '1990-10-11', 34, 234, 03161238947),
('4422-5566-7788', 'Ahmed', 'Raza', 'Farida', 'Kamal', 'Male', '1989-07-19', 35, 235, 03331234567);

-- Insert User data
INSERT INTO User_Table VALUES
('V119', 'password000', 1, '3520-1345-9877', 1),
('V120', 'password111', 1, '4210-7895-2346', 1),
('V121', 'password222', 1, '3310-8855-6678', 1),
('V122', 'password333', 1, '4310-5555-3345', 1),
('V123', 'password444', 1, '3120-9087-1123', 1),
('V124', 'password555', 1, '4200-5674-3342', 1),
('V125', 'password666', 1, '3321-5445-9989', 1),
('V126', 'password777', 1, '3412-6754-9989', 1),
('V127', 'password888', 1, '3564-8392-1291', 1),
('V128', 'password999', 1, '4219-9874-6453', 1),
('V129', 'password0001', 1, '4532-7654-1235', 1),
('V130', 'password1111', 1, '5678-3211-8766', 1),
('V131', 'password2222', 1, '6789-2345-1123', 1),
('V132', 'password3333', 1, '7890-5678-9013', 1),
('V133', 'password4444', 1, '8901-2345-6790', 1),
('V134', 'password5555', 1, '9012-3456-7891', 1),
('V135', 'password6666', 1, '1122-2334-4456', 1),
('V136', 'password7777', 1, '2233-4455-6678', 1),
('V137', 'password8888', 1, '3321-5445-9990', 1),
('A100', 'admin123', 1, '4422-5566-7788', 2);

-- Insert Candidate data
INSERT INTO Candidate_Table VALUES
(1005, '3520-1345-9877', 100, 11, 200, 234),
(1006, '4210-7895-2346', 101, 12, 200, 235),
(1007, '3310-8855-6678', 100, 13, 200, 234),
(1008, '4310-5555-3345', 101, 14, 200, 235),
(1009, '3120-9087-1123', 100, 11, 200, 234),
(1010, '4200-5674-3342', 101, 12, 200, 235),
(1011, '3321-5445-9989', 100, 13, 200, 234),
(1012, '3412-6754-9989', 101, 14, 200, 235),
(1013, '3564-8392-1291', 100, 11, 200, 234),
(1014, '4219-9874-6453', 101, 12, 200, 235),
(1015, '4532-7654-1235', 100, 13, 200, 234),
(1016, '5678-3211-8766', 101, 14, 200, 235),
(1017, '6789-2345-1123', 100, 11, 200, 234),
(1018, '7890-5678-9013', 101, 12, 200, 235),
(1019, '8901-2345-6790', 100, 13, 200, 234),
(1020, '9012-3456-7891', 101, 14, 200, 235),
(1021, '1122-2334-4456', 100, 11, 200, 234),
(1022, '2233-4455-6678', 101, 15, 200, 235),
(1023, '3321-5445-9990', 100, 13, 200, 234),
(1024, '4422-5566-7788', 101, 12, 200, 235);

-- Insert Vote data
INSERT INTO Vote_Table VALUES
('A5', 'V119', 11, 1005, 234, 'password000', 'password000'),
('A6', 'V120', 12, 1006, 235, 'password111', 'password111'),
('A7', 'V121', 13, 1007, 234, 'password222', 'password222'),
('A8', 'V122', 14, 1008, 235, 'password333', 'password333'),
('A9', 'V123', 11, 1009, 234, 'password444', 'password444'),
('A10', 'V124', 12, 1010, 235, 'password555', 'password555'),
('A11', 'V125', 13, 1011, 234, 'password666', 'password666'),
('A12', 'V126', 14, 1012, 235, 'password777', 'password777'),
('A13', 'V127', 11, 1013, 234, 'password888', 'password888'),
('A14', 'V128', 12, 1014, 235, 'password999', 'password999'),
('A15', 'V129', 13, 1015, 234, 'password0001', 'password0001'),
('A16', 'V130', 14, 1016, 235, 'password1111', 'password1111'),
('A17', 'V131', 11, 1017, 234, 'password2222', 'password2222'),
('A18', 'V132', 12, 1018, 235, 'password3333', 'password3333'),
('A19', 'V133', 13, 1019, 234, 'password4444', 'password4444'),
('A20', 'V134', 14, 1020, 235, 'password5555', 'password5555'),
('A21', 'V135', 11, 1021, 234, 'password6666', 'password6666'),
('A22', 'V136', 15, 1022, 235, 'password7777', 'password7777'),
('A23', 'V137', 13, 1023, 234, 'password8888', 'password8888'),
('A24', 'A100', 12, 1024, 235, 'admin123', 'admin123');


-- Insert Result data
INSERT INTO Result VALUES
(1005, 11, 234, 450),
(1006, 12, 235, 350),
(1007, 13, 234, 400),
(1008, 14, 235, 250),
(1009, 11, 234, 470),
(1010, 12, 235, 340),
(1011, 13, 234, 390),
(1012, 14, 235, 280),
(1013, 11, 234, 460),
(1014, 12, 235, 330),
(1015, 13, 234, 380),
(1016, 14, 235, 270),
(1017, 11, 234, 450),
(1018, 12, 235, 320),
(1019, 13, 234, 370),
(1020, 14, 235, 260),
(1021, 11, 234, 440),
(1022, 15, 235, 310),
(1023, 13, 234, 360),
(1024, 12, 235, 300);

-- Verify vote counts match expected results
SELECT p.PartyName, COUNT(v.VoteID) AS TotalVotes
FROM Vote_Table v
JOIN Party_Table p ON v.PartyID = p.PartyID
GROUP BY p.PartyName
ORDER BY TotalVotes DESC;



-- ========================================
-- VIEWS
-- ========================================

-- View to list eligible voters (Age >= 18)
CREATE VIEW View_Eligible_Voters AS
SELECT CNIC, FirstName, Lastname, Age, DistrictID
FROM Voter_Table
WHERE Age >= 18;

-- View to show full candidate details with joins
CREATE VIEW View_Candidate_Details AS
SELECT 
    c.CandidateID,
    v.FirstName + ' ' + v.Lastname AS FullName,
    p.PartyName,
    p.Symbol,
    ct.CandidateType,
    e.ElectionType,
    a.City
FROM Candidate_Table c
JOIN Voter_Table v ON c.CNIC = v.CNIC
JOIN Party_Table p ON c.PartyID = p.PartyID
JOIN Candidate_Type ct ON c.CandidateTypeID = ct.CandidateTypeID
JOIN Election_Table e ON c.ElectionID = e.ElectionID
JOIN Address a ON c.DistrictID = a.DistrictID;

-- ========================================
-- FUNCTION
-- ========================================

-- Check if a voter is eligible (18+ and hasn't voted)
CREATE FUNCTION fn_IsEligibleToVote(@CNIC CHAR(15))
RETURNS BIT
AS
BEGIN
    DECLARE @Eligible BIT;
    DECLARE @HasVoted INT;

    SELECT @HasVoted = COUNT(*) FROM Vote_Table WHERE CNIC = @CNIC;
    
    IF EXISTS (SELECT 1 FROM Voter_Table WHERE CNIC = @CNIC AND Age >= 18 AND @HasVoted = 0)
        SET @Eligible = 1;
    ELSE
        SET @Eligible = 0;

    RETURN @Eligible;
END;

-- ========================================
-- STORED PROCEDURES
-- ========================================

-- Procedure to cast a vote
CREATE PROCEDURE sp_CastVote
    @CNIC CHAR(15),
    @CandidateID INT,
    @ElectionID INT
AS
BEGIN
    IF dbo.fn_IsEligibleToVote(@CNIC) = 1
    BEGIN
        INSERT INTO Vote_Table (CNIC, CandidateID, ElectionID)
        VALUES (@CNIC, @CandidateID, @ElectionID);
        PRINT 'Vote cast successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Voter is not eligible or has already voted.';
    END
END;

-- Procedure to get election results
CREATE PROCEDURE sp_GetElectionResults
    @ElectionID INT
AS
BEGIN
    SELECT 
        c.CandidateID,
        v.FirstName + ' ' + v.Lastname AS CandidateName,
        p.PartyName,
        COUNT(*) AS VoteCount
    FROM Vote_Table vt
    JOIN Candidate_Table c ON vt.CandidateID = c.CandidateID
    JOIN Voter_Table v ON c.CNIC = v.CNIC
    JOIN Party_Table p ON c.PartyID = p.PartyID
    WHERE vt.ElectionID = @ElectionID
    GROUP BY c.CandidateID, v.FirstName, v.Lastname, p.PartyName
    ORDER BY VoteCount DESC;
END;

