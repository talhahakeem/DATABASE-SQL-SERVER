create database Lab4_Database
--Creating Employee Table:
CREATE TABLE Employee (
FirstName VARCHAR(50),
LastName VARCHAR(50),
Adress VARCHAR(100),
City VARCHAR(50),
Age INT
);
-- Insert Data into Table:
INSERT INTO Employee (FirstName, LastName, Adress, City, Age) VALUES
('Mickey', 'Mouse', '123 Fantasy Way', 'Anaheim', 73),
('Bat', 'Man', '321 Cavern Ave', 'Gotham', 54),
('Wonder', 'Woman', '987 Truth Way', 'Paradise', 39),
('Donald', 'Duck', '555 Quack Street', 'Mallard', 65),
('Bugs', 'Bunny', '567 Carrot Street', 'Rascal', 58),
('Wiley', 'Coyote', '999 Acme Way', 'Canyon', 61),
('Cat', 'Woman', '234 Purrfect Street', 'Hairball', 32),
('Tweety', 'Bird', '543', 'Itottiaw', 28);

--Display the records of employees from "Paradise" and "Canyon"
SELECT * FROM Employee 
WHERE City = 'Paradise' OR City = 'Canyon';

--Display employees aged between 60 and 71
SELECT * FROM Employee 
WHERE Age >= 60 AND Age <= 71;


