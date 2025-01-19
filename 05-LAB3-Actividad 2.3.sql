use Univ
go
-- 1 Listado con la cantidad de cursos.
/*
select count(*) as 'Cantidad de cursos' from Cursos

-- 2 Listado con la cantidad de usuarios.

select count(*) as 'Usuarios' from Usuarios*/

-- 3 Listado con el promedio de costo de certificación de los cursos.

select CONCAT('$' , AVG(CostoCertificacion)) as 'Prom. de Costo de certificación' from Cursos