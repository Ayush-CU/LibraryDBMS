create database library_demo;

show databases;
use library_demo;

create table readers
	(
		reader_id varchar(6),
        fname varchar(30),
        mname varchar(30),
        ltname varchar(30),
        city varchar(15),
        mobileno varchar(10),
        occupation varchar(10),
        dob DATE,
        CONSTRAINT reader_pk PRIMARY KEY(reader_id) 
	);

insert into readers values('A001','Ayush',null,'Jain','Alwar','7374883131','Student','1998-02-05');
insert into readers values('A002','Ram','singh','chandra','Jaipur','9876789664','Service','1989-03-04');
insert into readers values('A003','Aditya',null,'singh','Jodhpur','8967548967','Student','1984-04-05');
insert into readers values('A004','Neha',null,'Sharma','Ludhiana','7809787856','Accountant','1985-06-04');
insert into readers values('A005','Ashish','Kumar','Rastogi','Meruth','8967547834','Army','1987-03-09');
insert into readers values('A006','Sambhav',null,'Sharma','Hathras','9067867589','Teacher','1990-11-12');

select * from readers;
drop table book;

create table Book
(
	bid varchar(6),
    bname varchar(80),
    bdomain varchar(30),
    constraint book_bid_pk primary key(bid)
);

insert into Book values('B001','The Adventure Island','Fiction');
insert into Book values('B002','Story of the Jungle','Fiction');
insert into Book values('B003','Dark Room','Horror');
insert into Book values('B004','Programing in C','Educational');
insert into Book values('B005','Learn Shell Scripting','Educational');
insert into Book values('B006','Programing in C++','Educational');

create table active_readers
(
	account_id varchar(6),
    reader_id varchar(6),
    bid varchar(6),
    atype varchar(10),
    astatus varchar(10),
    constraint active_readers_acnumber_pk primary key(account_id),
    constraint account_readerid_fk foreign key (reader_id) references readers(reader_id),
    constraint account_bid_fk foreign key (bid) references book(bid)
);

insert into active_readers values('C001','A001','B001','Premium','Active');
insert into active_readers values('C002','A002','B002','Premium','Active');
insert into active_readers values('C003','A003','B003','Normal','Active');
insert into active_readers values('C004','A004','B004','Normal','Unactive');
insert into active_readers values('C005','A005','B005','Free','Active');
insert into active_readers values('C006','A006','B006','Premium','Unactive');

select * from active_readers;

select * from active_readers where astatus='Unactive';

select * from active_readers where astatus='Active';

select * from readers where reader_id='A001';

SELECT *
FROM readers
WHERE mname IS NULL;

select count(account_id) from active_readers where atype='Premium';