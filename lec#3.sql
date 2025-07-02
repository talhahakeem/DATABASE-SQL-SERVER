--DML (insert,delete,update,select)
--INSERT Data into Table:
--when column of table are known
insert into Books_Details
values(001,'OOP','TALHA','abc@gamil.com',03251238084,580.87,1);
insert into Books_Details
values(002,'PF','AHMAD','xyz@gamil.com',03333334455,680.6,2);

--when column of table are unknown:
INSERT INTO Books_Details (Email_ID, Book_Name, Book_ID, Book_Price, Phone_No, Author_Name, Edition)  
VALUES ('mm@gmail.com', 'Database', 4, 620, '032134567891', 'TALHA', 4);

--select(Data DISPLAY):
--display all to all data
select * from Books_Details where Book_ID=2--ALL DATA

--specific column all data:
select Book_Name,Author_Name,Edition from Books_Details

--constrain kisi bhi spcific column pa rule set krti h.
--clause as a condition use kia jata h.

--UPDATION OF DATA IN TABLE:
update Books_Details set phone_no=033666666 where Book_ID=1


--Deletion of Data from table:
delete from Books_Details where Book_ID=2





