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
(1, 'Bahía Blanca', 1),
(2, 'Junín', 1),
(3, 'La Plata', 1),
(4, 'Luján', 1),
(5, 'Mar del Plata', 1),
(6, 'Pergamino', 1),
(7, 'Tandil', 1),
(8, 'Andalgalá', 2),
(9, 'Belén', 2),
(10, 'San Fernando del Valle de Catamarca', 2),
(11, 'San Miguel', 2),
(12, 'Santa María', 2),
(13, 'Villa Argentina', 2),
(14, 'Charata', 3),
(15, 'Monte Verde', 3),
(16, 'Nueva Esperanza', 3),
(17, 'Presidencia Roque Sáenz Peña', 3),
(18, 'Resistencia', 3),
(19, 'Villa Ángela', 3),
(20, 'Comodoro Rivadavia', 4),
(21, 'Puerto Esperanza', 4),
(22, 'Puerto Madryn', 4),
(23, 'Rawson', 4),
(24, 'San Nicolás', 4),
(25, 'Trelew', 4),
(26, 'Colonia Santa Ana', 5),
(27, 'Córdoba', 5),
(28, 'Río Cuarto', 5),
(29, 'Villa Carlos Paz', 5),
(30, 'Villa Hermosa', 5),
(31, 'Villa María', 5),
(32, 'Bella Vista', 6),
(33, 'Corrientes', 6),
(34, 'El Paraíso', 6),
(35, 'Goya', 6),
(36, 'Paso de los Libres', 6),
(37, 'Santa Clara', 6),
(38, 'Concordia', 7),
(39, 'Gualeguaychú', 7),
(40, 'Los Aromos', 7),
(41, 'Paraná', 7),
(42, 'Puerto Norte', 7),
(43, 'Victoria', 7),
(44, 'Clorinda', 8),
(45, 'Formosa', 8),
(46, 'Pirané', 8),
(47, 'San Javier', 8),
(48, 'Santa Rosa del Sur', 8),
(49, 'Valle Azul', 8),
(50, 'Laguna Blanca', 9),
(51, 'Libertador General San Martín', 9),
(52, 'Monte Grande', 9),
(53, 'Palpalá', 9),
(54, 'San José', 9),
(55, 'San Salvador de Jujuy', 9),
(56, 'Campo Alegre', 10),
(57, 'General Pico', 10),
(58, 'La Esperanza', 10),
(59, 'Puesto Viejo', 10),
(60, 'Santa Rosa', 10),
(61, 'Toay', 10),
(62, 'Aimogasta', 11),
(63, 'Chilecito', 11),
(64, 'Estación Central', 11),
(65, 'La Rioja', 11),
(66, 'Paso Grande', 11),
(67, 'Rincón', 11),
(68, 'El Trébol', 12),
(69, 'Godoy Cruz', 12),
(70, 'Luján de Cuyo', 12),
(71, 'Mendoza', 12),
(72, 'San Rafael', 12),
(73, 'Villa del Sur', 12),
(74, 'Apóstoles', 13),
(75, 'Eldorado', 13),
(76, 'Los Álamos', 13),
(77, 'Oberá', 13),
(78, 'Posadas', 13),
(79, 'Cutral Có', 14),
(80, 'Neuquén', 14),
(81, 'Plottier', 14),
(82, 'Bariloche', 15),
(83, 'Cipolletti', 15),
(84, 'Viedma', 15),
(85, 'Cafayate', 16),
(86, 'Metán', 16),
(87, 'Orán', 16),
(88, 'Salta', 16),
(89, 'Tartagal', 16),
(90, 'Chimbas', 17),
(91, 'Pocito', 17),
(92, 'Rawson', 17),
(93, 'San Juan', 17),
(94, 'Jáchal', 17),
(95, 'La Punta', 18),
(96, 'Merlo', 18),
(97, 'San Luis', 18),
(98, 'Villa Mercedes', 18),
(99, 'Caleta Olivia', 19),
(100, 'El Calafate', 19),
(101, 'Pico Truncado', 19),
(102, 'Río Gallegos', 19),
(103, 'Esperanza', 20),
(104, 'Rafaela', 20),
(105, 'Rosario', 20),
(106, 'Santa Fe', 20),
(107, 'Venado Tuerto', 20),
(108, 'Añatuya', 21),
(109, 'La Banda', 21),
(110, 'Santiago del Estero', 21),
(111, 'Termas de Río Hondo', 21),
(112, 'Río Grande', 22),
(113, 'Tolhuin', 22),
(114, 'Tolhuin Norte', 22),
(115, 'Ushuaia', 22),
(116, 'Aguilares', 23),
(117, 'Concepción', 23),
(118, 'San Miguel de Tucumán', 23),
(119, 'Tafí Viejo', 23),
(120, 'Yerba Buena', 23),
(121, 'Almagro', 24),
(122, 'Balvanera', 24),
(123, 'Barracas', 24),
(124, 'Belgrano', 24),
(125, 'Caballito', 24),
(126, 'Ciudad Autónoma de Buenos Aires', 24),
(127, 'Constitución', 24),
(128, 'Flores', 24),
(129, 'Palermo', 24),
(130, 'Recoleta', 24),
(131, 'Retiro', 24),
(132, 'Villa Lugano', 24),
(133, 'Villa Urquiza', 24),
(134, 'Nuevo Horizonte', 24),
(135, 'Villa del Sol', 24),
(136, 'Otros', 25);

