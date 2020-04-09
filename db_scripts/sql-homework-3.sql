use nc;

select a.object_type_id 'Object Type ID',sum(p.value) 'Sum Value'
from nc_params p join nc_attributes a
on p.attr_id=a.attr_id
where p.attr_id in(29, 30, 31)
group by p.attr_id
having sum(p.value)>=60;

select o.object_id 'Order Id',o.name 'Order Name', min(p.value) 'Minimum Price'
from nc_params p join nc_objects o
on o.object_id=p.object_id
where p.attr_id in(29, 30, 31) and p.object_id in (1,4)
group by o.name;

select o.object_id 'Order Id',o.name 'Order Name', max(p.value) 'Maximum Period'
from nc_params p join nc_objects o
on o.object_id=p.object_id
where p.attr_id in(26, 27, 28) and p.object_id between 1 and 4
group by o.name;

select round(avg(p.value*(select p1.value 
from nc_params p1 join nc_objects o1
on o1.object_id=p1.object_id
where p1.attr_id between 29 and 31 and o1.object_id=o.object_id)),1) as 'Avr price of all orders'
from nc_params p join nc_objects o
on o.object_id=p.object_id
where p.attr_id between 26 and 28 ;

select p.value as 'Period',p1.value as 'Price', p.value*p1.value as 'Sum Price'
from nc_objects o ,nc_params p,nc_objects o1 join nc_params p1
where o.object_id=p.object_id and o1.object_id=p1.object_id
and p.attr_id between 26 and 28 and o.name like 'Internet Order #1' and p1.attr_id between 29 and 31 and o1.name like 'Internet Order #1' ;

select p.value as 'Period',p1.value as 'Price', p.value*p1.value as 'Sum Price'
from nc_objects o ,nc_params p,nc_objects o1 join nc_params p1
where o.object_id=p.object_id and o1.object_id=p1.object_id
and p.attr_id between 26 and 28 and o.name like 'Video Order #1' and p1.attr_id between 29 and 31 and o1.name like 'Video Order #1' ;

select sum(value)
from nc_objects o join nc_params p
on o.object_id=p.object_id
where attr_id between 29 and 31 and o.name like '%#1';

select 
case
when p.value = (select max(value) from nc_params where attr_id between 29 and 31)then 'The most expensive'
when p.value = (select min(value) from nc_params where attr_id between 29 and 31)then 'The cheapest'
else 'The other'
end as 'Result',p.value 'Product Price',o.object_id 'Order Id',o.name 'Order Name'
 from nc_objects o join nc_params p 
on o.object_id=p.object_id
where attr_id between 29 and 31;

select count(*) 'Counter',p.value 'Value',p.list_value_id 'List Value'
from nc_params p
group by
case
when p.list_value_id is not null then p.list_value_id
else p.value
end;

select * from nc_objects
order by
case 
when name not like '074%' then object_type_id
else description
end;












