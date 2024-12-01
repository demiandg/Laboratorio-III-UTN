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
primary key (codigo)
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
legajo int identity (1000,1) primary key,
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
go
create table FACTURAS(
codigo bigint identity,
dni_cliente char(8) not null,
leg_vendedor int not null check(leg_vendedor >= 100),
fecha datetime not null check(fecha <= getdate()),
forma_de_pago char not null check (forma_de_pago = 'E' or forma_De_pago = 'T'),
importe money not null
primary key (codigo),
foreign key (dni_cliente) references CLIENTES (dni),
foreign key (leg_vendedor) references EMPLEADOS (legajo)
)
go
create table VENTAS(
n_venta bigint identity primary key,
cod_art int not null,
valor_unitario money not null,
cantidad smallint not null,
foreign key (cod_art) references ARTICULOS (codigo)
)
go
alter table FACTURAS 
ADD num_venta bigint not null,
constraint fk_n_venta foreign key (num_venta) references ventas (n_venta)













