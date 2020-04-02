drop database nc; 
create database nc;
use nc;

create table nc_object_types(object_type_id int unsigned auto_increment primary key,
							name varchar(60) not null,
							description varchar(200));

create table nc_objects(object_id int unsigned auto_increment primary key,
						object_type_id int unsigned,
						name varchar(60) not null,
						description varchar(200),
						foreign key (object_type_id) references nc_object_types(object_type_id));    
 
 create table nc_attributes(attr_id int unsigned auto_increment primary key,
							object_type_id int unsigned,
							name varchar(60) not null,
							type int,
                            foreign key (object_type_id) references nc_object_types(object_type_id));

create table nc_list_values(list_value_id int unsigned auto_increment primary key,
							value varchar (60));

create table nc_references(object_id int unsigned,
						attr_id int unsigned,
						reference int unsigned,
						foreign key(object_id) references nc_objects(object_id),
						foreign key(attr_id) references nc_attributes(attr_id));

create table nc_params(object_id int unsigned,
						attr_id int unsigned,
						list_value_id int unsigned,
						value varchar(60),
						foreign key(object_id) references nc_objects(object_id),
						foreign key(attr_id) references nc_attributes(attr_id),
						foreign key(list_value_id) references nc_list_values(list_value_id));

insert into nc_object_types values(null, 'Internet Order Object Type', null),
								(null, 'Video Order Object Type', null),
								(null, 'Mobile Order Object Type', null),
								(null, 'Abstract Order Object Type', 'Abstract object type for all porduct orders'),
								(null, 'Internet Instance Object Types', null),
								(null, 'Video Instance Object Types', null),
								(null, 'Mobile Order Object Type', null),
								(null, 'Abstract Instance Object Types', 'Abstract object type for all porduct instances'),
								(null, 'Phone number', null);

insert into nc_objects values(null, 1, 'Internet Order #1', null),
							(null, 2, 'Video Order #1', null),
							(null, 2, 'Video Order #2', null),
							(null, 1, 'Internet Order #2', null),
							(null, 3, 'Mobile Order #1', null),
							(null, 9, '07454343676', 'Number in the system');

insert into nc_attributes values(null, 4, 'Due Date', 4),
						(null, 3, 'Phone Number', 9),
						(null, 1, 'Access Type', 6),
						(null, 1, 'Download Speed', 0),
						(null, 3, 'Service Type', 6),
						(null, 2, 'Suspend Reason', 0),
						(26, 6, 'Activated Period', 2),
						(27, 7, 'Activated Period', 2),
						(28, 8, 'Activated Period', 2),
						(29, 6, 'Product Price', 2),
						(30, 7, 'Product Price', 2),
						(31, 8, 'Product Price', 2),
						(32, 6, 'Order status', 2),
						(33, 7, 'Order status', 2),
						(34, 8, 'Order status', 2);

insert into  nc_list_values values(null, 'XDSL'),
								(null, 'GPON'),
								(null, 'Postpaid'),
								(null, 'Prepaid'),
								(29, 'Entering'),
								(30, 'Processing'),
								(31, 'Completed'),
								(32, 'Cancelled');

insert into nc_params values(1, 3, 2, null),
							(1, 4, null, '100 Mbps'),
							(2, 6, null, 'Device Stolen'),
							(3, 6, null, 'Tariff Change'),
							(4, 3, 1, null),
							(4, 4, null, '500 Mbps'),
							(5, 5, 3, null),
                            (1,26,null,5),
                            (1,29,null,35),
                            (2,27,null,5),
                            (2,30,null,35),
                            (3,27,null,4),
                            (3,30,null,44),
                            (4,26,null,3),
                            (4,29,null,57),
                            (5,28,null,3),
                            (5,31,null,60);
				
insert into nc_references values(5, 2, 6);
                                
show tables;
                                
select * from nc.nc_object_types;
select * from nc.nc_objects;
select * from nc.nc_attributes;
select * from nc.nc_list_values;
select * from nc.nc_params;
select * from nc.nc_references;     