--
-- 	Database Table Creation
--
--	This file will create the tables for use with the book
--  Database Management Systems by Raghu Ramakrishnan and Johannes Gehrke.
--  It is run automatically by the installation script.
--
--	Version 0.1.0.0 2002/04/05 by: David Warden.
--	Copyright (C) 2002 McGraw-Hill Companies Inc. All Rights Reserved.
--
--  First drop any existing tables. Any errors are ignored.
--
drop table student cascade constraints;
drop table faculty cascade constraints;
drop table class cascade constraints;
drop table enrolled cascade constraints;
drop table emp cascade constraints;
drop table works cascade constraints;
drop table dept cascade constraints;
drop table flights cascade constraints;
drop table aircraft cascade constraints;
drop table certified cascade constraints;
drop table employees cascade constraints;
drop table suppliers cascade constraints;
drop table parts cascade constraints;
drop table catalog cascade constraints;
drop table sailors cascade constraints;
drop table boats cascade constraints;
drop table reserves cascade constraints;

purge recyclebin;

--
-- Now, add each table.
--
create table student (
	snum number (9, 0) primary key,
	sname varchar2 (30),
	major varchar2 (25),
	standing varchar2 (2),
	age number (3, 0)
);

create table faculty (
	fid number (9, 0) primary key,
	fname varchar2 (30),
	deptid number (2, 0)
);

create table class (
	name varchar2 (40) primary key,
	meets_at varchar2 (20),
	room varchar2 (10),
	fid number (9, 0),
	foreign key (fid) references faculty
);

create table enrolled (
	snum number (9, 0),
	cname varchar2 (40),
	primary key (snum, cname),
	foreign key (snum) references student,
	foreign key (cname) references class (name)
);

create table emp (
	eid number (9, 0) primary key,
	ename varchar2 (30),
	age number (3, 0),
	salary number (10, 2)
);

create table dept (
	did number (2, 0) primary key,
	dname varchar2 (20),
	budget number (10, 2),
	managerid number (9, 0),
	foreign key (managerid) references emp (eid)
);

create table works (
	eid number (9, 0),
	did number (2, 0),
	pct_time number (3, 0),
	primary key (eid, did),
	foreign key (eid) references emp,
	foreign key (did) references dept
);

create table flights (
	flno number (4, 0) primary key,
	origin varchar2 (20),
	destination varchar2 (20),
	distance number (6, 0),
	departs timestamp,
	arrives timestamp,
	price number (7, 2)
);

create table aircraft (
	aid number (9, 0) primary key,
	aname varchar2 (30),
	cruisingrange number (6, 0)
);

create table employees (
	eid number (9, 0) primary key,
	ename varchar2 (30),
	salary number (10, 2)
);

create table certified (
	eid number (9, 0),
	aid number (9, 0),
	primary key (eid, aid),
	foreign key (eid) references employees,
	foreign key (aid) references aircraft
);

create table suppliers (
	sid number (9, 0) primary key,
	sname varchar2 (30),
	address varchar2 (40)
);

create table parts (
	pid number (9, 0) primary key,
	pname varchar2 (40),
	colour varchar2 (15)
);

create table catalog (
	sid number (9, 0),
	pid number (9, 0),
	cost number (10, 2),
	primary key (sid, pid),
	foreign key (sid) references suppliers,
	foreign key (pid) references parts
);

create table sailors (
	sid integer,
	sname varchar2 (30),
	rating integer,
	age real,
	primary key (sid)
);

create table boats (
	bid integer,
	bname varchar2 (30),
	colour varchar2 (30),
	primary key (bid)
);

create table reserves (
	sid integer,
	bid integer,
	day date,
	primary key (sid, bid, day),
	foreign key (sid) references sailors,
	foreign key (bid) references boats
);

--
-- done adding all of the tables, now add in some tuples
--  first, add in the students
insert into student values (051135593, 'Maria White', 'English', 'SR', 21);
insert into student values (060839453, 'Charles Harris', 'Architecture', 'SR', 22);
insert into student values (099354543, 'Susan Martin', 'Law', 'JR', 20);
insert into student values (112348546, 'Joseph Thompson', 'Computer Science', 'SO', 19);
insert into student values (115987938, 'Christopher Garcia', 'Computer Science', 'JR', 20);
insert into student values (132977562, 'Angela Martinez', 'History', 'SR', 20);
insert into student values (269734834, 'Thomas Robinson', 'Psychology', 'SO', 18);
insert into student values (280158572, 'Margaret Clark', 'Animal Science', 'FR', 18);
insert into student values (301221823, 'Juan Rodriguez', 'Psychology', 'JR', 20);
insert into student values (318548912, 'Dorthy Lewis', 'Finance', 'FR', 18);
insert into student values (320874981, 'Daniel Lee', 'Electrical Engineering', 'FR', 17);
insert into student values (322654189, 'Lisa Walker', 'Computer Science', 'SO', 17);
insert into student values (348121549, 'Paul Hall', 'Computer Science', 'JR', 18);
insert into student values (351565322, 'Nancy Allen', 'Accounting', 'JR', 19);
insert into student values (451519864, 'Mark Young', 'Finance', 'FR', 18);
insert into student values (455798411, 'Luis Hernandez', 'Electrical Engineering', 'FR', 17);
insert into student values (462156489, 'Donald King', 'Mechanical Engineering', 'SO', 19);
insert into student values (550156548, 'George Wright', 'Education', 'SR', 21);
insert into student values (552455318, 'Ana Lopez', 'Computer Engineering', 'SR', 19);
insert into student values (556784565, 'Kenneth Hill', 'Civil Engineering', 'SR', 21);
insert into student values (567354612, 'Karen Scott', 'Computer Engineering', 'FR', 18);
insert into student values (573284895, 'Steven Green', 'Kinesiology', 'SO', 19);
insert into student values (574489456, 'Betty Adams', 'Economics', 'JR', 20);
insert into student values (578875478, 'Edward Baker', 'Veterinary Medicine', 'SR', 21);

--now add in the faculty
insert into faculty values (142519864, 'I. Teach', 20);
insert into faculty values (242518965, 'James Smith', 68);
insert into faculty values (141582651, 'Mary Johnson', 20);
insert into faculty values (011564812, 'John Williams', 68);
insert into faculty values (254099823, 'Patricia Jones', 68);
insert into faculty values (356187925, 'Robert Brown', 12);
insert into faculty values (489456522, 'Linda Davis', 20);
insert into faculty values (287321212, 'Michael Miller', 12);
insert into faculty values (248965255, 'Barbara Wilson', 12);
insert into faculty values (159542516, 'William Moore', 33);
insert into faculty values (090873519, 'Elizabeth Taylor', 11);
insert into faculty values (486512566, 'David Anderson', 20);
insert into faculty values (619023588, 'Jennifer Thomas', 11);
insert into faculty values (489221823, 'Richard Jackson', 33);
insert into faculty values (548977562, 'Ulysses Teach', 20);

--now add in the classes
insert into class values ('Data Structures', 'MWF 10', 'R128', 489456522);
insert into class values ('Database Systems', 'MWF 12:30-1:45', '1320 DCL', 142519864);
insert into class values ('Operating System Design', 'TuTh 12-1:20', '20 AVW', 489456522);
insert into class values ('Psychology', '', '', 619023588);
insert into class values ('Archaeology of the Incas', 'MWF 3-4:15', 'R128', 248965255);
insert into class values ('Aviation Accident Investigation', 'TuTh 1-2:50', 'Q3', 011564812);
insert into class values ('Air Quality Engineering', 'TuTh 10:30-11:45', 'R15', 011564812);
insert into class values ('Introductory Latin', 'MWF 3-4:15', 'R12', 248965255);
insert into class values ('American Political Parties', 'TuTh 2-3:15', '20 AVW', 619023588);
insert into class values ('Social Cognition', 'Tu 6:30-8:40', 'R15', 159542516);
insert into class values ('Perception', 'MTuWTh 3', 'Q3', 489221823);
insert into class values ('Multivariate Analysis', 'TuTh 2-3:15', 'R15', 090873519);
insert into class values ('Patent Law', 'F 1-2:50', 'R128', 090873519);
insert into class values ('Urban Economics', 'MWF 11', '20 AVW', 489221823);
insert into class values ('Organic Chemistry', 'TuTh 12:30-1:45', 'R12', 489221823);
insert into class values ('Marketing Research', 'MW 10-11:15', '1320 DCL', 489221823);
insert into class values ('Seminar in American Art', 'M 4', 'R15', 489221823);
insert into class values ('Orbital Mechanics', 'MWF 8', '1320 DCL', 011564812);
insert into class values ('Dairy Herd Management', 'TuTh 12:30-1:45', 'R128', 356187925);
insert into class values ('Communication Networks', 'MW 9:30-10:45', '20 AVW', 141582651);
insert into class values ('Optical Electronics', 'TuTh 12:30-1:45', 'R15', 254099823);
insert into class values ('Artificial Intelligence', '', 'UP328', null);
insert into class values ('Intoduction to Math', 'TuTh 8-9:30', 'R128', 489221823);

--now add in the enrollments
insert into enrolled values (112348546, 'Database Systems');
insert into enrolled values (115987938, 'Database Systems');
insert into enrolled values (348121549, 'Database Systems');
insert into enrolled values (322654189, 'Database Systems');
insert into enrolled values (552455318, 'Database Systems');
insert into enrolled values (455798411, 'Operating System Design');
insert into enrolled values (552455318, 'Operating System Design');
insert into enrolled values (567354612, 'Operating System Design');
insert into enrolled values (112348546, 'Operating System Design');
insert into enrolled values (115987938, 'Operating System Design');
insert into enrolled values (322654189, 'Operating System Design');
insert into enrolled values (567354612, 'Data Structures');
insert into enrolled values (552455318, 'Communication Networks');
insert into enrolled values (455798411, 'Optical Electronics');
insert into enrolled values (455798411, 'Organic Chemistry');
insert into enrolled values (301221823, 'Perception');
insert into enrolled values (301221823, 'Social Cognition');
insert into enrolled values (301221823, 'American Political Parties');
insert into enrolled values (556784565, 'Air Quality Engineering');
insert into enrolled values (099354543, 'Patent Law');
insert into enrolled values (574489456, 'Urban Economics');

