CREATE TABLE Person(
P_id VARCHAR(9) NOT NULL PRIMARY KEY,
Name VARCHAR(45) NOT NULL,
Phone BIGINT(10) NOT NULL,
Street_Address VARCHAR(45) NOT NULL,
City VARCHAR(45) NOT NULL,
State VARCHAR(45) NOT NULL,
Zip_Code INT(5) NOT NULL,
Birth_Date DATE NOT NULL);

CREATE TABLE Volunteer(
id VARCHAR(9) NOT NULL PRIMARY KEY,
V_skill VARCHAR(9),
 FOREIGN KEY (id) references Person(P_id));
 
 CREATE TABLE Employee(
 id VARCHAR(9) NOT NULL PRIMARY KEY,
 Date_Hired DATE NOT NULL,
 Job_Type CHAR(1) NOT NULL,
 Birth_Date DATE NOT NULL,
 CONSTRAINT UQ_Employee UNIQUE (id, Job_Type),
 CONSTRAINT Date_H_Employee CHECK(`Date_Hired` >= DATE_ADD(`Person`.`Birth_Date`, INTERVAL 18 YEAR)),
 CONSTRAINT Job_T_Employee CHECK(`Job_Type` IN ('N','S','T')),
 FOREIGN KEY (id) references Person(P_id));
 
 CREATE TABLE Physician(
 id VARCHAR(9) NOT NULL PRIMARY KEY,
 Pager_no INT(9),
 Specialty VARCHAR(45),
 FOREIGN KEY (id) references Person(P_id));
 
 CREATE TABLE Patient(
  id VARCHAR(9) NOT NULL PRIMARY KEY,
  Contact_Date DATE,
  Pat_type CHAR(1) NOT NULL CHECK(Pat_type IN ('I','O')),
  CONSTRAINT UQ_Patient UNIQUE (id, Pat_type),
  FOREIGN KEY (id) references Person(P_id));
  
  CREATE TABLE Nurse(
  id VARCHAR(9) NOT NULL PRIMARY KEY,
  Certificate VARCHAR(45),
  Job_Type CHAR(1) NOT NULL,
  CONSTRAINT CHK_Nurse CHECK (Job_Type = 'N'),
  FOREIGN KEY (id, Job_Type) references Employee(id, Job_Type));
  
  CREATE TABLE Staff(
  id VARCHAR(9) NOT NULL PRIMARY KEY,
  Job_Class VARCHAR(45),
  Job_Type CHAR(1) NOT NULL,
  CONSTRAINT CHK_Staff CHECK (Job_Type = 'S'),
  FOREIGN KEY (id, Job_Type) references Employee(id, Job_Type));
  
  CREATE TABLE Technician(
  id VARCHAR(9) NOT NULL PRIMARY KEY,
  Job_Type CHAR(1) NOT NULL,
  CONSTRAINT CHK_Tech CHECK (Job_Type = 'T'),
  FOREIGN KEY (id, Job_Type) references Employee(id, Job_Type));
  
  CREATE TABLE T_skill(
  id VARCHAR(9) NOT NULL,
  skill VARCHAR(45) NOT NULL,
  PRIMARY KEY (id, skill),
  FOREIGN KEY (id) references Technician(id));
  
  CREATE TABLE Labratory(
  Lab_Name VARCHAR(45) NOT NULL PRIMARY KEY,
  Location VARCHAR(45));
  
  CREATE TABLE Works_in(
  id VARCHAR(9) NOT NULL,
  Lab_Name VARCHAR(45) NOT NULL,
  PRIMARY KEY (id, Lab_Name),
  FOREIGN KEY (id) references Technician(id),
  FOREIGN KEY (Lab_Name) references Labratory(Lab_Name));
  
  CREATE TABLE Treats(
   Phys_id VARCHAR(9) NOT NULL,
   Pat_id VARCHAR(9) NOT NULL,
  PRIMARY KEY (Phys_id, Pat_id),
  FOREIGN KEY (Phys_id) references Physician(id),
  FOREIGN KEY (Pat_id) references Patient(id));
  
  CREATE TABLE Inpatient(
  id VARCHAR(9) NOT NULL PRIMARY KEY,
  Date_admitted DATE,
  Pat_type CHAR(1) NOT NULL,
  CONSTRAINT CHK_Inpat CHECK (Pat_type = 'I'),
  FOREIGN KEY (id, Pat_type) references Patient(id, Pat_type));
  
   CREATE TABLE Outpatient(
  id VARCHAR(9) NOT NULL PRIMARY KEY,
  Pat_type CHAR(1) NOT NULL,
  CONSTRAINT CHK_Outpat CHECK (Pat_type = 'O'),
  FOREIGN KEY (id, Pat_type) references Patient(id, Pat_type));
  
  CREATE TABLE Visits(
  Date DATE PRIMARY KEY,
  Comments VARCHAR(200));
  
  CREATE TABLE Scheduled(
  Out_id VARCHAR(9) NOT NULL,
  Visit_date DATE NOT NULL,
  PRIMARY KEY (Out_id, Visit_date),
  FOREIGN KEY (Out_id) references Outpatient(id),
  FOREIGN KEY (Visit_date) references Visits(Date));
  
  INSERT INTO `nhrnjez`.`Person`
(`P_id`,
`Name`,
`Phone`,
`Street_Address`,
`City`,
`State`,
`Zip_Code`,
`Birth_Date`)
VALUES
('083500835',
'Garland Fryer',
'2129935594',
'1179 Rosewood Lane',
'New York',
'NY',
'10013',
'1951-08-29');

