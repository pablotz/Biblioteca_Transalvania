-- Procedimientos registro de catalogos --


-- Registro Editorial --  
delimiter $
create procedure pa_InsertarEditorial(
editorial_ varchar(100)
)
begin
	Insert into Editorial(nombre) values(editorial_);
end; $
delimiter ;
-- drop procedure pa_InsertarEditorial;

call pa_InsertarEditorial("Editorial_1");

-- Actualizacion de nombre de una Editorial --  
delimiter $
create procedure pa_ActualizarEditorial(
editorialID_ int,
nombre_ varchar(100)
)
begin
	update Editorial
    set nombre = nombre_
    where editorialID = editorialID_;
end; $
delimiter ;
-- drop procedure pa_ActualizarEditorial;

call pa_ActualizarEditorial("Editorial_new");

-- Eliminacion de una Editorial --  
delimiter $
create procedure pa_DeleteEditorial(
editorialID_ int
)
begin
	delete from Editorial
    where editorialID = editorialID_;
end; $
delimiter ;
-- drop procedure pa_DeleteEditorial;

call pa_DeleteEditorial(last_insert_id()); -- INSERTE ID DE LA EDITORIAL QUE DESEE ELIMINAR --

-- Busqueda de Editorial --
delimiter $
create procedure pa_ConsultaEditorial(
nombre_ varchar(40)
)
begin
	select nombre from Editorial where nombre like concat('%', nombre_ ,'%');
end; $
delimiter ;
-- drop procedure pa_ConsultaEditorial;

call pa_ConsultaEditorial('Pa'); -- Inseta nombre de la editorial --

-- Registro Genero --  
delimiter $
create procedure pa_InsertarGenero(
genero_ varchar(100)
)
begin
	Insert into Genero(genero) values(genero_);
end; $
delimiter ;
-- drop procedure pa_InsertarGenero;

call pa_InsertarGenero("Fantasia");

-- Actualizacion de nombre de un genero --  
delimiter $
create procedure pa_ActualizarGenero(
generoID_ int,
genero_ varchar(100)
)
begin
	update Genero
    set genero = genero_
    where generoID = generoID_;
end; $
delimiter ;
-- drop procedure pa_ActualizarGenero;

call pa_ActualizarGenero("Terror");

-- Eliminacion de un genero --  
delimiter $
create procedure pa_DeleteGenero(
generoID_ int
)
begin
	delete from Genero
    where generoID = generoID_;
end; $
delimiter ;
-- drop procedure pa_DeleteGenero;

call pa_DeleteGenero(last_insert_id()); -- INSERTE ID DEL GENERO QUE DESEE ELIMINAR --

-- Busqueda de Genero --
delimiter $
create procedure pa_ConsultaGenero(
genero_ varchar(40)
)
begin
	select genero from Genero where genero like concat('%', genero_ ,'%');
end; $
delimiter ;
-- drop procedure pa_ConsultaGenero;

call pa_ConsultaGenero('Art');