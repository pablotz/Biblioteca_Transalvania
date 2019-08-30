Create Database Biblioteca_TS;
-- drop database Biblioteca_TS;
use Biblioteca_TS;

select * from Libro as l inner join Genero as g on (l.generoID = g.generoID) where g.generoID = 6 and estadoLibro = 1;

select u.usuarioID, u.usuario, u.contrasena, u.tipo, a.afiliadoID, e.empleadoID from Usuario as u
left join Afiliado as a on(a.usuarioID = u.usuarioID)
left join Empleado as e on(e.usuarioID = u.usuarioID);

select l.libroID, l.titulo, l.añoPublicacion, l.edicion, l.sinopsis, l.fotografia, l.ISBN, l.estadoLibro, p.primer_nom, p.segundo_nom, p.apellidoP, p.apellidoM, g.genero, g.generoID, e.nombre, e.editorialID from Libro as l
                        inner join Autor as a on (l.autorID = a.autorID)
                        inner join Persona as p on (a.personaID = p.personaID)
                        inner join Genero as g on (l.generoID = g.generoID)
                        inner join Editorial as e on (l.editorialID = e.editorialID)
						where estadoLibro = 1 and g.generoID = 6;
                         
                         
                         select pe1.primer_nom, pe1.primer_nom, u.usuarioID, u.usuario, u.contrasena, u.tipo, a.afiliadoID, e.empleadoID from Usuario as u
                            left join Afiliado as a on(a.usuarioID = u.usuarioID)
                            left join Empleado as e on(e.usuarioID = u.usuarioID)
                            inner join Persona as pe1 on(a.personaID=pe1.personaID or e.personaID=pe1.personaID);
                            
                            select r.reservacionID, l.titulo, af.afiliadoID, per.primer_nom, per.segundo_nom, per.apellidoP, per.apellidoM, r.ejemplarID,
                        l.ISBN, r.fechaResInicio, r.fechaResTermino
                        from Reservacion as r inner join Ejemplar as e on (r.ejemplarID = e.ejemplarID)
                        inner join Libro as l on (l.libroID=e.libroID)
                        inner join Usuario as us on (r.usuarioID = us.usuarioID)
                        inner join Afiliado as af on (af.usuarioID = us.usuarioID)
                        inner join Persona as per on (af.personaID = per.personaID);
                        
                        select * from Libro;
                        select * from Usuario;
SET GLOBAL sql_mode = '';

select * from Ejemplar;
SELECT * FROM Usuario;

select * from Libro where estadoLibro = true order by rand();
select * from Usuario;
-- TABLA PARA LA ELIMINACION DE PERSONA

create table estadoPersona(
 estadoPID INT auto_increment not null,
 estado boolean,
 Constraint primary key Pk_estadoPID (estadoPID)
);


-- ESTADOS DE ELIMINACION PERSONA --
Insert into estadoPersona(estado) values(TRUE); -- ACTIVO --
Insert into estadoPersona(estado) values(False); -- ELIMINADO --
select * from estadoPersona;


-- La tabla Persona hace herencia a tabla Afiliado, Autor y Empleado --
create table Persona(
personaID INT auto_increment not null,
primer_nom Varchar(15),
segundo_nom Varchar(15),
apellidoP Varchar(15),
apellidoM Varchar(15),
domicilio Varchar(100),
pais Varchar(100),
estado Varchar(100),
ciudad Varchar(100),
codPostal Varchar(10),
genero Varchar(10),
fotografia LONGTEXT,
telefono Varchar(21),
email Varchar(100),
fechaNacimiento DATE,
fechaRegistro DATE,
estadoPID INT not null,
Constraint primary key Pk_personaID (personaID),
Constraint FOREIGN KEY Fk_Persona_estadoPID (estadoPID) REFERENCES estadoPersona(estadoPID)
);

-- Establece si est Empleado o Afiliado, además de que asigna su usuario y contraseña --
CREATE TABLE Usuario(
usuarioID INT auto_increment not null,
usuario VARCHAR(50) unique,
contrasena VARCHAR(50),
tipo VARCHAR(50),
Constraint primary key PK_usuarioID (usuarioID)
);

-- Esta Tabla establece si el empleado es Bibliotecario o Administrador --
CREATE TABLE rolEmpleado(
rolID INT auto_increment not null,
Rol VARCHAR(30),
Constraint primary key PK_rolID (rolID)
);

-- Roles del Empleado --
Insert into rolEmpleado(Rol) values('Administrador');
Insert into rolEmpleado(Rol) values('Bibliotecario');
select * from rolEmpleado;

CREATE TABLE Empleado(
empleadoID INT auto_increment not null,
usuarioID INT not null,
rolID INT not null,
personaID INT not null,
constraint primary key Pk_empleadoID (empleadoID),
constraint foreign key Fk_Empleado_usuarioID (usuarioID) references Usuario(usuarioID),
constraint foreign key Fk_Empleado_rolID (rolID) references rolEmpleado(rolID),
constraint foreign key  Fk_Empleado_personaID (personaID) references Persona(personaID)
);

-- Estados que un Afiliado puede tener: Dado de baja; Activo; Penalizado --
CREATE TABLE estadoAfiliado(
estadoAfiliadoID INT auto_increment not null,
estadoAfiliado VARCHAR(30),
constraint primary key Pk_estadoAfiliadoID(estadoAfiliadoID)
);


-- Estados de un Afiliado
Insert into estadoAfiliado(estadoAfiliado) values('Activo');
Insert into estadoAfiliado(estadoAfiliado) values('Dado de baja');
Insert into estadoAfiliado(estadoAfiliado) values('Penalizado');


