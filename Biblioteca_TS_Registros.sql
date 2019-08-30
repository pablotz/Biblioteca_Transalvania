-- REGISTROS DE CADA TABLA --
use Biblioteca_TS;
select * from Libro where generoID = 6;
Select * from Genero;
select * from Libro where generoID = 3 and estadoLibro = true;
select * from Usuario;
Update Ejemplar 
set estadoEjemplarID = 2
where ejemplarID = 33;

select * from Usuario;

select r.reservacionID, l.titulo, af.afiliadoID, per.primer_nom, per.segundo_nom, per.apellidoP, per.apellidoM, r.ejemplarID, 
                        l.ISBN, r.fechaResInicio, r.fechaResTermino
                        from Reservacion as r inner join Ejemplar as e on (r.ejemplarID = e.ejemplarID)
                        inner join Libro as l on (l.libroID=e.libroID)
                        inner join Afiliado as af on (r.afiliadoID = af.afiliadoID) 
                        inner join Persona as per on (af.personaID = per.personaID) where fechaResInicio like concat('%',curdate(),'%') and e.estadoEjemplarID;



select r.reservacionID, l.titulo, af.afiliadoID, per.primer_nom, per.segundo_nom, per.apellidoP, per.apellidoM, r.ejemplarID,
l.ISBN, r.fechaResInicio, r.fechaResTermino
from Reservacion as r inner join Ejemplar as e on (r.ejemplarID = e.ejemplarID)
inner join Libro as l on (l.libroID=e.libroID)
inner join Usuario as us on (r.usuarioID = us.usuarioID)
inner join Afiliado as af on (af.usuarioID = us.usuarioID)
inner join Persona as per on (af.personaID = per.personaID) where r.fechaResInicio like concat('%',curdate(),'%') and e.estadoEjemplarID=2;

select u.usuarioID, u.usuario, u.contrasena, u.tipo, a.afiliadoID, e.empleadoID from Usuario as u
left join Afiliado as a on(a.usuarioID = u.usuarioID)
left join Empleado as e on(e.usuarioID = u.usuarioID) 
inner join Persona as pe on (a.personaID=pe.personaID or e.personaID=pe.personaID);