--now add in the sailors, boats, and reserves
insert into sailors values (22, 'dustin', 7, 45.0);
insert into sailors values (31, 'lubber', 8, 55.5);
insert into sailors values (58, 'rusty', 10, 35.0);

insert into boats values (101, 'interlake', 'blue');
insert into boats values (102, 'interlake', 'red');
insert into boats values (103, 'clipper', 'green');
insert into boats values (104, 'marien', 'red');

insert into reserves values (22, 101, TO_DATE ('10-OCT-2010', 'DD-MM-YYYY'));
insert into reserves values (22, 102, TO_DATE ('10-OCT-2010', 'DD-MM-YYYY'));
insert into reserves values (22, 103, TO_DATE ('8-OCT-2010', 'DD-MM-YYYY'));
insert into reserves values (22, 104, TO_DATE ('10-JUL-2010', 'DD-MM-YYYY'));
insert into reserves values (31, 102, TO_DATE ('10-NOV-2010', 'DD-MM-YYYY'));
insert into reserves values (31, 103, TO_DATE ('6-NOV-2010', 'DD-MM-YYYY'));
insert into reserves values (31, 104, TO_DATE ('12-NOV-2010', 'DD-MM-YYYY'));
insert into reserves values (58, 102, TO_DATE ('8-NOV-2010', 'DD-MM-YYYY'));
insert into reserves values (58, 103, TO_DATE ('12-NOV-2010', 'DD-MM-YYYY'));