INSERT INTO huesped (id_huesped, nombre, apellido, dni, telefono, email, id_nacionalidad, direccion, id_ciudad, fecha_registro, fecha_nacimiento) VALUES
(1, 'Wilfredo', 'Vega', 17816809, '+549 92 8022 3223', 'wvega888@mail.com', 6, 'Via Reyna Garrido 47 Piso 5 ', 7, '2025-03-11', '1980-04-17'),
(2, 'Sabas', 'Ricart', 27720614, '+549 51 4467 8449', 'sricart335@mail.com', 1, 'Ronda de Matías Jara 82', 67, '2023-07-30', '1955-08-23'),
(3, 'Paz', 'Blázquez', 40233262, '+549 63 5133 2341', 'pblázquez482@mail.com', 4, 'Via de Marcela Peralta 18', 72, '2024-09-05', '1987-08-26'),
(4, 'Chita', 'Murcia', 99565621, '+549 153 458 4673', 'cmurcia666@mail.com', 7, 'Acceso de Samanta Rocha 5', 136, '2024-09-16', '1970-09-11'),
(5, 'Pastor', 'Calleja', 40307866, '+549 13 5051 4266', 'pcalleja860@mail.com', 6, 'Cuesta Jacobo Campoy 68', 11, '2023-09-05', '2001-04-30'),
(6, 'León', 'Gonzalo', 99159784, '+549 344 229 8758', 'lgonzalo686@mail.com', 7, 'Callejón Ambrosio Escribano 64 Piso 0 ', 136, '2023-10-26', '1959-03-08'),
(7, 'Clarisa', 'Pérez', 38470149, '+549 42 7043 3749', 'cpérez621@mail.com', 2, 'Plaza Ciriaco Garrido 86', 120, '2024-02-27', '1960-02-23'),
(8, 'Rafael', 'Mesa', 41098364, '+549 30 6096 2771', 'rmesa593@mail.com', 6, 'Calle Fabricio Criado 501 Piso 6 ', 30, '2024-06-19', '1990-09-29'),
(9, 'Vasco', 'Ribas', 99327110, '+549 689 793 7149', 'vribas407@mail.com', 7, 'Pasadizo Danilo Ochoa 51 Puerta 9 ', 136, '2024-06-19', '1985-04-17'),
(10, 'Guadalupe', 'Mendez', 34867507, '+549 98 4978 2669', 'gmendez714@mail.com', 2, 'C. Elena Ballesteros 4', 20, '2024-01-28', '1963-10-23'),
(11, 'María Fernanda', 'Cervantes', 41716951, '+549 82 1672 6688', 'mcervantes546@mail.com', 6, 'Alameda de Dimas Aguilera 36 Apt. 68 ', 31, '2024-12-05', '1965-02-03'),
(12, 'Angelita', 'Pablo', 31977226, '+549 92 6590 1207', 'apablo870@mail.com', 3, 'Calle de Tristán Alfonso 61', 18, '2024-08-28', '1978-08-24'),
(13, 'Consuela', 'Quiroga', 29546631, '+549 56 8532 3506', 'cquiroga446@mail.com', 4, 'Via de Sandalio Almansa 82 Puerta 5 ', 28, '2023-08-15', '1979-02-25'),
(14, 'Rafaela', 'Camacho', 35666589, '+549 78 8921 8616', 'rcamacho447@mail.com', 5, 'Camino de Salvador Zamora 7', 70, '2025-04-14', '1970-07-19'),
(15, 'Marcia', 'Nicolás', 25814747, '+549 41 2419 5569', 'mnicolás903@mail.com', 5, 'Rambla de Carmelo Vicens 9', 69, '2024-07-08', '1962-08-18'),
(16, 'Vicenta', 'Olmedo', 26287597, '+549 13 9098 6325', 'volmedo187@mail.com', 4, 'Urbanización Cristian Coll 33 Puerta 2 ', 98, '2025-01-18', '2001-02-03'),
(17, 'Gabriela', 'Benet', 26419876, '+549 45 5526 1166', 'gbenet530@mail.com', 3, 'Pasaje de Marisela Sanchez 695', 67, '2023-10-03', '1979-05-12'),
(18, 'Borja', 'Somoza', 39161696, '+549 62 9004 4937', 'bsomoza708@mail.com', 1, 'Callejón de Domitila Barbero 28 Piso 7 ', 62, '2024-05-24', '1951-12-29'),
(19, 'Baudelio', 'Peinado', 30038242, '+549 12 2524 5820', 'bpeinado227@mail.com', 6, 'Avenida Encarnacion Vendrell 97 Puerta 0 ', 126, '2024-05-22', '2004-07-17'),
(20, 'Concha', 'Fabra', 37278801, '+549 84 7046 8753', 'cfabra567@mail.com', 2, 'Pasadizo de Eutropio Barrio 61 Puerta 1 ', 79, '2024-07-03', '1993-05-27'),
(21, 'Francisco Jose', 'Ariza', 26804802, '+549 99 8434 5438', 'fariza314@mail.com', 4, 'Pasaje de Azucena Yáñez 625', 85, '2025-05-20', '1968-09-07'),
(22, 'Roldán', 'Rebollo', 25588032, '+549 25 9779 4033', 'rrebollo197@mail.com', 1, 'Alameda Blas Murcia 9 Puerta 6 ', 50, '2024-01-14', '1966-08-01'),
(23, 'Lourdes', 'Conesa', 39313038, '+549 85 9595 5636', 'lconesa103@mail.com', 4, 'Camino Gracia Cid 74 Apt. 91 ', 71, '2024-02-03', '1987-06-21'),
(24, 'Renato', 'Moya', 27109159, '+549 32 5952 1231', 'rmoya726@mail.com', 3, 'Ronda Apolonia Paredes 6', 59, '2024-02-02', '1961-09-13'),
(25, 'Iker', 'Noguera', 16829589, '+549 80 5786 3068', 'inoguera654@mail.com', 3, 'Urbanización Emigdio Cortina 5 Apt. 88 ', 12, '2025-03-17', '1999-09-13'),
(26, 'Sol', 'Zurita', 44283615, '+549 11 5658 8690', 'szurita491@mail.com', 4, 'Vial de Edelmira Peñas 32', 27, '2025-03-14', '1996-07-31'),
(27, 'María Manuela', 'Daza', 23471768, '+549 71 2869 2070', 'mdaza411@mail.com', 2, 'Ronda Pánfilo Gámez 59 Puerta 7 ', 14, '2023-12-06', '1985-10-09'),
(28, 'Jorge', 'Mendoza', 20091113, '+549 29 5978 2395', 'jmendoza255@mail.com', 5, 'Acceso Irene Saez 74 Puerta 8 ', 14, '2024-04-28', '1960-06-17'),
(29, 'Olga', 'Flores', 41027956, '+549 76 7232 8381', 'oflores931@mail.com', 4, 'Calle de Felipa Terrón 28', 58, '2024-12-11', '2006-12-30'),
(30, 'Ascensión', 'Casanovas', 25246860, '+549 82 1986 2625', 'acasanovas971@mail.com', 5, 'Rambla Leandro Sancho 226 Apt. 75 ', 110, '2025-05-30', '1951-04-01'),
(31, 'Severino', 'Baeza', 23880050, '+549 94 2330 3573', 'sbaeza246@mail.com', 6, 'Urbanización de Rolando Bilbao 13 Piso 1 ', 55, '2025-03-20', '1998-01-26'),
(32, 'Florentina', 'Naranjo', 15089782, '+549 62 8381 8699', 'fnaranjo299@mail.com', 1, 'Calle Luciano Sureda 87', 41, '2024-09-27', '1949-10-16'),
(33, 'Vicenta', 'Bernad', 99302099, '+549 823 389 8438', 'vbernad73@mail.com', 7, 'Glorieta de Petrona Conde 798', 136, '2023-09-02', '2002-04-02'),
(34, 'Luis', 'Gámez', 29265296, '+549 24 9922 4683', 'lgámez664@mail.com', 3, 'Calle Jorge Rivas 271 Piso 9 ', 51, '2024-07-28', '1950-07-21'),
(35, 'Evelia', 'Villalba', 17396116, '+549 17 3718 6039', 'evillalba610@mail.com', 3, 'Cañada Timoteo Abellán 753', 37, '2023-10-31', '1994-08-24'),
(36, 'Guiomar', 'Boada', 29735544, '+549 25 8679 5982', 'gboada717@mail.com', 5, 'Pasadizo Candelas Vera 780 Piso 0 ', 74, '2024-10-13', '1975-10-05'),
(37, 'Raúl', 'Izaguirre', 33118774, '+549 73 8172 2317', 'rizaguirre613@mail.com', 3, 'Avenida de Onofre Hernando 6', 129, '2023-09-19', '1952-06-13'),
(38, 'Pastor', 'Nevado', 99453014, '+549 852 430 5102', 'pnevado27@mail.com', 7, 'Cuesta de Evangelina Esparza 81', 136, '2023-07-06', '1969-05-27'),
(39, 'Heriberto', 'Arranz', 40661100, '+549 96 5415 1659', 'harranz782@mail.com', 6, 'Alameda Martín Villalba 88', 6, '2023-12-21', '1951-12-05'),
(40, 'Marisa', 'Feijoo', 36861030, '+549 66 5557 3973', 'mfeijoo600@mail.com', 4, 'Calle de Rosenda Mármol 61 Piso 6 ', 133, '2025-01-05', '1979-05-11'),
(41, 'Teresa', 'Pomares', 30770931, '+549 54 7690 6460', 'tpomares329@mail.com', 4, 'Cuesta Jesusa Valencia 58 Apt. 61 ', 24, '2024-05-07', '1990-06-07'),
(42, 'Pacífica', 'Escribano', 28812517, '+549 98 9117 5722', 'pescribano679@mail.com', 2, 'Via de Cebrián Mosquera 84 Puerta 6 ', 85, '2023-10-15', '1996-05-16'),
(43, 'Vicente', 'Ortega', 30261425, '+549 21 6153 5135', 'vortega332@mail.com', 5, 'Acceso Encarnacion Royo 20 Puerta 6 ', 10, '2024-03-16', '1984-05-07'),
(44, 'Nicolasa', 'Cuesta', 42679963, '+549 10 9889 8569', 'ncuesta424@mail.com', 4, 'Pasaje Andrés Cases 4', 132, '2025-02-01', '1993-05-03'),
(45, 'Quique', 'Paredes', 35892125, '+549 73 8242 1845', 'qparedes209@mail.com', 5, 'Vial Iris Sandoval 85 Apt. 92 ', 93, '2024-07-23', '1974-05-28'),
(46, 'Rómulo', 'Miralles', 29700736, '+549 99 8941 2989', 'rmiralles30@mail.com', 2, 'Via Amancio Estrada 78 Puerta 1 ', 74, '2023-12-28', '2002-03-03'),
(47, 'Juan Bautista', 'Salmerón', 38816359, '+549 30 6091 1224', 'jsalmerón566@mail.com', 5, 'Cuesta de Heraclio Casado 81', 62, '2023-10-20', '1997-12-23'),
(48, 'Victor', 'Bonilla', 30483621, '+549 25 3522 9165', 'vbonilla956@mail.com', 2, 'Avenida de Carmelita Manrique 32 Piso 8 ', 30, '2023-11-29', '1957-09-10'),
(49, 'Herberto', 'Chamorro', 28941542, '+549 71 8736 4993', 'hchamorro468@mail.com', 5, 'Plaza de Poncio Peinado 38', 70, '2024-09-25', '1955-04-20'),
(50, 'Blas', 'Mendoza', 35111774, '+549 75 3236 2143', 'bmendoza283@mail.com', 4, 'Pasadizo de Segismundo Recio 612 Puerta 1 ', 49, '2024-05-22', '1981-02-18'),
(51, 'Irma', 'Villar', 41431410, '+549 74 5377 1042', 'ivillar290@mail.com', 4, 'Paseo Felicidad Espada 96 Apt. 18 ', 88, '2023-10-04', '1970-02-17'),
(52, 'Fidel', 'Cáceres', 44033327, '+549 29 8316 9824', 'fcáceres496@mail.com', 5, 'Acceso Aurelia Luz 5 Apt. 84 ', 126, '2023-09-13', '1991-12-20'),
(53, 'Marcio', 'Bueno', 30278829, '+549 51 4090 4912', 'mbueno586@mail.com', 5, 'Rambla Genoveva Nebot 200', 97, '2023-07-13', '1993-01-31'),
(54, 'María Manuela', 'Landa', 25676225, '+549 70 7246 7325', 'mlanda680@mail.com', 4, 'Plaza de Anastasia Manjón 47', 12, '2025-02-22', '2004-05-16'),
(55, 'Isidora', 'Ramis', 31620471, '+549 14 3068 9229', 'iramis989@mail.com', 6, 'Avenida de Jennifer Barreda 77 Piso 7 ', 39, '2023-11-13', '1972-08-01'),
(56, 'Elvira', 'Cobo', 18345769, '+549 77 8486 1251', 'ecobo740@mail.com', 1, 'Acceso de Sabas Castrillo 98 Apt. 53 ', 113, '2024-06-04', '1957-10-09'),
(57, 'Juanito', 'Sancho', 17510819, '+549 70 5342 6546', 'jsancho639@mail.com', 6, 'Via Aureliano Manrique 79', 40, '2023-12-17', '1960-04-20'),
(58, 'Odalys', 'Morán', 43580500, '+549 52 9742 7226', 'omorán978@mail.com', 6, 'Rambla Andrea Villa 57 Piso 0 ', 21, '2023-08-16', '1976-03-12'),
(59, 'Anselma', 'Sebastián', 44272316, '+549 79 1588 2121', 'asebastián241@mail.com', 6, 'Camino Patricio Atienza 5', 125, '2024-06-26', '1990-02-04'),
(60, 'Sofía', 'Sosa', 40057321, '+549 21 8110 2612', 'ssosa779@mail.com', 3, 'Via Tomás Cañete 75 Piso 0 ', 59, '2024-04-14', '1952-11-30'),
(61, 'Clotilde', 'Ferreras', 20582275, '+549 98 5906 1474', 'cferreras48@mail.com', 1, 'Avenida de Rolando Varela 58 Puerta 9 ', 114, '2023-09-08', '1958-03-10'),
(62, 'Cleto', 'Prada', 27028033, '+549 57 8056 3385', 'cprada251@mail.com', 1, 'Paseo de Pío Cobos 99 Piso 8 ', 76, '2023-07-09', '1952-07-08'),
(63, 'Antonio', 'Cerro', 20703704, '+549 32 2293 7267', 'acerro635@mail.com', 5, 'Pasadizo de Yago Company 682 Puerta 5 ', 47, '2023-10-12', '1976-03-04'),
(64, 'Encarnita', 'Martínez', 22790951, '+549 69 5161 8529', 'emartínez262@mail.com', 4, 'Camino de Marcelino Taboada 6 Piso 1 ', 37, '2024-04-26', '1989-02-25'),
(65, 'Mario', 'Amor', 37736848, '+549 79 3588 2210', 'mamor453@mail.com', 4, 'Camino de Crescencia Goñi 8 Apt. 89 ', 74, '2025-01-29', '2006-09-04'),
(66, 'Ricardo', 'Coloma', 36439225, '+549 64 5097 8484', 'rcoloma866@mail.com', 5, 'Camino Juanita Canet 80', 77, '2024-02-06', '1977-12-06'),
(67, 'Evaristo', 'Rey', 18578689, '+549 40 7248 6881', 'erey589@mail.com', 4, 'Pasadizo de Matilde Soto 3', 124, '2024-07-14', '1963-07-18'),
(68, 'Chelo', 'Morcillo', 15736170, '+549 94 7484 5497', 'cmorcillo9@mail.com', 6, 'Alameda de Fulgencio Segura 658 Puerta 4 ', 76, '2024-09-23', '1982-05-20'),
(69, 'Gregorio', 'Hoz', 35347625, '+549 73 5689 4770', 'ghoz622@mail.com', 6, 'Urbanización de Manuel Malo 67 Piso 5 ', 13, '2024-08-16', '2003-07-24'),
(70, 'Lorena', 'Llanos', 35833650, '+549 42 3240 2591', 'lllanos926@mail.com', 2, 'Camino Inmaculada Pino 35 Piso 0 ', 49, '2024-01-17', '1998-01-12'),
(71, 'Cayetano', 'Olivares', 41461376, '+549 66 1546 6977', 'colivares750@mail.com', 1, 'Cuesta de Iker Franch 548 Apt. 19 ', 80, '2025-01-03', '1989-05-14'),
(72, 'Jose', 'Herrera', 40081295, '+549 63 3877 4289', 'jherrera136@mail.com', 3, 'Urbanización Baldomero Cabrera 85', 84, '2023-08-25', '1995-10-16'),
(73, 'María Manuela', 'Cervantes', 24144500, '+549 31 5210 8894', 'mcervantes991@mail.com', 3, 'Ronda Fortunata Tamarit 53', 129, '2024-02-12', '1968-11-09'),
(74, 'Flavia', 'Barranco', 41985566, '+549 24 8673 2233', 'fbarranco145@mail.com', 6, 'Paseo Mamen Arcos 36', 87, '2025-06-02', '1951-11-28'),
(75, 'Piedad', 'Puerta', 43378475, '+549 81 6992 2479', 'ppuerta810@mail.com', 2, 'Cañada Sarita Arcos 5 Puerta 9 ', 102, '2023-08-30', '1972-03-26'),
(76, 'Lucas', 'Santos', 30260086, '+549 57 5295 7242', 'lsantos843@mail.com', 3, 'Pasadizo Adelina Llamas 61 Apt. 74 ', 32, '2024-12-17', '1962-02-08'),
(77, 'Alberto', 'Navas', 37643757, '+549 39 8724 1410', 'anavas635@mail.com', 3, 'Rambla Emiliana Ramirez 68 Apt. 61 ', 28, '2023-10-29', '1959-01-01'),
(78, 'Albina', 'Morales', 35470961, '+549 38 2035 8606', 'amorales932@mail.com', 5, 'Callejón Rodolfo Gutiérrez 64', 84, '2024-01-28', '1989-01-26'),
(79, 'Loreto', 'Alberdi', 18914994, '+549 27 1742 1609', 'lalberdi312@mail.com', 6, 'Urbanización de Bernabé Carrasco 34 Piso 8 ', 105, '2025-05-24', '1997-04-24'),
(80, 'María Luisa', 'Mercader', 22878581, '+549 78 3222 7367', 'mmercader465@mail.com', 1, 'Acceso de Encarnacion Giner 82', 25, '2023-10-04', '1980-05-24'),
(81, 'Mariana', 'Pereira', 34707871, '+549 29 7797 2622', 'mpereira854@mail.com', 6, 'Paseo de Nidia Gil 29 Puerta 7 ', 108, '2024-07-22', '1997-04-29'),
(82, 'Porfirio', 'Bermejo', 16097776, '+549 98 7070 4559', 'pbermejo455@mail.com', 4, 'Paseo Vanesa Vega 99', 72, '2023-10-02', '1960-08-18'),
(83, 'Nacio', 'Viña', 18333787, '+549 97 7018 9920', 'nviña924@mail.com', 2, 'Glorieta Liliana Torrijos 9 Piso 0 ', 93, '2024-05-25', '1958-05-31'),
(84, 'Armida', 'Ribes', 28359349, '+549 45 4109 3001', 'aribes972@mail.com', 3, 'Paseo Óscar Mendez 7 Piso 0 ', 16, '2025-01-07', '1964-04-05'),
(85, 'Cristina', 'Beltran', 37238828, '+549 37 1349 1828', 'cbeltran806@mail.com', 4, 'Acceso de Juanita Bartolomé 801', 24, '2023-07-02', '1968-12-20'),
(86, 'Sebastian', 'Escolano', 17302174, '+549 80 4394 4538', 'sescolano833@mail.com', 2, 'Acceso de Tatiana Piñeiro 76', 53, '2023-08-09', '1995-11-23'),
(87, 'Gisela', 'Cañas', 41462493, '+549 86 1046 5542', 'gcañas880@mail.com', 3, 'Rambla Brígida Pozo 123 Apt. 47 ', 38, '2024-11-12', '1998-05-15'),
(88, 'Candelas', 'Rodrigo', 41793677, '+549 32 2801 1422', 'crodrigo135@mail.com', 2, 'Urbanización Édgar Oliva 44 Puerta 1 ', 65, '2023-07-03', '2004-07-08'),
(89, 'Gertrudis', 'Rius', 99828358, '+549 907 343 6304', 'grius17@mail.com', 7, 'Glorieta Bonifacio Cabrero 107', 136, '2023-12-15', '1999-10-30'),
(90, 'Arsenio', 'Quesada', 39887928, '+549 63 9619 2862', 'aquesada764@mail.com', 1, 'Paseo Isaac Barbero 58 Apt. 95 ', 33, '2024-08-29', '1990-02-14'),
(91, 'María Teresa', 'Montes', 32221408, '+549 85 2786 8405', 'mmontes516@mail.com', 4, 'Vial de Gertrudis Vázquez 56', 93, '2024-01-07', '1953-08-01'),
(92, 'Cecilia', 'Díez', 39402225, '+549 94 9543 5941', 'cdíez470@mail.com', 5, 'Calle de Omar Piquer 756 Apt. 46 ', 12, '2023-10-28', '2000-10-09'),
(93, 'Brígida', 'Sáenz', 31071965, '+549 61 7984 2768', 'bsáenz503@mail.com', 1, 'Cañada Rosa Cobos 90', 16, '2024-04-23', '1977-10-11'),
(94, 'Cecilia', 'Cañete', 17710878, '+549 51 3430 2076', 'ccañete130@mail.com', 4, 'Callejón Herminio Murillo 8 Piso 1 ', 19, '2024-07-28', '1998-09-28'),
(95, 'Paula', 'Farré', 27781030, '+549 86 9692 5831', 'pfarré465@mail.com', 6, 'C. de Ignacia Ariza 4', 84, '2025-02-21', '2001-04-08'),
(96, 'Diana', 'Gaya', 41611888, '+549 99 2874 4522', 'dgaya441@mail.com', 4, 'Alameda Marcio Alcántara 23 Puerta 7 ', 26, '2025-05-18', '1965-12-10'),
(97, 'Josefa', 'Fuente', 26372657, '+549 68 7532 7815', 'jfuente748@mail.com', 2, 'Paseo Modesto Luna 97 Puerta 5 ', 106, '2024-02-02', '1967-03-27'),
(98, 'Plácido', 'Vilalta', 37317316, '+549 42 7132 3500', 'pvilalta704@mail.com', 4, 'Via de Nieves Soria 63 Piso 6 ', 81, '2023-07-13', '1987-09-18'),
(99, 'Rosario', 'Giralt', 42909633, '+549 20 2527 8075', 'rgiralt99@mail.com', 1, 'Callejón Carolina Rios 42', 24, '2024-02-19', '1965-02-01'),
(100, 'Reynaldo', 'Hoyos', 33668704, '+549 17 6400 3002', 'rhoyos421@mail.com', 3, 'Callejón de María Carmen Torres 37 Puerta 5 ', 34, '2023-10-17', '1958-12-16');

