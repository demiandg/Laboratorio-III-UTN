use Univ
go
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