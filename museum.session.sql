use museum;

-- Query 1 Show all tables and explain how they are related to one another (keys, triggers, etc.)
show tables;
/*
Exhibitions
	No Foreign Keys
    Primary Key, Name, is referenced by Art_Object attribute Exhibit_Name
    
Collections
	No Foreign Keys
    Primary Key, Name, is referenced by Art_Object attribute Collection_Name
    
Artist
	No Foreign Keys
    Primary Key, Name
    No tables in the database reference artist

Art_Objects
	Parent table to Painting, Sculpture, Statue, Other, Borrowed, and Permanent_Collection
    Foreign Keys Collection_Name, and Exhibit_Name reference the primary keys of Collections, and Exhibitions respectively
    
Painting
	Child Table to Art_Objects
	Primary Key, Painting_id_no
    Foreign Key, Painting_id_no references Art_Objects primary key
    
Sculpture
	Child Table to Art_Objects
	Primary Key, Sculpture_id_no
    Foreign Key, Sculpture_id_no references Art_Objects primary key
    
Statue
	Child Table to Art_Objects
	Primary Key, Statue_id_no
    Foreign Key, Statue_id_no references Art_Objects primary key
    
Other
	Child Table to Art_Objects
	Primary Key, Oid_no
    Foreign Key, Oid_no references Art_Objects primary key
    
Borrowed
	Child Table to Art_Objects
	Primary Key, BId_no
    Foreign Key, BId_no references Art_Objects primary key
    
PERMANENT_COLLECTION
	Child Table to Art_Objects
	Primary Key, Perm_Id_no
    Foreign Key, Perm_Id_no references Art_Objects primary key
*/

-- Query 2 A basic retrieval query
select *
from art_objects;

-- Query 3 A retrieval query with ordered results
select *
from borrowed as b
order by b.date_borrowed desc;

-- Query 4 A nested retrieval query
select ao.id_no, ao.title, ao.description, ao.exhibit_name
from art_objects as ao
where ao.exhibit_name = (select e.name from exhibitions as e where e.start_date = '2022-10-20');

-- Query 5 A retrieval query using joined tables
select ao.id_no, ao.title, e.name, e.start_date, e.end_date
from (art_objects as ao inner join exhibitions as e on ao.exhibit_name = e.name);

-- Query 6 An update operation with any necessary triggers
drop trigger if exists death_update;
create trigger death_update
before update on artist
for each row
set new.date_died = 
if ( new.date_died < (select NOW()), new.date_died, old.date_died);

update artist
set date_died = '2020-3-15'
where name = 'Hans Eworth';

-- Query 7 A deletion operation with any necessary triggers
drop trigger if exists delete_collection;
create trigger delete_collection
before delete on collections
for each row
	update art_objects
	set collection_name = null
    where collection_name = old.name;

delete from collections
where name = 'Departement des Peintures';