INSERT INTO area (id_area, nombre_area) VALUES
(1, 'Recepción'),
(2, 'Mantenimiento'),
(3, 'Limpieza'),
(4, 'Administración'),
(5, 'Gastronomía'),
(6, 'Spa y Bienestar'),
(7, 'Lavandería'),
(8, 'Transporte');

iNSERT INTO puesto (id_puesto, nombre_puesto, id_area) VALUES
(1, 'Recepcionista', 1),
(2, 'Supervisor de Recepción', 1),
(3, 'Técnico de Mantenimiento', 2),
(4, 'Encargado de Mantenimiento', 2),
(5, 'Personal de Limpieza', 3),
(6, 'Supervisor de Limpieza', 3),
(7, 'Administrador General', 4),
(8, 'Asistente Administrativo', 4),
(9, 'Contador', 4),
(10, 'Chef Principal', 5),
(11, 'Ayudante de Cocina', 5),
(12, 'Mozo/Salonero', 5),
(13, 'Masajista', 6),
(14, 'Recepcionista de Spa', 6),
(15, 'Técnico en Bienestar', 6),
(16, 'Encargado de Lavandería', 7),
(17, 'Operario de Lavandería', 7),
(18, 'Chofer', 8),
(19, 'Coordinador de Transporte', 8);

