-- ACCIONES EMPLEADO --
use Biblioteca_TS;
-- PROCEDIMIENTO PENALIZAR AFILIADO -- 
delimiter $
create procedure pa_PenalizarAfiliado(
afiliadoID_ INT
)
begin
Update Afiliado
set estadoAfiliadoID=3
where afiliadoID=afiliadoID_;
end; $
delimiter ;
-- DROP PROCEDURE pa_PenalizarAfiliado;
call pa_PenalizarAfiliado(1);

select * from Afiliado;

-- PROCEDIEMINTO BAJA AFILIADO -- -- Permite dar de baja a un afiliado --
delimiter $
create procedure pa_BajaAfiliado(
afiliadoID_ INT
)
begin
Update Afiliado
set estadoAfiliadoID=2
where afiliadoID=afiliadoID_;
end; $
delimiter ;
-- DROP PROCEDURE pa_BajaAfiliado;
call pa_BajaAfiliado(1);

select * from Afiliado;

-- PORCEDIMIENTO PARA ACTIVAR UN AFILIADO -- -- Permite cambiar su estado a activo --
delimiter $
create procedure pa_ActivarAfiliado(
afiliadoID_ INT
)
begin
Update Afiliado
set estadoAfiliadoID=1
where afiliadoID=afiliadoID_;
end; $
delimiter ;
-- DROP PROCEDURE pa_ActivarAfiliado;
call pa_ActivarAfiliado(1);

select * from Afiliado;

-- PROCEDIMIENTO PRESTAMO --
delimiter $
create procedure pa_PrestamoLibro(
empleadoID_ INT,
ejemplarID_ INT,
afiliadoID_ INT
)
begin
	set @fechaPresTermino := ADDDATE(now(), INTERVAL 7 DAY);
	insert into Prestamo (fechaPresInicio, fechaPresTermino, fechaEntregaPres, empleadoID, ejemplarID, afiliadoID) 
	values(now(),@fechaPresTermino,null,empleadoID_,ejemplarID_,afiliadoID_);
    
    update Ejemplar
    set estadoEjemplarID = 3
    where ejemplarID = ejemplarID_;
end; $
delimiter ;
-- drop procedure pa_PrestamoLibro;

-- INSERTS DE PRUEBA PARA COMPROBACION DE PRESTAMO
call pa_PrestamoLibro(1, 1, 1);
call pa_PrestamoLibro(1, 2, 1);
call pa_PrestamoLibro(1, 2, 1);
call pa_PrestamoLibro(1, 2, 1);
call pa_PrestamoLibro(1, 2, 1);
call pa_PrestamoLibro(1, 3, 1);
call pa_PrestamoLibro(1, 3, 1);
call pa_PrestamoLibro(1, 1, 1);
select * from Prestamo;

-- PROCEDIMIENTO RESERVA --
delimiter $
create procedure pa_ReservaLibro(
ejemplarID_ INT,
usuarioID_ INT
)
begin
	set @fechaPresTermino := ADDDATE(now(), INTERVAL 1 DAY);
	insert into Reservacion (fechaResInicio, fechaResTermino, ejemplarID, usuarioID) 
	values(now(),@fechaPresTermino,ejemplarID_,usuarioID_);
    
    update Ejemplar
    set estadoEjemplarID = 2
    where ejemplarID = ejemplarID_;
end; $
delimiter ;
-- drop procedure pa_ReservaLibro;

call pa_ReservaLibro(16, 3);
select * from Usuario;
select * from Ejemplar where estadoEjemplarID = 1 ;
SELECT * from Reservacion;

select e.ejemplarID from Ejemplar as e inner join Libro as l on(e.libroID=l.libroID) where estadoEjemplarID=1 and e.libroID=(2);


