create database LIBRERIA
go
use LIBRERIA 
go
create table MARCAS(
codigo smallint identity,
descripcion varchar(50) not null,
primary key (codigo) 
)
go
create table CATEGORIAS(
codigo smallint identity,
descripcion varchar(50) not null,
primary key (codigo)
)
go
create table ARTICULOS(
codigo int identity,
descripcion varchar(50) not null,
cod_marca smallint not null foreign key references
MARCAS(codigo),
costo money not null check (costo > 0),
precio money not null check (precio > 0),
cod_categoria smallint not null foreign key references
CATEGORIAS(codigo),
stock_minimo smallint check (stock_minimo >= 0),
stock smallint check (stock >= 0),
estado bit default 1
)
go
create table PROVINCIAS(
codigo smallint identity,
descripcion varchar(50) not null,
primary key (codigo)
)
go
create table LOCALIDADES(
codigo smallint identity,
descripcion varchar(50) not null,
primary key (codigo)
)
go
create table CLIENTES(
dni char(8) not null primary key,
nombre varchar(50) not null,
apellido varchar(50) not null,
fecha_de_nacimiento datetime not null,
sexo char check (sexo = 'M' or sexo = 'F' or sexo = 'X') default ('X'),
telefono varchar(15),
mail varchar(30),
direccion varchar(50),
CP varchar(8),
cod_localidad smallint,
fecha_de_alta datetime not null,
foreign key (cod_localidad) references LOCALIDADES(codigo) 
)
go
create table EMPLEADOS(
legajo int identity (1000,1) not null primary key,
dni char(8) not null unique,
nombre varchar(50) not null,
apellido varchar(50) not null,
fecha_de_nacimiento datetime not null,
sexo char check (sexo = 'M' or sexo = 'F' or sexo = 'X') default ('X'),
telefono varchar(15),
mail varchar(30),
direccion varchar(50) not null,
CP varchar(8),
cod_localidad smallint not null,
sueldo money not null, 
fecha_de_ingreso datetime not null check(fecha_de_ingreso <= getdate()),
foreign key (cod_localidad) references LOCALIDADES(codigo) 
)