INSERT INTO empleado (nombre, apellido, dni, direccion, telefono, email, id_puesto, id_ciudad, id_nacionalidad, fecha_nacimiento) VALUES
('Aura', 'Pardo', 37378571, 'Calle de Herminio Lasa 824 Puerta 7 ', '+549 23 6794 7658', 'apardo@hotelaurora.com', 1, 64, 2, '1997-07-01'),
('Ambrosio', 'Heras', 41839754, 'Paseo de Alberto Raya 4', '+549 32 7755 1406', 'aheras@hotelaurora.com', 1, 42, 2, '1978-02-26'),
('Íñigo', 'Carpio', 23952514, 'Cañada de Araceli Llano 87', '+549 30 2771 7267', 'ícarpio@hotelaurora.com', 1, 64, 4, '1999-07-31'),
('Yago', 'Coca', 42400099, 'Pasadizo Margarita Cerezo 5 Piso 5 ', '+549 68 6728 6000', 'ycoca@hotelaurora.com', 1, 52, 2, '2004-01-26'),
('Juanito', 'Acedo', 37147038, 'Camino de Cruz Tovar 97 Piso 5 ', '+549 34 7528 6378', 'jacedo@hotelaurora.com', 2, 7, 2, '2001-02-01'),
('Carmina', 'Pi', 99810891, 'Glorieta de José Haro 763 Apt. 57 ', '+549 385 459 9346', 'cpi@hotelaurora.com', 3, 136, 7, '2001-12-01'),
('Rolando', 'Cornejo', 15926120, 'Vial Ani Mármol 8 Apt. 87 ', '+549 24 5279 3925', 'rcornejo@hotelaurora.com', 3, 85, 5, '1995-09-11'),
('Lorenza', 'Cobos', 35017609, 'Avenida Adora Landa 79 Puerta 1 ', '+549 65 6663 6139', 'lcobos@hotelaurora.com', 4, 28, 1, '2001-01-08'),
('Reyes', 'Pinto', 34347084, 'Paseo de Andrés Felipe Bayona 44 Puerta 1 ', '+549 34 5173 1727', 'rpinto@hotelaurora.com', 5, 99, 1, '2002-10-25'),
('Clímaco', 'Cabrera', 99970535, 'Cañada Vera Andres 6 Apt. 45 ', '+549 925 651 4228', 'ccabrera@hotelaurora.com', 5, 136, 7, '2001-10-23'),
('Tomás', 'Coello', 99696503, 'Camino de Isabel Escolano 22', '+549 438 738 6143', 'tcoello@hotelaurora.com', 5, 136, 7, '2005-10-20'),
('Sabina', 'Piñeiro', 25377871, 'Camino de Eric Guerra 84', '+549 95 7691 6344', 'spiñeiro@hotelaurora.com', 5, 130, 3, '1999-10-11'),
('Griselda', 'Agustí', 29107837, 'Paseo de Fausto Benavent 55 Puerta 6 ', '+549 95 7211 3851', 'gagustí@hotelaurora.com', 5, 50, 2, '1999-09-09'),
('Yago', 'Matas', 25196351, 'Cuesta de Custodio Gálvez 69', '+549 46 4443 8043', 'ymatas@hotelaurora.com', 5, 1, 5, '2005-03-18'),
('Manolo', 'Marquez', 29823878, 'Callejón de Adán Avilés 474', '+549 66 4501 9375', 'mmarquez@hotelaurora.com', 6, 120, 3, '2005-10-05'),
('Nidia', 'Ortuño', 37107362, 'Callejón Irene Cerro 1', '+549 20 5649 9445', 'nortuño@hotelaurora.com', 7, 44, 6, '2000-09-08'),
('Modesta', 'Saez', 37575276, 'Vial de Cipriano Marquez 36', '+549 49 4680 4262', 'msaez@hotelaurora.com', 8, 61, 1, '1984-02-05'),
('Eligio', 'Paz', 99498216, 'Callejón Xiomara Tirado 25 Piso 1 ', '+549 725 970 2193', 'epaz@hotelaurora.com', 9, 136, 7, '1997-10-29'),
('Marisela', 'Gonzalez', 39103689, 'Avenida de Morena Prat 5 Puerta 1 ', '+549 99 7291 9099', 'mgonzalez@hotelaurora.com', 10, 50, 5, '2003-03-03'),
('Rafa', 'Juárez', 44952693, 'Via de Imelda Guillen 90 Piso 9 ', '+549 23 7965 4585', 'rjuárez@hotelaurora.com', 11, 2, 6, '1985-07-01'),
('Flora', 'Barroso', 16685049, 'Ronda de Demetrio Chaves 1 Piso 7 ', '+549 81 5082 2988', 'fbarroso@hotelaurora.com', 11, 119, 5, '1997-05-29'),
('Cleto', 'Guitart', 40341985, 'Pasaje de Raimundo Rius 226', '+549 66 9270 7991', 'cguitart@hotelaurora.com', 12, 82, 6, '2003-10-04'),
('Encarnación', 'Raya', 30101835, 'Acceso Isaac Salcedo 63 Apt. 58 ', '+549 43 5050 5543', 'eraya@hotelaurora.com', 12, 122, 2, '2006-05-27'),
('Plinio', 'Barrera', 24213961, 'Glorieta de Donato Sanz 4 Puerta 9 ', '+549 66 2269 5681', 'pbarrera@hotelaurora.com', 13, 62, 6, '1995-10-18'),
('Aureliano', 'Múgica', 19643063, 'Camino Hernán Bayona 439', '+549 29 4788 7275', 'amúgica@hotelaurora.com', 14, 21, 5, '1999-05-25'),
('Nando', 'Coloma', 28676765, 'Vial de Eladio Iglesia 11', '+549 52 9890 8633', 'ncoloma@hotelaurora.com', 15, 107, 1, '1997-09-03'),
('Albino', 'Palma', 40830059, 'Plaza de Félix Lara 3', '+549 84 1320 7232', 'apalma@hotelaurora.com', 16, 100, 4, '2002-08-05'),
('Begoña', 'Carballo', 43636961, 'Pasaje de Mayte Paredes 891', '+549 63 9818 9947', 'bcarballo@hotelaurora.com', 17, 100, 3, '2004-01-02'),
('Ismael', 'Aroca', 24158189, 'Plaza de Benjamín Tejero 26 Piso 7 ', '+549 65 8956 1475', 'iaroca@hotelaurora.com', 18, 57, 4, '1996-09-06'),
('Trini', 'Berrocal', 43202690, 'Avenida Edmundo Llopis 698 Piso 9 ', '+549 69 3091 9751', 'tberrocal@hotelaurora.com', 19, 43, 4, '1990-07-02');

