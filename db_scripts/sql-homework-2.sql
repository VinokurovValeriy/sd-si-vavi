use nc;

select * from nc_attributes
where object_type_id in (3,7)
order by attr_id desc;

select o.object_id as "order id",name as "order name"
from nc_objects o inner join nc_params p
on o.object_id=p.object_id
where attr_id = 4 and value like '100%';

select object_id as "object id",name as "object name"
from nc_objects  
where name like '074%';

select o.object_id as "object id",o.name as "object name",t.object_type_id as "object type id",t.name as "object type name"
from nc_objects o inner join nc_object_types t  
on o.object_type_id=t.object_type_id
where o.name like '074%';


