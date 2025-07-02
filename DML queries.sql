--DML(insert, delete, update, select)
--insert data into table

--when column of table are known
insert into books_details values(001,'OOP','Hassan','abc@gmail.com',03007624537,580.21,1);
--when add multiple values
insert into books_details values(002,'PF','Ali','xyz@gmail.com',03035853712,511.21,3),(003 ,'DSA','Asad','bilal@gmail.com', 04656514261, 320.3, 5);

--when columns of table are umknown
  insert into books_details(books_details.email_id,book_name,books_id,books_details.book_price,phone_no,author_name,edition)
  values('mm@gmail.com', 'Database',004, 360,043256747134,'ahmed',4);

  --select (data display)
  --display all to all data
  select * from books_details where books_id=4
  select * from books_details where book_price>400 and edition>=3
  select * from books_details where book_price>400 or edition>3

  --specific column all data
  select book_name,author_name,edition from books_details

  --updation of data in table
  update books_details set phone_no=0 where books_id=1 and phone_no=3007624537 

  --deletion of data from table
  delete from books_details where books_id=2


