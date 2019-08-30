-- TRIGGERS BEFORE INSERT

-- Si el estado del afiliado es penalizado, no es posible efectuar el prestamo.
-- drop trigger Tr_Be_In_Prestamo;
set @estadoAfiliado =1;
delimiter $
create TRIGGER Tr_Be_In_Prestamo before insert ON Prestamo
for each row
begin
	-- select @estadoAfiliado := estadoafiliado from Afiliado; 
	if @estadoAfiliado = 3 then
		begin
			signal sqlstate '45000' set message_text='El afiliado esta penalizado, no es posible efectuar el prestamo';
		end;
        if @estadoAfiliado = 2 then
			begin
				signal sqlstate '45000' set message_text='El afiliado esta dado de baja, no es posible efectuar el prestamo';
            end;
		end if;
    end if;
end; $
Delimiter ;
call pa_PrestamoLibro(1, 1, 1); -- CREAR EL PROCEDIMIENTO DE PRESTAMO PARA EFECTUAR EL CALL

-- Si el estado del afiliado es penalizado o dado de baja, no es posible efectuar la reserva.
-- drop trigger Tr_Be_In_Reservacion;
set @estadoAfiliado =1;
delimiter $
create TRIGGER Tr_Be_In_Reservacion before insert ON Reservacion
for each row
begin
	-- select @estadoAfiliado := estadoafiliado from Afiliado; 
	if @estadoAfiliado = 3 then
		begin
			signal sqlstate '45000' set message_text='El afiliado esta penalizado, no es posible efectuar la reservacion';
		end;
        if @estadoAfiliado = 2 then
			begin
				signal sqlstate '45000' set message_text='El afiliado esta dado de baja, no es posible efectuar la reservacion';
            end;
		end if;
    end if;
end; $
Delimiter ;
call pa_ReservaLibro(1, 1); -- CREAR EL PROCEDIMIENTO DE RESERVACION PARA EFECTUAR EL CALL