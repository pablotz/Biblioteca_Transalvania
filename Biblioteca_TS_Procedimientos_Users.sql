-- CREACION DE USUARIOS
/*
CREATE USER 'Administrador'@'localhost' IDENTIFIED BY 'Admin';

GRANT ALL PRIVILEGES ON biblioteca_ts.* TO 'Administrador'@'localhost';

CREATE USER 'Bibliotecario'@'localhost' IDENTIFIED BY 'password';

GRANT INSERT, SELECT, UPDATE ON biblioteca_ts.* TO 'Bibliotecario'@'localhost';
 */
 
-- INSERTAR EMPLEADO -- 
delimiter $
create procedure pa_InsertarEmpleadoUser(
primer_nom_ Varchar(15),
segundo_nom_ Varchar(15),
apellidoP_ Varchar(15),
apellidoM_ Varchar(15),

domicilio_ Varchar(100),
pais_ Varchar(100),
estado_ Varchar(100),
ciudad_ Varchar(100),
codPostal_ Varchar(10),

genero_ Varchar(10),
fotografia_ LONGTEXT,
telefono_ Varchar(21),
email_ Varchar(100),
fechaNacimiento_ DATE,

rolID_ INT,
usuario_ VARCHAR(50),
contrasena_ VARCHAR(50)
)
begin
	insert into Persona(primer_nom, segundo_nom, apellidoP, apellidoM, domicilio, pais, estado, ciudad, codPostal, genero, fotografia, telefono, email, fechaNacimiento, fechaRegistro, estadoPID) 
	values(primer_nom_, segundo_nom_, apellidoP_, apellidoM_, domicilio_, pais_, estado_, ciudad_, codPostal_, genero_, fotografia_, telefono_, email_, fechaNacimiento_, now(),1);
	insert into Usuario(usuario, contrasena, tipo) values (usuario_, contrasena_, 'Empleado');
    
    set @personaID_ = last_insert_id();
    set @usuarioID_= last_insert_id();
    insert into Empleado(usuarioID, rolID, personaID) values(@usuarioID_, rolID_, @personaID_);

	if usuario_ = 'Administrador' then
		begin
			CREATE USER usuario_@'localhost' IDENTIFIED BY 'contrasena';
            GRANT ALL PRIVILEGES ON biblioteca_ts.* TO usuario_@'localhost';
		end;
	end if;
	if usuario_ = 'Bibliotecario' then
		begin
			CREATE USER 'usuario_'@'localhost' IDENTIFIED BY 'password';
			GRANT INSERT, SELECT, UPDATE ON biblioteca_ts.* TO 'Bibliotecario'@'localhost';
		end;
	end if;
end; $
delimiter ;
-- drop procedure pa_InsertarEmpleado;

-- INSERTAR AFILIADO --
delimiter $
create procedure pa_InsertarAfiliado(
primer_nom_ Varchar(15),
segundo_nom_ Varchar(15),
apellidoP_ Varchar(15),
apellidoM_ Varchar(15),

domicilio_ Varchar(100),
pais_ Varchar(100),
estado_ Varchar(100),
ciudad_ Varchar(100),
codPostal_ Varchar(10),

genero_ Varchar(10),
fotografia_ LONGTEXT,
telefono_ Varchar(21),
email_ Varchar(100),
fechaNacimiento_ DATE,


usuario_ VARCHAR(50),
contrasena_ VARCHAR(50)
)
begin
	insert into Persona(primer_nom, segundo_nom, apellidoP, apellidoM, domicilio, pais, estado, ciudad, codPostal, genero, fotografia, telefono, email, fechaNacimiento, fechaRegistro, estadoPID) 
	values(primer_nom_, segundo_nom_, apellidoP_, apellidoM_, domicilio_, pais_, estado_, ciudad_, codPostal_, genero_, fotografia_, telefono_, email_, fechaNacimiento_, now(),1);
	insert into Usuario(usuario, contrasena, tipo) values (usuario_, contrasena_, 'Afiliado');
    
    set @personaID_ = last_insert_id();
    set @usuarioID_= last_insert_id();
    insert into Afiliado(usuarioID, personaID, estadoAfiliadoID) values(@usuarioID_, @personaID_, 1);
    
if usuario_ = 'Administrador' then
		begin
			CREATE USER usuario_@'localhost' IDENTIFIED BY 'admin';
            GRANT ALL PRIVILEGES ON biblioteca_ts.* TO usuario_@'localhost';
		end;
	end if;
	if usuario_ = 'Bibliotecario' then
		begin
			CREATE USER usuario_@'localhost' IDENTIFIED BY 'password';
			GRANT INSERT, SELECT, UPDATE ON biblioteca_ts.* TO 'Bibliotecario'@'localhost';
		end;
	end if;
end; $
delimiter ;
-- drop procedure pa_InsertarAfiliado;