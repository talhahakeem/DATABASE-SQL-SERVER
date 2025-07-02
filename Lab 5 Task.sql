-- Creating the Result table
CREATE TABLE Result (
ID INT PRIMARY KEY,
Name VARCHAR(50),
Class VARCHAR(10),
Mark INT,
Gender VARCHAR(10)
);
-- Inserting data into Result Table: 
INSERT INTO Result (ID, Name, Class, Mark, Gender) VALUES
(1, 'John Deo', 'Four', 75, 'female'),
(2, 'Max Ruin', 'Three', 85, 'male'),
(3, 'Arnold', 'Three', 55, 'male'),
(4, 'Krish Star', 'Four', 60, 'female'),
(5, 'John Mike', 'Four', 60, 'female'),
(6, 'Alex John', 'Four', 55, 'male'),
(7, 'My John Rob', 'Five', 78, 'male'),
(8, 'Asruid', 'Five', 85, 'male'),
(9, 'Tes Gry', 'Six', 78, 'male'),
(10, 'Big John', 'Four', 55, 'female');

-- Inserting a new student Sara Khan
INSERT INTO Result (ID, Name, Class, Mark, Gender) VALUES
(11, 'Sara Khan', 'Five', 82, 'female');

-- Inserting three more students
INSERT INTO Result (ID, Name, Class, Mark, Gender) VALUES
(12, 'Ali Raza', 'Two', 90, 'male'),
(13, 'Emma Watson', 'Six', 88, 'female'),
(14, 'David Miller', 'Three', 65, 'male');

-- Display names of all students in class "Four": 
SELECT Name FROM Result WHERE Class = 'Four';

-- Display all male students who scored above 80 marks
SELECT * FROM Result WHERE Gender = 'male' AND Mark > 80;

-- Display all students either in class "Three" or have marks above 75
SELECT * FROM Result WHERE Class = 'Three' OR Mark > 75;

-- Display Select students who are not in class "Four"
SELECT * FROM Result WHERE Class <> 'Four';






