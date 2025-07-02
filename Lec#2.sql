--Single Line of Comment

/*Multiple line of Comments
here is the Way
*/

--create Database
create database BSCS_4F_DB_Lab

--Drop Database or delete 
--drop database BSCS_4F_DB_Lab

--Create Table in Database
create table Authors_Details
(Author_ID int not null,
Author_Name varchar(50),
Age int not null);

--Delete Table 
drop table Authors_Details

--Modify Existing Tables
--Add column
alter table Authors_Details
add Gender char(20) not null

--Delete Column
alter table Authors_Details
drop column Age 

--data insertion
insert into Authors_Details values (001,'TALHA','Male'),(002,'AHMAD','Male');