INSERT INTO tipo_habitacion (id_tipo, nombre_tipo, precio_base) VALUES
(1, 'Estándar', 40000.00),
(2, 'Deluxe', 60000.00),
(3, 'Suite', 90000.00);

INSERT INTO habitacion (id_habitacion, numero, id_tipo, estado) VALUES
(1, 101, 1, 'disponible'),
(2, 102, 1, 'disponible'),
(3, 103, 1, 'disponible'),
(4, 104, 1, 'disponible'),
(5, 105, 1, 'disponible'),
(6, 106, 1, 'disponible'),
(7, 107, 1, 'disponible'),
(8, 108, 1, 'disponible'),
(9, 109, 1, 'disponible'),
(10, 110, 1, 'disponible'),
(11, 201, 1, 'disponible'),
(12, 202, 1, 'disponible'),
(13, 203, 1, 'disponible'),
(14, 204, 1, 'disponible'),
(15, 205, 1, 'disponible'),
(16, 206, 1, 'disponible'),
(17, 207, 1, 'disponible'),
(18, 208, 1, 'disponible'),
(19, 209, 1, 'disponible'),
(20, 210, 1, 'disponible'),
(21, 301, 2, 'disponible'),
(22, 302, 2, 'disponible'),
(23, 303, 2, 'disponible'),
(24, 304, 2, 'disponible'),
(25, 305, 2, 'disponible'),
(26, 306, 2, 'disponible'),
(27, 307, 2, 'disponible'),
(28, 308, 2, 'disponible'),
(29, 309, 2, 'disponible'),
(30, 310, 2, 'disponible'),
(31, 401, 2, 'disponible'),
(32, 402, 2, 'disponible'),
(33, 403, 3, 'disponible'),
(34, 404, 3, 'disponible'),
(35, 405, 3, 'disponible'),
(36, 406, 3, 'disponible'),
(37, 407, 3, 'disponible'),
(38, 408, 3, 'disponible'),
(39, 409, 3, 'disponible'),
(40, 410, 3, 'disponible');