INSERT INTO `nhrnjez`.`Person`
(`P_id`,
`Name`,
`Phone`,
`Street_Address`,
`City`,
`State`,
`Zip_Code`,
`Birth_Date`)
VALUES
('073240732',
'James Laury',
'7167946889',
'864 Bottom Lane',
'Buffalo',
'NY',
'14202',
'1949-12-24');

INSERT INTO `nhrnjez`.`Person`
(`P_id`,
`Name`,
`Phone`,
`Street_Address`,
`City`,
`State`,
`Zip_Code`,
`Birth_Date`)
VALUES
('458874588',
'Daphne Perez',
'7138071820',
'4426 Michael Street',
'Houston',
'TX',
'77006',
'1979-08-23');


INSERT INTO `nhrnjez`.`Person`
(`P_id`,
`Name`,
`Phone`,
`Street_Address`,
`City`,
`State`,
`Zip_Code`,
`Birth_date`)
 VALUES
    (543513291,'Johnetta Stephan  ',3296846364,'331 South Pine Ave','Annandale','VA',22003,'1984-04-14'),
    (119345502,'Hyman Luciano  ',3133528363,'2 Steam St','Herndon','VA',20171,'1985-06-04'),
    (367762949,'Dixie Gil  ',4108625001,'208 Hilldale','Lane Gore','VA',22637,'1992-03-04'),
    (337745025,'Camellia Jerome  ',4840455177,'4 Dew Dr','Haymarket','VA',20169,'1995-04-07'),
    (908317676,'Jody Lincoln  ',9551514226,'8535 Wintergreen St','Blacksburg','VA',24062,'1972-01-31'),
    (954467240,'Wilfred Miguel  ',7218133471,'832 Branch Drive','Columbia','VA',23038,'1975-09-29'),
    (246943885,'Tessa Sanford  ',2136573906,'9375 Lawn Street','Mc Lean','VA',22106,'1982-09-24'),
    (594921238,'Dara Sturtevant  ',7571077024,'7067 West Cherry St','Richmond','VA',23222,'1978-07-22'),
    (920520953,'Brittany Koester  ',6628519351,'67 4th Lane','Fieldale','VA',24089,'1997-09-10'),
    (876118359,'Trudie Armwood  ',1799390936,'642 Great Street','Virgilina','VA',24598,'1990-11-13'),
    (263807464,'Angelica Bill  ',1734511922,'62 Durham Street','Gasburg','VA',23857,'1980-01-30'),
    (482676201,'Elanor Swinehart  ',3110094979,'60 East San Carlos Rd','Radford','VA',24141,'1975-10-03'),
    (652570555,'Lance Dampier  ',5090795222,'8314 Boulder Street','Bristol','VA',24202,'1999-02-26'),
    (269835008,'Dorotha Stthomas  ',2944673542,'88 Ridgewood St','Bowling Green','VA',22427,'1972-05-20'),
    (886576419,'Octavio Zilnicki  ',3793859093,'7 Pheasant St','Sandy Level','VA',24161,'1994-06-10'),
    (650331123,'Jennifer Wilborn  ',5839153317,'628 Ohio St','Arlington','VA',22203,'1989-05-20'),
    (537282389,'Euna Ohagan  ',1974626940,'8749 Trout Ave','Jetersville','VA',23083,'1964-06-13'),
    (385222972,'Glendora Hilger  ',4183152145,'348 Courtland Drive','Manquin','VA',23106,'1988-10-09'),
    (317272399,'Lakeesha Ravenell  ',4111075830,'16 West Creekside Rd','Schuyler','VA',22969,'1995-02-21'),
    (232656000,'Janett Kirklin  ',5569894104,'717 Market St','Goodview','VA',24095,'1967-08-12'),
    (470553224,'Anastacia Hodapp  ',6012667006,'642 Sycamore Ave','Center Cross','VA',22437,'1990-07-08'),
    (465094974,'Benedict Midkiff  ',1231618777,'452 Lilac Street','Richmond','VA',23226,'1999-09-08'),
    (583496502,'Pura Nevarez  ',8527792718,'57 Court St','Fort Belvoir','VA',22060,'1989-03-28'),
    (115749468,'Rosendo Nova  ',7023095528,'519 Newbridge Rd','Doran','VA',24612,'1986-09-19'),
    (146548068,'Myrtice Empey  ',6088631835,'57 Bellow Avenue','Stephenson','VA',22656,'1985-09-17'),
    (694663975,'Jeanne Bielecki  ',9505814445,'352 Annadale Street','Ophelia','VA',22530,'1996-08-03'),
    (335143000,'Alix Ferguson  ',7953934662,'8333 W Seacoast S','Doswell','VA',23047,'1994-04-29'),
    (677065426,'Duane Taylor  ',2377604381,'343 W Belmont Dr','Waverly','VA',23890,'1989-01-14'),
    (819784948,'Nadene Trojan  ',3250919509,'9163 East Manchester Rd','Virginia Beach','VA',23464,'1993-08-18'),
    (926056558,'Alan Silvers  ',9261656529,'671 Hillside Dr','Arlington','VA',22240,'1987-12-30');
  
  INSERT INTO `nhrnjez`.`Employee`
(`id`,
`Date_Hired`,
`Job_Type`,
`Birth_Date`)
VALUES
   (543513291,'2005-03-01','N','1984-04-14'),
    (119345502,'2006-10-24','N','1985-06-04'),
    (367762949,'2021-09-19','N','1992-03-04'),
    (337745025,'2014-05-21','T','1995-04-07'),
    (908317676,'2001-05-06','T','1972-01-31'),
    (954467240,'1999-04-02','S','1975-09-29'),
    (246943885,'2011-12-07','S','1982-09-24');

  
  
  
  
  
  
  
  
  
  
  

