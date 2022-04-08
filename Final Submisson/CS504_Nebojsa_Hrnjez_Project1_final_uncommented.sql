#CS504 Project 1 Part 3 SQL script
#This script is based on parts 1 and 2 of project 1

#This is the uncommented version of the code, a version with comments has also been submitted.
DROP SCHEMA nhrnjez;
CREATE SCHEMA nhrnjez;
USE nhrnjez;

CREATE TABLE Person (
    P_id VARCHAR(9) NOT NULL PRIMARY KEY,
    Name VARCHAR(45) NOT NULL,
    Phone BIGINT(10) NOT NULL,
    Street_Address VARCHAR(45) NOT NULL,
    City VARCHAR(45) NOT NULL,
    State VARCHAR(45) NOT NULL,
    Zip_Code INT(5) NOT NULL,
    Birth_Date DATE NOT NULL
);


CREATE TABLE Volunteer (

    id VARCHAR(9) NOT NULL PRIMARY KEY,
    V_skill VARCHAR(45),
    FOREIGN KEY (id)
        REFERENCES Person (P_id)
);

 
CREATE TABLE Employee (
    id VARCHAR(9) NOT NULL PRIMARY KEY,
    Date_Hired DATE NOT NULL,
    Job_Type CHAR(1) NOT NULL,
    CONSTRAINT UQ_Employee UNIQUE (id , Job_Type),
    CONSTRAINT Job_T_Employee CHECK (`Job_Type` IN ('N' , 'S', 'T')),
    FOREIGN KEY (id)
        REFERENCES Person (P_id)
);
 
CREATE TABLE Physician (
    id VARCHAR(9) NOT NULL PRIMARY KEY,
    Pager_no BIGINT(10),
    Specialty VARCHAR(45),
    FOREIGN KEY (id)
        REFERENCES Person (P_id)     
);
 
CREATE TABLE Patient (
    id VARCHAR(9) NOT NULL PRIMARY KEY,
    Contact_Date DATE,
    Pat_type CHAR(1) NOT NULL CHECK (Pat_type IN ('I' , 'O')),
    CONSTRAINT UQ_Patient UNIQUE (id , Pat_type),
    FOREIGN KEY (id)
        REFERENCES Person (P_id)
);
  
CREATE TABLE Nurse (
    id VARCHAR(9) NOT NULL PRIMARY KEY,
    Certificate VARCHAR(45),
    Job_Type CHAR(1) NOT NULL,
    CONSTRAINT CHK_Nurse CHECK (Job_Type = 'N'),
    FOREIGN KEY (id , Job_Type)
        REFERENCES Employee (id , Job_Type)
);
  
CREATE TABLE Staff (
    id VARCHAR(9) NOT NULL PRIMARY KEY,
    Job_Class VARCHAR(45),
    Job_Type CHAR(1) NOT NULL,
    CONSTRAINT CHK_Staff CHECK (Job_Type = 'S'),
    FOREIGN KEY (id , Job_Type)
        REFERENCES Employee (id , Job_Type)
);
  
CREATE TABLE Technician (
    id VARCHAR(9) NOT NULL PRIMARY KEY,
    Job_Type CHAR(1) NOT NULL,
    CONSTRAINT CHK_Tech CHECK (Job_Type = 'T'),
    FOREIGN KEY (id , Job_Type)
        REFERENCES Employee (id , Job_Type)
);
  
CREATE TABLE T_skill (
    id VARCHAR(9) NOT NULL,
    skill VARCHAR(45) NOT NULL,
    PRIMARY KEY (id , skill),
    FOREIGN KEY (id)
        REFERENCES Technician (id)
);
  
CREATE TABLE Labratory (
    Lab_Name VARCHAR(45) NOT NULL PRIMARY KEY,
    Location VARCHAR(45)
);
  
CREATE TABLE Works_in (
    id VARCHAR(9) NOT NULL,
    Lab_Name VARCHAR(45) NOT NULL,
    PRIMARY KEY (id , Lab_Name),
    FOREIGN KEY (id)
        REFERENCES Technician (id),
    FOREIGN KEY (Lab_Name)
        REFERENCES Labratory (Lab_Name)
);
  
CREATE TABLE Treats (
    Phys_id VARCHAR(9) NOT NULL,
    Pat_id VARCHAR(9) NOT NULL,
    PRIMARY KEY (Pat_id),
    FOREIGN KEY (Phys_id)
        REFERENCES Physician (id),
    FOREIGN KEY (Pat_id)
        REFERENCES Patient (id)
);
  
CREATE TABLE Inpatient (
    id VARCHAR(9) NOT NULL PRIMARY KEY,
    Date_admitted DATE,
    Pat_type CHAR(1) NOT NULL,
    CONSTRAINT CHK_Inpat CHECK (Pat_type = 'I'),
    FOREIGN KEY (id , Pat_type)
        REFERENCES Patient (id , Pat_type)
);
  
