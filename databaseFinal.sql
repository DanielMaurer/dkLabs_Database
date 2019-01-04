/* This database will keep track of the various members of DK Labs, a Research Group from Lewis University,
* when it comes to their work schedule as well as tracking the instruments and their status in the lab. 
*/

CREATE DATABASE dkLabs;

USE dkLabs;

CREATE TABLE member(memberID INT PRIMARY KEY, fName VARCHAR(15), lName VARCHAR(25), project VARCHAR(50));

CREATE TABLE log(logID INT PRIMARY KEY, useDate DATE NOT NULL, startTime TIME, endTime TIME, memberID INT, instrumentID INT);

CREATE TABLE instrument(instrumentID INT PRIMARY KEY, insName VARCHAR(20), purpose VARCHAR(75), inUse BOOLEAN);

CREATE TABLE work(workID INT PRIMARY KEY AUTO_INCREMENT, timeIn TIME, timeOut TIME, wDate DATE, goal VARCHAR(200), memberID INT);

ALTER TABLE log ADD CONSTRAINT FOREIGN KEY log_fk_member(memberID) REFERENCES member(memberID) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE log ADD CONSTRAINT FOREIGN KEY log_fk_instrument(instrumentID) REFERENCES instrument(instrumentID) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE work ADD CONSTRAINT FOREIGN KEY work_fk_member(memberID) REFERENCES member(memberID) ON UPDATE CASCADE ON DELETE RESTRICT;

CREATE INDEX whole_name ON member(fName, lName);
CREATE INDEX time_of_use ON log(startTime, endTime);
CREATE INDEX in_use ON instrument(inUse);
CREATE INDEX work_date ON work(wDate);

INSERT INTO member VALUES (0001,'Danny','Maurer','Aviation'),
(0002,	'Alana','Dunne',	'Microbial Fuel Cells'),
(0003,	'Maria','Salinas',	'CMP'),
(0004,	'Kasey','Kane',	'CMP'),
(0005,	'Alexandria','Lanning',	'Hydrogel'),
(0006,	'Costa',	'Panayiotides',	'Hydrogel'),
(0007,	'Nicole', 	'Yuede',	'Microbial Fuel Cells'),
(0008,	'Rose',	'McDonough',	'Water Filtration'),
(0009,	'Samuel',	'Baker',	'Water Filtration'),
(0010,	'Tommy',	'Beckmann',	'Antimicrobial Materials'),
(0011,	'Carly',	'Graverson',	'CMP'),
(0012,	'Cynthia',	'Saucedo',	'CMP'),
(0013,	'Matt',	'Grimm',	'AME'),
(0014,	'Hafsa',	'Khan',	'Microbial Fuel Cells'),
(0015,	'Madison',	'Hill',	'CMP'),
(0016,	'Abigail', 	'Linhart',	'Hydrogel'),
(0017,	'Heather',	'Lange',	'Hydrogel'),
(0018,	'Steven',	'Boetscher',	'Microbial Fuel Cells'),
(0019,	'Tala', 	'Zubi', 	'CMP'),
(0020,	'Jackie',	'Pezan',	'Water Filtration/Hydrogel'),
(0021,	'Henri',	'Lam',	'Aviation'),
(0022,	'Fiona',	'Byrne',	'Water Filtration'),
(0023,	'Katie',	'Wortman',	'CMP'),
(0024,	'Carolyn',	'Werr',	'Hydrogel');

INSERT INTO instrument VALUES (1000,	'Creality 3D Printer',	'Print 3D objects using PLA filament',	FALSE),
(1100,	'RedTide','Measure UV-VIS absorbance spectra',	FALSE),
(1200,	'InstaPot','Sterilize glassware and solutions',	FALSE),
(1300,	'Multimeter','Measure voltage and current generated in MFCs',	FALSE),
(1400,	'Optical Tweezer','Film viability studies, single cell viability studies',	FALSE),
(1500,	'Syringe Pump','Inject liquids mechanically to reduce variation',	FALSE),
(1600,	'Atomic Force Microscope','Measure surface topography with nanometer resolution, generate force distance curves',	FALSE),
(1700,	'Incubator','Remain constant temperature (used for culturing bacteria',	FALSE),
(1800,	'Centrifuge','Used for the separation liquids and solids based on density',	FALSE),
(1900,	'Keithley',	'Measure current generated across material using applied potential',	FALSE),
(2000,	'EQCN', 'Measures adsorption/desorption', 	FALSE),
(2100,	'Echem/Potentiostat','measures the voltage difference between a working and a reference electrode',	FALSE),
(2200,	'Friction Polisher','Determine the coefficient of friction between a pad and substrate during polishing',	FALSE),
(2300,	'Fluorescence Microscope','Fluoresce particles on a particular surface in order to capture an image of their size and number',	FALSE),
(2400,	'Photoreactor',	'Irradiate a sample with UV light over an extended period of time',	FALSE),
(2500,	'Echem/Potentiostat','Measure induced redox reactions and electron transfer through a potential sweep',	FALSE),
(2600,	'Fluorimeter','Measure fluorescent intensity of a given sample',	FALSE),
(2700,	'Force Sensor',	'Measure the tensile strength of a material',	FALSE),
(2800,	'IR','Measure the vibrational motions of a molecule to determine functional groups',	FALSE),
(2900,	'Persee UV/Vis spectrometer','Measure the absorbance spectra of a given sample',	FALSE),
(3000,	'Reflectometer','Film thickness measurements', 	FALSE),
(3100,	'Malvern','Particle size and zeta potential', 	FALSE);

INSERT INTO log VALUES (100000,'12/1/18','9:00','13:00',	0001	,	1000),
(100001	,	'12/2/18'	,	'10:00'	,	'14:00'	,	0013	,	2400),
(100002	,	'12/3/18'	,	'11:00'	,	'15:00'	,	0007	,	1700),
(100003	,	'12/4/18'	,	'12:00'	,	'16:00'	,	0022	,	2100),
(100004	,	'12/5/18'	,	'13:00'	,	'17:00'	,	0011	,	3000),
(100005	,	'12/6/18'	,	'14:00'	,	'18:00'	,	0016	,	1200),
(100006	,	'12/7/18'	,	'15:00'	,	'19:00'	,	0024	,	2700);

INSERT INTO work(timeIn, timeOut, wDate, goal, memberID) VALUES ('10:00', '12:00', '10/5/18', 'Design cell holder for blocking efficiency testing', 0001),
('6:00', '15:00', '11/15/18', 'Look into the viability of using new substances', 0007),
('5:00', '16:00', '12/8/18', 'See if adding silver nano-particles helps kill time', 0010);

CREATE USER 'dannymaurer'@'localhost'  identified by 'databasefinal';
GRANT SELECT, INSERT, UPDATE, DELETE on dkLabs.* TO 'dannymaurer'@'localhost';







