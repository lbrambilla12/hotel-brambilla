USE hotel;

INSERT INTO nacionalidad (id_nacionalidad, pais) VALUES
(1, 'Argentina'),
(2, 'Brasil'),
(3, 'Chile'),
(4, 'Uruguay'),
(5, 'Paraguay'),
(6, 'Europa'),
(7, 'Otros');

INSERT INTO provincia (id_provincia, nombre) VALUES
(1, 'Buenos Aires'),
(2, 'Catamarca'),
(3, 'Chaco'),
(4, 'Chubut'),
(5, 'Córdoba'),
(6, 'Corrientes'),
(7, 'Entre Ríos'),
(8, 'Formosa'),
(9, 'Jujuy'),
(10, 'La Pampa'),
(11, 'La Rioja'),
(12, 'Mendoza'),
(13, 'Misiones'),
(14, 'Neuquén'),
(15, 'Río Negro'),
(16, 'Salta'),
(17, 'San Juan'),
(18, 'San Luis'),
(19, 'Santa Cruz'),
(20, 'Santa Fe'),
(21, 'Santiago del Estero'),
(22, 'Tierra del Fuego'),
(23, 'Tucumán'),
(24, 'Ciudad Autónoma de Buenos Aires'),
(25, 'Otros');

INSERT INTO ciudad (id_ciudad, nombre, id_provincia) VALUES
(1, 'Buenos Aires', 18),
(2, 'La Plata', 15),
(3, 'Mar del Plata', 22),
(4, 'Bahía Blanca', 9),
(5, 'Tandil', 17),
(6, 'Córdoba Capital', 5),
(7, 'Villa Carlos Paz', 22),
(8, 'Río Cuarto', 19),
(9, 'Rosario', 7),
(10, 'Santa Fe Capital', 13),
(11, 'Rafaela', 23),
(12, 'Mendoza Capital', 17),
(13, 'San Rafael', 2),
(14, 'Godoy Cruz', 14),
(15, 'San Juan', 16),
(16, 'San Luis', 13),
(17, 'Salta Capital', 18),
(18, 'Tartagal', 9),
(19, 'Jujuy Capital', 14),
(20, 'Palpalá', 7),
(21, 'Resistencia', 2),
(22, 'Formosa', 17),
(23, 'Corrientes', 21),
(24, 'Paraná', 9),
(25, 'Concordia', 21),
(26, 'Posadas', 11),
(27, 'Oberá', 9),
(28, 'San Fernando del Valle de Catamarca', 4),
(29, 'Santiago del Estero', 1),
(30, 'La Rioja', 14),
(31, 'San Fernando', 20),
(32, 'Neuquén Capital', 15),
(33, 'Plottier', 6),
(34, 'Río Grande', 20),
(35, 'Río Gallegos', 12),
(36, 'Trelew', 24),
(37, 'Puerto Madryn', 16),
(38, 'Esquel', 23),
(39, 'San Martín de los Andes', 2),
(40, 'El Calafate', 1),
(41, 'Bariloche', 21),
(42, 'Viedma', 4),
(43, 'General Roca', 21),
(44, 'Cipolletti', 12),
(45, 'Villa Mercedes', 22),
(46, 'Ushuaia', 11),
(47, 'Gualeguaychú', 4),
(48, 'Concepción del Uruguay', 2),
(49, 'Mercedes', 15),
(50, 'Chivilcoy', 5),
(51, 'San Nicolás', 17),
(52, 'Zárate', 2),
(53, 'Campana', 22),
(54, 'Junín', 17),
(55, 'Pergamino', 12),
(56, 'Olavarría', 22),
(57, 'Necochea', 22),
(58, 'Azul', 1),
(59, 'Tres Arroyos', 19),
(60, 'San Pedro', 9),
(61, 'Rafaela', 1),
(62, 'Venado Tuerto', 24),
(63, 'Casilda', 5),
(64, 'Villa Constitución', 5),
(65, 'Cañada de Gómez', 18),
(66, 'Esperanza', 21),
(67, 'Villa María', 13),
(68, 'San Francisco', 21),
(69, 'Villa Dolores', 11),
(70, 'Carlos Paz', 23),
(71, 'Bell Ville', 3),
(72, 'Cruz del Eje', 20),
(73, 'Deán Funes', 6),
(74, 'Villa Carlos Paz', 2),
(75, 'Cafayate', 23),
(76, 'Metán', 7),
(77, 'Orán', 3),
(78, 'Pocito', 22),
(79, 'Rawson', 3),
(80, 'Chimbas', 9),
(81, 'Rivadavia', 3),
(82, 'Maipú', 10),
(83, 'Guaymallén', 7),
(84, 'Luján de Cuyo', 12),
(85, 'Las Heras', 1),
(86, 'Godoy Cruz', 10),
(87, 'Malargüe', 17),
(88, 'Montecarlo', 21),
(89, 'Apóstoles', 24),
(90, 'Eldorado', 8),
(91, 'Clorinda', 7),
(92, 'Pirané', 21),
(93, 'Presidencia Roque Sáenz Peña', 14),
(94, 'Villa Ángela', 22),
(95, 'Machagai', 9),
(96, 'Reconquista', 6),
(97, 'Goya', 15),
(98, 'Santo Tomé', 14),
(99, 'Ituzaingó', 20),
(100, 'La Banda', 10),
(101, 'Frías', 16),
(102, 'Añatuya', 24),
(103, 'Termas de Río Hondo', 7),
(104, 'Chos Malal', 18),
(105, 'Zapala', 24),
(106, 'Cutral Có', 12),
(107, 'Centenario', 3),
(108, 'Allen', 7),
(109, 'Villa Regina', 16),
(110, 'Choele Choel', 16),
(111, 'General Acha', 12),
(112, 'Toay', 10),
(113, 'Santa Rosa', 2),
(114, 'Victorica', 22),
(115, 'Trenque Lauquen', 13),
(116, 'Pehuajó', 12),
(117, 'Lincoln', 19),
(118, '9 de Julio', 21),
(119, 'Balcarce', 4),
(120, 'Miramar', 14),
(121, 'Pinamar', 18),
(122, 'Villa Gesell', 4),
(123, 'San Bernardo', 3),
(124, 'Santa Teresita', 1),
(125, 'San Clemente', 2),
(126, 'Rojas', 21),
(127, 'Salto', 10),
(128, 'Baradero', 20),
(129, 'Arrecifes', 14),
(130, 'Colón', 5),
(131, 'Capilla del Monte', 2),
(132, 'La Falda', 10),
(133, 'Jesús María', 11),
(134, 'Alta Gracia', 19),
(135, 'Cosquín', 12),
(136, 'Chilecito', 23),
(137, 'Andalgalá', 20),
(138, 'Tinogasta', 15),
(139, 'San Antonio de los Cobres', 15),
(140, 'Abra Pampa', 14),
(141, 'Tilcara', 5),
(142, 'Humahuaca', 18),
(143, 'Santa Lucía', 9),
(144, '25 de Mayo', 10),
(145, 'Campo Quijano', 23),
(146, 'Las Lomitas', 13),
(147, 'Charata', 24),
(148, 'Gualeguay', 9),
(149, 'Nogoyá', 7),
(150, 'Otros', 25);