CREATE TABLE Outpatient (
    id VARCHAR(9) NOT NULL PRIMARY KEY,
    Pat_type CHAR(1) NOT NULL,
    CONSTRAINT CHK_Outpat CHECK (Pat_type = 'O'),
    FOREIGN KEY (id , Pat_type)
        REFERENCES Patient (id , Pat_type)
);
    
CREATE TABLE Scheduled_Visits (
    Out_id VARCHAR(9) NOT NULL,
    Visit_date DATE NOT NULL,
    Comments VARCHAR(200),
    PRIMARY KEY (Out_id , Visit_date),
    FOREIGN KEY (Out_id)
        REFERENCES Outpatient (id)
);
 
  
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
(083500835,
'Garland Smith',
 2129935594,
'1179 Rosewood Lane',
'New York',
'NY',
10013,
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
(073240732,
'James Laury',
7167946889,
'864 Bottom Lane',
'Buffalo',
'NY',
14202,
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
(458874588,
'Daphne Perez',
7138071820,
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
    (926056558,'Alan Silvers  ',9261656529,'671 Hillside Dr','Arlington','VA',22240,'1987-12-30'),
    (123454321,'Tom Brady ',9053804195,'7744 Yvette Cr','Alexandria','VA',22305,'1995-04-11'),
    (246818642,'Greg Jennings',9053713820,'4416 Keswick Dr','Alexandria','VA',22305,'1997-05-12'),
    (345612352,'Peyton Manning',9053249304,'2412 Ridge Rd','Alexandria','VA',22305,'1966-07-16'),
    (777432341,'Lamar Jackson',9057604123,'2934 Landover Rd','Alexandira','VA',22305,'1974-11-11'),
    (653242310,'Lisa Leslie',9058204145,'8203 Keswick Dr','Alexandria','VA',22305,'1983-9-23');
  
  INSERT INTO `nhrnjez`.`Employee`
(`id`,
`Date_Hired`,
`Job_Type`)
VALUES
   (543513291,'2005-03-01','N'),
    (119345502,'2006-10-24','N'),
    (367762949,'2021-09-19','N'),
    (337745025,'2014-05-21','T'),
    (908317676,'2001-05-06','T'),
    (954467240,'1999-04-02','S'),
    (246943885,'2011-12-07','S'),
    (123454321,'2018-05-11','S'),
    (246818642,'2019-06-12','S'),
    (345612352,'1995-02-13','S'),
    (777432341,'2001-08-18','S'),
    (653242310,'2011-07-22','S');
    
INSERT INTO `nhrnjez`.`Volunteer`
(`id`,
`V_skill`)
VALUES
    (465094974,'Cleaning'),
    (583496502,'Cleaning'),
    (115749468,'Meal Prep'),
    (146548068,'Meal Prep'),
    (694663975,'Cleaning'),
    (335143000,'Emotional Support'),
    (677065426,'Emotional Support'),
    (819784948,'Stocker'),
    (926056558,'Stocker');

INSERT INTO `nhrnjez`.`Physician`
(`id`,
`Pager_no`,
`Specialty`)
VALUES
    (083500835,9153802524,'CARD'),
    (263807464,7436142749,'ENT'),
    (482676201,1792319575,'CARD'),
    (652570555,8762288192,'GM'),
    (269835008,9925409387,'GM'),
    (886576419,5199368061,'ENT'),
    (650331123,2863162907,'CARD');
  
   
INSERT INTO `nhrnjez`.`Patient`
(`id`,
`Contact_Date`,
`Pat_type`)
VALUES
    (537282389,'2018-05-30','I'),
    (385222972,'2013-10-11','I'),
    (317272399,'2008-10-25','I'),
    (232656000,'2007-03-05','O'),
    (470553224,'2011-07-05','O'),
    (335143000,'2010-08-21','I'),
    (677065426,'2014-09-03','O'),
    (819784948,'2016-08-11','O'),
    (926056558,'2018-10-04','I'),
    (594921238,'2009-07-14','I'),
    (920520953,'2015-09-11','I'),
    (876118359,'2007-06-03','O');

INSERT INTO `nhrnjez`.`Nurse`
(`id`,`Job_Type`)
SELECT `Employee`.`id`, `Employee`.`Job_Type`
FROM `Employee`
WHERE `Employee`.`Job_Type` = 'N';
    
UPDATE `nhrnjez`.`Nurse`
SET `Certificate` = 'RN'
WHERE `id` = 543513291;

UPDATE `nhrnjez`.`Nurse`
SET `Certificate` = 'RN'
WHERE `id` = 119345502;

UPDATE `nhrnjez`.`Nurse`
SET `Certificate` = 'LPN'
WHERE `id` = 367762949;
  
INSERT INTO `nhrnjez`.`Staff`
(`id`,`Job_Class`,`Job_Type`)
VALUES
	(954467240,'Admin','S'),
    (246943885,'Admin','S'),
    (123454321,'Admin','S'),
    (246818642,'Janitor','S'),
    (345612352,'Janitor','S'),
    (777432341,'Janitor','S'),
    (653242310,'Admin','S');
    
INSERT INTO `nhrnjez`.`Technician`
(`id`,`Job_Type`)
SELECT `Employee`.`id`,`Employee`.`Job_Type`
FROM `Employee`
WHERE `Employee`.`Job_Type` = 'T';

INSERT INTO `nhrnjez`.`T_skill`
(`id`,`skill`)
VALUES
	(337745025, 'IT'),
    (337745025, 'Repair'),
    (337745025, 'Plumbing'),
    (908317676, 'Electrical'),
    (908317676, 'HVAC'),
    (908317676, 'Repair');

INSERT INTO `nhrnjez`.`Labratory`
(`Lab_Name`,`Location`)
VALUES
	('Willis Lab', 'Arlington'),
    ('Crawford Lab', 'Alexandria');
    
INSERT INTO `nhrnjez`.`Works_in`
(`id`,`Lab_Name`)
VALUE
	(337745025,'Willis Lab'),
    (337745025,'Crawford Lab'),
    (908317676, 'Willis Lab'),
    (908317676, 'Crawford Lab');
    
INSERT INTO `nhrnjez`.`Inpatient`
(`id`,`Date_admitted`,`Pat_type`)
VALUE
	(537282389,'2018-06-04','I'),
    (385222972,'2013-10-16','I'),
    (317272399,'2008-10-26','I'),
    (335143000,'2010-08-24','I'),
    (926056558,'2018-10-09','I'),
    (594921238,'2009-07-17','I'),
    (920520953,'2015-09-21','I');
    
INSERT INTO `nhrnjez`.`Outpatient`
(`id`,`Pat_type`)
SELECT `Patient`.`id`,`Patient`.`Pat_type`
FROM `Patient`
WHERE `Patient`.`Pat_type` = 'O';

INSERT INTO `nhrnjez`.`Scheduled_Visits`
(`Out_id`, `Visit_date`,`Comments`)
VALUE
	(232656000,'2007-05-05','Initial post-op visit, wound looks inflammed, patient to come back in 2 weeks'),
    (470553224,'2011-09-13','Patient just recently moved to the area, final check up for heart surgery, all good, no further visits needed.'),
	(677065426,'2014-11-5','Initial post-op visit, patient to come back in 1 year.'),
    (819784948,'2016-08-11','No comments, all good'),
	(876118359,'2007-06-03','No comments, all good'),
    (232656000,'2007-05-19','2nd post-op visit, wound looks much better, no further visits needed'),
    (677065426,'2015-11-12','One year post-op visit, all vitals good');
    
INSERT INTO `nhrnjez`.`Treats`
(`Phys_id`,`Pat_id`)
VALUES
	(083500835,537282389),
    (083500835,385222972),
    (083500835,317272399),
    (083500835,232656000),
    (482676201,470553224),
    (482676201,335143000),
    (482676201,677065426),
    (652570555,819784948),
    (652570555,926056558),
    (886576419,594921238),
    (886576419,920520953),
    (886576419,876118359);
    
#Part 3 Query 1: Find the hire dates of all nurses who have an RN certificate
SELECT Employee.Date_Hired
FROM Employee, Nurse
WHERE Nurse.Certificate = 'RN' AND Nurse.id = Employee.id;

#Part 3 Query 2: Find the zip codes of all physicians who are specialized in ENT 
SELECT DISTINCT Person.Zip_Code
FROM Person, Physician
WHERE Physician.Specialty = 'ENT' AND Physician.id = Person.P_id;

#Part 3 Query 3: Find the names of all patients who are also volunteers
SELECT DISTINCT Person.Name
FROM Person, Patient, Volunteer
WHERE Person.P_id IN 
	(SELECT Patient.id
    FROM Patient, Volunteer
    WHERE Patient.id = Volunteer.id);

#Part 3 Query 4: Find the total number of patients that Dr.Smith is responsible for. 
SELECT count(*) 
FROM 
(SELECT Treats.Phys_id 
FROM Treats
WHERE Treats.Phys_id IN 
	(SELECT Physician.id 
    FROM Person, Physician
    WHERE Person.Name LIKE '%Smith%' AND Person.P_id = Physician.id)) x;
    
#Part 3 Query 5: For each jobclass in staff, find the IDs of the youngest staff memebers belonging to this class.
SELECT DISTINCT Staff.id,Staff.Job_Class 
FROM Person, Staff
WHERE Staff.id = Person.P_id AND Person.Birth_Date IN 
(SELECT MAX(Person.Birth_Date) 
FROM Staff,Person
WHERE Staff.id = Person.P_id
GROUP BY Staff.Job_Class);

#Part 3 Query 6: Find the pager# of each physician who has no been responsible for any patient yet.
SELECT DISTINCT Physician.Pager_no 
FROM Physician, Treats
WHERE NOT EXISTS 
	(SELECT *
	FROM Treats
    WHERE Physician.id = Treats.Phys_id);
					




    

    


  
  
  
  
  
  
  
  
  