-- now add in the flights and such
insert into flights values (99, 'Los Angeles', 'Washington D.C.', 2308, to_timestamp ('2015/04/12 09:30', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 21:40', 'YYYY/MM/DD HH24 MI'), 235.98 );

insert into flights values (13, 'Los Angeles', 'Chicago', 1749, to_timestamp ('2015/04/12 08:45', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 20:45', 'YYYY/MM/DD HH24 MI'), 220.98 );

insert into flights values (346, 'Los Angeles', 'Dallas', 1251, to_timestamp ('2015/04/12 11:50', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 19:05', 'YYYY/MM/DD HH24 MI'), 225.43 );

insert into flights values (387, 'Los Angeles', 'Boston', 2606, to_timestamp ('2015/04/12 07:03', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 17:03', 'YYYY/MM/DD HH24 MI'), 261.56 );

insert into flights values (7, 'Los Angeles', 'Sydney', 7487, to_timestamp ('2015/04/12 22:30', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/14 06:10', 'YYYY/MM/DD HH24 MI'), 1278.56 );

insert into flights values (2, 'Los Angeles', 'Tokyo', 5478, to_timestamp ('2015/04/12 12:30', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/13 15:55', 'YYYY/MM/DD HH24 MI'), 780.99 );

insert into flights values (33, 'Los Angeles', 'Honolulu', 2551, to_timestamp ('2015/04/12 09:15', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 11:15', 'YYYY/MM/DD HH24 MI'), 375.23 );

insert into flights values (34, 'Los Angeles', 'Honolulu', 2551, to_timestamp ('2015/04/12 12:45', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 15:18', 'YYYY/MM/DD HH24 MI'), 425.98 );

insert into flights values (76, 'Chicago', 'Los Angeles', 1749, to_timestamp ('2015/04/12 08:32', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 10:03', 'YYYY/MM/DD HH24 MI'), 220.98 );

insert into flights values (68, 'Chicago', 'New York', 802, to_timestamp ('2015/04/12 09:00', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 12:02', 'YYYY/MM/DD HH24 MI'), 202.45 );

insert into flights values (7789, 'Madison', 'Detroit', 319, to_timestamp ('2015/04/12 06:15', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 08:19', 'YYYY/MM/DD HH24 MI'), 120.33 );

insert into flights values (701, 'Detroit', 'New York', 470, to_timestamp ('2015/04/12 08:55', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 10:26', 'YYYY/MM/DD HH24 MI'), 180.56 );

insert into flights values (702, 'Madison', 'New York', 789, to_timestamp ('2015/04/12 07:05', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 10:12', 'YYYY/MM/DD HH24 MI'), 202.34 );

insert into flights values (4884, 'Madison', 'Chicago', 84, to_timestamp ('2015/04/12 22:12', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 23:02', 'YYYY/MM/DD HH24 MI'), 112.45 );

insert into flights values (2223, 'Madison', 'Pittsburgh', 517, to_timestamp ('2015/04/12 08:02', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 10:01', 'YYYY/MM/DD HH24 MI'), 189.98 );

insert into flights values (5694, 'Madison', 'Minneapolis', 247, to_timestamp ('2015/04/12 08:32', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 09:33', 'YYYY/MM/DD HH24 MI'), 120.11 );

insert into flights values (304, 'Minneapolis', 'New York', 991, to_timestamp ('2015/04/12 10:00', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 13:39', 'YYYY/MM/DD HH24 MI'), 101.56 );

insert into flights values (149, 'Pittsburgh', 'New York', 303, to_timestamp ('2015/04/12 09:42', 'YYYY/MM/DD HH24 MI'), to_timestamp ('2015/04/12 12:09', 'YYYY/MM/DD HH24 MI'), 116.50 );

insert into aircraft values (1, 'Boeing 747-400', 8430);
insert into aircraft values (2, 'Boeing 737-800', 3383);
insert into aircraft values (3, 'Airbus A340-300', 7120);
insert into aircraft values (4, 'British Aerospace Jetstream 41', 1502);
insert into aircraft values (5, 'Embraer ERJ-145', 1530);
insert into aircraft values (6, 'SAAB 340', 2128);
insert into aircraft values (7, 'Piper Archer III', 520);
insert into aircraft values (8, 'Tupolev 154', 4103);
insert into aircraft values (16, 'Schwitzer 2-33', 30);
insert into aircraft values (9, 'Lockheed L1011', 6900);
insert into aircraft values (10, 'Boeing 757-300', 4010);
insert into aircraft values (11, 'Boeing 777-300', 6441);
insert into aircraft values (12, 'Boeing 767-400ER', 6475);
insert into aircraft values (13, 'Airbus A320', 2605);
insert into aircraft values (14, 'Airbus A319', 1805);
insert into aircraft values (15, 'Boeing 727', 1504);

insert into employees values (242518965, 'James Smith', 120433);
insert into employees values (141582651, 'Mary Johnson', 178345);
insert into employees values (011564812, 'John Williams', 153972);
insert into employees values (567354612, 'Lisa Walker', 256481);
insert into employees values (552455318, 'Larry West', 101745);
insert into employees values (550156548, 'Karen Scott', 205187);
insert into employees values (390487451, 'Lawrence Sperry', 212156);
insert into employees values (274878974, 'Michael Miller', 99890);
insert into employees values (254099823, 'Patricia Jones', 24450);
insert into employees values (356187925, 'Robert Brown', 44740);
insert into employees values (355548984, 'Angela Martinez', 212156);
insert into employees values (310454876, 'Joseph Thompson', 212156);
insert into employees values (489456522, 'Linda Davis', 127984);
insert into employees values (489221823, 'Richard Jackson', 23980);
insert into employees values (548977562, 'William Ward', 84476);
insert into employees values (310454877, 'Chad Stewart', 33546);
insert into employees values (142519864, 'Betty Adams', 227489);
insert into employees values (269734834, 'George Wright', 289950);
insert into employees values (287321212, 'Michael Miller', 48090);
insert into employees values (552455348, 'Dorthy Lewis', 92013);
insert into employees values (248965255, 'Barbara Wilson', 43723);
insert into employees values (159542516, 'William Moore', 48250);
insert into employees values (348121549, 'Haywood Kelly', 32899);
insert into employees values (090873519, 'Elizabeth Taylor', 32021);
insert into employees values (486512566, 'David Anderson', 743001);
insert into employees values (619023588, 'Jennifer Thomas', 54921);
insert into employees values (015645489, 'Donald King', 18050);
insert into employees values (556784565, 'Mark Young', 205187);
insert into employees values (573284895, 'Eric Cooper', 114323);
insert into employees values (574489456, 'William Jones', 105743);
insert into employees values (574489457, 'Milo Brooks', 20);

insert into certified values (567354612, 1);
insert into certified values (567354612, 2);
insert into certified values (567354612, 10);
insert into certified values (567354612, 11);
insert into certified values (567354612, 12);
insert into certified values (567354612, 15);
insert into certified values (567354612, 7);
insert into certified values (567354612, 9);
insert into certified values (567354612, 3);
insert into certified values (567354612, 4);
insert into certified values (567354612, 5);
insert into certified values (552455318, 2);
insert into certified values (552455318, 14);
insert into certified values (550156548, 1);
insert into certified values (550156548, 12);
insert into certified values (390487451, 3);
insert into certified values (390487451, 13);
insert into certified values (390487451, 14);
insert into certified values (274878974, 10);
insert into certified values (274878974, 12);
insert into certified values (355548984, 8);
insert into certified values (355548984, 9);
insert into certified values (310454876, 8);
insert into certified values (310454876, 9);
insert into certified values (548977562, 7);
insert into certified values (142519864, 1);
insert into certified values (142519864, 11);
insert into certified values (142519864, 12);
insert into certified values (142519864, 10);
insert into certified values (142519864, 3);
insert into certified values (142519864, 2);
insert into certified values (142519864, 13);
insert into certified values (142519864, 7);
insert into certified values (269734834, 1);
insert into certified values (269734834, 2);
insert into certified values (269734834, 3);
insert into certified values (269734834, 4);
insert into certified values (269734834, 5);
insert into certified values (269734834, 6);
insert into certified values (269734834, 7);
insert into certified values (269734834, 8);
insert into certified values (269734834, 9);
insert into certified values (269734834, 10);
insert into certified values (269734834, 11);
insert into certified values (269734834, 12);
insert into certified values (269734834, 13);
insert into certified values (269734834, 14);
insert into certified values (269734834, 15);
insert into certified values (552455318, 7);
insert into certified values (556784565, 5);
insert into certified values (556784565, 2);
insert into certified values (556784565, 3);
insert into certified values (573284895, 3);
insert into certified values (573284895, 4);
insert into certified values (573284895, 5);
insert into certified values (574489456, 8);
insert into certified values (574489456, 6);
insert into certified values (574489457, 7);
insert into certified values (242518965, 2);
insert into certified values (242518965, 10);
insert into certified values (141582651, 2);
insert into certified values (141582651, 10);
insert into certified values (141582651, 12);
insert into certified values (011564812, 2);
insert into certified values (011564812, 10);
insert into certified values (356187925, 6);
insert into certified values (159542516, 5);
insert into certified values (159542516, 7);
insert into certified values (090873519, 6);

--
-- Now the Movies and Stars tables
--
drop table Movie cascade constraints;
drop table MovieStar cascade constraints;
drop table StarsIn cascade constraints;

create table Movie (
	MovieID integer primary key,
	Title char(50),
	Year integer
);

create table MovieStar (
	StarID integer primary key,
	Name char(30),
	Gender char(12)
);

create table StarsIn (
	MovieID integer,
	StarID integer,
	Character char(64),
	foreign key (MovieID) references Movie,
	foreign key (StarID) references MovieStar
);

insert into Movie values (0, 'The Last Command', 1927);
insert into MovieStar values (1000, 'Emil Jannings', 'male');
insert into StarsIn values (0, 1000, 'General Dolgorucki [Grand Duke Sergius Alexander]');

insert into Movie values (1, '7th Heaven', 1927);
insert into MovieStar values (1001, 'Janet Gaynor', 'female');
insert into StarsIn values (1, 1001, 'Diane');

insert into Movie values (2, 'In Old Arizona', 1928);
insert into MovieStar values (1002, 'Warner Baxter', 'male');
insert into StarsIn values (2, 1002, 'The Cisco Kid');

insert into Movie values (3, 'Coquette', 1928);
insert into MovieStar values (1003, 'Mary Pickford', 'female');
insert into StarsIn values (3, 1003, 'Norma Besant');

insert into Movie values (4, 'Disraeli', 1929);
insert into MovieStar values (1004, 'George Arliss', 'male');
insert into StarsIn values (4, 1004, 'Benjamin Disraeli');

insert into Movie values (5, 'The Divorcee', 1929);
insert into MovieStar values (1005, 'Norma Shearer', 'female');
insert into StarsIn values (5, 1005, 'Jerry');

insert into Movie values (6, 'A Free Soul', 1930);
insert into MovieStar values (1006, 'Lionel Barrymore', 'male');
insert into StarsIn values (6, 1006, 'Stephen Ashe');

insert into Movie values (7, 'Min and Bill', 1930);
insert into MovieStar values (1007, 'Marie Dressler', 'female');
insert into StarsIn values (7, 1007, 'Min');

insert into Movie values (8, 'The Champ', 1931);
insert into MovieStar values (1008, 'Wallace Beery', 'male');
insert into StarsIn values (8, 1008, 'Champ');

insert into Movie values (9, 'The Sin of Madelon Claudet', 1931);
insert into MovieStar values (1009, 'Helen Hayes', 'female');
insert into StarsIn values (9, 1009, 'Madelon');

insert into Movie values (10, 'The Private Life of Henry VIII', 1932);
insert into MovieStar values (1010, 'Charles Laughton', 'male');
insert into StarsIn values (10, 1010, 'Henry VIII');

insert into Movie values (11, 'Morning Glory', 1932);
insert into MovieStar values (1011, 'Katharine Hepburn', 'female');
insert into StarsIn values (11, 1011, 'Eva Lovelace');

insert into Movie values (12, 'It Happened One Night', 1934);
insert into MovieStar values (1012, 'Clark Gable', 'male');
insert into StarsIn values (12, 1012, 'Peter Warne');
insert into MovieStar values (1013, 'Claudette Colbert', 'female');
insert into StarsIn values (12, 1013, 'Ellie Andrews');

insert into Movie values (13, 'The Informer', 1935);
insert into MovieStar values (1014, 'Victor McLaglen', 'male');
insert into StarsIn values (13, 1014, 'Gypo Nolan');

insert into Movie values (14, 'Dangerous', 1935);
insert into MovieStar values (1015, 'Bette Davis', 'female');
insert into StarsIn values (14, 1015, 'Joyce Heath');

insert into Movie values (15, 'The Story of Louis Pasteur', 1936);
insert into MovieStar values (1016, 'Paul Muni', 'male');
insert into StarsIn values (15, 1016, 'Louis Pasteur');

insert into Movie values (16, 'Come and Get It', 1936);
insert into MovieStar values (1017, 'Walter Brennan', 'male');
insert into StarsIn values (16, 1017, 'Swan Bostrom');

insert into Movie values (17, 'The Great Ziegfeld', 1936);
insert into MovieStar values (1018, 'Luise Rainer', 'female');
insert into StarsIn values (17, 1018, 'Anna Held');

insert into Movie values (18, 'Anthony Adverse', 1936);
insert into MovieStar values (1019, 'Gale Sondergaard', 'female');
insert into StarsIn values (18, 1019, 'Faith Paleologue');

insert into Movie values (19, 'Captains Courageous', 1937);
insert into MovieStar values (1020, 'Spencer Tracy', 'male');
insert into StarsIn values (19, 1020, 'Manuel');

insert into Movie values (20, 'The Life of Emile Zola', 1937);
insert into MovieStar values (1021, 'Joseph Schildkraut', 'male');
insert into StarsIn values (20, 1021, 'Captain Alfred Dreyfus');

insert into Movie values (21, 'The Good Earth', 1937);
insert into StarsIn values (21, 1018, 'O-Lan');

insert into Movie values (22, 'In Old Chicago', 1937);
insert into MovieStar values (1022, 'Alice Brady', 'female');
insert into StarsIn values (22, 1022, 'Molly O''Leary');

insert into Movie values (23, 'Boys Town', 1938);
insert into StarsIn values (23, 1020, 'Father Flanagan');

insert into Movie values (24, 'Kentucky', 1938);
insert into StarsIn values (24, 1017, 'Peter Goodwin');

insert into Movie values (25, 'Jezebel', 1938);
insert into StarsIn values (25, 1015, 'Julie Morrison');
insert into MovieStar values (1023, 'Fay Bainter', 'female');
insert into StarsIn values (25, 1023, 'Aunt Belle Massey');

insert into Movie values (26, 'Goodbye, Mr. Chips', 1939);
insert into MovieStar values (1024, 'Robert Donat', 'male');
insert into StarsIn values (26, 1024, 'Mr. Chips');

insert into Movie values (27, 'Stagecoach', 1939);
insert into MovieStar values (1025, 'Thomas Mitchell', 'male');
insert into StarsIn values (27, 1025, 'Dr. Josiah Boone');

insert into Movie values (28, 'Gone with the Wind', 1939);
insert into MovieStar values (1026, 'Vivien Leigh', 'female');
insert into StarsIn values (28, 1026, 'Scarlett O''Hara');
insert into MovieStar values (1027, 'Hattie McDaniel', 'female');
insert into StarsIn values (28, 1027, 'Mammy');

insert into Movie values (29, 'The Philadelphia Story', 1940);
insert into MovieStar values (1028, 'James Stewart', 'male');
insert into StarsIn values (29, 1028, 'Mike Connor');

insert into Movie values (30, 'The Westerner', 1940);
insert into StarsIn values (30, 1017, 'Judge Roy Bean');

insert into Movie values (31, 'Kitty Foyle', 1940);
insert into MovieStar values (1029, 'Ginger Rogers', 'female');
insert into StarsIn values (31, 1029, 'Kitty Foyle');

insert into Movie values (32, 'The Grapes of Wrath', 1940);
insert into MovieStar values (1030, 'Jane Darwell', 'female');
insert into StarsIn values (32, 1030, 'Ma Joad');

insert into Movie values (33, 'Sergeant York', 1941);
insert into MovieStar values (1031, 'Gary Cooper', 'male');
insert into StarsIn values (33, 1031, 'Alvin C. York');

insert into Movie values (34, 'How Green Was My Valley', 1941);
insert into MovieStar values (1032, 'Donald Crisp', 'male');
insert into StarsIn values (34, 1032, 'Mr. Morgan');

insert into Movie values (35, 'Suspicion', 1941);
insert into MovieStar values (1033, 'Joan Fontaine', 'female');
insert into StarsIn values (35, 1033, 'Lina McLaidlaw');

insert into Movie values (36, 'The Great Lie', 1941);
insert into MovieStar values (1034, 'Mary Astor', 'female');
insert into StarsIn values (36, 1034, 'Sandra Kovak');

insert into Movie values (37, 'Yankee Doodle Dandy', 1942);
insert into MovieStar values (1035, 'James Cagney', 'male');
insert into StarsIn values (37, 1035, 'George M. Cohan');

insert into Movie values (38, 'Johnny Eager', 1942);
insert into MovieStar values (1036, 'Van Heflin', 'male');
insert into StarsIn values (38, 1036, 'Jeff Hartnett');

insert into Movie values (39, 'Mrs. Miniver', 1942);
insert into MovieStar values (1037, 'Greer Garson', 'female');
insert into StarsIn values (39, 1037, 'Kay Miniver');
insert into MovieStar values (1038, 'Teresa Wright', 'female');
insert into StarsIn values (39, 1038, 'Carol Beldon');

insert into Movie values (40, 'Watch on the Rhine', 1943);
insert into MovieStar values (1039, 'Paul Lukas', 'male');
insert into StarsIn values (40, 1039, 'Kurt Muller');

insert into Movie values (41, 'The More the Merrier', 1943);
insert into MovieStar values (1040, 'Charles Coburn', 'male');
insert into StarsIn values (41, 1040, 'Benjamin Dingle');

insert into Movie values (42, 'The Song of Bernadette', 1943);
insert into MovieStar values (1041, 'Jennifer Jones', 'female');
insert into StarsIn values (42, 1041, 'Bernadette Soubirous');

insert into Movie values (43, 'For Whom the Bell Tolls', 1943);
insert into MovieStar values (1042, 'Katina Paxinou', 'female');
insert into StarsIn values (43, 1042, 'Pilar');

insert into Movie values (44, 'Going My Way', 1944);
insert into MovieStar values (1043, 'Bing Crosby', 'male');
insert into StarsIn values (44, 1043, 'Father O''Malley');
insert into MovieStar values (1044, 'Barry Fitzgerald', 'male');
insert into StarsIn values (44, 1044, 'Father Fitzgibbon');

insert into Movie values (45, 'Gaslight', 1944);
insert into MovieStar values (1045, 'Ingrid Bergman', 'female');
insert into StarsIn values (45, 1045, 'Paula Alquist');

insert into Movie values (46, 'None but the Lonely Heart', 1944);
insert into MovieStar values (1046, 'Ethel Barrymore', 'female');
insert into StarsIn values (46, 1046, 'Ma Mott');

insert into Movie values (47, 'The Lost Weekend', 1945);
insert into MovieStar values (1047, 'Ray Milland', 'male');
insert into StarsIn values (47, 1047, 'Don Birnam');

insert into Movie values (48, 'A Tree Grows in Brooklyn', 1945);
insert into MovieStar values (1048, 'James Dunn', 'male');
insert into StarsIn values (48, 1048, 'Johnny Nolan');

insert into Movie values (49, 'Mildred Pierce', 1945);
insert into MovieStar values (1049, 'Joan Crawford', 'female');
insert into StarsIn values (49, 1049, 'Mildred Pierce');

insert into Movie values (50, 'National Velvet', 1945);
insert into MovieStar values (1050, 'Anne Revere', 'female');
insert into StarsIn values (50, 1050, 'Mrs. Brown');

insert into Movie values (51, 'The Best Years of Our Lives', 1946);
insert into MovieStar values (1051, 'Fredric March', 'male');
insert into StarsIn values (51, 1051, 'Al Stephenson');
insert into MovieStar values (1052, 'Harold Russell', 'male');
insert into StarsIn values (51, 1052, 'Homer Parrish');

insert into Movie values (52, 'To Each His Own', 1946);
insert into MovieStar values (1053, 'Olivia de Havilland', 'female');
insert into StarsIn values (52, 1053, 'Jody Norris');

insert into Movie values (53, 'The Razor''s Edge', 1946);
insert into MovieStar values (1054, 'Anne Baxter', 'female');
insert into StarsIn values (53, 1054, 'Sophie MacDonald');

insert into Movie values (54, 'A Double Life', 1947);
insert into MovieStar values (1055, 'Ronald Colman', 'male');
insert into StarsIn values (54, 1055, 'Anthony John');

insert into Movie values (55, 'Miracle on 34th Street', 1947);
insert into MovieStar values (1056, 'Edmund Gwenn', 'male');
insert into StarsIn values (55, 1056, 'Kris Kringle');

insert into Movie values (56, 'The Farmer''s Daughter', 1947);
insert into MovieStar values (1057, 'Loretta Young', 'female');
insert into StarsIn values (56, 1057, 'Katrin Holstrom');

insert into Movie values (57, 'Gentleman''s Agreement', 1947);
insert into MovieStar values (1058, 'Celeste Holm', 'female');
insert into StarsIn values (57, 1058, 'Anne');

insert into Movie values (58, 'Hamlet', 1948);
insert into MovieStar values (1059, 'Laurence Olivier', 'male');
insert into StarsIn values (58, 1059, 'Hamlet');

insert into Movie values (59, 'The Treasure of the Sierra Madre', 1948);
insert into MovieStar values (1060, 'Walter Huston', 'male');
insert into StarsIn values (59, 1060, 'Howard');

insert into Movie values (60, 'Johnny Belinda', 1948);
insert into MovieStar values (1061, 'Jane Wyman', 'female');
insert into StarsIn values (60, 1061, 'Belinda McDonald');

insert into Movie values (61, 'Key Largo', 1948);
insert into MovieStar values (1062, 'Claire Trevor', 'female');
insert into StarsIn values (61, 1062, 'Gaye');

insert into Movie values (62, 'All the King''s Men', 1949);
insert into MovieStar values (1063, 'Broderick Crawford', 'male');
insert into StarsIn values (62, 1063, 'Willie Stark');

insert into Movie values (63, 'Twelve O''Clock High', 1949);
insert into MovieStar values (1064, 'Dean Jagger', 'male');
insert into StarsIn values (63, 1064, 'Major Stovall');

insert into Movie values (64, 'The Heiress', 1949);
insert into StarsIn values (64, 1053, 'Catherine Sloper');
insert into MovieStar values (1065, 'Mercedes McCambridge', 'female');
insert into StarsIn values (62, 1065, 'Sadie Burke');

insert into Movie values (65, 'Cyrano de Bergerac', 1950);
insert into MovieStar values (1066, 'JoseFerrer', 'male');
insert into StarsIn values (65, 1066, 'Cyrano de Bergerac');

insert into Movie values (66, 'All about Eve', 1950);
insert into MovieStar values (1067, 'George Sanders', 'male');
insert into StarsIn values (66, 1067, 'Addison De Witt');

insert into Movie values (67, 'Born Yesterday', 1950);
insert into MovieStar values (1068, 'Judy Holliday', 'female');
insert into StarsIn values (67, 1068, 'Billie Dawn');

insert into Movie values (68, 'Harvey', 1950);
insert into MovieStar values (1069, 'Josephine Hull', 'female');
insert into StarsIn values (68, 1069, 'Veta Louise Simmons');

insert into Movie values (69, 'The African Queen', 1951);
insert into MovieStar values (1070, 'Humphrey Bogart', 'male');
insert into StarsIn values (69, 1070, 'Charlie Allnut');

insert into Movie values (70, 'A Streetcar Named Desire', 1951);
insert into MovieStar values (1071, 'Karl Malden', 'male');
insert into StarsIn values (70, 1071, 'Mitch');
insert into StarsIn values (70, 1026, 'Blanche DuBois');
insert into MovieStar values (1072, 'Kim Hunter', 'female');
insert into StarsIn values (70, 1072, 'Stella Kowalski');

insert into Movie values (71, 'High Noon', 1952);
insert into StarsIn values (71, 1031, 'Will Kane');

insert into Movie values (72, 'Viva Zapata!', 1952);
insert into MovieStar values (1073, 'Anthony Quinn', 'male');
insert into StarsIn values (72, 1073, 'Eufemio Zapata');

insert into Movie values (73, 'Come Back, Little Sheba', 1952);
insert into MovieStar values (1074, 'Shirley Booth', 'female');
insert into StarsIn values (73, 1074, 'Lola Delaney');

insert into Movie values (74, 'The Bad and the Beautiful', 1952);
insert into MovieStar values (1075, 'Gloria Grahame', 'female');
insert into StarsIn values (74, 1075, 'Rosemary Bartlow');

insert into Movie values (75, 'Stalag 17', 1953);
insert into MovieStar values (1076, 'William Holden', 'male');
insert into StarsIn values (75, 1076, 'Sefton');

insert into Movie values (76, 'From Here to Eternity', 1953);
insert into MovieStar values (1077, 'Frank Sinatra', 'male');
insert into StarsIn values (76, 1077, 'Angelo Maggio');

insert into Movie values (77, 'Roman Holiday', 1953);
insert into MovieStar values (1078, 'Audrey Hepburn', 'female');
insert into StarsIn values (77, 1078, 'Princess Anne');
insert into MovieStar values (1079, 'Donna Reed', 'female');
insert into StarsIn values (76, 1079, 'Lorene/Alma');

insert into Movie values (78, 'On the Waterfront', 1954);
insert into MovieStar values (1080, 'Marlon Brando', 'male');
insert into StarsIn values (78, 1080, 'Terry Malloy');

insert into Movie values (79, 'The Barefoot Contessa', 1954);
insert into MovieStar values (1081, 'Edmond O''Brien', 'male');
insert into StarsIn values (79, 1081, 'Oscar Muldoon');

insert into Movie values (80, 'The Country Girl', 1954);
insert into MovieStar values (1082, 'Grace Kelly', 'female');
insert into StarsIn values (80, 1082, 'Georgie Elgin');
insert into MovieStar values (1083, 'Eva Marie Saint', 'female');
insert into StarsIn values (78, 1083, 'Edie Doyle');

insert into Movie values (81, 'Marty', 1955);
insert into MovieStar values (1084, 'Ernest Borgnine', 'male');
insert into StarsIn values (81, 1084, 'Marty Pilletti');

insert into Movie values (82, 'Mister Roberts', 1955);
insert into MovieStar values (1085, 'Jack Lemmon', 'male');
insert into StarsIn values (82, 1085, 'Ensign Pulver');

insert into Movie values (83, 'The Rose Tattoo', 1955);
insert into MovieStar values (1086, 'Anna Magnani', 'female');
insert into StarsIn values (83, 1086, 'Serafina Della Rose');

insert into Movie values (84, 'East of Eden', 1955);
insert into MovieStar values (1087, 'Jo Van Fleet', 'female');
insert into StarsIn values (84, 1087, 'Kate');

insert into Movie values (85, 'The King and I', 1956);
insert into MovieStar values (1088, 'Yul Brynner', 'male');
insert into StarsIn values (85, 1088, 'The King');

insert into Movie values (86, 'Lust for Life', 1956);
insert into StarsIn values (86, 1073, 'Paul Gauguin');

insert into Movie values (87, 'Anastasia', 1956);
insert into StarsIn values (87, 1045, 'The Woman');

insert into Movie values (88, 'Written on the Wind', 1956);
insert into MovieStar values (1089, 'Dorothy Malone', 'female');
insert into StarsIn values (88, 1089, 'Marylee Hadley');

insert into Movie values (89, 'The Bridge on the River Kwai', 1957);
insert into MovieStar values (1090, 'Alec Guinness', 'male');
insert into StarsIn values (89, 1090, 'Colonel Nicholson');

insert into Movie values (90, 'Sayonara', 1957);
insert into MovieStar values (1091, 'Red Buttons', 'male');
insert into StarsIn values (90, 1091, 'Joe Kelly');

insert into Movie values (91, 'The Three Faces of Eve', 1957);
insert into MovieStar values (1092, 'Joanne Woodward', 'female');
insert into StarsIn values (91, 1092, 'Eve White/Eve Black/Jane');
insert into MovieStar values (1093, 'Miyoshi Umeki', 'female');
insert into StarsIn values (90, 1093, 'Katsumi');

insert into Movie values (92, 'Separate Tables', 1958);
insert into MovieStar values (1094, 'David Niven', 'male');
insert into StarsIn values (92, 1094, 'Major Pollock');

insert into Movie values (93, 'The Big Country', 1958);
insert into MovieStar values (1095, 'Burl Ives', 'male');
insert into StarsIn values (93, 1095, 'Rufus Hannassey');

insert into Movie values (94, 'I Want to Live!', 1958);
insert into MovieStar values (1096, 'Susan Hayward', 'female');
insert into StarsIn values (94, 1096, 'Barbara Graham');
insert into MovieStar values (1097, 'Wendy Hiller', 'female');
insert into StarsIn values (92, 1097, 'Pat Cooper');

insert into Movie values (95, 'Ben-Hur', 1959);
insert into MovieStar values (1098, 'Charlton Heston', 'male');
insert into StarsIn values (95, 1098, 'Judah Ben-Hur');
insert into MovieStar values (1099, 'Hugh Griffith', 'male');
insert into StarsIn values (95, 1099, 'Sheik Ilderim');

insert into Movie values (96, 'Room at the Top', 1959);
insert into MovieStar values (1100, 'Simone Signoret', 'female');
insert into StarsIn values (96, 1100, 'Alice Aisgill');

insert into Movie values (97, 'The Diary of Anne Frank', 1959);
insert into MovieStar values (1101, 'Shelley Winters', 'female');
insert into StarsIn values (97, 1101, 'Mrs. Van Daan');

insert into Movie values (98, 'Elmer Gantry', 1960);
insert into MovieStar values (1102, 'Burt Lancaster', 'male');
insert into StarsIn values (98, 1102, 'Elmer Gantry');

insert into Movie values (99, 'Spartacus', 1960);
insert into MovieStar values (1103, 'Peter Ustinov', 'male');
insert into StarsIn values (99, 1103, 'Batiatus');

insert into Movie values (100, 'Butterfield 8', 1960);
insert into MovieStar values (1104, 'Elizabeth Taylor', 'female');
insert into StarsIn values (100, 1104, 'Gloria Wandrous');
insert into MovieStar values (1105, 'Shirley Jones', 'female');
insert into StarsIn values (98, 1105, 'Lulu Bains');

insert into Movie values (101, 'Judgment at Nuremberg', 1961);
insert into MovieStar values (1106, 'Maximilian Schell', 'male');
insert into StarsIn values (101, 1106, 'Hans Rolfe');

insert into Movie values (102, 'West Side Story', 1961);
insert into MovieStar values (1107, 'George Chakiris', 'male');
insert into StarsIn values (102, 1107, 'Bernardo');

insert into Movie values (103, 'Two Women', 1961);
insert into MovieStar values (1108, 'Sophia Loren', 'female');
insert into StarsIn values (103, 1108, 'Cesira');
insert into MovieStar values (1109, 'Rita Moreno', 'female');
insert into StarsIn values (102, 1109, 'Anita');

insert into Movie values (104, 'To Kill a Mockingbird', 1962);
insert into MovieStar values (1110, 'Gregory Peck', 'male');
insert into StarsIn values (104, 1110, 'Atticus Finch');

insert into Movie values (105, 'Sweet Bird of Youth', 1962);
insert into MovieStar values (1111, 'Ed Begley', 'male');
insert into StarsIn values (105, 1111, 'Tom ''Boss'' Finley');

insert into Movie values (106, 'The Miracle Worker', 1962);
insert into MovieStar values (1112, 'Anne Bancroft', 'female');
insert into StarsIn values (106, 1112, 'Annie Sullivan');
insert into MovieStar values (1113, 'Patty Duke', 'female');
insert into StarsIn values (106, 1113, 'Helen Keller');

insert into Movie values (107, 'Lilies of the Field', 1963);
insert into MovieStar values (1114, 'Sidney Poitier', 'male');
insert into StarsIn values (107, 1114, 'Homer Smith');

insert into Movie values (108, 'Hud', 1963);
insert into MovieStar values (1115, 'Melvyn Douglas', 'male');
insert into StarsIn values (108, 1115, 'Homer Bannon');
insert into MovieStar values (1116, 'Patricia Neal', 'female');
insert into StarsIn values (108, 1116, 'Alma');

insert into Movie values (109, 'The V.I.P.s', 1963);
insert into MovieStar values (1117, 'Margaret Rutherford', 'female');
insert into StarsIn values (109, 1117, 'Duchess of Brighton');

insert into Movie values (110, 'My Fair Lady', 1964);
insert into MovieStar values (1118, 'Rex Harrison', 'male');
insert into StarsIn values (110, 1118, 'Professor Henry Higgins');

insert into Movie values (111, 'Topkapi', 1964);
insert into StarsIn values (111, 1103, 'Arthur Simpson');

insert into Movie values (112, 'Mary Poppins', 1964);
insert into MovieStar values (1119, 'Julie Andrews', 'female');
insert into StarsIn values (112, 1119, 'Mary Poppins');

insert into Movie values (113, 'Zorba the Greek', 1964);
insert into MovieStar values (1120, 'Lila Kedrova', 'female');
insert into StarsIn values (113, 1120, 'Madame Hortense');

insert into Movie values (114, 'Cat Ballou', 1965);
insert into MovieStar values (1121, 'Lee Marvin', 'male');
insert into StarsIn values (114, 1121, 'Kid Shelleen/Tim Strawn');

insert into Movie values (115, 'A Thousand Clowns', 1965);
insert into MovieStar values (1122, 'Martin Balsam', 'male');
insert into StarsIn values (115, 1122, 'Arnold Burns');

insert into Movie values (116, 'Darling', 1965);
insert into MovieStar values (1123, 'Julie Christie', 'female');
insert into StarsIn values (116, 1123, 'Diana Scott');

insert into Movie values (117, 'A Patch of Blue', 1965);
insert into StarsIn values (117, 1101, 'Rose-Ann D''Arcey');

insert into Movie values (118, 'A Man for All Seasons', 1966);
insert into MovieStar values (1124, 'Paul Scofield', 'male');
insert into StarsIn values (118, 1124, 'Sir Thomas More');

insert into Movie values (119, 'The Fortune Cookie', 1966);
insert into MovieStar values (1125, 'Walter Matthau', 'male');
insert into StarsIn values (119, 1125, 'Willie Gingrich');

insert into Movie values (120, 'Who''s Afraid of Virginia Woolf?', 1966);
insert into StarsIn values (120, 1104, 'Martha');
insert into MovieStar values (1126, 'Sandy Dennis', 'female');
insert into StarsIn values (120, 1126, 'Honey');

insert into Movie values (121, 'In the Heat of the Night', 1967);
insert into MovieStar values (1127, 'Rod Steiger', 'male');
insert into StarsIn values (121, 1127, 'Police Chief Bill Gillespie');

insert into Movie values (122, 'Cool Hand Luke', 1967);
insert into MovieStar values (1128, 'George Kennedy', 'male');
insert into StarsIn values (122, 1128, 'Dragline');

insert into Movie values (123, 'Guess Who''s Coming to Dinner', 1967);
insert into StarsIn values (123, 1011, 'Christina Drayton');

insert into Movie values (124, 'Bonnie and Clyde', 1967);
insert into MovieStar values (1129, 'Estelle Parsons', 'female');
insert into StarsIn values (124, 1129, 'Blanche Barrow');

insert into Movie values (125, 'Charly', 1968);
insert into MovieStar values (1130, 'Cliff Robertson', 'male');
insert into StarsIn values (125, 1130, 'Charly Gordon');

insert into Movie values (126, 'The Subject Was Roses', 1968);
insert into MovieStar values (1131, 'Jack Albertson', 'male');
insert into StarsIn values (126, 1131, 'John Cleary');

insert into Movie values (127, 'The Lion in Winter', 1968);
insert into StarsIn values (127, 1011, 'Queen Eleanor of Aquitaine');

insert into Movie values (128, 'Rosemary''s Baby', 1968);
insert into MovieStar values (1132, 'Ruth Gordon', 'female');
insert into StarsIn values (128, 1132, 'Minnie Castevet');

insert into Movie values (129, 'True Grit', 1969);
insert into MovieStar values (1133, 'John Wayne', 'male');
insert into StarsIn values (129, 1133, 'Rooster Cogburn');

insert into Movie values (130, 'They Shoot Horses, Don''t They?', 1969);
insert into MovieStar values (1134, 'Gig Young', 'male');
insert into StarsIn values (130, 1134, 'Rocky');

insert into Movie values (131, 'The Prime of Miss Jean Brodie', 1969);
insert into MovieStar values (1135, 'Maggie Smith', 'female');
insert into StarsIn values (131, 1135, 'Miss Jean Brodie');

insert into Movie values (132, 'Cactus Flower', 1969);
insert into MovieStar values (1136, 'Goldie Hawn', 'female');
insert into StarsIn values (132, 1136, 'Toni Simmons');

insert into Movie values (133, 'Patton', 1970);
insert into MovieStar values (1137, 'George C. Scott', 'male');
insert into StarsIn values (133, 1137, 'General George S. Patton, Jr.');

insert into Movie values (134, 'Ryan''s Daughter', 1970);
insert into MovieStar values (1138, 'John Mills', 'male');
insert into StarsIn values (134, 1138, 'Michael');

insert into Movie values (135, 'Women in Love', 1970);
insert into MovieStar values (1139, 'Glenda Jackson', 'female');
insert into StarsIn values (135, 1139, 'Gudrun Brangwen');

insert into Movie values (136, 'Airport', 1970);
insert into StarsIn values (136, 1009, 'Ada Quonsett');

insert into Movie values (137, 'The French Connection', 1971);
insert into MovieStar values (1140, 'Gene Hackman', 'male');
insert into StarsIn values (137, 1140, 'Jimmy ''Popeye'' Doyle');

insert into Movie values (138, 'The Last Picture Show', 1971);
insert into MovieStar values (1141, 'Ben Johnson', 'male');
insert into StarsIn values (138, 1141, 'Sam the Lion');

insert into Movie values (139, 'Klute', 1971);
insert into MovieStar values (1142, 'Jane Fonda', 'female');
insert into StarsIn values (139, 1142, 'Bree Daniel');
insert into MovieStar values (1143, 'Cloris Leachman', 'female');
insert into StarsIn values (138, 1143, 'Ruth Popper');

insert into Movie values (140, 'The Godfather', 1972);
insert into StarsIn values (140, 1080, 'Don Vito Corleone');

insert into Movie values (141, 'Cabaret', 1972);
insert into MovieStar values (1144, 'Joel Grey', 'male');
insert into StarsIn values (141, 1144, 'The Master of Ceremonies');
insert into MovieStar values (1145, 'Liza Minnelli', 'female');
insert into StarsIn values (141, 1145, 'Sally Bowles');

insert into Movie values (142, 'Butterflies Are Free', 1972);
insert into MovieStar values (1146, 'Eileen Heckart', 'female');
insert into StarsIn values (142, 1146, 'Mrs. Baker');

insert into Movie values (143, 'Save the Tiger', 1973);
insert into StarsIn values (143, 1085, 'Harry Stoner');

insert into Movie values (144, 'The Paper Chase', 1973);
insert into MovieStar values (1147, 'John Houseman', 'male');
insert into StarsIn values (144, 1147, 'Professor Kingsfield');

insert into Movie values (145, 'A Touch of Class', 1973);
insert into StarsIn values (145, 1139, 'Vicki Allessio');

insert into Movie values (146, 'Paper Moon', 1973);
insert into MovieStar values (1148, 'Tatum O''Neal', 'female');
insert into StarsIn values (146, 1148, 'Addie Loggins');

insert into Movie values (147, 'Harry and Tonto', 1974);
insert into MovieStar values (1149, 'Art Carney', 'male');
insert into StarsIn values (147, 1149, 'Harry');

insert into Movie values (148, 'The Godfather Part II', 1974);
insert into MovieStar values (1150, 'Robert De Niro', 'male');
insert into StarsIn values (148, 1150, 'Vito Corleone');

insert into Movie values (149, 'Alice Doesn''t Live Here Anymore', 1974);
insert into MovieStar values (1151, 'Ellen Burstyn', 'female');
insert into StarsIn values (149, 1151, 'Alice Hyatt');

insert into Movie values (150, 'Murder on the Orient Express', 1974);
insert into StarsIn values (150, 1045, 'Greta Ohlsson');

insert into Movie values (151, 'One Flew over the Cuckoo''s Nest', 1975);
insert into MovieStar values (1152, 'Jack Nicholson', 'male');
insert into StarsIn values (151, 1152, 'Randle Patrick McMurphy');

insert into Movie values (152, 'The Sunshine Boys', 1975);
insert into MovieStar values (1153, 'George Burns', 'male');
insert into StarsIn values (152, 1153, 'Al Lewis');
insert into MovieStar values (1154, 'Louise Fletcher', 'female');
insert into StarsIn values (151, 1154, 'Nurse Mildred Ratched');

insert into Movie values (153, 'Shampoo', 1975);
insert into MovieStar values (1155, 'Lee Grant', 'female');
insert into StarsIn values (153, 1155, 'Felicia Karpf');

insert into Movie values (154, 'Network', 1976);
insert into MovieStar values (1156, 'Peter Finch', 'male');
insert into StarsIn values (154, 1156, 'Howard Beale');

insert into Movie values (155, 'All the President''s Men', 1976);
insert into MovieStar values (1157, 'Jason Robards', 'male');
insert into StarsIn values (155, 1157, 'Ben Bradlee');
insert into MovieStar values (1158, 'Faye Dunaway', 'female');
insert into StarsIn values (154, 1158, 'Diana Christensen');
insert into MovieStar values (1159, 'Beatrice Straight', 'female');
insert into StarsIn values (154, 1159, 'Louise Schumacher');

insert into Movie values (156, 'The Goodbye Girl', 1977);
insert into MovieStar values (1160, 'Richard Dreyfuss', 'male');
insert into StarsIn values (156, 1160, 'Elliot Garfield');

insert into Movie values (157, 'Julia', 1977);
insert into StarsIn values (157, 1157, 'Dashiell Hammett');

insert into Movie values (158, 'Annie Hall', 1977);
insert into MovieStar values (1161, 'Diane Keaton', 'female');
insert into StarsIn values (158, 1161, 'Annie Hall');
insert into MovieStar values (1162, 'Vanessa Redgrave', 'female');
insert into StarsIn values (157, 1162, 'Julia');

insert into Movie values (159, 'Coming Home', 1978);
insert into MovieStar values (1163, 'Jon Voight', 'male');
insert into StarsIn values (159, 1163, 'Luke Martin');

insert into Movie values (160, 'The Deer Hunter', 1978);
insert into MovieStar values (1164, 'Christopher Walken', 'male');
insert into StarsIn values (160, 1164, 'Nick');
insert into StarsIn values (159, 1142, 'Sally Hyde');

insert into Movie values (161, 'California Suite', 1978);
insert into StarsIn values (161, 1135, 'Diana Barrie');

insert into Movie values (162, 'Kramer vs. Kramer', 1979);
insert into MovieStar values (1165, 'Dustin Hoffman', 'male');
insert into StarsIn values (162, 1165, 'Ted Kramer');

insert into Movie values (163, 'Being There', 1979);
insert into StarsIn values (163, 1115, 'Benjamin Rand');

insert into Movie values (164, 'Norma Rae', 1979);
insert into MovieStar values (1166, 'Sally Field', 'female');
insert into StarsIn values (164, 1166, 'Norma Rae');
insert into MovieStar values (1167, 'Meryl Streep', 'female');
insert into StarsIn values (162, 1167, 'Joanna Kramer');

insert into Movie values (165, 'Raging Bull', 1980);
insert into StarsIn values (165, 1150, 'Jake LaMotta');

insert into Movie values (166, 'Ordinary People', 1980);
insert into MovieStar values (1168, 'Timothy Hutton', 'male');
insert into StarsIn values (166, 1168, 'Conrad Jarrett');

insert into Movie values (167, 'Coal Miner''s Daughter', 1980);
insert into MovieStar values (1169, 'Sissy Spacek', 'female');
insert into StarsIn values (167, 1169, 'Loretta Lynn');

insert into Movie values (168, 'Melvin and Howard', 1980);
insert into MovieStar values (1170, 'Mary Steenburgen', 'female');
insert into StarsIn values (168, 1170, 'Lynda Dummar');

insert into Movie values (169, 'On Golden Pond', 1981);
insert into MovieStar values (1171, 'Henry Fonda', 'male');
insert into StarsIn values (169, 1171, 'Norman Thayer, Jr.');

insert into Movie values (170, 'Arthur', 1981);
insert into MovieStar values (1172, 'John Gielgud', 'male');
insert into StarsIn values (170, 1172, 'Hobson');
insert into StarsIn values (169, 1011, 'Ethel Thayer');

insert into Movie values (171, 'Reds', 1981);
insert into MovieStar values (1173, 'Maureen Stapleton', 'female');
insert into StarsIn values (171, 1173, 'Emma Goldman');

insert into Movie values (172, 'Gandhi', 1982);
insert into MovieStar values (1174, 'Ben Kingsley', 'male');
insert into StarsIn values (172, 1174, 'Mahatma Gandhi');

insert into Movie values (173, 'An Officer and a Gentleman', 1982);
insert into MovieStar values (1175, 'Louis Gossett, Jr.', 'male');
insert into StarsIn values (173, 1175, 'Sgt. Emil Foley');

insert into Movie values (174, 'Sophie''s Choice', 1982);
insert into StarsIn values (174, 1167, 'Sophie');

insert into Movie values (175, 'Tootsie', 1982);
insert into MovieStar values (1176, 'Jessica Lange', 'female');
insert into StarsIn values (175, 1176, 'Julie Nichols');

insert into Movie values (176, 'Tender Mercies', 1983);
insert into MovieStar values (1177, 'Robert Duvall', 'male');
insert into StarsIn values (176, 1177, 'Mac Sledge');

insert into Movie values (177, 'Terms of Endearment', 1983);
insert into StarsIn values (177, 1152, 'Garrett Breedlove');
insert into MovieStar values (1178, 'Shirley MacLaine', 'female');
insert into StarsIn values (177, 1178, 'Aurora Greenway');

insert into Movie values (178, 'The Year of Living Dangerously', 1983);
insert into MovieStar values (1179, 'Linda Hunt', 'female');
insert into StarsIn values (178, 1179, 'Billy Kwan');

insert into Movie values (179, 'Amadeus', 1984);
insert into MovieStar values (1180, 'F. Murray Abraham', 'male');
insert into StarsIn values (179, 1180, 'Antonio Salieri');

insert into Movie values (180, 'The Killing Fields', 1984);
insert into MovieStar values (1181, 'Haing S. Ngor', 'male');
insert into StarsIn values (180, 1181, 'Dith Pran');

insert into Movie values (181, 'Places in the Heart', 1984);
insert into StarsIn values (181, 1166, 'Edna Spalding');

insert into Movie values (182, 'A Passage to India', 1984);
insert into MovieStar values (1182, 'Peggy Ashcroft', 'female');
insert into StarsIn values (182, 1182, 'Mrs. Moore');

insert into Movie values (183, 'Kiss of the Spider Woman', 1985);
insert into MovieStar values (1183, 'William Hurt', 'male');
insert into StarsIn values (183, 1183, 'Luis Molina');

insert into Movie values (184, 'Cocoon', 1985);
insert into MovieStar values (1184, 'Don Ameche', 'male');
insert into StarsIn values (184, 1184, 'Art Selwyn');

insert into Movie values (185, 'The Trip to Bountiful', 1985);
insert into MovieStar values (1185, 'Geraldine Page', 'female');
insert into StarsIn values (185, 1185, 'Mrs. Watts');

insert into Movie values (186, 'Prizzi''s Honor', 1985);
insert into MovieStar values (1186, 'Anjelica Huston', 'female');
insert into StarsIn values (186, 1186, 'Maerose Prizzi');

insert into Movie values (187, 'The Color of Money', 1986);
insert into MovieStar values (1187, 'Paul Newman', 'male');
insert into StarsIn values (187, 1187, 'Eddie Felson');

insert into Movie values (188, 'Hannah and Her Sisters', 1986);
insert into MovieStar values (1188, 'Michael Caine', 'male');
insert into StarsIn values (188, 1188, 'Elliot');

insert into Movie values (189, 'Children of a Lesser God', 1986);
insert into MovieStar values (1189, 'Marlee Matlin', 'female');
insert into StarsIn values (189, 1189, 'Sarah');
insert into MovieStar values (1190, 'Dianne Wiest', 'female');
insert into StarsIn values (188, 1190, 'Holly');

insert into Movie values (190, 'Wall Street', 1987);
insert into MovieStar values (1191, 'Michael Douglas', 'male');
insert into StarsIn values (190, 1191, 'Gordon Gekko');

insert into Movie values (191, 'The Untouchables', 1987);
insert into MovieStar values (1192, 'Sean Connery', 'male');
insert into StarsIn values (191, 1192, 'Jim Malone');

insert into Movie values (192, 'Moonstruck', 1987);
insert into MovieStar values (1193, 'Cher', 'female');
insert into StarsIn values (192, 1193, 'Loretta Castorini');
insert into MovieStar values (1194, 'Olympia Dukakis', 'female');
insert into StarsIn values (192, 1194, 'Rose Castorini');

insert into Movie values (193, 'Rain Man', 1988);
insert into StarsIn values (193, 1165, 'Raymond Babbitt');

insert into Movie values (194, 'A Fish Called Wanda', 1988);
insert into MovieStar values (1195, 'Kevin Kline', 'male');
insert into StarsIn values (194, 1195, 'Otto');

insert into Movie values (195, 'The Accused', 1988);
insert into MovieStar values (1196, 'Jodie Foster', 'female');
insert into StarsIn values (195, 1196, 'Sarah Tobias');

insert into Movie values (196, 'The Accidental Tourist', 1988);
insert into MovieStar values (1197, 'Geena Davis', 'female');
insert into StarsIn values (196, 1197, 'Muriel');

insert into Movie values (197, 'My Left Foot', 1989);
insert into MovieStar values (1198, 'Daniel Day Lewis', 'male');
insert into StarsIn values (197, 1198, 'Christy Brown');

insert into Movie values (198, 'Glory', 1989);
insert into MovieStar values (1199, 'Denzel Washington', 'male');
insert into StarsIn values (198, 1199, 'Trip');

insert into Movie values (199, 'Driving Miss Daisy', 1989);
insert into MovieStar values (1200, 'Jessica Tandy', 'female');
insert into StarsIn values (199, 1200, 'Daisy Werthan');
insert into MovieStar values (1201, 'Brenda Fricker', 'female');
insert into StarsIn values (197, 1201, 'Mrs. Brown');

insert into Movie values (200, 'Reversal of Fortune', 1990);
insert into MovieStar values (1202, 'Jeremy Irons', 'male');
insert into StarsIn values (200, 1202, 'Claus Von Bulow');

insert into Movie values (201, 'Good Fellas', 1990);
insert into MovieStar values (1203, 'Joe Pesci', 'male');
insert into StarsIn values (201, 1203, 'Tommy DeVito');

insert into Movie values (202, 'Misery', 1990);
insert into MovieStar values (1204, 'Kathy Bates', 'female');
insert into StarsIn values (202, 1204, 'Annie Wilkes');

insert into Movie values (203, 'Ghost', 1990);
insert into MovieStar values (1205, 'Whoopi Goldberg', 'female');
insert into StarsIn values (203, 1205, 'Oda Mae Brown');

insert into Movie values (204, 'The Silence of the Lambs', 1991);
insert into MovieStar values (1206, 'Anthony Hopkins', 'male');
insert into StarsIn values (204, 1206, 'Dr. Hannibal Lecter');

insert into Movie values (205, 'City Slickers', 1991);
insert into MovieStar values (1207, 'Jack Palance', 'male');
insert into StarsIn values (205, 1207, 'Curly');
insert into StarsIn values (204, 1196, 'Clarice Starling');

insert into Movie values (206, 'The Fisher King', 1991);
insert into MovieStar values (1208, 'Mercedes Ruehl', 'female');
insert into StarsIn values (206, 1208, 'Anne');

insert into Movie values (207, 'Scent of a Woman', 1992);
insert into MovieStar values (1209, 'Al Pacino', 'male');
insert into StarsIn values (207, 1209, 'Lt. Col. Frank Slade');

insert into Movie values (208, 'Unforgiven', 1992);
insert into StarsIn values (208, 1140, 'Little Bill Daggett');

insert into Movie values (209, 'Howards End', 1992);
insert into MovieStar values (1210, 'Emma Thompson', 'female');
insert into StarsIn values (209, 1210, 'Margaret Schlegel');

insert into Movie values (210, 'My Cousin Vinny', 1992);
insert into MovieStar values (1211, 'Marisa Tomei', 'female');
insert into StarsIn values (210, 1211, 'Mona Lisa Vito');

insert into Movie values (211, 'Philadelphia', 1993);
insert into MovieStar values (1212, 'Tom Hanks', 'male');
insert into StarsIn values (211, 1212, 'Andrew Beckett');

insert into Movie values (212, 'The Fugitive', 1993);
insert into MovieStar values (1213, 'Tommy Lee Jones', 'male');
insert into StarsIn values (212, 1213, 'Samuel Gerard');

insert into Movie values (213, 'The Piano', 1993);
insert into MovieStar values (1214, 'Holly Hunter', 'female');
insert into StarsIn values (213, 1214, 'Ada');
insert into MovieStar values (1215, 'Anna Paquin', 'female');
insert into StarsIn values (213, 1215, 'Flora');

insert into Movie values (214, 'Forrest Gump', 1994);
insert into StarsIn values (214, 1212, 'Forrest Gump');

insert into Movie values (215, 'Ed Wood', 1994);
insert into MovieStar values (1216, 'Martin Landau', 'male');
insert into StarsIn values (215, 1216, 'Bela Lugosi');

insert into Movie values (216, 'Blue Sky', 1994);
insert into StarsIn values (216, 1176, 'Carly Marshall');

insert into Movie values (217, 'Bullets over Broadway', 1994);
insert into StarsIn values (217, 1190, 'Helen Sinclair');

insert into Movie values (218, 'Leaving Las Vegas', 1995);
insert into MovieStar values (1217, 'Nicolas Cage', 'male');
insert into StarsIn values (218, 1217, 'Ben Sanderson');

insert into Movie values (219, 'The Usual Suspects', 1995);
insert into MovieStar values (1218, 'Kevin Spacey', 'male');
insert into StarsIn values (219, 1218, 'Roger ''Verbal'' Kint');

insert into Movie values (220, 'Dead Man Walking', 1995);
insert into MovieStar values (1219, 'Susan Sarandon', 'female');
insert into StarsIn values (220, 1219, 'Sister Helen Prejean');

insert into Movie values (221, 'Mighty Aphrodite', 1995);
insert into MovieStar values (1220, 'Mira Sorvino', 'female');
insert into StarsIn values (221, 1220, 'Linda');

insert into Movie values (222, 'Shine', 1996);
insert into MovieStar values (1221, 'Geoffrey Rush', 'male');
insert into StarsIn values (222, 1221, 'David Helfgott');

insert into Movie values (223, 'Jerry Maguire', 1996);
insert into MovieStar values (1222, 'Cuba Gooding, Jr.', 'male');
insert into StarsIn values (223, 1222, 'Rod Tidwell');

insert into Movie values (224, 'Fargo', 1996);
insert into MovieStar values (1223, 'Frances McDormand', 'female');
insert into StarsIn values (224, 1223, 'Marge Gunderson');

insert into Movie values (225, 'The English Patient', 1996);
insert into MovieStar values (1224, 'Juliette Binoche', 'female');
insert into StarsIn values (225, 1224, 'Hana');

insert into Movie values (226, 'As Good as It Gets', 1997);
insert into StarsIn values (226, 1152, 'Melvin Udall');

insert into Movie values (227, 'Good Will Hunting', 1997);
insert into MovieStar values (1225, 'Robin Williams', 'male');
insert into StarsIn values (227, 1225, 'Sean McGuire');
insert into MovieStar values (1226, 'Helen Hunt', 'female');
insert into StarsIn values (226, 1226, 'Carol Connelly');

insert into Movie values (228, 'L.A. Confidential', 1997);
insert into MovieStar values (1227, 'Kim Basinger', 'female');
insert into StarsIn values (228, 1227, 'Lynn Bracken');

insert into Movie values (229, 'Life Is Beautiful', 1998);
insert into MovieStar values (1228, 'Roberto Benigni', 'male');
insert into StarsIn values (229, 1228, 'Guido');

insert into Movie values (230, 'Affliction', 1998);
insert into MovieStar values (1229, 'James Coburn', 'male');
insert into StarsIn values (230, 1229, 'Glen Whitehouse');

insert into Movie values (231, 'Shakespeare in Love', 1998);
insert into MovieStar values (1230, 'Gwyneth Paltrow', 'female');
insert into StarsIn values (231, 1230, 'Viola De Lesseps');
insert into MovieStar values (1231, 'Judi Dench', 'female');
insert into StarsIn values (231, 1231, 'Queen Elizabeth I');

insert into Movie values (232, 'American Beauty', 1999);
insert into StarsIn values (232, 1218, 'Lester Burnham');

insert into Movie values (233, 'The Cider House Rules', 1999);
insert into StarsIn values (233, 1188, 'Dr. Wilbur Larch');

insert into Movie values (234, 'Boys Don''t Cry', 1999);
insert into MovieStar values (1232, 'Hilary Swank', 'female');
insert into StarsIn values (234, 1232, 'Brandon Teena/Teena Brandon');

insert into Movie values (235, 'Girl, Interrupted', 1999);
insert into MovieStar values (1233, 'Angelina Jolie', 'female');
insert into StarsIn values (235, 1233, 'Lisa Rowe');

insert into Movie values (236, 'Gladiator', 2000);
insert into MovieStar values (1234, 'Russell Crowe', 'male');
insert into StarsIn values (236, 1234, 'Maximus Decimus Meridius');

insert into Movie values (237, 'Traffic', 2000);
insert into MovieStar values (1235, 'Benicio Del Toro', 'male');
insert into StarsIn values (237, 1235, 'Javier Rodriguez');

insert into Movie values (238, 'Erin Brockovich', 2000);
insert into MovieStar values (1236, 'Julia Roberts', 'female');
insert into StarsIn values (238, 1236, 'Erin Brockovich');

insert into Movie values (239, 'Pollock', 2000);
insert into MovieStar values (1237, 'Marcia Gay Harden', 'female');
insert into StarsIn values (239, 1237, 'Lee Krasner');

insert into Movie values (240, 'Training Day', 2001);
insert into StarsIn values (240, 1199, 'Alonzo');

insert into Movie values (241, 'Iris', 2001);
insert into MovieStar values (1238, 'Jim Broadbent', 'male');
insert into StarsIn values (241, 1238, 'John Bayley');

insert into Movie values (242, 'Monster''s Ball', 2001);
insert into MovieStar values (1239, 'Halle Berry', 'female');
insert into StarsIn values (242, 1239, 'Leticia Musgrove');

insert into Movie values (243, 'A Beautiful Mind', 2001);
insert into MovieStar values (1240, 'Jennifer Connelly', 'female');
insert into StarsIn values (243, 1240, 'Alicia Nash');

insert into Movie values (244, 'The Pianist', 2002);
insert into MovieStar values (1241, 'Adrien Brody', 'male');
insert into StarsIn values (244, 1241, 'Wladyslaw Szpilman');

insert into Movie values (245, 'Adaptation', 2002);
insert into MovieStar values (1242, 'Chris Cooper', 'male');
insert into StarsIn values (245, 1242, 'John Laroche');

insert into Movie values (246, 'The Hours', 2002);
insert into MovieStar values (1243, 'Nicole Kidman', 'female');
insert into StarsIn values (246, 1243, 'Virginia Woolf');

insert into Movie values (247, 'Chicago', 2002);
insert into MovieStar values (1244, 'Catherine Zeta-Jones', 'female');
insert into StarsIn values (247, 1244, 'Velma Kelly');

insert into Movie values (248, 'Mystic River', 2003);
insert into MovieStar values (1245, 'Sean Penn', 'male');
insert into StarsIn values (248, 1245, 'Jimmy Markum');
insert into MovieStar values (1246, 'Tim Robbins', 'male');
insert into StarsIn values (248, 1246, 'Dave Boyle');

insert into Movie values (249, 'Monster', 2003);
insert into MovieStar values (1247, 'Charlize Theron', 'female');
insert into StarsIn values (249, 1247, 'Aileen Wuornos');

insert into Movie values (250, 'Cold Mountain', 2003);
insert into MovieStar values (1248, 'Ren�e Zellweger', 'female');
insert into StarsIn values (250, 1248, 'Ruby Thewes');

insert into Movie values (251, 'Ray', 2004);
insert into MovieStar values (1249, 'Jamie Foxx', 'male');
insert into StarsIn values (251, 1249, 'Ray Charles');

insert into Movie values (252, 'Million Dollar Baby', 2004);
insert into MovieStar values (1250, 'Morgan Freeman', 'male');
insert into StarsIn values (252, 1250, 'Eddie Scrap-Iron Dupris');
insert into StarsIn values (252, 1232, 'Maggie Fitzgerald');

insert into Movie values (253, 'The Aviator', 2004);
insert into MovieStar values (1251, 'Cate Blanchett', 'female');
insert into StarsIn values (253, 1251, 'Katharine Hepburn');

insert into Movie values (254, 'Capote', 2005);
insert into MovieStar values (1252, 'Philip Seymour Hoffman', 'male');
insert into StarsIn values (254, 1252, 'Truman Capote');

insert into Movie values (255, 'Syriana', 2005);
insert into MovieStar values (1253, 'George Clooney', 'male');
insert into StarsIn values (255, 1253, 'Bob Barnes');

insert into Movie values (256, 'Walk the Line', 2005);
insert into MovieStar values (1254, 'Reese Witherspoon', 'female');
insert into StarsIn values (256, 1254, 'June Carter');

insert into Movie values (257, 'The Constant Gardener', 2005);
insert into MovieStar values (1255, 'Rachel Weisz', 'female');
insert into StarsIn values (257, 1255, 'Tessa Quayle');

insert into Movie values (258, 'The Last King of Scotland', 2006);
insert into MovieStar values (1256, 'Forest Whitaker', 'male');
insert into StarsIn values (258, 1256, 'Idi Amin');

insert into Movie values (259, 'Little Miss Sunshine', 2006);
insert into MovieStar values (1257, 'Alan Arkin', 'male');
insert into StarsIn values (259, 1257, 'Grandpa');

insert into Movie values (260, 'The Queen', 2006);
insert into MovieStar values (1258, 'Helen Mirren', 'female');
insert into StarsIn values (260, 1258, 'The Queen');

insert into Movie values (261, 'Dreamgirls', 2006);
insert into MovieStar values (1259, 'Jennifer Hudson', 'female');
insert into StarsIn values (261, 1259, 'Effie White');

insert into Movie values (262, 'There Will Be Blood', 2007);
insert into MovieStar values (1260, 'Daniel Day-Lewis', 'male');
insert into StarsIn values (262, 1260, 'Daniel Plainview');

insert into Movie values (263, 'No Country for Old Men', 2007);
insert into MovieStar values (1261, 'Javier Bardem', 'male');
insert into StarsIn values (263, 1261, 'Anton Chigurh');

insert into Movie values (264, 'La Vie en Rose', 2007);
insert into MovieStar values (1262, 'Marion Cotillard', 'female');
insert into StarsIn values (264, 1262, 'Edith Piaf');

insert into Movie values (265, 'Michael Clayton', 2007);
insert into MovieStar values (1263, 'Tilda Swinton', 'female');
insert into StarsIn values (265, 1263, 'Karen Crowder');

insert into Movie values (266, 'Milk', 2008);
insert into StarsIn values (266, 1245, 'Harvey Milk');

insert into Movie values (267, 'The Dark Knight', 2008);
insert into MovieStar values (1264, 'Heath Ledger', 'male');
insert into StarsIn values (267, 1264, 'Joker');

insert into Movie values (268, 'The Reader', 2008);
insert into MovieStar values (1265, 'Kate Winslet', 'female');
insert into StarsIn values (268, 1265, 'Hanna Schmitz');

insert into Movie values (269, 'Vicky Cristina Barcelona', 2008);
insert into MovieStar values (1266, 'Penelope Cruz', 'female');
insert into StarsIn values (269, 1266, 'Maria Elena');

insert into Movie values (270, 'Crazy Heart', 2009);
insert into MovieStar values (1267, 'Jeff Bridges', 'male');
insert into StarsIn values (270, 1267, 'Bad Blake');

insert into Movie values (271, 'Inglourious Basterds', 2009);
insert into MovieStar values (1268, 'Christoph Waltz', 'male');
insert into StarsIn values (271, 1268, 'Col. Hans Landa');

insert into Movie values (272, 'The Blind Side', 2009);
insert into MovieStar values (1269, 'Sandra Bullock', 'female');
insert into StarsIn values (272, 1269, 'Leigh Anne Tuohy');

insert into Movie values (273, 'Precious: Based on the Novel ''Push'' by Sapphire', 2009);
insert into MovieStar values (1270, 'Mo''Nique', 'female');
insert into StarsIn values (273, 1270, 'Mary');

insert into Movie values (274, 'The King''s Speech', 2010);
insert into MovieStar values (1271, 'Colin Firth', 'male');
insert into StarsIn values (274, 1271, 'King George VI');

insert into Movie values (275, 'The Fighter', 2010);
insert into MovieStar values (1272, 'Christian Bale', 'male');
insert into StarsIn values (275, 1272, 'Dicky Eklund');

insert into Movie values (276, 'Black Swan', 2010);
insert into MovieStar values (1273, 'Natalie Portman', 'female');
insert into StarsIn values (276, 1273, 'Nina Sayers/The Swan Queen');
insert into MovieStar values (1274, 'Melissa Leo', 'female');
insert into StarsIn values (275, 1274, 'Alice Ward');

insert into Movie values (277, 'X-Men: Days of Future Past', 2014);
insert into MovieStar values (1275, 'Elliot Page', 'non-binary');
insert into StarsIn values (277, 1275, 'Kitty Pryde');

insert into Movie values (278, 'The Riot Club', 2014);
insert into MovieStar values (1276, 'Olly Alexander', 'non-binary');
insert into StarsIn values (278, 1276, 'Toby Maitland');

insert into Movie values (279, 'John Wick: Chapter 3-Parabllum', 2019);
insert into MovieStar values (1277, 'Asia Kate Dillon', 'non-binary');
insert into StarsIn values (279, 1277, 'The Adjudicator');

insert into Movie values (280, 'Let It Snow', 2019);
insert into MovieStar values (1278, 'Liv Hewson', 'non-binary');
insert into StarsIn values (280, 1278, 'Dorrie');

insert into Movie values (281, 'The Criminal', 1999);

insert into Movie values (282, 'The High Note', 2020);
insert into MovieStar values (1279, 'Eddie Izzard', 'genderfluid');
insert into StarsIn values (281, 1279, 'Peter Hume');
insert into StarsIn values (282, 1279, 'Dan Deakins');

insert into Movie values (283, 'The Glass Castle', 2017);
insert into MovieStar values (1280, 'Brigette Lundy-Paine', 'non-binary');
insert into StarsIn values (283, 1280, 'Maureen Walls');

insert into Movie values (284, 'Rosewood Lane', 2011);

insert into Movie values (285, 'The Sound', 2017);
insert into MovieStar values (1281, 'Rose McGowan', 'non-binary');
insert into StarsIn values (284, 1281, 'Sonny Blake');
insert into StarsIn values (285, 1281, 'Kelly Johansen');

insert into Movie values (286, 'Suicide Squad', 2016);

insert into Movie values (287, 'Justice League', 2017);
insert into MovieStar values (1282, 'Ezra Miller', 'genderfluid');
insert into StarsIn values (286, 1282, 'Barry Allen');
insert into StarsIn values (287, 1282, 'Barry Allen');

insert into Movie values (288, 'Escape Room: Tournament of Champions', 2021);
insert into MovieStar values (1283, 'Indya Moore', 'non-binary');
insert into StarsIn values (288, 1283, 'Brianna Collier');

insert into Movie values (289, 'XXX: Return of Xander Cage', 2017);

insert into Movie values (290, 'The Meg', 2018);
insert into MovieStar values (1284, 'Ruby Rose', 'genderfluid');
insert into StarsIn values (289, 1284, 'Adele Wolff');
insert into StarsIn values (290, 1284, 'Jaxx Herd');

insert into Movie values (291, 'Everything, Everything', 2017);
insert into MovieStar values (1285, 'Amandla Stenberg', 'non-binary');
insert into StarsIn values (291, 1285, 'Maddy Whittler');

insert into Movie values (292, 'Odd Thomas', 2013);
insert into MovieStar values (1286, 'Nico Tortorella', 'genderfluid');
insert into StarsIn values (292, 1286, 'Simon Varner');

insert into Movie values (293, 'Hard Feelings', 1982);
insert into MovieStar values (1287, 'Joanne Vannicola', 'non-binary');
insert into StarsIn values (293, 1287, 'Claudia Hergruder');

insert into Movie values (294, 'Flatliners', 2017);
insert into StarsIn values (294, 1275, 'Courtney Holmes');
