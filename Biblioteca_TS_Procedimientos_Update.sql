-- Biblioteca_TS_Procedimientos_Update
use Biblioteca_TS;

-- UPADATE EMPLEADO --
delimiter $
create procedure pa_UpdateEmpleado(
personaID_ INT,
empleadoID_ INT,
usuarioID_ INT,
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

Update Persona
set primer_nom=primer_nom_, segundo_nom=segundo_nom_, apellidoP=apellidoP_, apellidoM=apellidoM_, domicilio=domicilio_, pais=pais_, estado=estado_, ciudad=ciudad_, codPostal=codPostal_, genero=genero_, fotografia=fotografia_, telefono=telefono_, email=email_, fechaNacimiento=fechaNacimiento_
where personaID=personaID_;

Update Empleado
set  rolID = rolID_
where empleadoID = empleadoID_;

Update Usuario
set usuario = usuario_, contrasena = contrasena_
where usuarioID_ = usuarioID;
end; $
delimiter ;
-- drop procedure pa_UpdateEmpleado;

call pa_UpdateEmpleado(1,1,1,'Pedro','Pablo','Quiroz','Lara','Olivo del Valle #419','México','Guanajuato','León','37140',
'Masculino','FOT001','4771965363','peri_ql@live.com.mx','2000-08-09','1','PRUEBA','PRUEBA');
call pa_UpdateEmpleado(2,2,2,'Guillermo','','del Toro','Gómez','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771235363','guillermodelT@live.com.mx','2000-08-09','1','guillermoDelToro','password2');
call pa_UpdateEmpleado(3,3,3,'Manuel','Candelario','Gutierrez','Palacios','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4776549977','manuelC@live.com.mx','2000-08-09','1','manuelCalendario','password');

select * from Persona;
select * from Empleado;

-- UPDATE AFILIADO --
delimiter $
create procedure pa_UpdateAfiliado(
personaID_ INT,
usuarioID_ INT,
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
Update Persona
set primer_nom=primer_nom_, segundo_nom=segundo_nom_, apellidoP=apellidoP_, apellidoM=apellidoM_, domicilio=domicilio_, pais=pais_, estado=estado_, ciudad=ciudad_, codPostal=codPostal_, genero=genero_, fotografia=fotografia_, telefono=telefono_, email=email_, fechaNacimiento=fechaNacimiento_
where personaID=personaID_;

Update Usuario
set usuario = usuario_, contrasena = contrasena_
where usuarioID_ = usuarioID;
end; $
delimiter ;
-- DROP PROCEDURE pa_UpdateAfiliado;

call pa_UpdateAfiliado(4,4,'Alejandro','','González ','Iñárritu','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','alejandro@live.com.mx','2000-08-09','alejandroGonzales','password');
call pa_UpdateAfiliado(5,5,'Julian','Porte','Casablanca','Ezpinoza','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','julianP@live.com.mx','2000-08-09','julianPorte','password');
call pa_UpdateAfiliado(6,6,'Juan','Pedro','Luna','Flores','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','JuanP@live.com.mx','2000-08-09','JuanPedro','password');

select * from Persona as p inner join Empleado as e on (p.personaID=e.personaID)
inner join Usuario as u on (e.usuarioID=u.usuarioID);


-- UPDATE AUTOR --
delimiter $
create procedure pa_UpdateAutor(
personaID_ INT,
primer_nom_ Varchar(15),
segundo_nom_ Varchar(15),
apellidoP_ Varchar(15),
apellidoM_ Varchar(15),

domicilio_ Varchar(100),
pais_ Varchar(20),
estado_ Varchar(20),
ciudad_ Varchar(20),
codPostal_ Varchar(10),

genero_ Varchar(10),
fotografia_ LONGTEXT,
telefono_ Varchar(21),
email_ Varchar(100),
fechaNacimiento_ DATE
)
begin
	Update Persona
	set primer_nom=primer_nom_, segundo_nom=segundo_nom_, apellidoP=apellidoP_, apellidoM=apellidoM_, domicilio=domicilio_, pais=pais_, estado=estado_, ciudad=ciudad_, codPostal=codPostal_, genero=genero_, fotografia=fotografia_, telefono=telefono_, email=email_, fechaNacimiento=fechaNacimiento_
	where personaID=personaID_;
end;  $
delimiter ;
-- DROP PROCEDURE pa_UpdateAutor;

call pa_UpdateAutor(7,'Autor1','Autor1','Autor1','Autor1','Olivo del Libro #123','México','Guanajuato','León','37140',
'Masculino','FOT002','4771965363','Autor1@gmail.com','2000-01-01');
call pa_UpdateAutor(8,'Autor2','Autor2','Autor2','Autor2','Olivo del Libro #123','México','Guanajuato','León','37140',
'Masculino','FOT002','4771965363','Autor2@gmail.com','2000-01-02');
call pa_UpdateAutor(9,'Autor3','Autor3','Autor3','Autor3','Olivo del Libro #123','México','Guanajuato','León','37140',
'Masculino','FOT002','4771965363','Autor3@gmail.com','2000-01-03');

select * from Persona;

-- UPDATE LIBRO --
delimiter $
create procedure pa_UpdateLibro(
libroID_ INT,
titulo_ VARCHAR(100),
añoPublicacion_ DATE,
edicion_ VARCHAR(40),
sinopsis_ VARCHAR(500),
fotografia_ LONGTEXT,
ISBN_ VARCHAR(20),
generoID_ INT,
editorialID_ INT,
autorID_ INT
)
begin
	update Libro
    set titulo=titulo_, añoPublicacion=añoPublicacion_, edicion=edicion_, sinopsis=sinopsis_, fotografia= fotografia_, ISBN=ISBN_, generoID=generoID_, editorialID=editorialID_, autorID=autorID_
    where libroID=libroID_;
end; $
delimiter ;
-- drop procedure pa_UpdateLibro;
select * from Libro;
call pa_UpdateLibro(1,'Titulo_Libro1','20-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO','FO0002','8497364575',1,1,1);
call pa_UpdateLibro(2,'Titulo_Libro2','20-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO','FO0002','2497444575',1,1,1);
call pa_UpdateLibro(3,'Titulo_Libro3','20-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO','FO0002','9944364575',2,2,1);
select * from Libro;
-- UPDATE Ejemplar --
delimiter $
create procedure pa_UpdateEjemplar(
ejemplarID_ INT,
libroID_ INT
)
begin
	update Ejemplar
    set libroID=libroID_
	where ejemplarID=ejemplarID_;
end; $
delimiter ;
-- drop procedure pa_UpdateEjemplar;

call pa_UpdateEjemplar(1,1);
call pa_UpdateEjemplar(2,2);
call pa_UpdateEjemplar(3,3);
select * from ejemplar;

select * from Persona;


-- UPDATE AUTOR --
delimiter $
create procedure pa_UpdateAutor(
personaID_ INT,
primer_nom_ Varchar(15),
segundo_nom_ Varchar(15),
apellidoP_ Varchar(15),
apellidoM_ Varchar(15),

domicilio_ Varchar(100),
pais_ Varchar(20),
estado_ Varchar(20),
ciudad_ Varchar(20),
codPostal_ Varchar(10),

genero_ Varchar(10),
fotografia_ LONGTEXT,
telefono_ Varchar(21),
email_ Varchar(100),
fechaNacimiento_ DATE
)
begin
	Update Persona
	set primer_nom=primer_nom_, segundo_nom=segundo_nom_, apellidoP=apellidoP_, apellidoM=apellidoM_, domicilio=domicilio_, pais=pais_, estado=estado_, ciudad=ciudad_, codPostal=codPostal_, genero=genero_, fotografia=fotografia_, telefono=telefono_, email=email_, fechaNacimiento=fechaNacimiento_
	where personaID=personaID_;
end;  $
delimiter ;
-- DROP PROCEDURE pa_UpdateAutor;

call pa_UpdateAutor(7,'Autor1','Autor1','Autor1','Autor1','Olivo del Libro #123','México','Guanajuato','León','37140',
'Masculino','FOT002','4771965363','Autor1@gmail.com','2000-01-01');
call pa_UpdateAutor(8,'Autor2','Autor2','Autor2','Autor2','Olivo del Libro #123','México','Guanajuato','León','37140',
'Masculino','FOT002','4771965363','Autor2@gmail.com','2000-01-02');
call pa_UpdateAutor(9,'Autor3','Autor3','Autor3','Autor3','Olivo del Libro #123','México','Guanajuato','León','37140',
'Masculino','FOT002','4771965363','Autor3@gmail.com','2000-01-03');

select * from Persona;

-- UPDATE LIBRO --
delimiter $
create procedure pa_UpdateLibro(
libroID_ INT,
titulo_ VARCHAR(100),
añoPublicacion_ DATE,
edicion_ VARCHAR(40),
sinopsis_ VARCHAR(500),
fotografia_ LONGTEXT,
generoID_ INT,
editorialID_ INT,
autorID_ INT
)
begin
	update Libro
    set titulo=titulo_, añoPublicacion=añoPublicacion_, edicion=edicion_, sinopsis=sinopsis_, fotografia= fotografia_, generoID=generoID_, editorialID=editorialID_, autorID=autorID_
    where libroID=libroID_;
end; $
delimiter ;
-- drop procedure pa_UpdateLibro;
select * from Libro;
call pa_UpdateLibro(1,'Titulo_Libro1','20-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO','FO0002',1,1,1);
call pa_UpdateLibro(2,'Titulo_Libro2','20-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO','FO0002',1,1,1);
call pa_UpdateLibro(3,'Titulo_Libro3','20-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO','FO0002',2,2,1);
select * from libro;
-- UPDATE Ejemplar --
delimiter $
create procedure pa_UpdateEjemplar(
ejemplarID_ INT,
ISBN_ VARCHAR(20),
libroID_ INT
)
begin
	update Ejemplar
    set ISBN=ISBN_, libroID=libroID_
	where ejemplarID=ejemplarID_;
end; $
delimiter ;
-- drop procedure pa_UpdateEjemplar;

call pa_UpdateEjemplar(1,'8497364575',1);
call pa_UpdateEjemplar(2,'2497444575',2);
call pa_UpdateEjemplar(3,'9944364575',3);
select * from ejemplar;

select * from Persona;



-- UPDATE AUTOR --
delimiter $
create procedure pa_UpdateAutor(
personaID_ INT,
primer_nom_ Varchar(15),
segundo_nom_ Varchar(15),
apellidoP_ Varchar(15),
apellidoM_ Varchar(15),

domicilio_ Varchar(100),
pais_ Varchar(20),
estado_ Varchar(20),
ciudad_ Varchar(20),
codPostal_ Varchar(10),

genero_ Varchar(10),
fotografia_ LONGTEXT,
telefono_ Varchar(21),
email_ Varchar(100),
fechaNacimiento_ DATE
)
begin
	Update Persona
	set primer_nom=primer_nom_, segundo_nom=segundo_nom_, apellidoP=apellidoP_, apellidoM=apellidoM_, domicilio=domicilio_, pais=pais_, estado=estado_, ciudad=ciudad_, codPostal=codPostal_, genero=genero_, fotografia=fotografia_, telefono=telefono_, email=email_, fechaNacimiento=fechaNacimiento_
	where personaID=personaID_;
end;  $
delimiter ;
-- DROP PROCEDURE pa_UpdateAutor;

call pa_UpdateAutor(7,'Autor1','Autor1','Autor1','Autor1','Olivo del Libro #123','México','Guanajuato','León','37140',
'Masculino','FOT002','4771965363','Autor1@gmail.com','2000-01-01');
call pa_UpdateAutor(8,'Autor2','Autor2','Autor2','Autor2','Olivo del Libro #123','México','Guanajuato','León','37140',
'Masculino','FOT002','4771965363','Autor2@gmail.com','2000-01-02');
call pa_UpdateAutor(9,'Autor3','Autor3','Autor3','Autor3','Olivo del Libro #123','México','Guanajuato','León','37140',
'Masculino','FOT002','4771965363','Autor3@gmail.com','2000-01-03');

select * from Persona;

-- UPDATE LIBRO --
delimiter $
create procedure pa_UpdateLibro(
libroID_ INT,
titulo_ VARCHAR(100),
añoPublicacion_ DATE,
edicion_ VARCHAR(40),
sinopsis_ VARCHAR(500),
fotografia_ LONGTEXT,
generoID_ INT,
editorialID_ INT,
autorID_ INT
)
begin
	update Libro
    set titulo=titulo_, añoPublicacion=añoPublicacion_, edicion=edicion_, sinopsis=sinopsis_, fotografia= fotografia_, generoID=generoID_, editorialID=editorialID_, autorID=autorID_
    where libroID=libroID_;
end; $
delimiter ;
-- drop procedure pa_UpdateLibro;
select * from Libro;
call pa_UpdateLibro(1,'Titulo_Libro1','20-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO','FO0002',1,1,1);
call pa_UpdateLibro(2,'Titulo_Libro2','20-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO','FO0002',1,1,1);
call pa_UpdateLibro(3,'Titulo_Libro3','20-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO','FO0002',2,2,1);
select * from libro;
-- UPDATE Ejemplar --
delimiter $
create procedure pa_UpdateEjemplar(
ejemplarID_ INT,
ISBN_ VARCHAR(20),
libroID_ INT
)
begin
	update Ejemplar
    set ISBN=ISBN_, libroID=libroID_
	where ejemplarID=ejemplarID_;
end; $
delimiter ;
-- drop procedure pa_UpdateEjemplar;

call pa_UpdateEjemplar(1,'8497364575',1);
call pa_UpdateEjemplar(2,'2497444575',2);
call pa_UpdateEjemplar(3,'9944364575',3);
select * from Ejemplar;

select * from Persona;
-- UPDATE AUTOR --
delimiter $
create procedure pa_UpdateAutor(
personaID_ INT,
primer_nom_ Varchar(15),
segundo_nom_ Varchar(15),
apellidoP_ Varchar(15),
apellidoM_ Varchar(15),

domicilio_ Varchar(100),
pais_ Varchar(20),
estado_ Varchar(20),
ciudad_ Varchar(20),
codPostal_ Varchar(10),

genero_ Varchar(10),
fotografia_ LONGTEXT,
telefono_ Varchar(21),
email_ Varchar(100),
fechaNacimiento_ DATE
)
begin
	Update Persona
	set primer_nom=primer_nom_, segundo_nom=segundo_nom_, apellidoP=apellidoP_, apellidoM=apellidoM_, domicilio=domicilio_, pais=pais_, estado=estado_, ciudad=ciudad_, codPostal=codPostal_, genero=genero_, fotografia=fotografia_, telefono=telefono_, email=email_, fechaNacimiento=fechaNacimiento_
	where personaID=personaID_;
end;  $
delimiter ;
-- DROP PROCEDURE pa_UpdateAutor;

call pa_UpdateAutor(7,'Autor1','Autor1','Autor1','Autor1','Olivo del Libro #123','México','Guanajuato','León','37140',
'Masculino','FOT002','4771965363','Autor1@gmail.com','2000-01-01');
call pa_UpdateAutor(8,'Autor2','Autor2','Autor2','Autor2','Olivo del Libro #123','México','Guanajuato','León','37140',
'Masculino','FOT002','4771965363','Autor2@gmail.com','2000-01-02');
call pa_UpdateAutor(9,'Autor3','Autor3','Autor3','Autor3','Olivo del Libro #123','México','Guanajuato','León','37140',
'Masculino','FOT002','4771965363','Autor3@gmail.com','2000-01-03');

select * from Persona;

-- UPDATE LIBRO --
delimiter $
create procedure pa_UpdateLibro(
libroID_ INT,
titulo_ VARCHAR(100),
añoPublicacion_ DATE,
edicion_ VARCHAR(40),
sinopsis_ VARCHAR(500),
fotografia_ LONGTEXT,
generoID_ INT,
editorialID_ INT,
autorID_ INT
)
begin
	update Libro
    set titulo=titulo_, añoPublicacion=añoPublicacion_, edicion=edicion_, sinopsis=sinopsis_, fotografia= fotografia_, generoID=generoID_, editorialID=editorialID_, autorID=autorID_
    where libroID=libroID_;
end; $
delimiter ;
-- drop procedure pa_UpdateLibro;
select * from Libro;
call pa_UpdateLibro(1,'Titulo_Libro1','20-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO','FO0002',1,1,1);
call pa_UpdateLibro(2,'Titulo_Libro2','20-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO','FO0002',1,1,1);
call pa_UpdateLibro(3,'Titulo_Libro3','20-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO','FO0002',2,2,1);
select * from Libro;
-- UPDATE Ejemplar --
delimiter $
create procedure pa_UpdateEjemplar(
ejemplarID_ INT,
ISBN_ VARCHAR(20),
libroID_ INT
)
begin
	update Ejemplar
    set ISBN=ISBN_, libroID=libroID_
	where ejemplarID=ejemplarID_;
end; $
delimiter ;
-- drop procedure pa_UpdateEjemplar;

call pa_UpdateEjemplar(1,'8497364575',1);
call pa_UpdateEjemplar(2,'2497444575',2);
call pa_UpdateEjemplar(3,'9944364575',3);
select * from Ejemplar;

select * from Persona;




