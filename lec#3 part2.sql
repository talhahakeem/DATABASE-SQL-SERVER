create table Players
(player_id int not null primary key,
player_name char(30) not null,
player_country char(30) not null,
player_Email varchar(40) not null unique ,
player_Type char(30) not null,
palyer_Format varchar(30) not null,
player_Salary money not null,
player_contact nchar(11) not null unique,
player_SR float null,
Team_id int not null foreign key references Team_Details(Team_id));

--primary key null waly table ma ni lgti.
--ak table ma just ak hi primary key hogi.
--unique key ki limit ni hoti aur null waly table pa bhi lg jati h.