-- ESTADOS DE ELIMINACION PERSONA --
/*
Insert into estadoPersona(estado) values(TRUE); -- ACTIVO --
Insert into estadoPersona(estado) values(False); -- ELIMINADO --
select * from estadoPersona;

-- Roles del Empleado --
Insert into rolEmpleado(Rol) values('Administrador');
Insert into rolEmpleado(Rol) values('Bibliotecario');
select * from rolEmpleado;
Delete from rolEmpleado where rolID = 1;
-- Estados de un Afiliado --
Insert into estadoAfiliado(estadoAfiliado) values('Activo');
Insert into estadoAfiliado(estadoAfiliado) values('Dado de baja');
Insert into estadoAfiliado(estadoAfiliado) values('Penalizado');

-- GENEROS --
Insert into Genero(genero) values('Acción');
Insert into Genero(genero) values('Artes');
Insert into Genero(genero) values('Suspenso');
Insert into Genero(genero) values('Lenguaje Extranjera');
Insert into Genero(genero) values('Los más solicitados');
Insert into Genero(genero) values('Recomendados');
*/
-- EDITORIALES --
Insert into Editorial(nombre) values('Panini');
Insert into Editorial(nombre) values('Vertigo');
Insert into Editorial(nombre) values('Backlist');
Insert into Editorial(nombre) values('Norma');
Insert into Editorial(nombre) values('Disney');
Insert into Editorial(nombre) values('Austral');
/*
-- GENEROS --
Insert into Genero(genero) values('Acción');
Insert into Genero(genero) values('Artes');
Insert into Genero(genero) values('Suspenso');
Insert into Genero(genero) values('Lenguaje Extranjera');
Insert into Genero(genero) values('Los más solicitados');
Insert into Genero(genero) values('Recomendados');

-- ESTADOS EJEMPLAR --
Insert into estadoEjemplar(estadoA) values('Disponible');
Insert into estadoEjemplar(estadoA) values('Reservado');
Insert into estadoEjemplar(estadoA) values('Prestamo');
Insert into estadoEjemplar(estadoA) values('No entregado');
Insert into estadoEjemplar(estadoA) values('No Disponible');
*/
-- EJECUTAR PROCEDIMIENTOS DE INSERT PARA EL CORRECTO FUNCIONAMIENTO DE LAS SENTENCIAS CALL --
-- REGISTROS EMPLEADO --
call pa_InsertarEmpleado("Pedro","Iván","Martínez","López","Olivo del Valle #211, Valle de León","México","Guanajuato","León",33257,
'Masculino','FOT001','4771965363','pedroI@gmail.com','1996-10-26',1,'pedroIvan','password');
call pa_InsertarEmpleado("Carlos","Vicente","Lara","González","Alamo del valle #351, Valle de León","México","Guanajuato","León",33568,
'Masculino','FOT002','4771962663','carlosV@gmail.com','1995-06-25',1,'carlosVicente','password2');
call pa_InsertarEmpleado("Luis","Victor","Martínez","Ávila","Alamo del valle #843, Valle de León","México","Guanajuato","León",23014,
'Masculino','FOT003','4771435363','luisV@gmail.com','1999-04-10',1,'luisVictor','password3');
call pa_InsertarEmpleado("Karla","Areceli","Hernández","Martínez","Pirul del valle #643, Valle de León","México","Guanajuato","León",21100,
'Femenino','FOT004','4771555363','karlaA@gmail.com','2000-03-11',1,'karlaAreceli','password4');
call pa_InsertarEmpleado("Mauricio","Moises","Ávila","Lara","Alameda del valle #546, Valle de León","México","Guanajuato","León",24668,
'Masculino','FOT005','4771875363','mauricioM@gmail.com','1998-02-14',1,'mauricioMoises','password5');
call pa_InsertarEmpleado("Gabriela","Araceli","García","Rodríguez","Olivo del valle #843, Valle de León","México","Guanajuato","León",34126,
'Femenino','FOT006','4771876463','gabrielaA@gmail.com','1995-04-29',1,'gabrielaAraceli','password6');
call pa_InsertarEmpleado("Juan","Roberto","García","García","Espinoza del valle #363, Valle de León","México","Guanajuato","León",21330,
'Masculino','FOT007','4771876463','juanR@gmail.com','2000-12-03',1,'juanRoberto','password7');
call pa_InsertarEmpleado("Mauricio","Eduardo","Castillo","Rodríguez","Ombu del valle #386, Valle de León","México","Guanajuato","León",22512,
'Masculino','FOT008','4771879863','mauricioE@gmail.com','1997-12-26',1,'mauricioEduardo','password8');
call pa_InsertarEmpleado("Karla","Nayely","Ávila","González","Avellano del valle #193, Valle de León","México","Guanajuato","León",28474,
'Masculino','FOT009','4771279833','karlaN@gmail.com','1999-05-16',1,'karlaNayely','password9');
call pa_InsertarEmpleado("Pablo","Roberto","Lara","Ávila","Mezquite del Valle #111, Valle de León","México","Guanajuato","León",23054,
'Masculino','FOT011','4772179833','pabloR@gmail.com','2002-06-29',2,'pabloRoberto','password11');
call pa_InsertarEmpleado("Pablo","Vicente","Martínez","González","Mezquite del valle #363, Valle de León","México","Guanajuato","León",23126,
'Masculino','FOT012','4772129833','pabloV@gmail.com','1998-10-25',2,'pabloVicente','password12');
call pa_InsertarEmpleado("Luis","Iván","Castillo","Lara","Ombu del valle #188, Valle de León","México","Guanajuato","León",20853,
'Masculino','FOT013','4772129833','luisI@gmail.com','1996-09-09',2,'luisIván','password13');
call pa_InsertarEmpleado("Juan","Victor","Martínez","González","Alamo del valle #843, Valle de León","México","Guanajuato","León",20169,
'Masculino','FOT014','4772224833','juanV@gmail.com','2003-01-20',2,'juanVictor','password14');
call pa_InsertarEmpleado("Pedro","Arturo","Rodríguez","Martínez","Olivo del Valle #199, Valle de León","México","Guanajuato","León",26477,
'Masculino','FOT015','4772114833','pedroA@gmail.com','2000-02-14',2,'pedroArturo','password15');
call pa_InsertarEmpleado("Pedro","Emmanuel","Martínez","Rodríguez","Lago del valle #234, Valle de los Lagos","México","Guanajuato","León",35751,
'Masculino','FOT016','4771124833','pedroE@gmail.com','2000-11-11',2,'pedroEmmanuel','password16');
call pa_InsertarEmpleado("Alexis","Jesús","Lara","Martínez","Avellano del valle #262, Valle de León","México","Guanajuato","León",32988,
'Masculino','FOT017','4774424833','alexisJ@gmail.com','2000-08-14',2,'alexisJesus','password17');
call pa_InsertarEmpleado("Jose","Vicente","Ávila","López","Alamo del valle #134, Valle de León","México","Guanajuato","León",36278,
'Masculino','FOT018','4774424113','joseV@gmail.com','2003-04-20',2,'joseVicente','password18');
call pa_InsertarEmpleado("Guillermo","Arturo","García","López","Alamo del valle #843, Valle de León","México","Guanajuato","León",26324,
'Masculino','FOT020','4772021113','guillermoA@gmail.com','1996-12-17',2,'guillermoArturo','password20');
call pa_InsertarEmpleado("Pablo","Alejandro","López","Ávila","Olivo del Valle #211, Valle de León","México","Guanajuato","León",36745,
'Masculino','FOT021','4778821113','pabloA@gmail.com','2000-05-19',2,'pabloAlejandro','password21');
call pa_InsertarEmpleado("Gabriela","Jasmine","Rodríguez","Rodríguez","Nispero del valle #564, Valle de León","México","Guanajuato","León",28150,
'Femenino','FOT022','4778824423','gabrielaJ@gmail.com','2003-04-27',2,'gabrielaJasmine','password22');
call pa_InsertarEmpleado("Jasmine","Nayeli","García","López","Mezquite del valle #363, Valle de León","México","Guanajuato","León",34643,
'Femenino','FOT023','4772242213','jasmineN@gmail.com','1996-01-29',2,'jasmineNayeli','password23');
call pa_InsertarEmpleado("Alejandro","Eduardo","Castillo","López","Ombu del valle #134, Valle de León","México","Guanajuato","León",25925,
'Masculino','FOT024','4772211213','alejandroE@gmail.com','1997-03-08',2,'alejandroEduardo','password24');
call pa_InsertarEmpleado("Juan","Alexis","Ávila","Martínez","Mezquite del valle #223, Valle de León","México","Guanajuato","León",27028,
'Masculino','FOT025','4772218813','juanA@gmail.com','1999-06-13',2,'alejandroEduard','password25');
call pa_InsertarEmpleado("Mauricio","Iván","González","González","Avellano del valle #299, Valle de León","México","Guanajuato","León",26941,
'Masculino','FOT026','4772558813','mauricioI@gmail.com','2002-08-03',2,'mauricioI','password26');
call pa_InsertarEmpleado("Alex","Eduardo","Ávila","Castillo","Alamo del valle #221, Valle de León","México","Guanajuato","León",25054,
'Masculino','FOT027','4772558813','alexE@gmail.com','1999-08-20',2,'alexEduard','password27');
call pa_InsertarEmpleado("Guillermo","Eduardo","Ávila","García","Alamo del valle #228, Valle de León","México","Guanajuato","León",35859,
'Masculino','FOT028','4772552913','guillermoE@gmail.com','1998-09-23',2,'gEduardo','password28');
call pa_InsertarEmpleado("Juan","Jesús","Martínez","González","Alamo del valle #647, Valle de León","México","Guanajuato","León",34724,
'Masculino','FOT029','4772558802','juanJ@gmail.com','2001-02-27',2,'JJesus','password29');
call pa_InsertarEmpleado("Mauricio","Daniel","González","López","Alamo del valle #134, Valle de León","México","Guanajuato","León",24778,
'Masculino','FOT030','4772557713','mauricioD@gmail.com','1997-01-10',2,'mauricioDan','password30');
call pa_InsertarEmpleado("Guillermo","Vicente","González","González","Nispero del valle #112, Valle de León","México","Guanajuato","León",22946,
'Masculino','FOT031','4772551113','guillermoV@gmail.com','1997-01-10',2,'gVicente','password31');
call pa_InsertarEmpleado("Paola","Nayeli","Rodríguez","Castillo","Alamo del valle #355, Valle de León","México","Guanajuato","León",36167,
'Femenino','FOT032','4772552713','paolaN@gmail.com','2002-02-01',2,'paolaN','password32');
call pa_InsertarEmpleado("Alejandra","Araceli","Castillo","Castillo","Ombu del valle #224, Valle de León","México","Guanajuato","León",39527,
'Femenino','FOT034','4772552213','alejandraA@gmail.com','1998-05-08',2,'alejandraA','password34');
call pa_InsertarEmpleado("Jose","Javier","Hernández","Hernández","Mezquite del valle #663, Valle de León","México","Guanajuato","León",37636,
'Masculino','FOT035','4772511713','joseJ@gmail.com','1998-09-06',2,'joseJ','password35');
call pa_InsertarEmpleado("Alejandro","Roberto","García","Rodríguez","Mezquite del valle #553, Valle de León","México","Guanajuato","León",24125,
'Masculino','FOT036','4772533713','alejandroR@gmail.com','1995-05-28',2,'alejandroRober','password36');
call pa_InsertarEmpleado("Juan","Eduardo","Rodríguez","García","Mezquite del valle #244, Valle de León","México","Guanajuato","León",38337,
'Masculino','FOT037','4772553313','juanE@gmail.com','2001-01-29',2,'juanEduard','password37');
call pa_InsertarEmpleado("Valeria","Paola","Ávila","García","Olivo del Valle #211, Valle de León","México","Guanajuato","León",33645,
'Femenino','FOT038','4772353713','veleriaP@gmail.com','2003-07-07',2,'veleriaP','password38');
call pa_InsertarEmpleado("Alejandro","Alexis","García","López","Nispero del valle #564, Valle de León","México","Guanajuato","León",28042,
'Masculino','FOT039','4774522713','alejandroA@gmail.com','1995-03-25',2,'alejandroAlexis','password39');
call pa_InsertarEmpleado("Jesús","Alberto","Martínez","López","Nispero del valle #464, Valle de León","México","Guanajuato","León",26431,
'Masculino','FOT040','4772550013','jesusA@gmail.com','2003-11-01',2,'jesusAlberto','password40');
call pa_InsertarEmpleado("Pablo","Roberto","Martínez","Lara","Olivo del Valle #161, Valle de León","México","Guanajuato","León",34005,
'Masculino','FOT041','4772097713','pabloR@gmail.com','1999-11-30',2,'pabloRober','password41');
call pa_InsertarEmpleado("Pablo","Javier","Martínez","Martínez","Olivo del Valle #223, Valle de León","México","Guanajuato","León",23730,
'Masculino','FOT042','4772550023','pabloJ@gmail.com','2002-05-15',2,'pabloJavier','password42');
call pa_InsertarEmpleado("Luis","Roberto","Martínez","Ávila","Avellano del valle #262, Valle de León","México","Guanajuato","León",22506,
'Masculino','FOT043','4772599713','luisR@gmail.com','1995-03-13',2,'luisRoberto','password43');
call pa_InsertarEmpleado("Luis","Jesús","Lara","González","Mezquite del valle #221, Valle de León","México","Guanajuato","León",36701,
'Masculino','FOT044','47724477188','luisJ@gmail.com','1987-03-14',2,'luisJesus','password44');
call pa_InsertarEmpleado("Valeria","Ángela","Castillo","Ávila","Avellano del valle #262, Valle de León","México","Guanajuato","León",23343,
'Femenino','FOT045','4772053713','valeriaA@gmail.com','1996-04-15',2,'valeriaAngela','password45');
call pa_InsertarEmpleado("José","Pedro","Martínez","Ávila","Ombu del valle #134, Valle de León","México","Guanajuato","León",23159,
'Masculino','FOT046','4772557004','joseP@gmail.com','1995-08-05',2,'josePedro','password46');
call pa_InsertarEmpleado("Jorge","Vicente","González","Lara","Alameda del valle #212, Valle de León","México","Guanajuato","León",35002,
'Masculino','FOT047','4772237713','jorgeV@gmail.com','2003-06-16',2,'jorgeVicente','password47');
call pa_InsertarEmpleado("Alejandro","Roberto","González","Rodríguez","Avellano del valle #249, Valle de León","México","Guanajuato","León",21282,
'Masculino','FOT048','4773357713','alejandroR@gmail.com','1996-03-08',2,'alejandroRoberto','password48');
call pa_InsertarEmpleado("Karla","Valeria","García","Lara","Olivo del Valle #433, Valle de León","México","Guanajuato","León",25205,
'Femenino','FOT049','4772220013','karlaV@gmail.com','1999-03-14',2,'karlaValeria','password49');
call pa_InsertarEmpleado("Valentina","Paola","López","García","Mezquite del valle #213, Valle de León","México","Guanajuato","León",37035,
'Masculino','FOT050','4774457703','valentinaP@gmail.com','2000-11-03',2,'valentinaPaola','password50');