INSERT INTO huesped (id_huesped, nombre, apellido, dni, telefono, email, id_nacionalidad, direccion, id_ciudad, fecha_registro, fecha_nacimiento) VALUES
(1, 'Leonel', 'Luján', 99270319, '26 74188076', 'leonel.luján@gmail.com', 6, 'Via José Figuerola 55', 9, '2024-05-23', '1999-10-23'),
(2, 'Yago', 'Mariscal', 99304794, '64 03846074', 'yago.mariscal@gmail.com', 5, 'Calle Celestina Esparza 8 Apt. 99 ', 130, '2025-02-25', '2003-01-31'),
(3, 'Adriana', 'Casas', 99571530, '47 17733025', 'adriana.casas@gmail.com', 2, 'Cuesta Flavia Guillen 2', 63, '2021-07-08', '1993-04-13'),
(4, 'Fernanda', 'Villalba', 99444145, '561 5193422', 'fernanda.villalba@gmail.com', 6, 'Plaza Cintia Ibáñez 5 Piso 4 ', 8, '2023-05-15', '2006-09-13'),
(5, 'Felix', 'Luque', 99360281, '008 3914225', 'felix.luque@gmail.com', 5, 'Pasaje Sebastián Coca 72', 97, '2024-05-23', '1990-05-07'),
(6, 'Bautista', 'Alsina', 99174016, '801 0262584', 'bautista.alsina@gmail.com', 5, 'Cañada de Vicente Macias 16 Puerta 7 ', 104, '2022-03-24', '1987-10-20'),
(7, 'Néstor', 'Duque', 99682421, '28 19684046', 'néstor.duque@gmail.com', 5, 'Urbanización de Adela Caballero 8', 98, '2024-09-28', '1977-09-21'),
(8, 'Ernesto', 'Sobrino', 99102982, '11 60959831', 'ernesto.sobrino@gmail.com', 2, 'Avenida Olimpia Cabañas 7 Puerta 1 ', 28, '2022-04-01', '1959-07-28'),
(9, 'Benjamín', 'Campillo', 99802503, '676 9213080', 'benjamín.campillo@gmail.com', 1, 'Cuesta de Sandalio Taboada 92 Piso 8 ', 136, '2021-02-16', '2003-04-14'),
(10, 'Gracia', 'Torrents', 99197347, '967 7859748', 'gracia.torrents@gmail.com', 4, 'Glorieta Otilia Matas 74 Apt. 74 ', 45, '2021-03-17', '1997-08-18'),
(11, 'René', 'Goicoechea', 99131380, '47 20612252', 'rené.goicoechea@gmail.com', 4, 'Avenida Alejo Marti 2', 133, '2024-07-01', '1950-04-18'),
(12, 'Renato', 'Villalobos', 99507751, '016 5579098', 'renato.villalobos@gmail.com', 3, 'Pasadizo Isaac Collado 39 Apt. 36 ', 48, '2025-03-21', '1990-12-26'),
(13, 'Nicolasa', 'Cisneros', 99805662, '505 8904588', 'nicolasa.cisneros@gmail.com', 2, 'Pasaje Jose Luis Valle 32', 14, '2023-05-12', '1988-04-05'),
(14, 'Manuelita', 'Ugarte', 99336844, '649 0272885', 'manuelita.ugarte@gmail.com', 1, 'Plaza Galo Losa 94 Puerta 5 ', 3, '2021-03-08', '1956-12-22'),
(15, 'Albano', 'Torrijos', 99012966, '28 27371811', 'albano.torrijos@gmail.com', 4, 'Paseo de Héctor Torrens 5 Apt. 40 ', 103, '2022-08-08', '1988-02-25'),
(16, 'Gertrudis', 'Maza', 44821481, '885 0664226', 'gertrudis.maza@gmail.com', 5, 'Plaza Iván Giralt 8', 107, '2021-09-26', '2005-12-18'),
(17, 'Visitación', 'Zamorano', 19511853, '04 20235032', 'visitación.zamorano@gmail.com', 3, 'Calle Olegario Sainz 7 Apt. 74 ', 85, '2020-12-19', '1973-09-19'),
(18, 'Cristina', 'Molins', 43010600, '078 3517408', 'cristina.molins@gmail.com', 4, 'Avenida de José Uría 72', 103, '2022-10-25', '1958-06-27'),
(19, 'Salomé', 'Pedrero', 40830692, '179 6965165', 'salomé.pedrero@gmail.com', 6, 'Cañada de Florencio Cortés 146', 41, '2024-07-23', '2004-10-02'),
(20, 'Alfredo', 'Andrade', 32668005, '583 6374486', 'alfredo.andrade@gmail.com', 6, 'Alameda de José Barceló 69 Apt. 48 ', 18, '2021-09-16', '1980-07-26'),
(21, 'Basilio', 'Urrutia', 18378362, '10 67478883', 'basilio.urrutia@gmail.com', 6, 'Cuesta Josué Tomas 32', 106, '2024-01-06', '1975-02-09'),
(22, 'Rufina', 'Robledo', 7612491, '708 1512559', 'rufina.robledo@gmail.com', 6, 'Alameda de Andrea Prieto 725 Puerta 2 ', 117, '2020-09-12', '1993-10-08'),
(23, 'Corona', 'Mir', 28516886, '629 3187965', 'corona.mir@gmail.com', 2, 'Plaza Haydée Salvà 26 Piso 2 ', 64, '2024-10-19', '1995-05-31'),
(24, 'Feliciano', 'Enríquez', 24584972, '094 0837608', 'feliciano.enríquez@gmail.com', 4, 'Plaza Amancio Redondo 802', 76, '2024-11-03', '2000-08-16'),
(25, 'Lourdes', 'Capdevila', 42011499, '53 35192768', 'lourdes.capdevila@gmail.com', 6, 'Camino de Federico Aller 802', 140, '2021-07-07', '1980-01-17'),
(26, 'Nereida', 'Gras', 34032483, '108 0320721', 'nereida.gras@gmail.com', 5, 'Glorieta Galo Canals 2 Piso 0 ', 74, '2024-05-24', '1997-05-13'),
(27, 'Clara', 'Bauzà', 5316177, '228 3611483', 'clara.bauzà@gmail.com', 2, 'Alameda de Serafina Cisneros 639 Apt. 74 ', 8, '2023-05-18', '1992-03-02'),
(28, 'Caridad', 'Rios', 34548818, '87 46336181', 'caridad.rios@gmail.com', 1, 'Pasadizo Mayte Vendrell 8', 130, '2024-02-06', '1972-04-20'),
(29, 'Sigfrido', 'Marco', 33588559, '506 7874123', 'sigfrido.marco@gmail.com', 2, 'Alameda Andrés Felipe Solana 39 Apt. 40 ', 143, '2023-03-08', '1963-05-15'),
(30, 'Azahara', 'Carrión', 30589539, '19 56757619', 'azahara.carrión@gmail.com', 3, 'Glorieta de Diana Tejedor 982', 52, '2022-05-09', '1994-08-13'),
(31, 'Adriana', 'Viña', 6312754, '049 8949774', 'adriana.viña@gmail.com', 3, 'Callejón de Paulino Nevado 81 Piso 8 ', 42, '2021-01-05', '1950-11-30'),
(32, 'Ángela', 'Alberto', 10151891, '98 45368582', 'ángela.alberto@gmail.com', 7, 'Camino de Amor Céspedes 6 Apt. 00 ', 21, '2023-08-01', '1990-03-16'),
(33, 'Salvador', 'Cornejo', 23591797, '38 35777727', 'salvador.cornejo@gmail.com', 6, 'C. Begoña Marquez 977', 102, '2023-02-02', '1989-12-02'),
(34, 'Susanita', 'Peñas', 38730446, '154 5950536', 'susanita.peñas@gmail.com', 1, 'Vial Joaquín Salinas 26', 54, '2024-01-24', '1972-08-21'),
(35, 'Gaspar', 'Gibert', 35669430, '819 9676793', 'gaspar.gibert@gmail.com', 4, 'Avenida Jonatan Mesa 317', 49, '2020-06-16', '2001-07-19'),
(36, 'Erasmo', 'Montero', 7198691, '67 66600621', 'erasmo.montero@gmail.com', 7, 'Paseo Candelario Rivero 62', 132, '2023-07-10', '1982-01-11'),
(37, 'Telmo', 'Coronado', 6153531, '74 89237511', 'telmo.coronado@gmail.com', 6, 'Via Wilfredo Cortina 85', 19, '2025-02-16', '1996-02-27'),
(38, 'Ileana', 'Gallego', 23026730, '08 14381043', 'ileana.gallego@gmail.com', 3, 'Calle Mirta Ruiz 32 Puerta 4 ', 59, '2021-07-13', '1987-04-01'),
(39, 'Violeta', 'Herrero', 6849589, '54 31014783', 'violeta.herrero@gmail.com', 2, 'Rambla de Aránzazu Peinado 17', 39, '2024-08-29', '2001-08-28'),
(40, 'Alondra', 'Vázquez', 9021753, '41 90685120', 'alondra.vázquez@gmail.com', 4, 'Camino de David Ayllón 10 Puerta 3 ', 22, '2021-08-03', '2005-03-07'),
(41, 'Ana Sofía', 'Chamorro', 33498912, '83 59543459', 'ana sofía.chamorro@gmail.com', 4, 'Rambla de Joel Jaén 6', 67, '2024-06-08', '1958-10-12'),
(42, 'Teodosio', 'Pareja', 36831013, '216 5469122', 'teodosio.pareja@gmail.com', 4, 'Alameda Candelas Barragán 40', 74, '2023-04-15', '1983-07-09'),
(43, 'Rosaura', 'Pol', 44198126, '468 1616139', 'rosaura.pol@gmail.com', 5, 'Alameda de Víctor Velasco 38 Piso 8 ', 125, '2023-02-07', '1952-10-24'),
(44, 'Alberto', 'Lago', 26542965, '730 9681572', 'alberto.lago@gmail.com', 7, 'Vial de Macaria Higueras 241', 68, '2022-10-05', '1962-09-03'),
(45, 'Alcides', 'Esparza', 41608548, '98 04146615', 'alcides.esparza@gmail.com', 6, 'Avenida Fernando Bravo 963 Puerta 5 ', 129, '2020-08-07', '1992-02-14'),
(46, 'Clímaco', 'Company', 10220023, '885 8140866', 'clímaco.company@gmail.com', 2, 'Glorieta Toño Quintanilla 97 Puerta 8 ', 42, '2022-04-26', '1987-08-12'),
(47, 'Loreto', 'Nogueira', 6568702, '24 64003380', 'loreto.nogueira@gmail.com', 3, 'Glorieta Sancho Barrera 86', 8, '2024-01-03', '1952-12-13'),
(48, 'Juan Antonio', 'Urrutia', 6878022, '34 82975002', 'juan antonio.urrutia@gmail.com', 5, 'Glorieta de Reina Sanabria 70 Piso 7 ', 32, '2023-04-27', '1956-02-02'),
(49, 'Simón', 'Nicolau', 13146723, '941 5151029', 'simón.nicolau@gmail.com', 3, 'Urbanización Griselda Jimenez 56', 43, '2024-12-04', '1980-10-15'),
(50, 'Arturo', 'Valls', 36415792, '387 8672039', 'arturo.valls@gmail.com', 7, 'Pasaje de Inmaculada Marqués 80 Puerta 5 ', 105, '2020-06-05', '1982-04-29'),
(51, 'Francisco', 'Saavedra', 15403480, '547 3383589', 'francisco.saavedra@gmail.com', 3, 'Cuesta de Román Santamaria 39 Apt. 01 ', 28, '2021-11-08', '1958-04-04'),
(52, 'Luis Miguel', 'Castro', 43450956, '263 1661505', 'luis miguel.castro@gmail.com', 1, 'Via de Manuela Rodriguez 256', 41, '2021-08-06', '1967-07-25'),
(53, 'Úrsula', 'Neira', 31043372, '41 98943107', 'úrsula.neira@gmail.com', 3, 'Cuesta de Ainoa Nicolau 7', 89, '2023-07-14', '1981-08-13'),
(54, 'Ernesto', 'Cuenca', 41781005, '886 6952592', 'ernesto.cuenca@gmail.com', 5, 'C. Emelina Soriano 8', 62, '2023-09-11', '1986-03-07'),
(55, 'Pastora', 'Cañas', 10656154, '513 0582237', 'pastora.cañas@gmail.com', 5, 'Glorieta de Dalila Calleja 677', 87, '2022-10-02', '1979-06-30'),
(56, 'Hugo', 'Valderrama', 30138288, '683 4906365', 'hugo.valderrama@gmail.com', 6, 'Camino Adriana Larrea 66', 64, '2024-11-29', '1989-10-26'),
(57, 'Sandalio', 'Heredia', 6452173, '156 8621429', 'sandalio.heredia@gmail.com', 2, 'Ronda Haydée Granados 5 Apt. 53 ', 8, '2020-11-20', '2001-11-07'),
(58, 'José Ángel', 'Pedrero', 22869330, '910 7274711', 'josé ángel.pedrero@gmail.com', 4, 'Via de Isaac Escrivá 454', 43, '2020-07-20', '1963-12-12'),
(59, 'Cloe', 'Roig', 23493309, '024 7514032', 'cloe.roig@gmail.com', 3, 'Pasaje Dulce Rodríguez 31', 20, '2020-09-23', '1993-08-04'),
(60, 'Cipriano', 'Gutiérrez', 8434274, '692 2900099', 'cipriano.gutiérrez@gmail.com', 7, 'Glorieta Tere Manjón 472', 83, '2022-09-11', '1989-04-18'),
(61, 'José Ángel', 'Cózar', 5983582, '30 01410305', 'josé ángel.cózar@gmail.com', 6, 'Calle Tito Valera 32', 92, '2024-03-13', '1976-09-18'),
(62, 'Esteban', 'Arrieta', 30060301, '906 7726764', 'esteban.arrieta@gmail.com', 6, 'Rambla de Nidia Rius 97', 4, '2020-12-27', '1994-08-10'),
(63, 'Gervasio', 'Tapia', 6368646, '94 94884529', 'gervasio.tapia@gmail.com', 7, 'Avenida Imelda Giralt 5 Puerta 0 ', 129, '2024-06-04', '1988-12-10'),
(64, 'Reina', 'Almagro', 9347104, '592 0714524', 'reina.almagro@gmail.com', 3, 'Cañada Juan Bautista Cáceres 32 Apt. 51 ', 11, '2023-03-14', '1975-01-01'),
(65, 'Elba', 'Ocaña', 35464231, '43 84917942', 'elba.ocaña@gmail.com', 6, 'Ronda de Dorita Durán 1 Apt. 16 ', 39, '2024-08-23', '1981-11-16'),
(66, 'Elvira', 'Zamorano', 17126647, '67 05458312', 'elvira.zamorano@gmail.com', 1, 'Plaza Ángel Poza 829 Apt. 70 ', 107, '2022-10-20', '1999-11-16'),
(67, 'Susanita', 'Durán', 37580564, '75 81970357', 'susanita.durán@gmail.com', 2, 'Alameda Martín Ferrán 89', 56, '2022-04-19', '1965-11-10'),
(68, 'Zacarías', 'Chacón', 32531188, '005 9107867', 'zacarías.chacón@gmail.com', 6, 'Urbanización de Teófilo Almeida 96 Puerta 0 ', 109, '2021-11-14', '1966-03-27'),
(69, 'Victorino', 'Garcés', 7425108, '93 03168865', 'victorino.garcés@gmail.com', 3, 'Callejón Basilio Torres 9 Piso 7 ', 80, '2022-01-20', '1993-02-28'),
(70, 'Constanza', 'Almansa', 15225252, '704 0527656', 'constanza.almansa@gmail.com', 1, 'Acceso de Rosa Llorens 12 Piso 8 ', 146, '2022-04-09', '1993-10-11'),
(71, 'Elisabet', 'Solana', 35485146, '554 5435775', 'elisabet.solana@gmail.com', 1, 'Via Eutropio Jove 5 Puerta 3 ', 93, '2023-02-28', '1994-09-24'),
(72, 'Régulo', 'Lobato', 22621620, '773 7714969', 'régulo.lobato@gmail.com', 7, 'Urbanización Gerardo Torralba 491 Apt. 93 ', 94, '2022-07-29', '1965-04-09'),
(73, 'Soraya', 'Segura', 16277201, '515 5433447', 'soraya.segura@gmail.com', 5, 'Callejón de Gerónimo Perelló 789 Piso 1 ', 58, '2024-12-13', '1997-08-06'),
(74, 'Agustín', 'Landa', 16400418, '06 41603071', 'agustín.landa@gmail.com', 1, 'Via Timoteo Talavera 192', 78, '2024-12-05', '1991-05-22'),
(75, 'Ciriaco', 'Pujadas', 25996503, '01 26056636', 'ciriaco.pujadas@gmail.com', 7, 'Urbanización de Ricardo Mateu 95 Piso 3 ', 83, '2021-11-21', '2003-02-03'),
(76, 'Irma', 'Barrena', 43527823, '513 4422653', 'irma.barrena@gmail.com', 7, 'Pasaje de María Fernanda Chico 82 Piso 5 ', 67, '2022-07-03', '1981-05-09'),
(77, 'Caridad', 'Céspedes', 35782371, '058 2339666', 'caridad.céspedes@gmail.com', 3, 'Cuesta de Régulo Marti 34', 28, '2022-04-09', '1998-04-05'),
(78, 'María Teresa', 'Amores', 39077435, '793 9630848', 'maría teresa.amores@gmail.com', 1, 'Ronda Vera Cazorla 81 Apt. 15 ', 35, '2021-01-03', '1957-05-29'),
(79, 'Xiomara', 'Mas', 27512209, '409 6832331', 'xiomara.mas@gmail.com', 4, 'Acceso Kike Calderon 747', 81, '2023-12-20', '1983-02-08'),
(80, 'Mireia', 'Alcalá', 22939915, '324 5996336', 'mireia.alcalá@gmail.com', 6, 'Plaza Jenaro Prado 66 Puerta 6 ', 77, '2020-07-06', '1954-03-13'),
(81, 'Herberto', 'Amor', 21363606, '78 83672999', 'herberto.amor@gmail.com', 3, 'Camino Emilia Viana 89', 5, '2023-06-23', '1976-10-07'),
(82, 'Joel', 'Gual', 36014429, '819 2506211', 'joel.gual@gmail.com', 1, 'Acceso de Ricardo Corbacho 36 Apt. 41 ', 99, '2023-11-10', '1961-10-22'),
(83, 'Itziar', 'Burgos', 9810445, '14 83901705', 'itziar.burgos@gmail.com', 3, 'Pasaje de Lope Pinilla 85 Apt. 47 ', 59, '2023-05-10', '1951-07-05'),
(84, 'Jose Carlos', 'Luján', 42084994, '355 2194801', 'jose carlos.luján@gmail.com', 4, 'Avenida de Herberto Expósito 24', 102, '2025-03-03', '1960-01-19'),
(85, 'Rodrigo', 'Puente', 20393543, '606 8274363', 'rodrigo.puente@gmail.com', 1, 'Avenida Teresita Flor 18', 74, '2022-09-09', '1991-07-13'),
(86, 'Ignacio', 'Saura', 13714332, '826 1198831', 'ignacio.saura@gmail.com', 4, 'Ronda Sabina Patiño 72 Apt. 10 ', 16, '2024-03-05', '1983-05-30'),
(87, 'Luna', 'Vidal', 25364617, '60 06806302', 'luna.vidal@gmail.com', 2, 'Pasaje de Anunciación Ariño 11', 60, '2023-11-24', '1995-11-15'),
(88, 'Belen', 'Rius', 20467912, '428 8785055', 'belen.rius@gmail.com', 2, 'Alameda de Corona Casado 49 Apt. 80 ', 36, '2021-10-25', '1951-05-14'),
(89, 'Tristán', 'Ferrándiz', 15322659, '341 1016772', 'tristán.ferrándiz@gmail.com', 7, 'Cuesta Liliana Padilla 5', 39, '2020-10-20', '1953-10-21'),
(90, 'Fulgencio', 'Peñalver', 17627987, '166 0556836', 'fulgencio.peñalver@gmail.com', 7, 'Acceso Demetrio Cifuentes 84', 113, '2023-01-14', '1984-03-10'),
(91, 'Calixto', 'Alegre', 34132860, '88 34870359', 'calixto.alegre@gmail.com', 2, 'Plaza Amor Jurado 56 Puerta 6 ', 34, '2025-01-21', '1958-03-21'),
(92, 'Jonatan', 'Aliaga', 14189294, '87 99115476', 'jonatan.aliaga@gmail.com', 7, 'Rambla Flavio Pombo 17', 141, '2020-11-15', '1957-07-30'),
(93, 'Azahara', 'Linares', 42238338, '951 0942433', 'azahara.linares@gmail.com', 2, 'Pasadizo Armida Boada 19', 30, '2023-06-08', '2005-07-23'),
(94, 'Inmaculada', 'Cerdá', 11041449, '572 8434886', 'inmaculada.cerdá@gmail.com', 7, 'Callejón Martin Torralba 1', 88, '2025-01-22', '1983-12-30'),
(95, 'Josefina', 'Gárate', 30299753, '645 9186530', 'josefina.gárate@gmail.com', 1, 'Urbanización Silvestre Villar 713', 76, '2024-12-26', '1989-01-13'),
(96, 'Purificación', 'Peralta', 11710295, '640 6210585', 'purificación.peralta@gmail.com', 1, 'Acceso Rubén Casals 13 Piso 2 ', 90, '2024-10-07', '1973-03-30'),
(97, 'Ainara', 'Llorens', 28786629, '62 60281777', 'ainara.llorens@gmail.com', 5, 'Ronda Jose Ignacio Hervia 67 Piso 3 ', 71, '2024-07-02', '1963-06-10'),
(98, 'Morena', 'Polo', 39644176, '81 30706305', 'morena.polo@gmail.com', 6, 'Camino Carolina Abril 54 Piso 3 ', 39, '2022-11-16', '1969-07-22'),
(99, 'Fanny', 'Benavides', 37785975, '16 00589770', 'fanny.benavides@gmail.com', 4, 'Calle Lilia Lobo 33 Piso 8 ', 112, '2025-04-23', '1964-08-03'),
(100, 'Tatiana', 'Iñiguez', 21004196, '74 68445835', 'tatiana.iñiguez@gmail.com', 3, 'Urbanización Soledad Linares 47', 20, '2021-03-02', '1988-04-25');

