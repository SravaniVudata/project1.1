create database if not exists fuel_economy ;
use fuel_economy;
# fe2010 and fe2011 were inported using import wizard #
show tables;
select* from fe2010;
select* from fe2011;
alter table fe2010 add id int auto_increment  primary key ;
alter table fe2011 add id int auto_increment  primary key ;
alter table fe2010 add beta0 double, add beta1 double;
#to see the alter effects#
select* from fe2010 limit 10;
update fe2010 set beta1= -4.52, beta0= 50.56 where fe2010.id is not null;
#error has been observed as sql safe updates is active
# stop the sql safe updates 
set SQL_safe_updates = 0;
update fe2010 set beta1= -4.52, beta0= 50.56 where fe2010.id is not null;
alter table fe2011 add predict double;
update fe2011, fe2010
set fe2011.predict= fe2010.beta0+(fe2010.beta1*fe2011.engdispl) where fe2011.id=fe2010.id;
select* from fe2010;
select* from fe2011;