INSERT INTO servicio (nombre_servicio, descripcion, precio, bonificable) VALUES
('Desayuno', 'Servicio de desayuno continental con opciones calientes y frías.', 8000.00, TRUE),
('Spa', 'Acceso a spa con sauna, masajes y piscina climatizada.', 20000.00, FALSE),
('Buffet', 'Almuerzo o cena buffet libre con variedad de platos internacionales.', 15000.00, TRUE),
('Lavandería', 'Servicio de lavado, secado y planchado de prendas personales.', 6000.00, FALSE),
('Traslados al aeropuerto', 'Servicio de transporte privado desde/hacia el aeropuerto.', 18000.00, FALSE);

INSERT INTO tipo_pago (id_tipo_pago, nombre_tipo) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta');

-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

-- Creacion de Reservas
CALL sp_crear_reserva_simple(90, 13, 23, '2025-06-02', '2025-06-05', 2, @r1);
CALL sp_crear_reserva_simple(70, 11, 3, '2025-06-10', '2025-06-15', 1, @r2);
CALL sp_crear_reserva_simple(2, 27, 10, '2025-06-05', '2025-06-07', 2, @r3);
CALL sp_crear_reserva_simple(79, 8, 27, '2025-06-01', '2025-06-03', 1, @r4);
CALL sp_crear_reserva_simple(96, 18, 16, '2025-06-03', '2025-06-06', 3, @r5);
CALL sp_crear_reserva_simple(55, 36, 4, '2025-06-04', '2025-06-08', 2, @r6);
CALL sp_crear_reserva_simple(43, 20, 11, '2025-06-06', '2025-06-10', 2, @r7);
CALL sp_crear_reserva_simple(16, 33, 6, '2025-06-02', '2025-06-04', 1, @r8);
CALL sp_crear_reserva_simple(84, 9, 17, '2025-06-05', '2025-06-09', 2, @r9);
CALL sp_crear_reserva_simple(18, 5, 14, '2025-06-04', '2025-06-07', 1, @r10);
CALL sp_crear_reserva_simple(23, 31, 12, '2025-06-08', '2025-06-11', 3, @r11);
CALL sp_crear_reserva_simple(5, 6, 21, '2025-06-01', '2025-06-05', 1, @r12);
CALL sp_crear_reserva_simple(63, 7, 15, '2025-06-02', '2025-06-06', 2, @r13);
CALL sp_crear_reserva_simple(38, 35, 7, '2025-06-05', '2025-06-08', 2, @r14);
CALL sp_crear_reserva_simple(14, 24, 8, '2025-06-03', '2025-06-07', 1, @r15);