INSERT INTO area (id_area, nombre_area) VALUES
(1, 'Atencion al Cliente'),
(2, 'Limpieza'),
(3, 'Administración'),
(4, 'Mantenimiento'),
(5, 'Gastronomía'),
(6, 'Seguridad'),
(7, 'Servicios'),
(8, 'Recursos Humanos');

INSERT INTO puesto (id_puesto, nombre_puesto, id_area) VALUES
(1, 'Recepcionista', 1),
(2, 'Supervisor de Atención', 1),
(3, 'Encargado de Limpieza', 2),
(4, 'Personal de Limpieza', 2),
(5, 'Administrador General', 3),
(6, 'Asistente Administrativo', 3),
(7, 'Técnico de Mantenimiento', 4),
(8, 'Jefe de Mantenimiento', 4),
(9, 'Chef', 5),
(10, 'Ayudante de Cocina', 5),
(11, 'Mozo', 5),
(12, 'Guardia de Seguridad', 6),
(13, 'Jefe de Seguridad', 6),
(14, 'Masajista', 7),
(15, 'Guía de Actividades', 7),
(16, 'Reclutador', 8),
(17, 'Responsable de Personal', 8);

INSERT INTO empleado (id_empleado, nombre, apellido, dni, direccion, telefono, email, id_puesto, id_ciudad, id_nacionalidad, fecha_nacimiento) VALUES
(1, 'Lara', 'Cano', 99233685, 'Pasaje Hector Riba 7', '65 38193879', 'lara.cano@gmail.com', 17, 42, 6, '1991-03-30'),
(2, 'Luis', 'Zabala', 99872668, 'Via de Miriam Cabañas 9', '899 6556762', 'luis.zabala@gmail.com', 13, 55, 1, '1968-02-04'),
(3, 'Toribio', 'Calatayud', 99026875, 'Glorieta Eva María Lasa 5 Apt. 81 ', '701 8424647', 'toribio.calatayud@gmail.com', 2, 56, 1, '1979-12-07'),
(4, 'Mayte', 'Villalobos', 99721676, 'Callejón de Paula Hernández 56', '453 8288096', 'mayte.villalobos@gmail.com', 8, 133, 1, '1999-01-27'),
(5, 'Lino', 'Mayo', 99946345, 'Callejón Candela Porras 171 Apt. 78 ', '683 0993651', 'lino.mayo@gmail.com', 9, 53, 1, '1971-05-28'),
(6, 'Baldomero', 'Bonet', 11148845, 'Rambla de Fabio Serna 1 Apt. 47 ', '97 91747293', 'baldomero.bonet@gmail.com', 5, 107, 7, '1997-07-17'),
(7, 'Paulino', 'Cabañas', 18051878, 'Camino Cayetano Vallejo 64 Puerta 4 ', '472 0571755', 'paulino.cabañas@gmail.com', 12, 46, 1, '1965-01-11'),
(8, 'Custodio', 'Amo', 38206087, 'Urbanización de Nélida Barrio 3', '837 2379034', 'custodio.amo@gmail.com', 12, 55, 1, '1982-05-23'),
(9, 'Tiburcio', 'Quirós', 36067221, 'Paseo de Aitor Acevedo 1', '75 42320924', 'tiburcio.quirós@gmail.com', 7, 119, 1, '1986-07-15'),
(10, 'Inés', 'Galán', 42992250, 'Ronda de Ariel Muñoz 83 Apt. 99 ', '68 06892353', 'inés.galán@gmail.com', 16, 40, 1, '1968-09-12'),
(11, 'Clementina', 'Bauzà', 6722204, 'Cañada Nicolasa Garay 54 Piso 0 ', '44 18945774', 'clementina.bauzà@gmail.com', 16, 128, 1, '1997-02-13'),
(12, 'Zaira', 'Roura', 32624636, 'Glorieta de Marco Mur 544 Puerta 3 ', '221 8650451', 'zaira.roura@gmail.com', 10, 85, 6, '1992-08-11'),
(13, 'Cloe', 'Granados', 30875935, 'Pasadizo de Gilberto Castells 97 Puerta 0 ', '656 2163302', 'cloe.granados@gmail.com', 16, 48, 1, '1981-04-13'),
(14, 'Fabián', 'Capdevila', 19404080, 'Via de Severiano Valentín 33', '87 45173138', 'fabián.capdevila@gmail.com', 12, 35, 1, '1960-09-03'),
(15, 'Leocadio', 'Colom', 27901121, 'C. de Buenaventura Luna 486 Apt. 07 ', '180 8615859', 'leocadio.colom@gmail.com', 6, 80, 6, '1988-11-10'),
(16, 'José', 'Pizarro', 20730293, 'Alameda de Jose Manuel Ponce 20', '64 79212161', 'josé.pizarro@gmail.com', 10, 113, 1, '1990-09-09'),
(17, 'Bernardino', 'Pujadas', 22635510, 'Camino Manuela Estevez 340', '36 91975748', 'bernardino.pujadas@gmail.com', 10, 96, 7, '1989-10-04'),
(18, 'Sebastián', 'Sureda', 36781044, 'Cuesta de Victor Manuel Villalba 251', '05 44354602', 'sebastián.sureda@gmail.com', 12, 52, 1, '2002-02-08'),
(19, 'Gertrudis', 'Nevado', 13269332, 'Pasadizo de Carolina Mena 34', '75 45774171', 'gertrudis.nevado@gmail.com', 14, 53, 1, '1986-03-05'),
(20, 'Efraín', 'Nogueira', 21172103, 'Callejón de Valerio Haro 37 Puerta 6 ', '99 26553489', 'efraín.nogueira@gmail.com', 7, 120, 1, '1979-06-04'),
(21, 'Sebastián', 'Urrutia', 30896202, 'Camino Samuel Miranda 6 Piso 1 ', '19 10942864', 'sebastián.urrutia@gmail.com', 11, 29, 1, '1966-06-09'),
(22, 'Mauricio', 'Ripoll', 28725079, 'Callejón de Tania Uría 8', '806 4473650', 'mauricio.ripoll@gmail.com', 14, 125, 1, '1971-06-25'),
(23, 'Genoveva', 'Abella', 5270479, 'Camino Felipe Valentín 63', '320 8851167', 'genoveva.abella@gmail.com', 7, 35, 1, '1961-02-23'),
(24, 'Elpidio', 'Ureña', 26008009, 'Cuesta Olimpia Elorza 78', '734 6108468', 'elpidio.ureña@gmail.com', 14, 115, 1, '1975-12-02'),
(25, 'Leire', 'Casals', 28450397, 'Acceso de Eligio Alberdi 5 Apt. 76 ', '75 99297838', 'leire.casals@gmail.com', 10, 78, 1, '1982-03-03'),
(26, 'Aura', 'Bello', 22995397, 'Callejón Luis Ángel Acevedo 2 Piso 1 ', '305 8690929', 'aura.bello@gmail.com', 10, 49, 1, '1994-06-11'),
(27, 'Flora', 'Cuesta', 27444325, 'Camino Emiliana Ramis 15', '53 06536542', 'flora.cuesta@gmail.com', 11, 73, 1, '1979-12-10'),
(28, 'Fabricio', 'Álamo', 32671958, 'Glorieta Benita Sureda 576 Piso 1 ', '52 65786922', 'fabricio.álamo@gmail.com', 10, 124, 1, '1966-04-15'),
(29, 'Belen', 'Cano', 38931781, 'Vial de Ester Giralt 78', '36 23494457', 'belen.cano@gmail.com', 12, 90, 1, '1971-11-14'),
(30, 'Inés', 'Ojeda', 37768822, 'Cañada Gilberto Carmona 668', '241 9055294', 'inés.ojeda@gmail.com', 3, 54, 1, '1967-08-24'),
(31, 'Amor', 'Baró', 38320542, 'Via Lucio Oliva 84', '55 56703679', 'amor.baró@gmail.com', 7, 108, 1, '2000-12-29'),
(32, 'Mateo', 'Zurita', 8909777, 'Glorieta Olivia Pellicer 2', '73 33079979', 'mateo.zurita@gmail.com', 16, 34, 1, '1962-12-28'),
(33, 'Adelia', 'Fuentes', 5953173, 'Avenida de Nerea Pagès 651', '58 23394051', 'adelia.fuentes@gmail.com', 4, 82, 3, '1965-04-30'),
(34, 'Nacio', 'Mulet', 34011027, 'Ronda de Edelmira Ruano 79 Piso 9 ', '761 7791416', 'nacio.mulet@gmail.com', 6, 101, 5, '1992-07-08'),
(35, 'Isaura', 'Gálvez', 15345505, 'Camino Anastasio Burgos 9 Puerta 6 ', '113 1795453', 'isaura.gálvez@gmail.com', 16, 71, 1, '1965-05-06'),
(36, 'León', 'Caparrós', 22149567, 'Via de Lupe Cerdá 26 Piso 3 ', '027 3896499', 'león.caparrós@gmail.com', 14, 39, 1, '1964-11-15'),
(37, 'Maristela', 'Vazquez', 6168141, 'Alameda de Custodio Valdés 28', '836 7989564', 'maristela.vazquez@gmail.com', 1, 148, 1, '2001-10-25'),
(38, 'Luis Miguel', 'Baeza', 21074010, 'Camino Elena Ureña 1 Puerta 4 ', '87 71040786', 'luis miguel.baeza@gmail.com', 14, 22, 1, '1967-10-11'),
(39, 'Viviana', 'Milla', 16892361, 'Avenida de Rosa María Luján 36 Apt. 87 ', '88 89955372', 'viviana.milla@gmail.com', 6, 150, 7, '1992-02-28'),
(40, 'Danilo', 'Vidal', 16656303, 'Camino Marcial Baeza 91', '160 4121190', 'danilo.vidal@gmail.com', 14, 128, 2, '1977-08-15');

