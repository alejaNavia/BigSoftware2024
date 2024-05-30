create database BD_BigStation
use BD_BigStation

create table tbl_usuarios(
constrasena varchar(255) primary key not null,
nombreU varchar(40) not null,
email varchar(60) not null
)

select * from tbl_usuarios 