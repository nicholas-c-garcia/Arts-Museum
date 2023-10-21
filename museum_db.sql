DROP DATABASE IF EXISTS MUSEUM;
CREATE DATABASE MUSEUM;
USE MUSEUM;

DROP TABLE IF EXISTS EXHIBITIONS;
CREATE TABLE EXHIBITIONS (
	Name		varchar(50),
	Start_Date	char(15),
	End_Date	char(15),

	PRIMARY KEY(Name)
                       );

DROP TABLE IF EXISTS ARTIST;
CREATE TABLE ARTIST (
	Name				varchar(50),
	Date_Born			char(15),
	Date_Died			char(15),
	Country_of_Origin	varchar(50),
	Epoch				varchar(50),
	Description			varchar(50),
	Main_Style			varchar(50),

	PRIMARY KEY(Name)
);
	
DROP TABLE IF EXISTS COLLECTIONS;
CREATE TABLE COLLECTIONS (
	Name			varchar(50),
	Street_Address	varchar(50),
    City			varchar(50),
    Country			varchar(50),
    Postal_Code		varchar(50),
	Type			varchar(50),
	Description		varchar(50),
	Phone_Number	char(15),
	Current_Contact	varchar(50),

	PRIMARY KEY(Name)
);

DROP TABLE IF EXISTS ART_OBJECTS;
CREATE TABLE ART_OBJECTS (
	Year				int,
	Description			varchar(50),
	Epoch				varchar(50),
	Artist				varchar(50),
	Id_no				int,
	Title				varchar(50),
	Country_or_Culture	varchar(50),
	Collection_Name 	varchar(50),
	Exhibit_Name  		varchar(50),

	PRIMARY KEY(Id_no),       
    FOREIGN KEY (Collection_Name) REFERENCES COLLECTIONS(Name),
    FOREIGN KEY (Exhibit_Name) REFERENCES EXHIBITIONS(Name)
);


DROP TABLE IF EXISTS SCULPTURE;
CREATE TABLE SCULPTURE (
	Sculpture_Id_no		int,
	Main_Style	varchar(50),
	Material	varchar(50),
	Height 		varchar(50),
	Weight 		varchar(50),

	PRIMARY KEY(Sculpture_Id_no),
	FOREIGN KEY (Sculpture_Id_no) REFERENCES ART_OBJECTS(Id_No)
);

DROP TABLE IF EXISTS OTHER;
CREATE TABLE OTHER (
	OId_no		int,
	Main_Style	varchar(50),
	Type		varchar(50),

	PRIMARY KEY(OId_no),
	FOREIGN KEY (OId_no) REFERENCES ART_OBJECTS(Id_No)
);

DROP TABLE IF EXISTS PAINTING;
CREATE TABLE PAINTING (
	Paint_Id_no	int,
	Style		varchar(50),
	Paint_Type	varchar(50),
	Drawn_on	varchar(50),

	PRIMARY KEY(Paint_Id_no),
	FOREIGN KEY (Paint_Id_no) REFERENCES ART_OBJECTS(Id_No)
);

DROP TABLE IF EXISTS STATUE;
CREATE TABLE STATUE (
	Statue_Id_no		int,
	Main_Style			varchar(50),
	Material			varchar(50),
	Height 				varchar(50),
	Weight 				varchar(50),

	PRIMARY KEY(Statue_Id_no),
	FOREIGN KEY (Statue_Id_no) REFERENCES ART_OBJECTS(Id_No)
);

DROP TABLE IF EXISTS BORROWED;
CREATE TABLE BORROWED (
	BId_no			int,
	Department		varchar(50),
	Date_Borrowed	char(15),
	Date_Returned	char(15),

	PRIMARY KEY(BId_no),
	FOREIGN KEY (BId_no) REFERENCES ART_OBJECTS(Id_No)
);

DROP TABLE IF EXISTS PERMANENT_COLLECTION;
CREATE TABLE PERMANENT_COLLECTION (
	Perm_Id_no		int,
	Cost			int,
	Status			varchar(20),	
	Date_Acquired	char(15),

	PRIMARY KEY(Perm_Id_no),
	FOREIGN KEY (Perm_Id_no) REFERENCES ART_OBJECTS(Id_No)
);