select * from Empleado;

-- REGISTROS AFILIADOS --

call pa_InsertarAfiliado('Pedro1','Pablo1','Quiroz1','Lara1','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','pedro1@live.com.mx','2000-08-09','pedro1','password');
call pa_InsertarAfiliado('Pedro2','Pablo2','Quiroz2','Lara2','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','pedro2@live.com.mx','2000-08-01','pedro2','password');
call pa_InsertarAfiliado('Pedro2','Pablo3','Quiroz1','Lara1','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','pedro4@live.com.mx','2000-08-02','pedro12','password');
call pa_InsertarAfiliado('Pedro3','Pablo4','Quiroz1','Lara1','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','pedro4@live.com.mx','2000-08-03','pedro3','password');
call pa_InsertarAfiliado('Pedro4','Pablo4','Quiroz1','Lara1','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','pedro4@live.com.mx','2000-08-04','pedro4','password');
call pa_InsertarAfiliado('Pedro5','Pablo5','Quiroz1','Lara1','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','pedro5@live.com.mx','2000-08-05','pedro5','password');
call pa_InsertarAfiliado('Pedro6','Pablo6','Quiroz1','Lara1','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','pedro6@live.com.mx','2000-08-06','pedro6','password');
call pa_InsertarAfiliado('Pedro7','Pablo7','Quiroz1','Lara1','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','pedro7@live.com.mx','2000-08-07','pedro7','password');
call pa_InsertarAfiliado('Pedro8','Pablo8','Quiroz1','Lara1','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','pedro8@live.com.mx','2000-08-08','pedro8','password');
call pa_InsertarAfiliado('Pedro9','Pablo9','Quiroz1','Lara1','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','pedro9@live.com.mx','2000-08-10','pedro9','password');
call pa_InsertarAfiliado('Pedro10','Pablo10','Quiroz1','Lara1','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','pedro10@live.com.mx','2000-08-11','pedro10','password');
call pa_InsertarAfiliado('Pedro11','Pablo11','Quiroz1','Lara1','Olivo del Valle #419','México','Guanajuato','Salamanca','37140',
'Masculino','FOT001','4771965363','pedro11@live.com.mx','2000-08-12','pedro11','password');