INSERT INTO tipo_habitacion (id_tipo, nombre_tipo, precio_base) VALUES
(1, 'Estándar', 100.0),
(2, 'Deluxe', 150.0),
(3, 'Suite', 220.0);

INSERT INTO habitacion (id_habitacion, numero, id_tipo, estado) VALUES
(1, 101, 1, 'disponible'),
(2, 102, 1, 'disponible'),
(3, 103, 1, 'ocupada'),
(4, 104, 1, 'mantenimiento'),
(5, 105, 1, 'mantenimiento'),
(6, 106, 1, 'ocupada'),
(7, 107, 1, 'disponible'),
(8, 108, 1, 'disponible'),
(9, 109, 1, 'disponible'),
(10, 110, 1, 'ocupada'),
(11, 201, 1, 'disponible'),
(12, 202, 1, 'ocupada'),
(13, 203, 1, 'disponible'),
(14, 204, 1, 'disponible'),
(15, 205, 1, 'ocupada'),
(16, 206, 1, 'disponible'),
(17, 207, 1, 'ocupada'),
(18, 208, 1, 'disponible'),
(19, 209, 1, 'ocupada'),
(20, 210, 1, 'disponible'),
(21, 301, 2, 'ocupada'),
(22, 302, 2, 'disponible'),
(23, 303, 2, 'disponible'),
(24, 304, 2, 'mantenimiento'),
(25, 305, 2, 'disponible'),
(26, 306, 2, 'disponible'),
(27, 307, 2, 'disponible'),
(28, 308, 2, 'disponible'),
(29, 309, 2, 'disponible'),
(30, 310, 2, 'disponible'),
(31, 401, 2, 'disponible'),
(32, 402, 2, 'disponible'),
(33, 403, 3, 'disponible'),
(34, 404, 3, 'ocupada'),
(35, 405, 3, 'disponible'),
(36, 406, 3, 'mantenimiento'),
(37, 407, 3, 'ocupada'),
(38, 408, 3, 'disponible'),
(39, 409, 3, 'mantenimiento'),
(40, 410, 3, 'mantenimiento');

