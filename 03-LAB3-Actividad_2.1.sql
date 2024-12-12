Use Univ
go

-- 01 
select Nombre from Idiomas

-- 02 
select Nombre from Cursos

-- 03
select nombre, CostoCurso as "Costo de inscripción", CostoCertificacion as "Costo de certificación", Estreno as "Fecha de estreno" from Cursos

-- 04 
select ID, Nombre, CostoCurso, IDNivel from Cursos 
where CostoCertificacion > 5000

-- 05 
select id, Nombre, CostoCurso, IDNivel from Cursos
where CostoCertificacion < 1200

-- 06 
select Nombre, Numero, Duracion from Clases
where IDCurso = 6

-- 07 
select Nombre, Numero, Duracion from Clases
where IDCurso = 10

-- 08 
select nombre, Duracion from Clases
where IDCurso = 4 
order by Duracion desc

-- 09 
select Nombre, Estreno as 'fecha de estreno', CostoCurso as 'costo del curso', CostoCertificacion as 'costo de certificación' from Cursos
order by Estreno 

-- 10
select nombre, Estreno, CostoCurso from Cursos
where IDNivel in (1,5,9,10)

-- 11 
select top(3) Nombre, Estreno, CostoCurso from Cursos
order by CostoCertificacion desc

-- 12
select Nombre, Duracion, Numero from Clases
where IDCurso in (2,5,7)
order by IDCurso asc, Numero asc

-- 13 
select Nombre, Estreno from Cursos
where Estreno between '2019-01-01' and '2019-05-31'

-- 14
select Nombre from Cursos
where year(Estreno) = 2020 

-- 15
select nombre from Cursos
where month(Estreno) between 1 and 4 

-- 16 
select Nombre from Clases
where Duracion between 15 and 90 

-- 17 
select * from Contenidos
where (Tamaño > 5000 and IDTipo = 4) or (Tamaño < 400 and IDTipo = 1) 

-- 18
select * from Cursos
where IDNivel is null 

-- 19
select Nombre from Cursos
where (0.2*CostoCurso) < CostoCertificacion

-- 20 
select distinct(CostoCurso) from Cursos
order by CostoCurso desc