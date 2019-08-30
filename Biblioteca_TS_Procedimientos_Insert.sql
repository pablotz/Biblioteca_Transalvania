-- Biblioteca_TS_Procedimientos_Insert
use Biblioteca_TS;

-- INSERTAR EMPLEADO -- 
delimiter $
create procedure pa_InsertarEmpleado(
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
	set @personaID_ = last_insert_id();
    insert into Usuario(usuario, contrasena, tipo) values (usuario_, contrasena_, 'Empleado');
    set @usuarioID_= last_insert_id();
    insert into Empleado(usuarioID, rolID, personaID) values(@usuarioID_, rolID_, @personaID_);
    
   
end; $
delimiter ;
-- drop procedure pa_InsertarEmpleado;

call pa_InsertarEmpleado('Juan','Popeye','Garca','Lore','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','peri_ql@live.com.mx','2000-08-09','1','JuannGarcia','password');
call pa_InsertarEmpleado('Guillermo','','del Noro','Gómez','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771235363','guillermodelT@live.com.mx','2000-08-09','1','guillermoDelToro','password2');
call pa_InsertarEmpleado('Manuel','Cande','Gutierrez','Palacios','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4776549977','manuelC@live.com.mx','2000-08-09','1','manuelCalendario','password');

select * from Persona;
select * from Usuario;
select * from Empleado;

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
	set @personaID_ = last_insert_id();
    insert into Usuario(usuario, contrasena, tipo) values (usuario_, contrasena_, 'Afiliado');
    set @usuarioID_= last_insert_id();
    insert into Afiliado(usuarioID, personaID, estadoAfiliadoID) values(@usuarioID_, @personaID_, 1);
    
	
end; $
delimiter ;
-- drop procedure pa_InsertarAfiliado;

call pa_InsertarAfiliado('Alejandroooooo','','González ','Iñárritu','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','alejandro@live.com.mx','2000-08-09','alejandroGonzalees','password');
call pa_InsertarAfiliado('Juliannnnn','Porte','Casablanca','Ezpiniza','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','julianP@live.com.mx','2000-08-09','julianPorte','password');
call pa_InsertarAfiliado('John','Pedro','Luna','Flores','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','JuanP@live.com.mx','2000-08-09','JuanRulfooo','password');

select * from Usuario;
select * from Afiliado as a inner join Usuario as u on (a.usuarioID = u.usuarioID);
select * from Afiliado as a inner join Persona as p on (a.personaID = p.personaID) inner join Usuario as u on (a.usuarioID = u.usuarioID) where u.tipo ='Afiliado';
select * from Afiliado as a inner join Usuario as u on (a.usuarioID = u.usuarioID) where u.tipo ='Afiliado';
select * from Persona;

-- INSERTAR AUTOR ---
delimiter $
create procedure pa_InsertarAutor(
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
fechaNacimiento_ DATE

)
begin
	insert into Persona(primer_nom, segundo_nom, apellidoP, apellidoM, domicilio, pais, estado, ciudad, codPostal, genero, fotografia, telefono, email, fechaNacimiento, fechaRegistro, estadoPID) 
	values(primer_nom_, segundo_nom_, apellidoP_, apellidoM_, domicilio_, pais_, estado_, ciudad_, codPostal_, genero_, fotografia_, telefono_, email_, fechaNacimiento_, now(),1);
    set @personaID_ = last_insert_id();
    insert into Autor(personaID) values(@personaID_);

end; $
delimiter ;
-- drop procedure pa_InsertarAutor;

call pa_InsertarAutor('Autor1111','Autor1111','Autor1111','Autor1111','Olivo del Libro #123','México','Guanajuato','León','37140',
'Masculino','FOT002','4771965363','Autor1@gmail.com','2000-01-01');
call pa_InsertarAutor('Autor2222','Autor2222','Autor2222','Autor2222','Olivo del Libro #123','México','Guanajuato','León','37140',
'Masculino','FOT002','4771965363','Autor2@gmail.com','2000-01-02');
call pa_InsertarAutor('Autor3333','Autor3333','Autor3333','Autor3333','Olivo del Libro #123','México','Guanajuato','León','37140',
'Masculino','FOT002','4771965363','Autor3@gmail.com','2000-01-03');

select * from Autor;
select * from Persona;

-- INSERTAR LIBRO --
delimiter $
create procedure pa_InsertarLibro(
titulo_ VARCHAR(100),
añoPublicacion_ DATE,
edicion_ VARCHAR(40),
sinopsis_ VARCHAR(500),
fotografia_ LONGTEXT,
ISBN_ VARCHAR(20),
generoID_ INT,
editorialID_ INT,
autorID_ int
)
begin
	insert into Libro(titulo, añoPublicacion, edicion, sinopsis, fotografia, ISBN, estadoLibro, generoID, editorialID, autorID) 
	values(titulo_, añoPublicacion_, edicion_, sinopsis_, fotografia_, ISBN_, true, generoID_, editorialID_, autorID_);
end; $
delimiter ;
-- drop procedure pa_InsertarLibro;

call pa_InsertarLibro('Tiiiitulo_Libro1','2000-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO','FO0001','8497364575',1,1,1);
call pa_InsertarLibro('Tiiiitulo_Libro2','2018-05-04','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 2','FO0002','2497444575',1,1,1);
call pa_InsertarLibro('Tiiiitulo_Libro3','2019-03-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 3','FO0003','9944364575',2,2,1);
select * from Libro;


-- INSERTAR EJEMPLAR --
delimiter $
create procedure pa_InsertarEjemplar(
libroID_ INT
)
begin
	insert into Ejemplar(estadoEjemplarID, libroID) 
	values(1, libroID_);
end; $
delimiter ;
-- drop procedure pa_InsertarEjemplar;

call pa_InsertarEjemplar(36);
call pa_InsertarEjemplar(2);
call pa_InsertarEjemplar(7);
select * from Ejemplar;
SELECT * FROM Usuario;
select * from Libro where estadoLibro = 1;

-- Prueba consulta inner join
select count(ejemplarID), titulo from Ejemplar as e inner join Libro as l on(l.libroID = e.libroID) where e.libroID='1';

-- Prueba consulta para reserva
set @libroID =1;
Select * from Ejemplar as e inner join Libro as l on(e.libroID=l.libroID) where e.libroID = @libroID and e.estadoEjemplarID=1;

-- INSERTAR COMENTARIO --
delimiter $
create procedure pa_InsertarComentario(
comentario_ VARCHAR(250),
libroID_ INT,
afiliadoID_ INT
)
begin
	insert into Comentar(comentario, fechaComentario, libroID, afiliadoID) 
	values(comentario_,now(), libroID_, afiliadoID_);
end; $
delimiter ;
-- drop procedure pa_InsertarComentario;

call pa_InsertarComentario('Hola Mundo, muy bueno el libro: 1', 1, 1);
call pa_InsertarComentario('Hola Mundo, muy mal el libro: 1', 1, 1);
call pa_InsertarComentario('Hola Mundo, me gusto el libro: 1', 1, 1);
select * from Comentar;


-- INSERTAR Calificacion --
delimiter $
create procedure pa_InsertarCalificacion(
calificacion_ INT,
libroID_ INT,
afiliadoID_ INT
)
begin
	insert into Calificar(calificacion, fechaCalificar, libroID, afiliadoID) 
	values(calificacion_,now(), libroID_, afiliadoID_);
end; $
delimiter ;
-- drop procedure pa_InsertarCalificacion;

call pa_InsertarCalificacion(5, 1, 1);
select * from Calificar;



