show tables;

select * from art_objects;

select *
from borrowed as b
order by b.date_borrowed desc;

select ao.id_no, ao.title, ao.description, ao.exhibit_name
from art_objects as ao
where ao.exhibit_name = (select e.name from exhibitions as e where e.start_date = '2022-10-20');

select ao.id_no, ao.title, e.name, e.start_date, e.end_date
from (art_objects as ao inner join exhibitions as e on ao.exhibit_name = e.name);