INSERT INTO ARTIST
VALUES ('Marcus Gheeraerts the Younger','1561-01-06','1636-01-
19','Belgium','Baroque','Realism Potrait','Still Life'),
 ('Hans Eworth','1520-11-01','1574-11-03','Belgium','Baroque','Allegorical 
Reflection','Still Life'),
 ('Hans Holbein the Younger','1497-01-01','1543-01-
08','Germany','Renaissance','Preserving History','Potraits'),
 ('Jean Antoine','1699-06-01','1781-05-03','Croatia','Renaissance','Nature 
and beauty','Landscape'),
('Sanek','1760-06-01','1859-05-
09','London','Bascillica','Pottery','Handcrafting'),
('Nivon','1769-09-01','186--01-
01','Macedonia','Ancient','Pottery','Handcrafting'),
('Simone Leigh','1996-05-01','2022-05-05','United 
States','Modern','History','Absract'),
('Adebunmi','2000-11-01','2022-08-03','United 
States','Modern','Arborignal','Sculpting'),
('kant','1770-05-01','1860-05-03','Estonia','Renaissance','Preserving 
Hisotry','Statues'),
('Picasso','1889-05-01','1950-09-
03','England','Renaissance','Abstract Expressionism','Self Potraits'),
('various artists','1769-06-01','1874-05-
03','Italy','Renaissance','Pottery','Sculpting'),
('Jamberone','1769-05-01','1851-05-
03','France','Renaissance','Preserving Hisotry','Potraits'),
('Unknown','1601-01-01','1800-01-
01','Slovakia','Ancient','Poterry','Sculpting'),
('romaine','1779-05-06','1883-05-
19','France','Renaissance','Abstract','Expressionism'),
('Jan Van','1669-07-07','1723-06-
18','Romania','Abstract','Encaustic','Expressionism'),
('Passe','1799-11-23','1886-07-
03','Slovakia','Renaissance','Pottery','Handcrafting'),
('Limosin','1589-09-22','1703-01-
01','Italy','Ancient','Pottery','Handcrafting'),
('Micheal Stittow','1448-01-01','1567-09-
09','Sweden','Renaissance','Realism Potrait','Still life');

INSERT INTO EXHIBITIONS
VALUES ('The Tudors','2022-10-10','2023-01-08'),
 ('Hear Me Now: The Black Potters of Old Edgefield','2022-09-09','2023-02-
05'),
 ('Cubism and the Trompe l’Oeil Tradition','2022-10-20','2023-01-22'),
('Louvre Themed Collection','2021-08-20','2023-01-16');

INSERT INTO COLLECTIONS
VALUES ('Departement des Objets','18 Sussex Blvd', 
NULL, 'France', NULL, 'Museum','Private Museum','789-777-123','Kaleb Antoine'),
 ('Departement des Antiquites','2258 Wellignton Street', 
NULL, 'Italy',  NULL, 'Museum','Private Museum collection','989-456-333','Luka Modric'),
('Service de lHistoire','19 Fargo', NULL, 'Slovakia', NULL, 'Private 
Collector','Collection of artefact organization','111-697-696','Sir Jacob III'),
 ('Departement des Peintures','Louvre Museum, Rue de Rivoli, 75001', 'Paris', 
'France', NULL, 'Museum','Federal Museum','189-189-001','John Van Parsa');

INSERT INTO ART_OBJECTS
VALUES (1537,'Potrait of King Henry VIII','Tudor','Hans Holbein the Younger',000001,'Henry VIII','Painting','Departement des Objets','The Tudors'),
(1514,'Potrait of Queen of France','Renaissance','Micheal Stittow',000002,'Mary Tudor','Painting','Departement des Antiquites','Hear Me Now: The Black Potters of Old Edgefield'),
(1554,'Potrait of Majesty Mary I','Renaissance','Hans Eworth',000003,'Mary I','Painting','Departement des Antiquites','The Tudors'),
(1597,'Potrait of Ellen Maurice','Elizabethan era','Marcus Gheeraerts the Younger',000004,'Ellen Maurice','Painting','Departement des Objets','Hear Me Now: The Black Potters of Old Edgefield'),
(1700,'Water Landscape','Georgian','Jean Antoine',000005,'La Chute','Painting','Departement des Antiquites','Louvre Themed Collection'),
(1850,'Mug with faces','Victorian','Sanek',000006,'Untitled','Sculpture','Service de lHistoire','Hear Me Now: The Black Potters of Old Edgefield'),
(1854,'Mug with faces 2','Victorian','Nivon',000007,'Untitled','Sculpture','Service de lHistoire','The Tudors'),
(2021,'Large Jug','modern','Simone Leigh',000008,'Large Jug','Sculpture', 'Departement des Objets','Louvre Themed Collection'),
(2021,'A memorabilia','modern','Adebunmi',000009,'K.S.','Sculpture','Departement des Antiquites','Hear Me Now: The Black Potters of Old Edgefield'),
(1850,'A metallic figurine','Victorian','kant',000010,'Vili','Statue','Service de lHistoire','The Tudors'),
(1914,'An abstract figure','Edwardian','Picasso',000011,'The Absinthe Glass','Statue','Departement des Peintures','The Tudors'),
(1850,'An artefact','Victorian','various artists',000012,'Circular mug','Statue', 'Departement des Objets','Hear Me Now: The Black Potters of Old Edgefield'),
(1850,'A metallic figurine','Victorian','Jamberone',000013,'White fragment','Statue','Departement des Antiquites','The Tudors'),
(1770,'Baroque style figure','Georgian','Unknown',000014,'Le sainte familie','Statue','Departement des Peintures','Cubism and the Trompe l’Oeil Tradition'),
(1800,'Tablet of wood','Victorian Era','romaine',000015,'Tableau','Other','Service de lHistoire','Louvre Themed Collection'),
(1700,'A fabric','Georgian','Jan Van',000016,'Shroud','Other', 'Departement des Objets','The Tudors'),
(1810,'A broken tablet','Victorian','Passe',000017,'Tablet','Other','Departement des Peintures','Cubism and the Trompe l’Oeil Tradition'),
(1690,'Painted plate','renaissance','Limosin',000018,'Renaissance Plate','Other','Service de lHistoire','Louvre Themed Collection'), 
(1700,'metallic figurine','Georgian','Unknown',000019,'untitled', 'Sculpture', 'Departement des Objets','Louvre Themed Collection'),
(1850,'Tapestry','Victorian','Unknown',000020,'untitled', 'Painting','Departement des Peintures','Cubism and the Trompe l’Oeil Tradition'),
(1700,'metallic figurine','Georgian','Unknown',000021,'untitled','Sculpture','Departement des Antiquites','The Tudors');

INSERT INTO PAINTING
VALUES (000001,'Realism','Oil','Canvas'),
 (000002,'Allegorical','Oil','Paper'),
(000003,'Realism','Encaustic','Wood'),
(000004,'Realism','Encaustic','Canvas'),
(000005,'Landscape','Oil','Paper');

INSERT INTO SCULPTURE
VALUES (000006,'Full Round','Stone','18 cm','389 grams'),
 (000007,'Full Round','Composite','23 cm','255 grams'),
(000008,'Carved','Wood','15 cm','109 grams'),
(000009,'Carved','Wood','11 cm','190 grams');

INSERT INTO STATUE
VALUES (000010,'Cast','Brozne','24 cm','600 grams'),
 (000012,'Carved','Stone','17 cm','290 grams'),
(000013,'Carved','Stone','15 cm','311 grams'),
(000019,'Cast','Bronze','18 cm','288 grams'),
(000014,'Carved','Stone','20 cm','200 grams');

INSERT INTO OTHER
VALUES (000015,'Tablet','Baroque'),
 (000020,'Painted Fabric','Abstract'),
(000021,'Plate','Renaissance'),
(000017,'Tablet','Abstract');

INSERT INTO PERMANENT_COLLECTION
VALUES (000001,1500000,'on loan','2022-10-10'),
 (000002,1900000,'on loan','2022-11-09'),
(000003,2500000,'on display','2022-10-10'),
(000004,1898000,'on loan','2022-10-10'),
(000006,49000,'stored','2022-09-09'),
 (000007,19000,'on display','2022-09-09'),
(000008,29000,'on loan','2022-09-21'),
(000009,29000,'on loan','2022-09-17'),
(000010,190000,'on loan','2022-09-09'),
(000012,190000,'on display','2022-09-09'),
(000013,190000,'on loan','2022-10-20'),
(000019,7950000,'on display','2022-10-20');

INSERT INTO BORROWED 
VALUES (000014,'Departement des Objets','2020-01-14','2020-08-24'),
(000015,'Departement des Antiquites','2020-02-12','2020-02-29'),
(000020,'Service de lHistoire','2020-03-10','2020-07-14'),
(000017,'Departement des Objets','2020-05-14','2021-05-14'),
(000021,'Departement des Objets','2020-09-28','2020-10-14'),
(000005,'Departement des Peintures','2020-11-27','2021-05-10');
 


drop role if exists read_access@localhost;
create ROLE read_access@localhost;
grant SELECT on museum.* to read_access@localhost;

drop user if exists admstr@localhost;
drop user if exists guest@localhost;

create user admstr@localhost identified with mysql_native_password by 'admin';
create user guest@localhost;


GRANT ALL PRIVILEGES ON *.* TO 'admstr'@'localhost' with grant option;
grant read_access@localhost to guest@localhost;

set default role all to admstr@localhost;
set default role all to guest@localhost;
-- 