create table member(
	id varchar(10) character set utf8 primary key not null,
	passwd varchar(15) character set utf8 not null,
	number varchar(50) character set utf8 not null,
	name varchar(10) character set utf8 not null
);

create table check_table(
	number varchar(50) character set utf8 not null,
	name varchar(10) character set utf8 not null,
	check_date datetime not null,
	late_money int not null
);

create table money(
	name varchar(10) character set utf8 not null,
	late_money int not null
);

select * from member;
select * from check_table;
select * from money;

drop table member;
drop table check_table;
drop table money;

insert into member
values('admin','gmldnjs0010','21기','김희원');
insert into check_table
values('21기','김희원',"2015-12-10 7:29:54",0);
insert into money
values('김희원',0);

insert into check_table
values('21기','김희원',"2015-12-11 7:30:54",0);
insert into money
values('김희원',0);

insert into check_table
values('21기','김희원',"2015-12-12 7:31:54",500);
insert into money
values('김희원',500);

insert into check_table
values('21기','김희원',"2015-12-13 7:32:54",1000);
insert into money
values('김희원',1000);

insert into check_table
values('21기','김희원',"2015-12-14 7:33:54",1500);
insert into money
values('김희원',1500);

insert into check_table
values('21기','김희원',"2015-12-15 7:34:54",2000);
insert into money
values('김희원',2000);

insert into check_table
values('21기','김희원',"2015-12-16 7:35:54",2500);
insert into money
values('김희원',2500);

insert into check_table
values('21기','김희원',"2015-12-17 7:36:54",3000);
insert into money
values('김희원',3000);

insert into check_table
values('21기','김희원',"2015-12-18 7:37:54",3500);
insert into money
values('김희원',3500);

insert into check_table
values('21기','김희원',"2015-12-19 7:38:54",4000);
insert into money
values('김희원',4000);

insert into check_table
values('21기','김희원',"2015-12-20 7:39:54",4500);
insert into money
values('김희원',4500);

insert into check_table
values('21기','김희원',"2015-12-21 7:40:54",5000);
insert into money
values('김희원',5000);