-- PROCEDIMIENTO DEVOLUVION LIBRO -- 
/* Permite registrar la devolucion de un libro en la biblioteca 
y cambiar el estado del libro a disponible */ 
delimiter $
create procedure pa_DevolucionLibro(
ejemplarID_ INT,
afiliadoID_ INT
)
begin
    update Prestamo
    set fechaEntregaPres = now()
    where ejemplarID = ejemplarID_ and afiliadoID = afiliadoID_;
    
    update Ejemplar
    set estadoEjemplarID = 1
    where ejemplarID = ejemplarID_;
end; $
delimiter ;
-- drop procedure pa_DevolucionLibro;

call pa_DevolucionLibro(1, 1);

-- PROCEDIMIENTO CONSULTA PRESTAMOS -- /* Devuelve informacion sobre los prestamos llevados acabo en la biblioteca */
delimiter $
create procedure pa_ConsultaPrestamos()
begin
select p.prestamoID, l.titulo, p.fechaPresInicio, p.fechaPresTermino, p.fechaEntregaPres, 
em.empleadoID, per2.primer_nom, per2.segundo_nom, per2.apellidoP, per2.apellidoM,
 af.afiliadoID, per.primer_nom, per.segundo_nom, per.apellidoP, per.apellidoM 
from Prestamo as p inner join Ejemplar as e on (p.ejemplarID = e.ejemplarID) 
inner join Libro as l on(e.libroID=l.libroID)
inner join Empleado as em on (p.empleadoID = em.empleadoID)
inner join Persona as per2 on (em.personaID = per2.personaID)
inner join Afiliado as af on (p.afiliadoID = af.afiliadoID) 
inner join Persona as per on (af.personaID = per.personaID); -- where fechaPresInicio like concat('%',curdate(),'%');
end; $
delimiter ;
-- drop procedure pa_ConsultaPrestamos;
call pa_ConsultaPrestamos;



-- PROCEDIMIENTO CONSULTA RESERVAS --
delimiter $
create procedure pa_ConsultaReservas()
begin
select r.reservacionID, l.titulo, af.afiliadoID, per.primer_nom, per.segundo_nom, per.apellidoP, per.apellidoM, r.ejemplarID, 
l.ISBN, r.fechaResInicio, r.fechaResTermino
from Reservacion as r inner join Ejemplar as e on (r.ejemplarID = e.ejemplarID)
inner join Libro as l on (l.libroID=e.libroID)
inner join Usuario as us on (r.afiliadoID = us.afiliadoID) 
inner join Persona as per on (af.personaID = per.personaID) where fechaResInicio like concat('%',curdate(),'%');
end; $
delimiter ;
-- drop procedure pa_ConsultaReservas;
call pa_ConsultaReservas;
select r.reservacionID, l.titulo, af.afiliadoID, per.primer_nom, per.segundo_nom, per.apellidoP, per.apellidoM, r.ejemplarID, 
l.ISBN, r.fechaResInicio, r.fechaResTermino
from Reservacion as r inner join Ejemplar as e on (r.ejemplarID = e.ejemplarID)
inner join Libro as l on (l.libroID=e.libroID)
inner join Afiliado as af on (r.afiliadoID = af.afiliadoID) 
inner join Persona as per on (af.personaID = per.personaID) where fechaResInicio like concat('%',curdate(),'%');




select r.reservacionID, l.titulo, af.afiliadoID, per.primer_nom, per.segundo_nom, per.apellidoP, per.apellidoM, r.ejemplarID,
                        l.ISBN, r.fechaResInicio, r.fechaResTermino
                        from Reservacion as r inner join Ejemplar as e on (r.ejemplarID = e.ejemplarID)
                        inner join Libro as l on (l.libroID=e.libroID)
                        inner join Usuario as us on (r.usuarioID = us.usuarioID)
                        inner join Afiliado as af on (af.usuarioID = us.usuarioID)
                        inner join Persona as per on (af.personaID = per.personaID) where r.fechaResInicio like concat('%',curdate(),'%') and e.estadoEjemplarID=2;