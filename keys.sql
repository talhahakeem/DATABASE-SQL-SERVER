
create table Players(player_id int not null primary key,
player_name char(30) not null,
 player_email varchar(40) not null unique,
player_type char(30) not null,
player_format varchar(30) not null,
salary money not null,
player_contact nchar(11) not null unique,
player_sr float null,
Team_id int not null foreign key references Team_details(Team_id)
);