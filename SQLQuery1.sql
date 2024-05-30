Create database BD_Citas
use BD_Citas

Create table tbl_medicos(
cedulaM varchar(10) primary key not null,
nombreM varchar(40) not null,
email varchar(60) not null,
especializacion varchar(40))

Create table tbl_pacientes(
cedulaP varchar(10) primary key not null,
nombreP varchar(40) not null,
email varchar(60) not null,
eps varchar(40) not null)

Create table tbl_citas(
idCita int identity primary key,
fechaCita Date not null,
horaCita Time not null,
cedulaM varchar(10) not null,
cedulaP varchar(10) not null,
valorCita int not null,
foreign key(cedulaM) references tbl_Medicos(cedulaM),
foreign key(cedulaP) references tbl_pacientes(cedulaP));

Create table tbl_usuario(
idusuario int identity primary key,
email varchar(60) not null,
contrasena varchar(255) not null)
go
---Procedimientos Almacenados
Create procedure SP_Pacientes_Index
as 
begin
 Select * from dbo.tbl_pacientes
end
Select * from tbl_pacientes
go
---Create
Create procedure SP_Pacientes_Create
(@CedulaP varchar(10), @NombreP varchar(40),
@email varchar(60), @eps varchar(40))
as
begin
 Insert into dbo.tbl_pacientes values(@CedulaP, @NombreP, @email,@eps)
end
Select Scope_identity()
go
---Update
Create procedure SP_Pacientes_Update
(@CedulaP varchar(10), @NombreP varchar(40),
@email varchar(60), @eps varchar(40))
as
begin
 Update dbo.tbl_pacientes set nombreP=@NombreP, email=@email, eps=@eps
 where cedulaP=@CedulaP
 Select Scope_identity()
end
go
---Delete
Create procedure SP_Pacientes_Delete
(@CedulaP varchar(10))
as
begin
 Delete from dbo.tbl_pacientes where cedulaP=@CedulaP
 Select Scope_identity()
end
go
--- Read
Create procedure SP_Pacientes_Read
(@CedulaP varchar(10))
as
begin
 Select * from dbo.tbl_pacientes where cedulaP=@CedulaP
end

insert into tbl_pacientes values('1032780000','Pedro Pablo Villa','ppvilla@gmail.com','Sura')
go
Create procedure SP_Validar_Usuario
@email varchar(60),
@contra varchar(255)
as
begin
select email,contrasena from tbl_usuario
where email=@email and contrasena=@contra
end
Select * from tbl_usuario
insert into tbl_usuario values('jaimeP@gmail.com','12345');