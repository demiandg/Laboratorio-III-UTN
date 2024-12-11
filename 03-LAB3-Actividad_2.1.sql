Use Univ
go
/*
-- 01 Listado de todos los idiomas.
select Nombre from Idiomas

-- 02 Listado de todos los cursos.
select Nombre from Cursos

-- 03 Listado con nombre, costo de inscripci�n (costo de curso), costo de certificaci�n y fecha de estreno de todos los cursos.
select nombre, CostoCurso as "Costo de inscripci�n", CostoCertificacion as "Costo de certificaci�n", Estreno as "Fecha de estreno" from Cursos

-- 04 Listado con ID, nombre, costo de inscripci�n y ID de nivel de todos los cursos cuyo costo de certificaci�n sea menor a $5000.
select ID, Nombre, CostoCurso, IDNivel from Cursos 
where CostoCertificacion > 5000

-- 05 Listado con ID, nombre, costo de inscripci�n y ID de nivel de todos los cursos cuyo costo de certificaci�n sea mayor a $1200.
select id, Nombre, CostoCurso, IDNivel from Cursos
where CostoCertificacion < 1200

-- 06 Listado con nombre, n�mero y duraci�n de todas las clases del curso con ID n�mero 6.
select Nombre, Numero, Duracion from Clases
where IDCurso = 6

-- 07 Listado con nombre, n�mero y duraci�n de todas las clases del curso con ID n�mero 10.
select Nombre, Numero, Duracion from Clases
where IDCurso = 10

-- 08 Listado con nombre y duraci�n de todas las clases del curso con ID n�mero 4. Ordenado por duraci�n de mayor a menor.
select nombre, Duracion from Clases
where IDCurso = 4 
order by Duracion desc

-- 09 Listado de cursos con nombre, fecha de estreno, costo del curso, costo de certificaci�n ordenados por fecha de estreno de manera creciente.
select Nombre, Estreno as 'fecha de estreno', CostoCurso as 'costo del curso', CostoCertificacion as 'costo de certificaci�n' from Cursos
order by Estreno 

-- 10 Listado con nombre, fecha de estreno y costo del curso de todos aquellos cuyo ID de nivel sea 1, 5, 9 o 10.
select nombre, Estreno, CostoCurso from Cursos
where IDNivel in (1,5,9,10)*/
