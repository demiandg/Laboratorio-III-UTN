create database UNIVERSIDAD
go
create table CARRERAS(
codigo smallint identity primary key,
nombre varchar(50) not null,
resolución varchar(100)
)
go
create table MATERIAS(
codigo smallint identity primary key,
nombre varchar(50) not null,
cod_carrera smallint foreign key references CARRERAS(codigo)
)
go
create table DOCENTES(
legajo smallint identity(1000,1) primary key,
dni char(8) unique not null,
nombre varchar(30) not null, 
apellido varchar(30) not null
)
go
create table PLANTAS(
cod_materia smallint foreign key references MATERIAS(codigo),
anio smallint check(anio between 1980 and 2100),
legajo_prof_tit smallint foreign key references DOCENTES(legajo), 
leg_jefetp smallint,
leg_primer_ayud smallint,
leg_seg_ayud smallint,
constraint pk_plantas primary key(cod_materia, anio)
)