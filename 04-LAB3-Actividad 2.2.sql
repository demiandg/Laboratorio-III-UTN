use Univ
go
/*
-- 01 Listado con nombre de usuario de todos los usuarios y sus respectivos nombres y apellidos.
select US.NombreUsuario, DP.Nombres, DP.Apellidos from Usuarios as US
join Datos_Personales as DP on US.ID = Dp.ID

-- 02 Listado con apellidos, nombres, fecha de nacimiento y nombre del país de nacimiento.
select dp.Apellidos,dp.Nombres, dp.Nacimiento, pa.Nombre from Datos_Personales as dp
left join Localidades as loc on dp.IDLocalidad = loc.ID
left join Paises as pa on loc.IDPais = pa.ID

-- 03 Listado con nombre de usuario, apellidos, nombres, email o celular de todos los usuarios que vivan en una domicilio comience con vocal. 
--    NOTA: Si no tiene email, obtener el celular.
select us.NombreUsuario, dp.Apellidos, dp.Nombres, contacto = case 
when dp.Telefono is null then dp.Email 
else dp.Telefono end 
from Usuarios as us 
join Datos_Personales as dp on us.ID = dp.ID 
where dp.Domicilio like '[aeiou]%' 

-- 04 Listado con nombre de usuario, apellidos, nombres, email o celular o domicilio como 'Información de contacto'.
select us.NombreUsuario, dp.Apellidos, dp.Nombres, 'Información de contacto' = case
when dp.Email is not null then dp.Email
when dp.Celular is not null then dp.Celular
when dp.Domicilio is not null then dp.Domicilio
else 'S/I'
end
from Usuarios as us
join Datos_Personales as dp
on us.ID = dp.ID

-- 05 Listado con apellido y nombres, nombre del curso y costo de la inscripción de todos los usuarios inscriptos a cursos.
-- NOTA: No deben figurar los usuarios que no se inscribieron a ningún curso.

select dp.Apellidos + ', ' + dp.Nombres  as  nombre, cu.Nombre, ins.Costo from Datos_Personales as dp
inner join Inscripciones as ins
on dp.ID = ins.IDUsuario
inner join Cursos as cu
on ins.IDCurso = cu.ID 


-- 06 Listado con nombre de curso, nombre de usuario y mail de todos los inscriptos a cursos que se hayan estrenado en el año 2020.

select cu.Nombre, us.NombreUsuario, dp.Email from Cursos as cu
inner join Inscripciones as ins on cu.ID = ins.IDCurso
inner join Usuarios as us on ins.IDUsuario = us.ID
inner join Datos_Personales as dp on us.ID = dp.ID 
where year(cu.Estreno) = 2020 

-- 07 Listado con nombre de curso, nombre de usuario, apellidos y nombres, fecha de inscripción, costo de inscripción, fecha de pago e importe de pago. 
-- Sólo listar información de aquellos que hayan pagado.

select cu.Nombre as Curso, us.NombreUsuario as usuario, dp.Apellidos + ', ' + dp.Nombres as Nombre, ins.Fecha as 'Fecha de inscripción',
ins.Costo, pa.Fecha as 'Fecha de pago', pa.Importe  from Pagos as pa
left join Inscripciones as ins on pa.IDInscripcion = ins.ID
inner join Cursos as cu on ins.IDCurso = cu.ID
inner join Usuarios as us on ins.IDUsuario = us.ID
inner join Datos_Personales as dp on us.ID = dp.ID 


-- 08 Listado con nombre y apellidos, género, fecha de nacimiento, mail, nombre del curso y fecha de certificación
--    de todos aquellos usuarios que se hayan certificado.

select dp.Nombres, dp.Apellidos, dp.Genero, dp.Nacimiento, dp.Email, cu.Nombre as Curso, cer.Fecha as 'Fecha de certificación' from Inscripciones as ins
right join Certificaciones as cer on ins.ID = cer.IDInscripcion 
inner join cursos as cu on ins.IDCurso = cu.ID
inner join Usuarios as us on ins.IDUsuario = us.ID
inner join Datos_Personales as dp on us.ID = dp.ID 

-- 09 Listado de cursos con nombre, costo de cursado y certificación, costo total (cursado + certificación) con 10% de todos los cursos de nivel Principiante.

select cu.Nombre as Curso, cu.CostoCurso, cu.CostoCertificacion, (cu.CostoCurso + cu.CostoCertificacion)*1.1 as 'Costo Total' from Cursos as cu
inner join Niveles as ni on cu.IDNivel = ni.ID
where ni.Nombre like 'principiante' 

-- 10 Listado con nombre y apellido y mail de todos los instructores. Sin repetir.

select distinct(dp.Nombres + ' ' +  dp.Apellidos) as Nombre, dp.Email from Instructores_x_Curso as ixc
inner join Datos_Personales as dp on ixc.IDUsuario = dp.ID 

-- 11 Listado con nombre y apellido de todos los usuarios que hayan cursado algún curso cuya categoría sea 'Historia'.

Select dp.nombres, dp.Apellidos from Datos_Personales as dp
inner join Usuarios as us on dp.ID = us.ID
inner join Inscripciones as ins on us.ID = ins.ID
inner join Cursos as cu on ins.IDCurso = cu.ID
inner join Categorias_x_Curso as caxcu on cu.ID = caxcu.IDCurso
inner join Categorias as cat on caxcu.IDCategoria = cat.ID 
where cat.Nombre like 'Historia' 

-- 12 Listado con nombre de idioma, código de curso y código de tipo de idioma. Listar todos los idiomas indistintamente si no tiene cursos relacionados.

select leng.Nombre, ixc.IDCurso, fi.ID from Idiomas as leng
left join Idiomas_x_Curso as ixc on leng.id = ixc.IDIdioma
left join FormatosIdioma as fi on ixc.IDFormatoIdioma = fi.ID 

-- 13 Listado con nombre de idioma de todos los idiomas que no tienen cursos relacionados.

select Nombre from Idiomas as leng
left join Idiomas_x_Curso as ixc on leng.ID = ixc.IDIdioma
where ixc.IDCurso is null 

-- 14 Listado con nombres de idioma que figuren como audio de algún curso. Sin repeticiones.

select distinct(leng.Nombre) from Idiomas as leng
inner join Idiomas_x_Curso as ixc on leng.ID = ixc.IDIdioma
inner join FormatosIdioma as fi on ixc.IDFormatoIdioma = fi.ID
where fi.Nombre like 'audio' 

-- 15 Listado con nombres y apellidos de todos los usuarios y el nombre del país en el que nacieron. 
--	  Listar todos los países indistintamente si no tiene usuarios relacionados.

select dp.Nombres, dp.Apellidos, pa.Nombre from Datos_Personales as dp
inner join Localidades as loc on dp.IDLocalidad = loc.ID
right join Paises as pa on loc.IDPais = Pa.ID 

-- 16 Listado con nombre de curso, fecha de estreno y nombres de usuario de todos los inscriptos. 
--    Listar todos los nombres de usuario indistintamente si no se inscribieron a ningún curso.

select cu.Nombre, cu.Estreno, us.NombreUsuario from Cursos as cu
inner join Inscripciones as ins on cu.ID = ins.IDCurso
right join Usuarios as us on ins.IDUsuario = us.ID 

-- 17 Listado con nombre de usuario, apellido, nombres, género, fecha de nacimiento y mail de todos los usuarios que no cursaron ningún curso.

select us.NombreUsuario, dp.Apellidos, dp.Nombres, dp.Genero, dp.Nacimiento, dp.Email from Usuarios as us
inner join Datos_Personales as dp on us.ID = dp.ID
left join Inscripciones as ins on us.ID = ins.IDUsuario
where ins.ID is null 

-- 18 Listado con nombre y apellido, nombre del curso, puntaje otorgado y texto de la reseña. 
--    Sólo de aquellos usuarios que hayan realizado una reseña inapropiada.

select dp.Nombres, dp.Apellidos, cu.Nombre, re.Puntaje, re.Observaciones from Datos_Personales as dp
inner join Inscripciones as ins on dp.ID = ins.IDUsuario
inner join Cursos as cu on ins.IDCurso = cu.ID
inner join Reseñas as re on ins.ID = re.IDInscripcion
where re.Inapropiada = 1 


-- 19 Listado con nombre del curso, costo de cursado, costo de certificación, nombre del idioma 
--    y nombre del tipo de idioma de todos los cursos cuya fecha de estreno haya sido antes del año actual.
--	  Ordenado por nombre del curso y luego por nombre de tipo de idioma. Ambos ascendentemente.

select cu.Nombre, cu.CostoCurso, cu.CostoCertificacion, leng.Nombre as Idioma, fo.Nombre as 'Tipo de Idioma' from Cursos as cu
left join Idiomas_x_Curso as ixc on cu.ID = ixc.IDCurso
left join Idiomas as leng on ixc.IDIdioma = leng.ID
left join FormatosIdioma as fo on ixc.IDFormatoIdioma = fo.ID
where year(cu.Estreno) = year(getdate())
order by cu.Nombre, leng.Nombre 

-- 20 Listado con nombre del curso y todos los importes de los pagos relacionados.

select cu.Nombre, concat('$', pa.Importe) from Cursos as cu
left join Inscripciones as ins on cu.ID = ins.IDCurso
left join Pagos as pa on ins.ID = pa.IDInscripcion */

-- 21 Listado con nombre de curso, costo de cursado y una leyenda que indique "Costoso" si el costo de cursado es mayor a $ 15000, "Accesible" 
--    si el costo de cursado está entre $2500 y $15000, "Barato" si el costo está entre $1 y $2499 y "Gratis" si el costo es $0.

Select Nombre as Cusos, CostoCurso as Costo, Observacion = case
when CostoCurso > 15000 then 'Costoso'
when CostoCurso between 2500 and 15000 then 'Accesible'
when CostoCurso between 1 and 1499 then 'Barato'
else 'Gratis'
end 
from Cursos

