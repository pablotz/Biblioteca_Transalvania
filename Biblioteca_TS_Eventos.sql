use Biblioteca_TS;
delimiter $
CREATE EVENT event_verificacion_de_entrega_libros
ON SCHEDULE every 1 day starts '2019-08-05 19:25:00'   -- 1 day starts '2019-08-02 12::00:00'
ON COMPLETION PRESERVE
  DO
	begin
 		UPDATE
		Afiliado as a inner join Prestamo as p on (a.afiliadoID=p.afiliadoID)
		SET
		a.estadoAfiliadoID = 3
		where datediff(p.fechaPresInicio,p.fechaPresTermino)>2 or (p.fechaEntregaPres is null and datediff(now(),date_add(p.fechaPresInicio,interval 2 day))>2);
	end $
delimiter ;
-- drop EVENT event_verificacion_de_entrega_libros;

select * from Afiliado as a inner join Prestamo as p on (a.afiliadoID = p.afiliadoID);
select * from estadoafiliado;
insert into prestamo values(11,'2019-07-17','2019-07-24',null,1,1,1);

SELECT @@event_scheduler;
set global event_scheduler= on;
show events;

delimiter $
CREATE EVENT event_verificacion_Reserva
ON SCHEDULE every 1 day starts '2019-08-05 19:52:00'   -- 1 day starts '2019-08-02 12::00:00'
ON COMPLETION PRESERVE
  DO
	begin
 		UPDATE
		Ejemplar as e inner join Reservacion as r on (e.ejemplarID = r.ejemplarID)
		SET
		e.estadoEjemplarID = 1
		where datediff(now(),r.fechaResTermino)>1;
	end; $
delimiter ;
-- drop EVENT event_verificacion_Reserva;

insert into Reservacion values(5,'2019-07-17','2019-07-24',1,1);

select * from Ejemplar as e inner join Reservacion as r on (e.ejemplarID = r.afiliadoID);