INSERT INTO servicio (id_servicio, nombre_servicio, descripcion, precio, bonificable) VALUES
(1, 'Desayuno', 'Incluye desayuno buffet', 10.0, TRUE),
(2, 'Spa', 'Acceso al spa por 1 hora', 25.0, FALSE),
(3, 'Almuerzo Ejecutivo', 'Menú diario en el restaurante del hotel', 18.0, TRUE),
(4, 'Cena Gourmet', 'Cena con entrada, plato principal y postre', 30.0, FALSE),
(5, 'Servicio a la Habitación', 'Atención de mozo directamente en la habitación', 12.0, TRUE),
(6, 'Masaje Relajante', 'Sesión de 45 minutos realizada por profesional', 35.0, FALSE),
(7, 'Tour Guiado', 'Recorrido por atractivos turísticos con guía del hotel', 20.0, TRUE),
(8, 'Lavado de Ropa', 'Lavado, secado y doblado de ropa personal', 15.0, TRUE),
(9, 'Early Check-in', 'Ingreso anticipado sujeto a disponibilidad', 10.0, TRUE),
(10, 'Late Check-out', 'Salida extendida hasta las 15 hs', 15.0, TRUE),
(11, 'Estacionamiento Cubierto', 'Estacionamiento privado bajo techo', 8.0, FALSE),
(12, 'Acceso a Piscina Climatizada', 'Uso libre de la piscina en zona Spa', 12.0, FALSE),
(13, 'Conexión Wi-Fi Premium', 'Mayor velocidad de internet en la habitación', 5.0, TRUE);

INSERT INTO tipo_pago (id_tipo_pago, nombre_tipo) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta');