CREATE TABLE Afiliado(
afiliadoID INT auto_increment not null,
usuarioID INT not null,
personaID INT not null,
estadoAfiliadoID INT not null,
constraint primary key Pk_afiliadoID(afiliadoID),
constraint foreign key Fk_Afiliado_usuarioID (usuarioID) references Usuario(usuarioID),
constraint foreign key Fk_Afiliado_personaID(personaID) references Persona(personaID),
constraint foreign key Fk_Afiliado_estadoAfiliadoID (estadoAfiliadoID) references estadoAfiliado(estadoAfiliadoID)
);

CREATE TABLE Autor(
autorID INT auto_increment not null,
personaID INT not null,
constraint primary key Pk_autorID (autorID),
constraint foreign key Fk_Autor_personaID(personaID) references Persona(personaID)
);

-- Tabla donde se registran los generos de un Libro
CREATE TABLE Genero(
generoID INT auto_increment not null,
genero VARCHAR(40),
constraint primary key Pk_generoID(generoID)
);


-- GENEROS --
Insert into Genero(genero) values('Acción');
Insert into Genero(genero) values('Artes');
Insert into Genero(genero) values('Suspenso');
Insert into Genero(genero) values('Lenguaje Extranjera');
Insert into Genero(genero) values('Los más solicitados');
Insert into Genero(genero) values('Recomendados');


-- Tabla donde se registran las editoriales de un Libro
CREATE TABLE Editorial(
editorialID INT auto_increment not null,
nombre VARCHAR(100),
constraint primary key Pk_editorialID(editorialID)
);


-- EDITORIALES --
Insert into Editorial(nombre) values('Panini');
Insert into Editorial(nombre) values('Vertigo');


CREATE TABLE Libro(
libroID INT auto_increment not null,
titulo VARCHAR(100),
añoPublicacion DATE,
edicion VARCHAR(40),
sinopsis VARCHAR(500),
fotografia LONGTEXT,
ISBN VARCHAR(20),
estadoLibro boolean,
generoID INT not null,
editorialID INT not null,
autorID INT not null,
constraint primary key Pk_libroID(libroID),
constraint foreign key Fk_Libro_generoID(generoID) references Genero(generoID),
constraint foreign key Fk_Libro_editorialID(editorialID) references Editorial(editorialID),
constraint foreign key Fk_Libro_autorID(autorID) references Autor(autorID)
);

-- Tabla donde se registran estados de un Ejemplar: Disponible; Reservado; Prestamo; No entregado; No disponible --
CREATE TABLE estadoEjemplar(
estadoEjemplarID INT auto_increment not null,
estadoA VARCHAR(30),
constraint primary key Pk_estadoEjemplarID(estadoEjemplarID)
);


-- ESTADOS EJEMPLAR
Insert into estadoEjemplar(estadoA) values('Disponible');
Insert into estadoEjemplar(estadoA) values('Reservado');
Insert into estadoEjemplar(estadoA) values('Prestamo');
Insert into estadoEjemplar(estadoA) values('No entregado');
Insert into estadoEjemplar(estadoA) values('No Disponible');


CREATE TABLE Ejemplar(
ejemplarID INT auto_increment not null,
estadoEjemplarID INT not null,
libroID INT not null,
constraint primary key Pk_ejemplarID(ejemplarID),
constraint foreign key Fk_Ejemplar_estadoEjemplarID(estadoEjemplarID) references estadoEjemplar(estadoEjemplarID),
constraint foreign key Fk_Ejemplar_libroID(libroID) references Libro(libroID)
);

CREATE TABLE Prestamo(
prestamoID INT auto_increment not null,
fechaPresInicio DATETIME,
fechaPresTermino DATETIME,
fechaEntregaPres DATETIME,
empleadoID INT not null,
ejemplarID INT not null,
afiliadoID INT not null,
constraint primary key Pk_prestamoID(prestamoID),
constraint foreign key Fk_Prestamo_empleadoID(empleadoID) references Empleado(empleadoID),
constraint foreign key Fk_Prestamo_ejemplarID(ejemplarID) references Ejemplar(ejemplarID),
constraint foreign key Fk_Prestamo_afiliadoID(afiliadoID) references Afiliado(afiliadoID)
);

CREATE TABLE Reservacion(
reservacionID INT auto_increment not null,
fechaResInicio DATETIME,
fechaResTermino DATETIME,
ejemplarID INT not null,
usuarioID INT not null,
constraint primary key Pk_reservacionID(reservacionID),
constraint foreign key Fk_Reservacion_ejemplarID(ejemplarID) references Ejemplar(ejemplarID),
constraint foreign key Fk_Reservacion_usuarioID(usuarioID) references Usuario(usuarioID)
);
-- Tabla donde se registran los comentarios sobre un libro en el sitio --
CREATE TABLE Comentar(
comentarioID INT auto_increment not null,
comentario VARCHAR(250),
fechaComentario DATE,
libroID INT not null,
afiliadoID INT not null,
constraint primary key Pk_comentarioID(comentarioID),
constraint foreign key Fk_Comentar_libroID(libroID) references Libro(libroID),
constraint foreign key Fk_Comentar_afiliadoID(afiliadoID) references Afiliado(afiliadoID)
);
-- Tabla donde se registran las calificaciones sobre un libro en el sitio --
CREATE TABLE Calificar(
calificarID INT auto_increment not null,
calificacion INT,
fechaCalificar DATE,
libroID INT not null,
afiliadoID INT not null,
constraint primary key Pk_calificarID(calificarID),
constraint foreign key Fk_Calificar_libroID(libroID) references Libro(libroID),
constraint foreign key Fk_Calificar_afiliadoID(afiliadoID) references Afiliado(afiliadoID)
);



