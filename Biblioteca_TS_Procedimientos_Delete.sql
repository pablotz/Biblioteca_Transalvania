-- ELIMINACION LOGICA EMPLEADO, AFILIADO, AUTOR -- 
delimiter $
create procedure pa_DeleteLogico(
personaID_ INT
)
begin

Update Persona
set estadoPID=2
where personaID=personaID_;

end; $
delimiter ;
-- drop procedure pa_DeleteLogico;
call pa_DeleteLogico(1);
select * from Persona where estadoPID=1;

-- ELIMINACION LOGICA EJEMPLAR --
delimiter $
create procedure pa_DeleteLogicoEjemplar(
ejemplarID_ INT
)
begin

Update Ejemplar
set estadoEjemplarID=5
where ejemplarID=ejemplarID_;

end; $
delimiter ;
-- drop procedure pa_DeleteLogicoEjemplar;
call pa_DeleteLogicoEjemplar(1);
select * from Ejemplar where estadoEjemplarID=1;

-- ELIMINACION LOGICA LIBRO --
delimiter $
create procedure pa_DeleteLogicoLibro(
libroID_ INT
)
begin

Update Libro
set estadoLibro=false
where libroID=libroID_;

end; $
delimiter ;
-- drop procedure pa_DeleteLogicoLibro;
call pa_DeleteLogicoLibro(2);
select * from Libro where estadoLibro=false;
