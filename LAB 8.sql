create table person3
(
P_Id int not null primary key identity(100,10), -- x=> starting range y=>kitna increment krna h.  
P_name varchar(50) not null,
P_address varchar(50) not null check (P_Address='Lahore'), --check=> already stored data ma sacheck krny k lia.
age int not null check (age>=18), --insert krny sa phaly check kry ga k age 18 sa greater h aghr greater hogi to data insert hoga otherwise ni hoga.
contact int null unique,
Email_Add varchar(50) not null unique,
Id int not null foreign key references Person1(Id)
);
--primary key not null pa implement hogi.
--null waly attribute k sath ni hogi.

insert into Person1 values (2,'Hassan','Karachi',24,0311,'cde@gamil.com')

select * from person1
--aghr 0 akela hoga to as a value use hoga.aghr wo kisi k sath use hoga to skip ho jay ga.
--primary key as relation use hoti h lakin unique key ni hoti.
--duplicate record ko insert krny sa bachany k lia hm primary aur unique key use krty hain.
--autoincrement => identity as a keyword use hota h auto increment k lia.
--identity bhi null waly k sath ni lg skta.
--primary key jis type ki hogi foreign key bhi us type ki hogi.
--insertion krty hoay parent sa insert karin gy.
--deletion child sa karin gy phr parent sa.