-- REGISTROS AUTORES --
call pa_InsertarAutor("Autor1","Autor1","Autor1","Autor1","Olivo del Valle #211, Valle de León","México","Guanajuato","León",33257,
'Masculino','FOT001','4771965363','Autor1@gmail.com','1996-10-26');
call pa_InsertarAutor("Autor2","Autor2","Autor2","Autor2","Alamo del valle #351, Valle de León","México","Guanajuato","León",33568,
'Masculino','FOT002','4771962663','Autor2@gmail.com','1995-06-25');
call pa_InsertarAutor("Autor3","Autor3","Autor3","Autor3","Alamo del valle #843, Valle de León","México","Guanajuato","León",23014,
'Masculino','FOT003','4771435363','Autor3@gmail.com','1999-04-10');
call pa_InsertarAutor("Autor4","Autor4","Autor4","Autor4","Pirul del valle #643, Valle de León","México","Guanajuato","León",21100,
'Femenino','FOT004','4771555363','Autor4@gmail.com','2000-03-11');
call pa_InsertarAutor("Autor5","Autor5","Autor5","Autor5","Alameda del valle #546, Valle de León","México","Guanajuato","León",24668,
'Masculino','FOT005','4771875363','mauricioM@gmail.com','1998-02-14');
call pa_InsertarAutor("Autor6","Autor6","Autor6","Autor6","Olivo del valle #843, Valle de León","México","Guanajuato","León",34126,
'Femenino','FOT006','4771876463','Autor6@gmail.com','1995-04-29');
call pa_InsertarAutor("Autor7","Autor7","Autor7","Autor7","Espinoza del valle #363, Valle de León","México","Guanajuato","León",21330,
'Masculino','FOT007','4771876463','juanR@gmail.com','2000-12-03');
call pa_InsertarAutor("Autor8","Autor8","Autor8","Autor8","Ombu del valle #386, Valle de León","México","Guanajuato","León",22512,
'Masculino','FOT008','4771879863','mauricioE@gmail.com','1997-12-26');
call pa_InsertarAutor("Autor9","Autor9","Autor9","Autor9","Avellano del valle #193, Valle de León","México","Guanajuato","León",28474,
'Masculino','FOT009','4771279833','Autor9@gmail.com','1999-05-16');
call pa_InsertarAutor("Autor10","Autor10","Autor10","Autor10","Avellano del valle #193, Valle de León","México","Guanajuato","León",28474,
'Masculino','FOT010','4771479833','Autor10@gmail.com','1999-05-16');
call pa_InsertarAutor("Autor11","Autor11","Autor11","Autor11","Mezquite del Valle #111, Valle de León","México","Guanajuato","León",23054,
'Masculino','FOT011','4772179833','Autor11@gmail.com','2002-06-29');
call pa_InsertarAutor("Autor12","Autor12","Autor12","Autor12","Mezquite del valle #363, Valle de León","México","Guanajuato","León",23126,
'Masculino','FOT012','4772129833','Autor12@gmail.com','1998-10-25');
call pa_InsertarAutor("Autor13","Autor13","Autor13","Autor13","Ombu del valle #188, Valle de León","México","Guanajuato","León",20853,
'Masculino','FOT013','4772129833','Autor13@gmail.com','1996-09-09');
call pa_InsertarAutor("Autor14","Autor14","Autor14","Autor14","Alamo del valle #843, Valle de León","México","Guanajuato","León",20169,
'Masculino','FOT014','4772224833','Autor14@gmail.com','2003-01-20');
call pa_InsertarAutor("Autor15","Autor15","Autor15","Autor15","Olivo del Valle #199, Valle de León","México","Guanajuato","León",26477,
'Masculino','FOT015','4772114833','Autor15@gmail.com','2000-02-14');
call pa_InsertarAutor("Autor16","Autor16","Autor16","Autor16","Lago del valle #234, Valle de los Lagos","México","Guanajuato","León",35751,
'Masculino','FOT016','4771124833','Autor16@gmail.com','2000-11-11');
call pa_InsertarAutor("Autor17","Autor17","Autor17","Autor17","Avellano del valle #262, Valle de León","México","Guanajuato","León",32988,
'Masculino','FOT017','4774424833','Autor17@gmail.com','2000-08-14');
call pa_InsertarAutor("Autor18","Autor18","Autor18","Autor18","Alamo del valle #134, Valle de León","México","Guanajuato","León",36278,
'Masculino','FOT018','4774424113','joseV@gmail.com','2003-04-20');
call pa_InsertarAutor("Autor19","Autor19","Autor19","Autor19","Nispero del valle #564, Valle de León","México","Guanajuato","León",26033,
'Masculino','FOT019','4774422213','Autor19@gmail.com','2002-10-22');
call pa_InsertarAutor("Autor20","Autor20","Autor20","Autor20","Alamo del valle #843, Valle de León","México","Guanajuato","León",26324,
'Masculino','FOT020','4772021113','Autor20@gmail.com','1996-12-17');
call pa_InsertarAutor("Autor21","Autor21","Autor21","Autor21","Olivo del Valle #211, Valle de León","México","Guanajuato","León",36745,
'Masculino','FOT021','4778821113','Autor21@gmail.com','2000-05-19');
call pa_InsertarAutor("Autor22","Autor22","Autor22","Autor22","Nispero del valle #564, Valle de León","México","Guanajuato","León",28150,
'Femenino','FOT022','4778824423','Autor22@gmail.com','2003-04-27');
call pa_InsertarAutor("Autor23","Autor23","Autor23","Autor23","Mezquite del valle #363, Valle de León","México","Guanajuato","León",34643,
'Femenino','FOT023','4772242213','Autor23@gmail.com','1996-01-29');
call pa_InsertarAutor("Autor24","Autor24","Autor24","Autor24","Ombu del valle #134, Valle de León","México","Guanajuato","León",25925,
'Masculino','FOT024','4772211213','Autor24@gmail.com','1997-03-08');
call pa_InsertarAutor("Autor25","Autor25","Autor25","Autor25","Mezquite del valle #223, Valle de León","México","Guanajuato","León",27028,
'Masculino','FOT025','4772218813','juanA@gmail.com','1999-06-13');


