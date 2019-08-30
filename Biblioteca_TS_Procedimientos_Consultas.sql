-- PROCEDIMIENTOS CONSULTAS -- 
use Biblioteca_TS;
select * from Libro where generoID = 1;
-- CONSULTA LIBRO MAS PRESTADO -- 
delimiter $
create procedure pa_ConsultaLibroMasPrestado()
begin
Select l.titulo, count(e.ejemplarID) as numero_prestamos from Ejemplar as e inner join Prestamo as p on (e.ejemplarID=p.ejemplarID)
inner join Libro as l on (e.libroID = l.libroID) group by p.ejemplarID order by numero_prestamos DESC;
end; $
delimiter ;
-- drop procedure pa_ConsultaLibroMasPrestado;
call pa_ConsultaLibroMasPrestado;
-- select * from prestamo;

-- CONSULTA Ejemplares NO ENTREGADOS A TIEMPO --
-- El evento se encarga de actualizar los libros a un estado de no entregado, para ello necesita pasar el limite de dias.
-- El procedimiento llama los libros con ese estado.
delimiter $
create procedure pa_ConsultaEjemplaresNoEntregados()
begin
Select e.ejemplarID, e.ISBN, e.libroID, l.titulo, p.fechaPresInicio, p.fechaPresTermino, p.afiliadoID, pe.primer_nom, pe.apellidoP
from Ejemplar as e inner join Prestamo as p on (e.ejemplarID=p.ejemplarID)
inner join Libro as l on (e.libroID = l.libroID) 
inner join Afiliado as a on (p.afiliadoID=a.afiliadoID)
inner join Persona as pe on (a.personaID=pe.personaID) where e.estadoEjemplarID=4;
end; $
delimiter ;
-- drop procedure pa_ConsultaEjemplaresNoEntregados;
call pa_ConsultaEjemplaresNoEntregados;

-- CONSULTA LIRBOS PRESTADO POR TIEMPO --
delimiter $
create procedure pa_ConsultaLibroTIME(
fecha_ varchar(20)
)
begin
Select e.ejemplarID, e.ISBN, e.libroID, l.titulo, p.fechaPresInicio, p.fechaPresTermino, p.afiliadoID, pe.primer_nom, pe.apellidoP
from Ejemplar as e inner join Prestamo as p on (e.ejemplarID=p.ejemplarID)
inner join Libro as l on (e.libroID = l.libroID) 
inner join Afiliado as a on (p.afiliadoID=a.afiliadoID)
inner join Persona as pe on (a.personaID=pe.personaID) where p.fechaPresInicio like fecha_;
end; $
delimiter ;
-- drop procedure pa_ConsultaLibroTIME;
call pa_ConsultaLibroTIME('%2019-07-19%');
-- select * from prestamo;

-- CONSULTA LIRBOS PRESTADO POR REANGO TIEMPO --
delimiter $
create procedure pa_ConsultaLibroRango_TIME(
afiliadoID_ INT,
fecha1_ date,
fecha2_ date
)
begin
Select e.ejemplarID, e.ISBN, e.libroID, l.titulo, p.fechaPresInicio, p.fechaPresTermino, p.afiliadoID, pe.primer_nom, pe.apellidoP
from Ejemplar as e inner join Prestamo as p on (e.ejemplarID=p.ejemplarID)
inner join Libro as l on (e.libroID = l.libroID) 
inner join Afiliado as a on (p.afiliadoID=a.afiliadoID)
inner join Persona as pe on (a.personaID=pe.personaID) where p.fechaPresInicio between fecha1_ and fecha2_ and p.afiliadoID=afiliadoID_;
end; $
delimiter ;
-- drop procedure pa_ConsultaLibroRango_TIME;
call pa_ConsultaLibroRango_TIME(1,'2019-07-19','2019-09-19');
-- select * from prestamo;

-- CONSULTA LIRBOS PRESTADO POR REANGO TIEMPO --
delimiter $
create procedure pa_ConsultaLibro_Filtro(
editorial_ varchar(100),
genero_ varchar(100)
)
begin
Select l.libroID, l.titulo, ed.nombre, g.genero
from Libro as l inner join Editorial as ed on (l.editorialID = ed.editorialID)
inner join Genero as g on (l.generoID=g.generoID) where ed.nombre = editorial_ or g.genero = genero_ group by libroID;
end; $
delimiter ;
-- drop procedure pa_ConsultaLibro_Filtro;
call pa_ConsultaLibro_Filtro('Panini','Accion');

-- BUSQUEDA DE LIBROS EN LA PAGINA
delimiter $
create procedure pa_Busqueda_Libro(
libro_ varchar(100)
)
begin    
	Select fotografia, titulo from Libro as l inner join Ejemplar as e on (l.libroID=e.libroID) where titulo like CONCAT('%',libro_,'%') or ISBN like CONCAT('%',libro_,'%');
end; $
delimiter ;
-- drop procedure pa_Busqueda_Libro;
call pa_Busqueda_Libro('Titulo');

-- BUSQUEDA DE AUTORES EN LA PAGINA
delimiter $
create procedure pa_Busqueda_Autor(
autor_ varchar(100)
)
begin    
	Select fotografia, primer_nom, apellidoP from Autor as a inner join Persona as p on (a.personaID = p.personaID) where primer_nom like CONCAT('%',autor_,'%') or apellidoP like CONCAT('%',autor_,'%');
end; $
delimiter ;
-- drop procedure pa_Busqueda_Autor;
call pa_Busqueda_Autor('Autor111');