-- Asignar Servicio a Reserva
CALL sp_agregar_servicio_a_reserva(@r1, 1, TRUE);
CALL sp_agregar_servicio_a_reserva(@r1, 2, FALSE);
CALL sp_agregar_servicio_a_reserva(@r2, 3, FALSE);
CALL sp_agregar_servicio_a_reserva(@r3, 1, TRUE);
CALL sp_agregar_servicio_a_reserva(@r4, 2, FALSE);
CALL sp_agregar_servicio_a_reserva(@r4, 4, TRUE);
CALL sp_agregar_servicio_a_reserva(@r5, 5, FALSE);
CALL sp_agregar_servicio_a_reserva(@r6, 3, FALSE);
CALL sp_agregar_servicio_a_reserva(@r6, 1, TRUE);
CALL sp_agregar_servicio_a_reserva(@r7, 4, FALSE);
CALL sp_agregar_servicio_a_reserva(@r8, 2, TRUE);
CALL sp_agregar_servicio_a_reserva(@r9, 5, FALSE);
CALL sp_agregar_servicio_a_reserva(@r9, 1, TRUE);
CALL sp_agregar_servicio_a_reserva(@r10, 1, TRUE);
CALL sp_agregar_servicio_a_reserva(@r11, 2, FALSE);
CALL sp_agregar_servicio_a_reserva(@r12, 3, FALSE);
CALL sp_agregar_servicio_a_reserva(@r13, 1, TRUE);
CALL sp_agregar_servicio_a_reserva(@r14, 5, FALSE);
CALL sp_agregar_servicio_a_reserva(@r15, 4, TRUE);