select * from Autor;
select * from Persona;

-- REGISTROS LIBROS --
call pa_InsertarLibro('Tiiiitulo_Libro1','2000-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO','FO0001','8097',1,1,1);
call pa_InsertarLibro('Tiiiitulo_Libro2','2018-05-04','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 2','FO0002','9086',1,1,1);
call pa_InsertarLibro('Tiiiitulo_Libro3','2019-03-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 3','FO0003','5697',2,2,1);
call pa_InsertarLibro('Tiiiitulo_Libro4','2000-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 4','FO0001','1017',1,2,2);
call pa_InsertarLibro('Tiiiitulo_Libro5','2018-05-04','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 5','FO0002','8917',2,2,2);
call pa_InsertarLibro('Tiiiitulo_Libro6','2019-03-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 6','FO0003','1074',2,2,1);
call pa_InsertarLibro('Tiiiitulo_Libro7','2000-04-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 7','FO0001','0101',1,2,1);
call pa_InsertarLibro('Tiiiitulo_Libro8','2018-06-04','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 8','FO0002','1076',1,2,1);
call pa_InsertarLibro('Tiiiitulo_Libro9','2019-08-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 9','FO0003','5643',3,1,1);
call pa_InsertarLibro('Tiiiitulo_Libro10','2000-05-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 10','FO0001','1643742',2,2,1);
call pa_InsertarLibro('Tiiiitulo_Libro11','2018-05-04','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 11','FO0002','1917521',3,2,1);
call pa_InsertarLibro('Tiiiitulo_Libro12','2019-06-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 12','FO0003','2781123',3,1,1);
call pa_InsertarLibro('Tiiiitulo_Libro13','2000-06-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 13','FO0001','019642',4,2,3);
call pa_InsertarLibro('Tiiiitulo_Libro14','2018-05-04','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 14','FO0002','1923211',2,2,3);
call pa_InsertarLibro('Tiiiitulo_Libro15','2019-03-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 15','FO0003','1222123',3,1,3);
call pa_InsertarLibro('Tiiiitulo_Libro16','2000-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 16','FO0001','45211342',2,2,1);
call pa_InsertarLibro('Tiiiitulo_Libro17','2014-05-04','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 17','FO0002','11021',3,2,3);
call pa_InsertarLibro('Tiiiitulo_Libro18','2015-03-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 18','FO0003','1039214',4,1,2);
call pa_InsertarLibro('Tiiiitulo_Libro19','2004-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 19','FO0001','0682761',2,2,3);
call pa_InsertarLibro('Tiiiitulo_Libro20','2013-05-04','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 20','FO0002','78391627',1,2,3);
call pa_InsertarLibro('Tiiiitulo_Libro21','2012-03-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 21','FO0003','5186131',3,1,1);
call pa_InsertarLibro('Tiiiitulo_Libro22','2009-01-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 22','FO0001','195721',1,2,1);
call pa_InsertarLibro('Tiiiitulo_Libro23','2012-05-04','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 23','FO0002','105821',1,2,2);
call pa_InsertarLibro('Tiiiitulo_Libro24','2014-03-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 24','FO0003','59091',3,1,3);
call pa_InsertarLibro('Tiiiitulo_Libro25','2012-03-05','Primera Edición','LA SIPNOSIS MAS GRANDE DEL MUNDO 25','FO0003','12409610',3,1,3);

-- REGISTROS EJEMPLARES -- 
call pa_InsertarEjemplar(1);
call pa_InsertarEjemplar(2);
call pa_InsertarEjemplar(3);
call pa_InsertarEjemplar(4);
call pa_InsertarEjemplar(5);
call pa_InsertarEjemplar(6);
call pa_InsertarEjemplar(7);
call pa_InsertarEjemplar(8);
call pa_InsertarEjemplar(9);
call pa_InsertarEjemplar(10);
call pa_InsertarEjemplar(11);
call pa_InsertarEjemplar(12);
call pa_InsertarEjemplar(13);
call pa_InsertarEjemplar(13);
call pa_InsertarEjemplar(14);
call pa_InsertarEjemplar(15);
call pa_InsertarEjemplar(16);
call pa_InsertarEjemplar(17);
call pa_InsertarEjemplar(18);
call pa_InsertarEjemplar(19);
call pa_InsertarEjemplar(20);
call pa_InsertarEjemplar(21);
call pa_InsertarEjemplar(22);
call pa_InsertarEjemplar(23);
call pa_InsertarEjemplar(24);
call pa_InsertarEjemplar(25);
