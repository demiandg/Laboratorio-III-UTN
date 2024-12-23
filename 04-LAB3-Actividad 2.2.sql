use Univ
go
/*
-- 01 Listado con nombre de usuario de todos los usuarios y sus respectivos nombres y apellidos.
select US.NombreUsuario, DP.Nombres, DP.Apellidos from Usuarios as US
join Datos_Personales as DP on US.ID = Dp.ID

-- 02 Listado con apellidos, nombres, fecha de nacimiento y nombre del pa�s de nacimiento.
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

-- 04 Listado con nombre de usuario, apellidos, nombres, email o celular o domicilio como 'Informaci�n de contacto'.
select us.NombreUsuario, dp.Apellidos, dp.Nombres, 'Informaci�n de contacto' = case
when dp.Email is not null then dp.Email
when dp.Celular is not null then dp.Celular
when dp.Domicilio is not null then dp.Domicilio
else 'S/I'
end
from Usuarios as us
join Datos_Personales as dp
on us.ID = dp.ID

-- 05 Listado con apellido y nombres, nombre del curso y costo de la inscripci�n de todos los usuarios inscriptos a cursos.
-- NOTA: No deben figurar los usuarios que no se inscribieron a ning�n curso.

select dp.Apellidos + ', ' + dp.Nombres  as  nombre, cu.Nombre, ins.Costo from Datos_Personales as dp
inner join Inscripciones as ins
on dp.ID = ins.IDUsuario
inner join Cursos as cu
on ins.IDCurso = cu.ID 


-- 06 Listado con nombre de curso, nombre de usuario y mail de todos los inscriptos a cursos que se hayan estrenado en el a�o 2020.

select cu.Nombre, us.NombreUsuario, dp.Email from Cursos as cu
inner join Inscripciones as ins on cu.ID = ins.IDCurso
inner join Usuarios as us on ins.IDUsuario = us.ID
inner join Datos_Personales as dp on us.ID = dp.ID 
where year(cu.Estreno) = 2020 

-- 07 Listado con nombre de curso, nombre de usuario, apellidos y nombres, fecha de inscripci�n, costo de inscripci�n, fecha de pago e importe de pago. 
-- S�lo listar informaci�n de aquellos que hayan pagado.

select cu.Nombre as Curso, us.NombreUsuario as usuario, dp.Apellidos + ', ' + dp.Nombres as Nombre, ins.Fecha as 'Fecha de inscripci�n',
ins.Costo, pa.Fecha as 'Fecha de pago', pa.Importe  from Pagos as pa
left join Inscripciones as ins on pa.IDInscripcion = ins.ID
inner join Cursos as cu on ins.IDCurso = cu.ID
inner join Usuarios as us on ins.IDUsuario = us.ID
inner join Datos_Personales as dp on us.ID = dp.ID 


-- 08 Listado con nombre y apellidos, g�nero, fecha de nacimiento, mail, nombre del curso y fecha de certificaci�n
--    de todos aquellos usuarios que se hayan certificado.

select dp.Nombres, dp.Apellidos, dp.Genero, dp.Nacimiento, dp.Email, cu.Nombre as Curso, cer.Fecha as 'Fecha de certificaci�n' from Inscripciones as ins
right join Certificaciones as cer on ins.ID = cer.IDInscripcion 
inner join cursos as cu on ins.IDCurso = cu.ID
inner join Usuarios as us on ins.IDUsuario = us.ID
inner join Datos_Personales as dp on us.ID = dp.ID 

-- 09 Listado de cursos con nombre, costo de cursado y certificaci�n, costo total (cursado + certificaci�n) con 10% de todos los cursos de nivel Principiante.
select cu.Nombre as Curso, cu.CostoCurso, cu.CostoCertificacion, (cu.CostoCurso + cu.CostoCertificacion)*1.1 as 'Costo Total' from Cursos as cu
inner join Niveles as ni on cu.IDNivel = ni.ID
where ni.Nombre like 'principiante' 

-- 10 Listado con nombre y apellido y mail de todos los instructores. Sin repetir.

select distinct(dp.Nombres + ' ' +  dp.Apellidos) as Nombre, dp.Email from Instructores_x_Curso as ixc
inner join Datos_Personales as dp on ixc.IDUsuario = dp.ID */