-- Asignar Pago a Reserva
CALL sp_registrar_pago_reserva(@r1, 1, 1);
CALL sp_registrar_pago_reserva(@r2, 1, 2);
CALL sp_registrar_pago_reserva(@r3, 2, 1);
CALL sp_registrar_pago_reserva(@r4, 2, 2);
CALL sp_registrar_pago_reserva(@r5, 1, 1);
CALL sp_registrar_pago_reserva(@r6, 3, 1);
CALL sp_registrar_pago_reserva(@r7, 1, 2);
CALL sp_registrar_pago_reserva(@r8, 2, 1);
CALL sp_registrar_pago_reserva(@r9, 1, 2);
CALL sp_registrar_pago_reserva(@r10, 3, 1);
CALL sp_registrar_pago_reserva(@r11, 4, 2);
CALL sp_registrar_pago_reserva(@r12, 1, 1);
CALL sp_registrar_pago_reserva(@r13, 1, 2);
CALL sp_registrar_pago_reserva(@r14, 4, 1);
CALL sp_registrar_pago_reserva(@r15, 1, 2);

-- Cambiar el Estado de Habitacion
CALL sp_actualizar_estado_habitacion(13, 'ocupada', 23, @r1);
CALL sp_actualizar_estado_habitacion(13, 'mantenimiento', 23, @r1);
CALL sp_actualizar_estado_habitacion(13, 'disponible', 23, @r1);

CALL sp_actualizar_estado_habitacion(25, 'ocupada', 18, @r2);
CALL sp_actualizar_estado_habitacion(25, 'mantenimiento', 18, @r2);

CALL sp_actualizar_estado_habitacion(3, 'ocupada', 6, @r3);
CALL sp_actualizar_estado_habitacion(3, 'mantenimiento', 6, @r3);

CALL sp_actualizar_estado_habitacion(7, 'ocupada', 9, @r4);

CALL sp_actualizar_estado_habitacion(38, 'ocupada', 12, @r5);


-- Cambiar Precios Habitacion / Servicios
UPDATE tipo_habitacion
SET precio_base = 95000
WHERE id_tipo = 3; 

UPDATE tipo_habitacion
SET precio_base = 195000
WHERE id_tipo = 3;

UPDATE tipo_habitacion
SET precio_base = 75000
WHERE id_tipo = 2; 

UPDATE servicio
SET precio = 19000
WHERE id_servicio = 1;

UPDATE servicio
SET precio = 29000
WHERE id_servicio = 4;


-- Cambiar estado de Reserva
UPDATE reserva
SET estado = 'cancelada'
WHERE id_reserva = @r4;