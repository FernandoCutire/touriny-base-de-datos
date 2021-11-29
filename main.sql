-- -----------------------------------------------------
-- Table pais
-- -----------------------------------------------------
CREATE TABLE PAIS (id_pais NUMBER NOT NULL,
  pais_nombre VARCHAR2(45) NOT NULL,
  CONSTRAINT pk_id_pais PRIMARY KEY (id_pais)
  );

-- -----------------------------------------------------
-- Table cliente
-- -----------------------------------------------------
CREATE TABLE CLIENTES (id_cliente NUMBER NOT NULL,
  dni VARCHAR2(45) NOT NULL,
  nombre1 VARCHAR2(45) NOT NULL,
  nombre2 VARCHAR2(45),
  apellido1 VARCHAR2(45) NOT NULL,
  apellido2 VARCHAR2(45),
  email VARCHAR2(45) NOT NULL,
  telefono VARCHAR2(45) NOT NULL,
  edad number NOT NULL,
  cod_pais NUMBER NOT NULL,
  CONSTRAINT pk_id_cliente PRIMARY KEY (id_cliente),
  CONSTRAINT fk_cod_pais
    FOREIGN KEY (cod_pais)
    REFERENCES PAIS (id_pais)
);


-- -----------------------------------------------------
-- Table guia
-- -----------------------------------------------------
CREATE TABLE GUIAS (id_guia NUMBER NOT NULL,
  dni VARCHAR2(45) NOT NULL,
  nombre1 VARCHAR2(45) NOT NULL,
  apellido1 VARCHAR2(45) NOT NULL,
  email VARCHAR2(45) NOT NULL,
  telefono VARCHAR2(45) NOT NULL,
  edad number NOT NULL,
  ciudad VARCHAR2(45) NOT NULL,
  CONSTRAINT pk_id_guia PRIMARY KEY (id_guia)
  );

----TABLE DIFICULTAD-----
CREATE TABLE DIFICULTAD (id_dificultad NUMBER NOT NULL,
  descripcion VARCHAR2(45) NOT NULL,
  CONSTRAINT pk_id_dificultad PRIMARY KEY (id_dificultad)
  );
-- -----------------------------------------------------
-- Table tours
-- -----------------------------------------------------
CREATE TABLE TOURS (id_tours NUMBER NOT NULL,
  tour_nombre VARCHAR2(45) NOT NULL,
  duracion NUMBER NOT NULL,
  descripcion VARCHAR2(250) NOT NULL,
  precio number NOT NULL,
  cantidad_cupos number not null,
  id_dificultad NUMBER NOT NULL,
  id_guia NUMBER NOT NULL,
  CONSTRAINT pk_id_tours PRIMARY KEY (id_tours),
  CONSTRAINT fk_id_dificultad
    FOREIGN KEY (id_dificultad)
    REFERENCES DIFICULTAD (id_dificultad),
  CONSTRAINT fk_id_guia
    FOREIGN KEY (id_guia)
    REFERENCES GUIAS (id_guia)
);


-- -----------------------------------------------------
-- Table reservacion
-- -----------------------------------------------------
CREATE TABLE RESERVACION (id_reserva NUMBER NOT NULL,
  id_cliente NUMBER NOT NULL,
  fecha_reserva DATE NOT NULL,
  cantidad_personas number default 0,
  CONSTRAINT pk_id_reserva PRIMARY KEY (id_reserva),
  CONSTRAINT fk_id_cliente
    FOREIGN KEY (id_cliente)
    REFERENCES CLIENTES (id_cliente)
);



-- -----------------------------------------------------
-- Table reserva_tours
-- -----------------------------------------------------

CREATE TABLE RESERVA_TOURS (
  id_reserva1 NUMBER NOT NULL,
  id_tour1 NUMBER NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  CONSTRAINT pk_reserva_tour PRIMARY KEY (id_reserva1,id_tour1),
  CONSTRAINT fk_reserva1
    FOREIGN KEY (id_reserva1)
    REFERENCES RESERVACION (id_reserva),
  CONSTRAINT fk_tours1
    FOREIGN KEY (id_tour1)
    REFERENCES TOURS (id_tours)
);

-- -----------------------------------------------------
-- Table destinos
-- -----------------------------------------------------
CREATE TABLE DESTINOS (id_destinos NUMBER NOT NULL,
  destino_nombre VARCHAR2(45) NOT NULL,
  CONSTRAINT pk_id_destinos PRIMARY KEY (id_destinos)
);

-- -----------------------------------------------------
-- Table destinos_tours
-- -----------------------------------------------------
CREATE TABLE DESTINOS_TOURS (
  id_destino1 NUMBER NOT NULL,
  id_tour2 NUMBER NOT NULL,
  PRIMARY KEY (id_destino1,id_tour2),
  CONSTRAINT fk_destinos1
    FOREIGN KEY (id_destino1)
    REFERENCES DESTINOS (id_destinos),
  CONSTRAINT fk_tours2
    FOREIGN KEY (id_tour2)
    REFERENCES TOURS (id_tours)
);

-- -----------------------------------------------------
-- SECUENCIAS
-- -----------------------------------------------------
--SECUENCIAS DE ID DE TABLAS Clientes--
CREATE SEQUENCE sec_id_cliente
INCREMENT BY 1
START WITH 14720
NOMAXVALUE
NOCYCLE;


--SECUENCIAS DE LAS REVIEWS
CREATE SEQUENCE sec_id_review
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

--SECUENCIAS DE LOS DESTINOS--
CREATE SEQUENCE sec_id_destino
INCREMENT BY 1
START WITH 17
NOMAXVALUE
NOCYCLE;

--SECUENCIAS DE LOS DESTINOS--
CREATE SEQUENCE sec_id_tour
INCREMENT BY 1
START WITH 11
NOMAXVALUE
NOCYCLE;

--SECUENCIAS DE LOS GUIAS--
CREATE SEQUENCE sec_id_guia
INCREMENT BY 1
START WITH 11
NOMAXVALUE
NOCYCLE;

--SECUENCIAS DE RESERVA--
CREATE SEQUENCE sec_id_reserva
INCREMENT BY 1
START WITH 101
NOMAXVALUE
NOCYCLE;

--SECUENCIAS DE RESERVA_TOUR--
CREATE SEQUENCE sec_id_reserva_tour
INCREMENT BY 1
START WITH 101
NOMAXVALUE
NOCYCLE;

--SECUENCIAS DE AUDITORIA-
CREATE SEQUENCE sec_cod_aut
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
MINVALUE 1;

--SECUENCIAS DE AUDITORIA--
CREATE SEQUENCE sec_id_promo
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE;



---- INSERT PARA LAS TABLAS---
INSERT INTO PAIS VALUES (1, 'Andorra ');
INSERT INTO PAIS VALUES (2, 'Emiratos Árabes Unidos ');
INSERT INTO PAIS VALUES (3, 'Afganistán ');
INSERT INTO PAIS VALUES (4, 'Antigua y Barbuda ');
INSERT INTO PAIS VALUES (5, 'Anguila ');
INSERT INTO PAIS VALUES (6, 'Albania ');
INSERT INTO PAIS VALUES (7, 'Armenia ');
INSERT INTO PAIS VALUES (8, 'Antillas Holandesas ');
INSERT INTO PAIS VALUES (9, 'Angola ');
INSERT INTO PAIS VALUES (10, 'Antártida ');
INSERT INTO PAIS VALUES (11, 'Argentina ');
INSERT INTO PAIS VALUES (12, 'Samoa Americana ');
INSERT INTO PAIS VALUES (13, 'Austria ');
INSERT INTO PAIS VALUES (14, 'Australia ');
INSERT INTO PAIS VALUES (15, 'Aruba ');
INSERT INTO PAIS VALUES (16, 'Azerbaiyán ');
INSERT INTO PAIS VALUES (17, 'Bosnia y Herzegovina ');
INSERT INTO PAIS VALUES (18, 'Barbados ');
INSERT INTO PAIS VALUES (19, 'Bangladesh ');
INSERT INTO PAIS VALUES (20, 'Bélgica ');
INSERT INTO PAIS VALUES (21, 'Burkina Faso ');
INSERT INTO PAIS VALUES (22, 'Bahrein ');
INSERT INTO PAIS VALUES (23, 'Burundi ');
INSERT INTO PAIS VALUES (24, 'Benin ');
INSERT INTO PAIS VALUES (25, 'Bermudas ');
INSERT INTO PAIS VALUES (26, 'Bolivia ');
INSERT INTO PAIS VALUES (27, 'Brasil ');
INSERT INTO PAIS VALUES (28, 'Bahamas ');
INSERT INTO PAIS VALUES (29, 'Bután ');
INSERT INTO PAIS VALUES (30, 'Isla Bouvet ');
INSERT INTO PAIS VALUES (31, 'Bulgaria ');
INSERT INTO PAIS VALUES (32, 'Botswana ');
INSERT INTO PAIS VALUES (33, 'Brunei Darussalam ');
INSERT INTO PAIS VALUES (34, 'Bielorrusia ');
INSERT INTO PAIS VALUES (35, 'Belice ');
INSERT INTO PAIS VALUES (36, 'Canadá ');
INSERT INTO PAIS VALUES (37, 'Cocos');
INSERT INTO PAIS VALUES (38, 'República Centroafricana ');
INSERT INTO PAIS VALUES (39, 'Congo ');
INSERT INTO PAIS VALUES (40, 'Suiza ');
INSERT INTO PAIS VALUES (41, 'Costa de Marfil');
INSERT INTO PAIS VALUES (42, 'Islas Cook ');
INSERT INTO PAIS VALUES (43, 'Chile ');
INSERT INTO PAIS VALUES (44, 'Camerún ');
INSERT INTO PAIS VALUES (45, 'China ');
INSERT INTO PAIS VALUES (46, 'Colombia ');
INSERT INTO PAIS VALUES (47, 'Costa Rica ');
INSERT INTO PAIS VALUES (48, 'Cuba ');
INSERT INTO PAIS VALUES (49, 'Cabo Verde ');
INSERT INTO PAIS VALUES (50, 'Isla de Navidad ');
INSERT INTO PAIS VALUES (51, 'Chipre ');
INSERT INTO PAIS VALUES (52, 'República Checa ');
INSERT INTO PAIS VALUES (53, 'Alemania ');
INSERT INTO PAIS VALUES (54, 'Djibouti ');
INSERT INTO PAIS VALUES (55, 'Dinamarca ');
INSERT INTO PAIS VALUES (56, 'Dominica ');
INSERT INTO PAIS VALUES (57, 'República Dominicana ');
INSERT INTO PAIS VALUES (58, 'Argelia ');
INSERT INTO PAIS VALUES (59, 'Ecuador ');
INSERT INTO PAIS VALUES (60, 'Estonia ');
INSERT INTO PAIS VALUES (61, 'Egipto ');
INSERT INTO PAIS VALUES (62, 'Sáhara Occidental ');
INSERT INTO PAIS VALUES (63, 'Eritrea ');
INSERT INTO PAIS VALUES (64, 'España ');
INSERT INTO PAIS VALUES (65, 'Etiopía ');
INSERT INTO PAIS VALUES (66, 'Finlandia ');
INSERT INTO PAIS VALUES (67, 'Fiji ');
INSERT INTO PAIS VALUES (68, 'Islas Malvinas ');
INSERT INTO PAIS VALUES (69, 'Micronesia ');
INSERT INTO PAIS VALUES (70, 'Islas Feroe ');
INSERT INTO PAIS VALUES (71, 'Francia ');
INSERT INTO PAIS VALUES (72, 'Gabón ');
INSERT INTO PAIS VALUES (73, 'Reino Unido');
INSERT INTO PAIS VALUES (74, 'Granada ');
INSERT INTO PAIS VALUES (75, 'Georgia ');
INSERT INTO PAIS VALUES (76, 'Guayana Francesa');
INSERT INTO PAIS VALUES (77, 'Ghana ');
INSERT INTO PAIS VALUES (78, 'Gibraltar ');
INSERT INTO PAIS VALUES (79, 'Groenlandia ');
INSERT INTO PAIS VALUES (80, 'Gambia ');
INSERT INTO PAIS VALUES (81, 'Guinea ');
INSERT INTO PAIS VALUES (82, 'Guadalupe ');
INSERT INTO PAIS VALUES (83, 'Guinea Ecuatorial ');
INSERT INTO PAIS VALUES (84, 'Grecia ');
INSERT INTO PAIS VALUES (85, 'Georgia del Sur y Islas Sandwich del Sur ');
INSERT INTO PAIS VALUES (86, 'Guatemala ');
INSERT INTO PAIS VALUES (87, 'Guam ');
INSERT INTO PAIS VALUES (88, 'Guinea-Bissau ');
INSERT INTO PAIS VALUES (89, 'Guayana ');
INSERT INTO PAIS VALUES (90, 'Hong Kong ');
INSERT INTO PAIS VALUES (91, 'Islas Heard y McDonald ');
INSERT INTO PAIS VALUES (92, 'Honduras ');
INSERT INTO PAIS VALUES (93, 'Croacia');
INSERT INTO PAIS VALUES (94, 'Haití ');
INSERT INTO PAIS VALUES (95, 'Hungría ');
INSERT INTO PAIS VALUES (96, 'Indonesia ');
INSERT INTO PAIS VALUES (97, 'Irlanda ');
INSERT INTO PAIS VALUES (98, 'Israel ');
INSERT INTO PAIS VALUES (99, 'India ');
INSERT INTO PAIS VALUES (100, 'Territorio Británico del Océano Índico');
INSERT INTO PAIS VALUES (101, 'Irak ');
INSERT INTO PAIS VALUES (102, 'Irán ');
INSERT INTO PAIS VALUES (103, 'Islandia ');
INSERT INTO PAIS VALUES (104, 'Italia ');
INSERT INTO PAIS VALUES (105, 'Jamaica ');
INSERT INTO PAIS VALUES (106, 'Jordania ');
INSERT INTO PAIS VALUES (107, 'Japón ');
INSERT INTO PAIS VALUES (108, 'Kenia ');
INSERT INTO PAIS VALUES (109, 'Kirguistán ');
INSERT INTO PAIS VALUES (110, 'Camboya ');
INSERT INTO PAIS VALUES (111, 'Kiribati ');
INSERT INTO PAIS VALUES (112, 'Comoras ');
INSERT INTO PAIS VALUES (113, 'Saint Kitts y Nevis ');
INSERT INTO PAIS VALUES (114, 'Corea del Norte ');
INSERT INTO PAIS VALUES (115, 'Corea del Sur ');
INSERT INTO PAIS VALUES (116, 'Kuwait ');
INSERT INTO PAIS VALUES (117, 'Las Islas Caimán ');
INSERT INTO PAIS VALUES (118, 'Kazajstán ');
INSERT INTO PAIS VALUES (119, 'Laos ');
INSERT INTO PAIS VALUES (120, 'Líbano ');
INSERT INTO PAIS VALUES (121, 'Santa Lucía ');
INSERT INTO PAIS VALUES (122, 'Liechtenstein ');
INSERT INTO PAIS VALUES (123, 'Sri Lanka ');
INSERT INTO PAIS VALUES (124, 'Liberia ');
INSERT INTO PAIS VALUES (125, 'Lesoto ');
INSERT INTO PAIS VALUES (126, 'Lituania ');
INSERT INTO PAIS VALUES (127, 'Luxemburgo ');
INSERT INTO PAIS VALUES (128, 'Letonia ');
INSERT INTO PAIS VALUES (129, 'Libia ');
INSERT INTO PAIS VALUES (130, 'Marruecos ');
INSERT INTO PAIS VALUES (131, 'Mónaco ');
INSERT INTO PAIS VALUES (132, 'Moldavia ');
INSERT INTO PAIS VALUES (133, 'Madagascar ');
INSERT INTO PAIS VALUES (134, 'Islas Marshall ');
INSERT INTO PAIS VALUES (135, 'Macedonia ');
INSERT INTO PAIS VALUES (136, 'Malí ');
INSERT INTO PAIS VALUES (137, 'Myanmar ');
INSERT INTO PAIS VALUES (138, 'Mongolia ');
INSERT INTO PAIS VALUES (139, 'Macao ');
INSERT INTO PAIS VALUES (140, 'Islas Marianas del Norte ');
INSERT INTO PAIS VALUES (141, 'Martinica ');
INSERT INTO PAIS VALUES (142, 'Mauritania ');
INSERT INTO PAIS VALUES (143, 'Montserrat ');
INSERT INTO PAIS VALUES (144, 'Malta ');
INSERT INTO PAIS VALUES (145, 'Mauricio ');
INSERT INTO PAIS VALUES (146, 'Maldivas ');
INSERT INTO PAIS VALUES (147, 'Malawi ');
INSERT INTO PAIS VALUES (148, 'México ');
INSERT INTO PAIS VALUES (149, 'Malasia ');
INSERT INTO PAIS VALUES (150, 'Mozambique ');
INSERT INTO PAIS VALUES (151, 'Namibia ');
INSERT INTO PAIS VALUES (152, 'Nueva Caledonia ');
INSERT INTO PAIS VALUES (153, 'Níger ');
INSERT INTO PAIS VALUES (154, 'Norfolk Island ');
INSERT INTO PAIS VALUES (155, 'Nigeria ');
INSERT INTO PAIS VALUES (156, 'Nicaragua ');
INSERT INTO PAIS VALUES (157, 'Países Bajos ');
INSERT INTO PAIS VALUES (158, 'Noruega ');
INSERT INTO PAIS VALUES (159, 'Nepal ');
INSERT INTO PAIS VALUES (160, 'Nauru ');
INSERT INTO PAIS VALUES (161, 'Niue ');
INSERT INTO PAIS VALUES (162, 'Nueva Zelanda ');
INSERT INTO PAIS VALUES (163, 'Omán ');
INSERT INTO PAIS VALUES (164, 'Panamá ');
INSERT INTO PAIS VALUES (165, 'Perú ');
INSERT INTO PAIS VALUES (166, 'Polinesia francés ');
INSERT INTO PAIS VALUES (167, 'Papua Nueva Guinea ');
INSERT INTO PAIS VALUES (168, 'Filipinas ');
INSERT INTO PAIS VALUES (169, 'Pakistán ');
INSERT INTO PAIS VALUES (170, 'Polonia ');
INSERT INTO PAIS VALUES (171, 'San Pedro y Miquelón ');
INSERT INTO PAIS VALUES (172, 'Pitcairn ');
INSERT INTO PAIS VALUES (173, 'Puerto Rico ');
INSERT INTO PAIS VALUES (174, 'Portugal ');
INSERT INTO PAIS VALUES (175, 'Palau ');
INSERT INTO PAIS VALUES (176, 'Paraguay ');
INSERT INTO PAIS VALUES (177, 'Qatar ');
INSERT INTO PAIS VALUES (178, 'Reunión ');
INSERT INTO PAIS VALUES (179, 'Rumania ');
INSERT INTO PAIS VALUES (180, 'La Federación de Rusia ');
INSERT INTO PAIS VALUES (181, 'Ruanda ');
INSERT INTO PAIS VALUES (182, 'Arabia Saudita ');
INSERT INTO PAIS VALUES (183, 'Las Islas Salomón ');
INSERT INTO PAIS VALUES (184, 'Seychelles ');
INSERT INTO PAIS VALUES (185, 'Sudán ');
INSERT INTO PAIS VALUES (186, 'Suecia ');
INSERT INTO PAIS VALUES (187, 'Singapur ');
INSERT INTO PAIS VALUES (188, 'Santa Elena ');
INSERT INTO PAIS VALUES (189, 'Eslovenia ');
INSERT INTO PAIS VALUES (190, 'Svalbard y Jan Mayen ');
INSERT INTO PAIS VALUES (191, 'República Eslovaca ');
INSERT INTO PAIS VALUES (192, 'Sierra Leona ');
INSERT INTO PAIS VALUES (193, 'San Marino ');
INSERT INTO PAIS VALUES (194, 'Senegal ');
INSERT INTO PAIS VALUES (195, 'Somalia ');
INSERT INTO PAIS VALUES (196, 'Suriname ');
INSERT INTO PAIS VALUES (197, 'Santo Tomé y Príncipe ');
INSERT INTO PAIS VALUES (198, 'El Salvador ');
INSERT INTO PAIS VALUES (199, 'Siria ');
INSERT INTO PAIS VALUES (200, 'Swazilandia ');
INSERT INTO PAIS VALUES (201, 'Islas Turcas y Caicos ');
INSERT INTO PAIS VALUES (202, 'Chad ');
INSERT INTO PAIS VALUES (203, 'Territorios del sur francés ');
INSERT INTO PAIS VALUES (204, 'Togo ');
INSERT INTO PAIS VALUES (205, 'Tailandia ');
INSERT INTO PAIS VALUES (206, 'Tayikistán ');
INSERT INTO PAIS VALUES (207, 'Tokelau ');
INSERT INTO PAIS VALUES (208, 'Turkmenistán ');
INSERT INTO PAIS VALUES (209, 'Túnez ');
INSERT INTO PAIS VALUES (210, 'Tonga ');
INSERT INTO PAIS VALUES (211, 'Timor Oriental ');
INSERT INTO PAIS VALUES (212, 'Turquía ');
INSERT INTO PAIS VALUES (213, 'Trinidad y Tobago ');
INSERT INTO PAIS VALUES (214, 'Tuvalu ');
INSERT INTO PAIS VALUES (215, 'Taiwan ');
INSERT INTO PAIS VALUES (216, 'Tanzania ');
INSERT INTO PAIS VALUES (217, 'Ucrania ');
INSERT INTO PAIS VALUES (218, 'Uganda ');
INSERT INTO PAIS VALUES (219, 'Reino Unido ');
INSERT INTO PAIS VALUES (220, 'Islas menores  de EE.UU.');
INSERT INTO PAIS VALUES (221, 'Estados Unidos de América');
INSERT INTO PAIS VALUES (222, 'Uruguay ');
INSERT INTO PAIS VALUES (223, 'Uzbekistán ');
INSERT INTO PAIS VALUES (224, 'Ciudad del Vaticano ');
INSERT INTO PAIS VALUES (225, 'San Vicente y las Granadinas ');
INSERT INTO PAIS VALUES (226, 'Venezuela ');
INSERT INTO PAIS VALUES (227, 'Islas Vírgenes');
INSERT INTO PAIS VALUES (228, 'Vietnam ');
INSERT INTO PAIS VALUES (229, 'Vanuatu ');
INSERT INTO PAIS VALUES (230, 'Islas Wallis y Futuna ');
INSERT INTO PAIS VALUES (231, 'Samoa ');
INSERT INTO PAIS VALUES (232, 'Yemen ');
INSERT INTO PAIS VALUES (233, 'Mayotte ');
INSERT INTO PAIS VALUES (234, 'Yugoslavia ');
INSERT INTO PAIS VALUES (235, 'Sudáfrica ');
INSERT INTO PAIS VALUES (236, 'Zambia ');
INSERT INTO PAIS VALUES (237, 'Zaire ');
INSERT INTO PAIS VALUES (238, 'Zimbabue ');

--INSERTAR CLIENTES--
INSERT INTO CLIENTES VALUES(8977, '800-99-123', 'JUAN', 'MARTINEZ', 'ZELAYA', 'ANTONIO', 'JUAN8977@MAIL.COM', '(337) 308-5133', 59, 198);
INSERT INTO CLIENTES VALUES(9010, '800-99-124', 'KREVITH', 'BEITIA', 'SHAW', 'HOLBERT', 'KREVITH9010@MAIL.COM', '(554) 887-4705', 57, 164);
INSERT INTO CLIENTES VALUES(9067, '800-99-125', 'BORIS', 'MENDOZA', 'FLORES', 'NELSON', 'BORIS9067@MAIL.COM', '(761) 503-5101', 22, 164);

--INSERTAR GUIA--
INSERT INTO GUIAS VALUES (1, '8-456-875', 'Fernando', 'Diaz', 'fernando.diaz@outlook.com', '68707239', 20, 'Ciudad de Panamá');
INSERT INTO GUIAS VALUES (2, '6-916-569', 'Serena', 'Cañate', 'alexander.canate@outlook.com', '68752699', 25, 'Ciudad de Panamá');

---INSERTAR DIFICULTAD--
INSERT INTO dificultad VALUES (1, 'Fácil');
INSERT INTO dificultad VALUES (2, 'Media');
INSERT INTO dificultad VALUES (3, 'Dificil');

-- INSERTAR TOURS
INSERT INTO TOURS VALUES (1, 'Tour de la ciudad y el Canal de Panamá ', 6, 'Conoce los mejores lugares en la ciudad de Panamá.', 67, 20, 1, 1);
INSERT INTO TOURS VALUES (2, 'Tour privado centro histórico de Panamá', 8, 'La historia de Panamá en un tour.', 100, 5, 1, 2);
-- INSERT INTO TOURS VALUES (3, 'Ven a San Blas ', 16, 'Las maravillas de la isla San Blas.', 89, 30, 2, 3);

-- INSERTAR RESERVAS
INSERT INTO RESERVACION VALUES (1, 8977, TO_DATE('02-01-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (2, 9010,TO_DATE('03-01-2019','DD-MM-YYYY'),2);
-- INSERT INTO RESERVACION VALUES (3, 10057,TO_DATE('04-01-2019','DD-MM-YYYY'),5);

-- INSERTAR RESERVA_TOURS 
INSERT INTO RESERVA_TOURS VALUES( 1, 2, TO_DATE('04-01-2019','DD-MM-YYYY'), TO_DATE('07-01-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 2, 1, TO_DATE('05-01-2019','DD-MM-YYYY'), TO_DATE('05-01-2019','DD-MM-YYYY'));
-- INSERT INTO RESERVA_TOURS VALUES( 2, 6, TO_DATE('07-01-2019','DD-MM-YYYY'), TO_DATE('10-01-2019','DD-MM-YYYY'));

--INSERTAR DESTINO
INSERT INTO DESTINOS VALUES (1,'Canal de Panamá');
INSERT INTO DESTINOS VALUES (2,'Biomuseo');
INSERT INTO DESTINOS VALUES (3,'Casco Antiguo');

-- INSERTAR DESTINOS TOURS
----DESTINOS_TOURS---
INSERT INTO DESTINOS_TOURS VALUES (1, 1);
INSERT INTO DESTINOS_TOURS VALUES (2, 1);
INSERT INTO DESTINOS_TOURS VALUES (3, 1);

-- -----------------------------------------------------
-- PROCESO DE MODIFICACION DEL MODELO DE DATOS DE TOURINY
-- -----------------------------------------------------

-- -----------------------------------------------------
-- 1- CREACION DE NUEVAS TABLAS
-- -----------------------------------------------------

--REVIEWS
CREATE TABLE REVIEWS (
  id_review NUMBER NOT NULL,
  id_cliente NUMBER NOT NULL,
  id_tour NUMBER NOT NULL,
  descripcion VARCHAR2(250),
  calificacion NUMBER,
  fecha_review DATE,
  CONSTRAINT pk_id_reviews PRIMARY KEY (id_review),
  CONSTRAINT fk_id_rev_client
    FOREIGN KEY (id_cliente)
    REFERENCES CLIENTES(id_cliente),
  CONSTRAINT fk_id_rev_tour
    FOREIGN KEY (id_tour)
    REFERENCES TOURS(id_tours)  
);


--AUDITORIA
CREATE TABLE AUDITORIA (
  id_auditoria NUMBER NOT NULL,
  no_reserva NUMBER NOT NULL,
  id_cliente NUMBER NOT NULL,
  id_tour NUMBER NOT NULL,
  fecha_reserva DATE NOT NULL,
  cantidad_personas NUMBER NOT NULL,
  cantidad_tours NUMBER NOT NULL,
  fecha_inicio NUMBER NOT NULL,
  fecha_fin NUMBER NOT NULL,
  status Char(2) NOT NULL,
  precio_total NUMBER NOT NULL,
  usuario VARCHAR2(250) NOT NULL,
  fecha_insercion DATE NOT NULL,
  CONSTRAINT auditoria_pk PRIMARY KEY (id_auditoria),
  CONSTRAINT auditoria_RESERVACION_fk FOREIGN KEY (no_reserva)
      REFERENCES RESERVACION (id_reserva)
);



--PROMOCIONES

CREATE TABLE PROMOCIONES(
  id_promo NUMBER NOT NULL,
  descripcion VARCHAR2(250) NOT NULL,
  mes_inicio NUMBER DEFAULT 0,
  mes_fin NUMBER DEFAULT 0,
  promocion NUMBER DEFAULT 0,
  CONSTRAINT pk_promocion PRIMARY KEY (id_promo)
);

-- -----------------------------------------------------
-- 2- MODIFICACION DE LAS TABLAS
-- -----------------------------------------------------
--DESTINOS
ALTER TABLE DESTINOS
  ADD (
    coordenadas VARCHAR2(200),
    fecha_ingreso DATE
  );

--DESTINOS_TOURS
ALTER TABLE DESTINOS_TOURS
 ADD (
   fecha_ingreso date
 );

--CLIENTES
ALTER TABLE CLIENTES 
  ADD (
    ciudad VARCHAR2(45),
    direccion VARCHAR2(250),
    fecha_nacimiento DATE,
    sexo VARCHAR2(45),
    fecha_ingreso DATE
  );

-- GUIAS
ALTER TABLE Guias
  ADD(
    direccion VARCHAR2(250),
    fecha_nacimiento DATE,
    sexo VARCHAR2(45),
    fecha_ingreso DATE
  );

-- -----------------------------------------------------
-- TOURS
-- -----------------------------------------------------

ALTER TABLE TOURS
  ADD (
    status CHAR(2),
    calificacion NUMBER(1) DEFAULT 0,
    id_promo NUMBER,
    promocion NUMBER,
    fecha_mod DATE,
    CONSTRAINT c_status CHECK (status IN ('D','A','N')),
    CONSTRAINT fk_promo FOREIGN KEY (id_promo)
      REFERENCES PROMOCIONES (id_promo)
  );

-- -----------------------------------------------------
-- RESERVACION
-- -----------------------------------------------------
--Estatus: PENDIENTE, CONFIRMADA, CANCELADA.
ALTER TABLE RESERVACION
  ADD (
    total_personas number,
    status CHAR(2),
    precio_total NUMBER(15,2) DEFAULT 0,
    CONSTRAINT c_re_status CHECK (status IN ('PE','CO','CA'))
  );

--RESERVA_TOURS
ALTER TABLE RESERVA_TOURS
  ADD(
    precio_tour number,
    cantidad_personas number,
    status char(2),
    fecha_ingreso date
  );

ALTER TABLE RESERVA_TOURS
DROP CONSTRAINT pk_reserva_tour; 
-- -----------------------------------------------------
-- 3- MIGRACION AL NUEVO MODELO
-- -----------------------------------------------------
-- COPIANDO cantidad_personas DATOS DE RESERVACION --> HACIA RESERVA TOUR
UPDATE reserva_tours 
    SET cantidad_personas = (
        SELECT cantidad_personas
        FROM reservacion
        WHERE reservacion.id_reserva = reserva_tours.id_reserva1
    );

--COPIANDO el precio DATOS DE TOURS --> HACIA RESERVA TOURS
UPDATE reserva_tours 
    SET precio_tour = (
        SELECT precio
        FROM tours
        WHERE tours.id_tours = reserva_tours.id_tour1
    );

--ELIMININACION DE LOS VALORES NO NECESARIOS EN LA TABLA DE RESERVACION
ALTER TABLE RESERVACION
  DROP COLUMN cantidad_personas;




-- -----------------------------------------------------
-- FUNCIONES
-- -----------------------------------------------------

/*
Funcion para calcula edad
*/
CREATE OR REPLACE FUNCTION calcularEdadCliente(p_fecha date)
RETURN NUMBER IS 
v_clienteEdad number(3);
v_fecha date := p_fecha;
BEGIN
  -- Necesitamos eso en años
  v_clienteEdad := (SYSDATE - v_fecha) / 365;

  RETURN v_clienteEdad;
  
  EXCEPTION
   WHEN ZERO_DIVIDE THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: Fecha no valida.');
END calcularEdadCliente;
/

--Funcion para calcular horas
create or replace function calcularhoras(l_horas number)
return number IS
v_dias number;

BEGIN

if l_horas/24 <= 1 then
v_dias := 1;
elsif l_horas/24 > 1 and l_horas/24 <= 2 THEN
v_dias := 2;
elsif l_horas/24 >2 and l_horas/24 <=3 THEN
v_dias := 3;
end if;

return v_dias;
EXCEPTION
   WHEN ZERO_DIVIDE THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: hora ingresada no valida.');
END calcularhoras;
/

--Funcion para aplicar descuento

create or replace function descuento(descuento number, precio number)
return number IS
v_resultado number;

BEGIN
v_resultado := precio -(descuento * precio);
return v_resultado;
END descuento;
/



-- -----------------------------------------------------
-- PROCEDIMIENTOS
-- -----------------------------------------------------

--CLIENTES

-- -----------------------------------------------------
-- 1- Proc Registro del cliente
-- Primero correr funcion calcularEdad
-- -----------------------------------------------------
CREATE OR REPLACE PROCEDURE registroCliente(
    p_dni         IN clientes.dni%TYPE,
    p_Nombre1     IN clientes.nombre1%TYPE,
    p_Nombre2     IN clientes.nombre2%TYPE,
    p_apellido1   IN clientes.apellido1%TYPE,
    p_apellido2   IN clientes.apellido2%TYPE,
    p_email       IN clientes.email%TYPE,
    p_telefono    IN clientes.telefono%TYPE,
      p_fecha       IN clientes.fecha_nacimiento%TYPE,
    p_sexo        IN clientes.sexo%TYPE,
    p_pais        IN clientes.cod_pais%TYPE,
    p_ciudad      IN clientes.ciudad%TYPE,
    p_direccion   IN clientes.direccion%TYPE
    )

IS 
    intSeqVal number;
    v_edad number(3) := calcularEdadCliente(p_fecha);
BEGIN
    select sec_id_cliente.nextval into intSeqVal from dual;
INSERT into CLIENTES VALUES (
    intSeqVal,
    p_dni,
    p_Nombre1,
    p_Nombre2,
    p_apellido1,
    p_apellido2,
    p_email,
    p_telefono,
    v_edad,
    p_pais,
    p_ciudad,
    p_direccion,
    to_date(p_fecha,'DD-MM-YYYY'),
    p_sexo,
    sysdate
    );
    COMMIT;
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: El cliente ya existe.');
END registroCliente;
/


-- -----------------------------------------------------
-- 2- Proc Registro de reserva del cliente
-- Correr primer calcular horas
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE registroReserva(
    p_id_cliente         IN clientes.id_cliente%TYPE,
    p_id_tour            IN reserva_tours.id_tour1%TYPE,
    p_cantidad_personas  IN reserva_tours.cantidad_personas%TYPE,
    p_fecha_inicio       IN reserva_tours.fecha_inicio%TYPE
    )

IS 
    intSeqVal number;
    v_id_cliente number;
    v_precio number;
    v_status CHAR(2) := 'PE';
    v_cantidad_max number;
    v_cupos number;
    limite_cupos_exeed EXCEPTION;
    v_dias number;
    v_horas number;
    PRAGMA exception_init(limite_cupos_exeed, -20111);
BEGIN

--validacion de no exceder el maximo de personas por solicitud y que la fecha
--de inicio del tour sea mayor a la fecha de solicutud. por lo menos 24h antes.
IF p_cantidad_personas <= 10 AND p_fecha_inicio > sysdate THEN
    --se extraen la cantidad maxima de personas del id tour ingresado.
    SELECT cantidad_cupos INTO v_cantidad_max 
    FROM TOURS
    WHERE id_tours = p_id_tour;

    --se realiza una sumatoria con las condiciones del id tour ingresado.
    --si el tour esta en estado pendiente y si esta en la misma fecha.
    SELECT SUM(cantidad_personas) INTO v_cupos
    FROM RESERVA_TOURS
    WHERE id_tour1 = p_id_tour
    AND fecha_inicio = p_fecha_inicio
    AND status = 'PE';

    --el numero de personas para un dia, no puede exeder el limite de personas del tour.
    IF v_cupos > v_cantidad_max THEN
        raise_application_error(-20111,'Limite de cupos exedido.');
    ELSE
    --antes de la insercion se valida con el trigger ValidarCupos
    select sec_id_reserva.nextval into intseqval from dual;
    INSERT INTO RESERVACION(
        id_reserva,
        id_cliente,
        fecha_reserva,
        status)
        VALUES (
            intseqval,
        p_id_cliente,
        sysdate,
        v_status);

    --extrae el precio del tour seleccionado;
    select precio into v_precio from tours where id_tours = p_id_tour;
    --extrae la duracion del tour selecionado.
    select duracion into v_horas from tours where id_tours = p_id_tour;
    --conversion de las horas de duracion a -> dias.
    v_dias := calcularhoras(v_horas);

    --FINALIZA LA TRANSACCION INSERTANTO LOS VALORES EN RESERVA_TOUR.
    INSERT INTO RESERVA_TOURS(
        id_reserva1,
        id_tour1,
        fecha_inicio,
        fecha_fin,
        precio_tour,
        cantidad_personas,
        status,
        fecha_ingreso)
        VALUES(
            intseqval,
            p_id_tour,
            to_date(p_fecha_inicio,'dd-mm-yy'),
            to_date(p_fecha_inicio,'dd-mm-yy') + v_dias,
            v_precio,
            p_cantidad_personas,
            v_status,
            sysdate
        );
    END IF;
ELSE
    DBMS_OUTPUT.PUT_LINE('💣 Advertencia: El numero maximo de personas es 10. Validar fecha de inicio.');
END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: Advertencia: No se han encontrado datos.');
    WHEN limite_cupos_exeed THEN
        DBMS_OUTPUT.PUT_LINE('💣 Advertencia: Cupos agotados para este tour. Elija una fecha diferente.');
END registroReserva;
/


-- -----------------------------------------------------
-- 3- Proc Registro de reviews del cliente
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE registroReview(
    p_ciente          IN reviews.id_cliente%TYPE,
    p_tour            IN reviews.id_tour%TYPE,
    p_descripcion     IN reviews.descripcion%TYPE,
    p_calificacion    IN reviews.calificacion%TYPE
    )

IS 
    intSeqVal number;
BEGIN
    select sec_id_review.nextval into intSeqVal from dual;
INSERT into REVIEWS VALUES (
    intSeqVal,
    p_ciente,
    p_tour,
    p_descripcion,
    p_calificacion,
    sysdate
    );
    COMMIT;
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: El cliente ya existe.');
END registroReview;
/



--ADMINISTRACION
-- -----------------------------------------------------
-- 1- Proc Registro del guia
-- Recordar correr la funcion calcularEdad y correr las secuencias
-- -----------------------------------------------------
CREATE OR REPLACE PROCEDURE registroGuia(
    p_dni         IN guias.dni%TYPE,
    p_Nombre1     IN guias.nombre1%TYPE,
    p_apellido1   IN guias.apellido1%TYPE,
    p_email       IN guias.email%TYPE,
    p_telefono    IN guias.telefono%TYPE,
    p_ciudad      IN guias.ciudad%TYPE,
    p_direccion   IN guias.direccion%TYPE,
    p_sexo        IN guias.sexo%TYPE,
    p_fecha       IN guias.fecha_nacimiento%TYPE
    )

IS 
    intSeqVal number;
    v_edad number(3) := calcularEdadCliente(p_fecha);
BEGIN
    select sec_id_guia.nextval into intSeqVal from dual;
INSERT into GUIAS VALUES (
    intSeqVal,
    p_dni,
    p_Nombre1,
    p_apellido1,
    p_email,
    p_telefono,
    v_edad,
    p_ciudad,
    p_direccion,
    to_date(p_fecha,'DD-MM-YYYY'),
    p_sexo,
    sysdate
    );
    COMMIT;
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: El guia ya existe.');
END registroGuia;
/

--LOGISTICA

-- -----------------------------------------------------
-- 1- Proc Registro de destinos
-- -----------------------------------------------------
CREATE OR REPLACE PROCEDURE registroDestino(
    p_nombre          IN destinos.destino_nombre%TYPE,
    p_coordenadas     IN destinos.coordenadas%TYPE
    )

IS 
    intSeqVal number;
BEGIN
    select sec_id_destino.nextval into intSeqVal from dual;
INSERT into DESTINOS VALUES (
    intSeqVal,
    p_nombre,
    p_coordenadas,
    sysdate
    );
    COMMIT;
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: El destino ya existe.');
END registroDestino;
/


-- -----------------------------------------------------
-- 2- Proc Registro de los tours
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE registroTour(
    p_nombre          IN tours.tour_nombre%TYPE,
    p_duracion        IN tours.duracion%TYPE,
    p_descripcion     IN tours.descripcion%TYPE,
    p_precio          IN tours.precio%TYPE,
    p_cupos           IN tours.cantidad_cupos%TYPE,
    p_dificultad      IN tours.id_dificultad%TYPE,
    p_guia            IN tours.id_guia%TYPE,
    p_id_promo        IN tours.id_promo%TYPE,
    p_destino1        number,
    p_destino2        number,
    p_destino3        number)

IS 
    
    v_precio number := p_precio;
    v_status char(2) := 'A';
    v_calificacion number := 0;
    v_promocion number;
    intSeqVal number;

    v_dest1 number := p_destino1;
    v_dest2 number := p_destino2;
    v_dest3 number := p_destino3;
    --array asociativo para guardar los destinos que tendra el tour.
    TYPE destinos IS TABLE OF NUMBER INDEX BY VARCHAR2(15);
    destino_id destinos;
    Idx VARCHAR2(15);

BEGIN
    --inicializacion de la secuencia.
    select sec_id_tour.nextval into intSeqVal from dual;

    --extraccion del valor de la promocion en promociones.
    select promocion into v_promocion from promociones where id_promo = p_id_promo;
    
INSERT into TOURS VALUES (
    intSeqVal,
    p_nombre,
    p_duracion,
    p_descripcion,
    p_precio,
    p_cupos,
    p_dificultad,
    p_guia,
    v_status,
    v_calificacion,
    p_id_promo,
    v_promocion,
    sysdate
    );

    --asignacion de los valores de los destinos para el tour.
    destino_id('destino1') := v_dest1;
    destino_id('destino2') := v_dest2;
    destino_id('destino3') := v_dest3;

    --asignacion del primer valor del array.
    idx := destino_id.first;

    --loop en el array para insertar el id del tour y el destino en la relacion muchos a muchos.
    WHILE Idx IS NOT NULL LOOP
        INSERT INTO DESTINOS_TOURS VALUES(
            destino_id(idx),
            intSeqVal,
            sysdate
        );
        Idx := destino_id.NEXT(Idx);
    END LOOP;

EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: El tour ya existe.');
END registroTour;
/

--MERCADOTECNIA

-- -----------------------------------------------------
-- 1- Proc Registro de promociones
-- -----------------------------------------------------
CREATE OR REPLACE PROCEDURE registroPromociones(
    p_descripcion       IN promociones.descripcion%TYPE,
    p_mes_inicio       IN promociones.mes_inicio%TYPE,
    p_mes_fin      IN promociones.mes_fin%TYPE,
    p_promocion      IN promociones.promocion%TYPE
    )
IS 
    intSeqVal number;
BEGIN
    select sec_id_promo.nextval into intSeqVal from dual;
INSERT into promociones VALUES (
    intSeqVal,
    p_descripcion,
    p_mes_inicio,
    p_mes_fin,
    p_promocion
    );
    COMMIT;
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: La promoción ya existe.');
END registroPromociones;
/


-- -----------------------------------------------------
-- 2- Proc activacion de las promociones
-- -----------------------------------------------------

create or replace procedure activarPromo(no_promocion number)
IS
v_id_promo number;
v_promo number;
v_descuento number;
BEGIN
select promocion into v_promo from promociones where id_promo = no_promocion;
update Tours
SET promocion = descuento(v_promo,precio)
where id_promo = no_promocion;
END activarPromo;
/

EXECUTE registroPromociones('Black Friday',11,12,0.35);
EXECUTE registroPromociones('Navidad', 12, 1, 0.5);
EXECUTE registroPromociones('Aniversario', 6, 7, 0.25);
EXECUTE registroPromociones('Rebajas de enero', 1, 2, 0.20);


-----CREACION DE LAS VISTAS----

-- 1 Consultar cuántos clientes reservan por distintos periodos de tiempo.​
/*
 CREATE VIEW VISTA_1_CUATRIMESTRE 
 AS SELECT TO_CHAR(fecha_reserva, 'Q') as "Cuatrimestre", COUNT(fecha_reserva) as "Cantidad" FROM reservacion
GROUP BY TO_CHAR(fecha_reserva, 'Q') 
ORDER BY TO_CHAR(fecha_reserva, 'Q');


-- 2 Conocer los dias más habituales de reserva. 

 CREATE VIEW VISTA_2_DIAS_HABITUALES 
AS SELECT TO_CHAR(fecha_reserva, 'DAY') AS "Dia de la semana" , COUNT(fecha_reserva) AS "Cantidad" FROM reservacion
GROUP BY TO_CHAR(fecha_reserva, 'DAY') 
ORDER BY COUNT(fecha_reserva) DESC;


-- 3 Identificar al consumidor a partir de la nacionalidad. 

 CREATE VIEW VISTA_3_NACIONALIDADES
AS SELECT p.pais_nombre AS "País", COUNT(c.id_cliente) AS "Cantidad de clientes"
    FROM PAIS p
    INNER JOIN CLIENTES c ON c.cod_pais = p.id_pais
    GROUP BY P.pais_nombre
    ORDER BY "Cantidad de clientes" DESC;


-- 4 Crear paquetes a partir de la cantidad de personas que suelen reservar en grupo.​

 CREATE VIEW VISTA_4_PAQUETES
AS SELECT
    SUM(CASE WHEN cantidad_personas BETWEEN 0 AND 1 THEN 1 ELSE 0 END) AS "Paquete Individual",
    SUM(CASE WHEN cantidad_personas BETWEEN 2 AND 2 THEN 1 ELSE 0 END) AS "Paquete Duo",
    SUM(CASE WHEN cantidad_personas BETWEEN 3 AND 3 THEN 1 ELSE 0 END) AS "Paquete Triple",
    SUM(CASE WHEN cantidad_personas BETWEEN 4 AND 10 THEN 1 ELSE 0 END) AS "Paquete Familiar"
 FROM reservacion;


-- 5 Establecer los tours ofrecidos más frecuentados.​

 CREATE VIEW VISTA_5_TOURS_FAVORITOS
AS SELECT  t.tour_nombre AS "Nombre del tour" , COUNT(b.tours_id_tours1) AS "Cantidad de bookings"
FROM tours t
INNER JOIN reserva_tours b 
ON b.tours_id_tours1 = t.id_tours
GROUP BY t.tour_nombre
ORDER BY COUNT(b.tours_id_tours1) DESC;


-- 6 Determinar el rango de edades más frecuentes de los clientes. 

 CREATE VIEW VISTA_6_EDADES
AS SELECT
    SUM(CASE WHEN edad BETWEEN 18 AND 24 THEN 1 ELSE 0 END) AS "18-24 Años",
    SUM(CASE WHEN edad BETWEEN 25 AND 54 THEN 1 ELSE 0 END) AS "25-54 Años",
    SUM(CASE WHEN edad BETWEEN 55 AND 63 THEN 1 ELSE 0 END) AS "55-63 Años",
    SUM(CASE WHEN edad BETWEEN 64 AND 105 THEN 1 ELSE 0 END) AS "64+ Años"
 FROM clientes;

-- 7 Comparar la cantidad de tours de cada guía turístico

CREATE VIEW VISTA_7_GUIAS_TURISTICOS AS SELECT (g.nombre1||' '||g.apellido1) as GUIA, COUNT(t.id_guia) "Tours"
FROM Guias g
    INNER JOIN TOURS t ON g.id_guia = t.id_guia
    GROUP BY g.nombre1, g.apellido1
    ORDER BY COUNT(t.id_guia) DESC;
*/



-----UPDATE PARA LOS DATOS ANTERIORES---

UPDATE CLIENTES SET 
  fecha_nacimiento = '13-FEB-1988',
  sexo = 'M',
  ciudad = 'Panamá',
  direccion = 'Punta Pacífica',
  fecha_ingreso = SYSDATE
where id_cliente = 8977;

UPDATE CLIENTES SET 
  fecha_nacimiento = '13-FEB-1965',
  sexo = 'M',
  ciudad = 'Panamá',
  direccion = 'Obarrio',
  fecha_ingreso = SYSDATE
where id_cliente = 9010;
  

-- Clientes 3
UPDATE CLIENTES SET 
  fecha_nacimiento = '25-FEB-1999',
  sexo = 'F',
  ciudad = 'Panamá',
  direccion = 'Costa Sur',
  fecha_ingreso = SYSDATE
where id_cliente = 9067;

-- Funciona registro cliente, cambiar orden de parámetros
EXECUTE registroCliente('800-99-126', 'SERGIO', 'GARCIA', 'ROJAS', 'ALBERTO', 'SERGIO9173@MAIL.COM', '(760) 858-4101','16-JAN-1995','M',164,'Panamá','La Locería calle 5');
EXECUTE registroCliente('800-99-127', 'RANDALL', 'SCHONELL', 'WAYNE', '', 'RANDALL9208@MAIL.COM', '(359) 601-3665','20-APR-1994', 'M',156,'Panamá', 'Costa del Este' );
EXECUTE registroCliente('800-99-128', 'JORGE', 'RODRIGUEZ', 'MOLINA', 'IGNACIO', 'JORGE9235@MAIL.COM', '(880) 310-4393','04-FEB-1989', 'M', 156, 'Panamá', 'San Francisco');
EXECUTE registroCliente('800-99-129', 'SEBASTIAN', 'RODRIGUEZ', 'GONZALEZ', '', 'SEBASTIAN9248@MAIL.COM', '(909) 739-9701', '18-MAY-1988', 'M', 47, 'Panamá', 'Anton Rio hato');
EXECUTE registroCliente('800-99-130', 'ANTONIO', 'MARTINEZ', 'FALLAS', 'FELIPE', 'ANTONIO9251@MAIL.COM', '(849) 837-9673','29-JUL-1994','M', 47, 'Panamá', 'Bethania');
EXECUTE registroCliente('800-99-131', 'JOSE', 'PRADO', 'FALLAS', 'NATALIO', 'JOSE9274@MAIL.COM', '(491) 457-3396', '23-AUG-2000', 'M', 47, 'Panamá', 'Villa Lucre');
EXECUTE registroCliente('800-99-132', 'PATRICIA', 'JIMENEZ', 'CENTENO', 'LUCIA', 'PATRICIA9333@MAIL.COM', '(509) 853-5896', '18-AUG-1984', 'F', 47, 'Panamá', 'Mañanitas calle 8');
EXECUTE registroCliente('800-99-133', 'ROY', 'MOJICA', 'SERRANO', 'EIBAR', 'ROY9378@MAIL.COM', '(333) 788-3128', '30-MAR-1999','M', 164, 'Panamá', 'Calidonia');
EXECUTE registroCliente('800-99-134', 'NOLBERTO', 'M', 'MENDOZA', '', 'NOLBERTO9757@MAIL.COM', '(463) 376-6487', '28-JUL-1993','M' , 164, 'Panamá', 'Chorrera Vista hermosa');
EXECUTE registroCliente('800-99-135', 'MARVIN', 'NUÑEZ', 'NUÑEZ', '', 'MARVIN9822@MAIL.COM', '(227) 711-3892','27-SEP-1997', 'M' , 47, 'Panamá', 'Tocumen La siesta');
EXECUTE registroCliente('800-99-136', 'PATROCINIO', 'ELIZONDO', 'QUESADA', '', 'PATROCINIO9829@MAIL.COM', '(561) 275-1095','14-SEP-2001', 'M' , 47, 'Panamá', 'Brisas del Golf');
EXECUTE registroCliente('800-99-137', 'CLAUDE', 'PARENT', 'COTO', '', 'CLAUDE9863@MAIL.COM', '(461) 409-3369', '10-OCT-1999','F', 36, 'Panamá', 'Condado del rey');
EXECUTE registroCliente('800-99-138', 'GLADYS', 'DUARTE', 'OBANDO', '', 'GLADYS9865@MAIL.COM', '(348) 681-5993', '13-NOV-1993','F', 47, 'Panamá', 'El Dorado');
EXECUTE registroCliente('800-99-139', 'HORACIO', 'CAJINA', 'ESPINOZA', 'ALBERTO', 'HORACIO9866@MAIL.COM', '(816) 426-6987', '12-MAR-1999', 'M' , 47, 'Panamá', 'El Valle de Antón');
EXECUTE registroCliente('800-99-140', 'HUGO', 'MARTINEZ', 'NUÑEZ', '', 'HUGO9868@MAIL.COM', '(999) 745-7934','10-JAN-2000','M' , 47,'Panamá', 'Santiago');
EXECUTE registroCliente('800-99-141', 'YENSEN', 'GOMEZ', 'HURTADO', 'JOAQUIN', 'YENSEN9870@MAIL.COM', '(994) 636-8261', '23-APR-1968','M', 47, 'Panamá', 'Penonomé');
EXECUTE registroCliente('800-99-142', 'BERNARDO', 'VEGA', 'HIDALGO', '', 'BERNARDO9873@MAIL.COM', '(235) 515-9166', '21-DEC-1979', 'M', 47, 'Panamá', 'Santiago');
EXECUTE registroCliente('800-99-143', 'ALVARO', 'CANALES', 'CANALES', '', 'ALVARO9874@MAIL.COM', '(381) 899-2311', '12-APR-1994', 'M', 47, 'Panamá', 'Boquete');
EXECUTE registroCliente('800-99-144', 'ALBERTO', 'GIL', 'COLL', 'EUGENIO', 'ALBERTO9877@MAIL.COM', '(926) 341-7084', '31-OCT-1967', 'M', 226, 'Panamá', 'Santiago');
EXECUTE registroCliente('800-99-145', 'MARCOS', 'ALVARADO', 'POVEDA', 'AURELIO', 'MARCOS9879@MAIL.COM', '(698) 889-4891', 29, 47);
EXECUTE registroCliente('800-99-146', 'MARCO', 'RODRIGUEZ', 'PRADO', 'H', 'MARCO9917@MAIL.COM', '(800) 515-7467', 36, 47);
EXECUTE registroCliente('800-99-147', 'PEDRO', 'BARRANZA', 'GUTIERREZ', '', 'PEDRO9919@MAIL.COM', '(963) 472-3173', 63, 47);
EXECUTE registroCliente('800-99-148', 'KARLA', 'WELCHERS', 'GIL', 'CRISTINA', 'KARLA9925@MAIL.COM', '(563) 841-5901', 58, 226);
EXECUTE registroCliente('800-99-149', 'EVELING', 'VICTOR', 'LOPEZ', 'JOHANNA', 'EVELING9950@MAIL.COM', '(215) 483-1128', 31, 156);
EXECUTE registroCliente('800-99-150', 'FRANCISCO', 'MACHADO', 'PIZARRO', '', 'FRANCISCO9953@MAIL.COM', '(718) 699-3754', 21, 221);
EXECUTE registroCliente('800-99-151', 'RICARDO', 'IBARRA', 'LOPEZ', '', 'RICARDO9965@MAIL.COM', '(814) 877-9845', 60, 156);
EXECUTE registroCliente('800-99-152', 'JORGE', 'REYES', 'MORA', 'SOCRATES', 'JORGE9967@MAIL.COM', '(720) 932-4515', 55, 221);
EXECUTE registroCliente('800-99-153', 'ADRIAN', 'ARAYA', 'QUESADA', '', 'ADRIAN9970@MAIL.COM', '(296) 572-1447', 26, 221);
EXECUTE registroCliente('800-99-154', 'JOSE', 'TREMINIO', 'ARCEDA', 'ERNESTO', 'JOSE9972@MAIL.COM', '(840) 470-0839', 58, 156);
EXECUTE registroCliente('800-99-155', 'MARVIN', 'MARTINEZ', 'RUIZ', 'PASCUAL', 'MARVIN9978@MAIL.COM', '(447) 214-8351', 39, 221);
EXECUTE registroCliente('800-99-156', 'DAMIAN', 'DELGADO', 'UMAÑA', '', 'DAMIAN9992@MAIL.COM', '(614) 782-2559', 29, 221);
EXECUTE registroCliente('800-99-157', 'JULIO', 'GUEVARA', 'CARDENAS', 'CESAR', 'JULIO9998@MAIL.COM', '(605) 207-6553', 51, 156);
EXECUTE registroCliente('800-99-158', 'ERICK', 'NAVAS', 'LOPEZ', 'ROBERTO', 'ERICK10004@MAIL.COM', '(291) 784-5428', 59, 156);
EXECUTE registroCliente('800-99-159', 'JHONY', 'CAMARGO', 'APONTE', '', 'JHONY10009@MAIL.COM', '(885) 246-9627', 41, 164);
EXECUTE registroCliente('800-99-160', 'MARVIN', 'OROZCO', 'BRAVO', '', 'MARVIN10018@MAIL.COM', '(410) 843-8848', 58, 221);
EXECUTE registroCliente('800-99-161', 'JAMIL', 'VIDAURRE', 'ALVAREZ', 'JOSUE', 'JAMIL10020@MAIL.COM', '(740) 233-9392', 30, 221);
EXECUTE registroCliente('800-99-162', 'MANUEL', 'ELIZONDO', 'FALLAS', 'ANTONIO', 'MANUEL10053@MAIL.COM', '(683) 380-2194', 61, 221);
EXECUTE registroCliente('800-99-163', 'CHRISTIAN', 'LOPEZ', 'DIAS', 'FELIPE', 'CHRISTIAN10057@MAIL.COM', '(718) 239-1416', 20, 221);
EXECUTE registroCliente('800-99-164', 'MICHAEL', 'CASTRO', 'HERRERA', '', 'MICHAEL10099@MAIL.COM', '(717) 401-2417', 60, 221);
EXECUTE registroCliente('800-99-165', 'LUIS', 'BERNAL', 'CARRERA', 'ANTONIO', 'LUIS10128@MAIL.COM', '(209) 934-2057', 24, 164);
EXECUTE registroCliente('800-99-166', 'LUIS', 'CENTENO', 'ARGUEDAS', '', 'LUIS10149@MAIL.COM', '(336) 671-8952', 49, 221);
EXECUTE registroCliente('800-99-167', 'HERNAN', 'COTO', 'VARGAS', 'JOSE', 'HERNAN10150@MAIL.COM', '(627) 856-2837', 43, 221);
EXECUTE registroCliente('800-99-168', 'OSWALD', 'ICAZA', 'CHAPMAN', 'RAMON', 'OSWALD10152@MAIL.COM', '(289) 320-4690', 19, 164);
EXECUTE registroCliente('800-99-169', 'EDWIN', 'ESPINOSA', 'ZABALLOS', 'ROBERTO', 'EDWIN10167@MAIL.COM', '(393) 817-7489', 47, 164);
EXECUTE registroCliente('800-99-170', 'CARLOS', 'ARGEÑAL', 'ODIO', 'MANUEL', 'CARLOS10173@MAIL.COM', '(874) 383-0296', 26, 156);
EXECUTE registroCliente('800-99-171', 'EVERTH', 'HERRERA', 'RAMOS', 'JOSE', 'EVERTH10192@MAIL.COM', '(819) 848-4270', 35, 221);
EXECUTE registroCliente('800-99-172', 'ANGELICA', 'QUESADA', 'VILLEGAS', '', 'ANGELICA10195@MAIL.COM', '(567) 284-6125', 53, 221);
EXECUTE registroCliente('800-99-173', 'PATRICIA', 'V.', 'ALVARENGA', '', 'PATRICIA10198@MAIL.COM', '(558) 767-0282', 45, 221);
EXECUTE registroCliente('800-99-174', 'BLANCA', 'HERRERA', 'VIQUEZ', 'IRMA', 'BLANCA10209@MAIL.COM', '(723) 477-6442', 39, 221);
EXECUTE registroCliente('800-99-175', 'MOISES', 'TORREZ', 'HERNANDEZ', '', 'MOISES10223@MAIL.COM', '(385) 707-3076', 47, 156);
EXECUTE registroCliente('800-99-176', 'JUAN', 'BAEZ', 'OJEDA', 'ROLANDO', 'JUAN10237@MAIL.COM', '(643) 232-9213', 24, 156);
EXECUTE registroCliente('800-99-177', 'MARTHA', 'LAGUNA', 'LANUZA', '', 'MARTHA10244@MAIL.COM', '(906) 876-1848', 61, 221);
EXECUTE registroCliente('800-99-178', 'DANILO', 'CASCANTE', 'DURAN', '', 'DANILO10255@MAIL.COM', '(215) 467-3942', 30, 221);
EXECUTE registroCliente('800-99-179', 'MAX', 'CUTILLAS', 'HERNANDEZ', 'ULISES', 'MAX10896@MAIL.COM', '(203) 828-1100', 40, 221);
EXECUTE registroCliente('800-99-180', 'MAXVIDAL', 'PEREZ', 'ALONZO', '', 'MAXVIDAL10898@MAIL.COM', '(669) 961-9093', 27, 221);
EXECUTE registroCliente('800-99-181', 'ANA', 'HERNANDEZ', 'CANO', 'JULIA', 'ANA10906@MAIL.COM', '(945) 531-6686', 21, 221);
EXECUTE registroCliente('800-99-182', 'MAURICIO', 'CARRANZA', 'CASTRO', 'ALBERTO', 'MAURICIO10912@MAIL.COM', '(677) 273-1606', 18, 221);
EXECUTE registroCliente('800-99-183', 'CARLOS', 'CESPEDES', 'CASCANTE', 'FRANCIS', 'CARLOS10915@MAIL.COM', '(731) 772-3521', 30, 221);
EXECUTE registroCliente('800-99-184', 'JIMMY', 'NORORI', 'ALVARADO', 'JOSE', 'JIMMY10917@MAIL.COM', '(969) 808-0512', 31, 221);
EXECUTE registroCliente('800-99-185', 'FRANCISCO', 'SANCHEZ', 'LEON', 'ALBERTO', 'FRANCISCO10930@MAIL.COM', '(959) 584-1775', 25, 221);
EXECUTE registroCliente('800-99-186', 'ISIDRO', 'CASCO', 'AVELAREZ', 'EUSEBRO', 'ISIDRO10935@MAIL.COM', '(765) 506-9345', 57, 156);
EXECUTE registroCliente('800-99-187', 'EDWIN', 'RIOS', 'DAVIS', 'DANIEL', 'EDWIN11007@MAIL.COM', '(320) 623-4695', 45, 164);
EXECUTE registroCliente('800-99-188', 'OSCAR', 'TORRES', 'PATIÑO', 'ARSENIO', 'OSCAR11027@MAIL.COM', '(325) 787-5793', 43, 164);
EXECUTE registroCliente('800-99-189', 'JORGE', 'SOTO', 'SEGURO', 'GERARDO', 'JORGE11114@MAIL.COM', '(931) 373-0849', 28, 221);
EXECUTE registroCliente('800-99-190', 'JACKELINE', 'TEJADA', 'MURILLO', 'GRISSEL', 'JACKELINE11248@MAIL.COM', '(324) 422-3262', 37, 92);
EXECUTE registroCliente('800-99-191', 'RAFAEL', 'CORPAS', 'MALDONADO', '', 'RAFAEL11454@MAIL.COM', '(310) 661-9757', 26, 164);
EXECUTE registroCliente('800-99-192', 'CHRISTOPH', 'FELBER', 'FRANZ', '', 'CHRISTOPH11947@MAIL.COM', '(515) 707-7004', 64, 13);
EXECUTE registroCliente('800-99-193', 'CARLOS', 'G.', 'HERNANDEZ', 'JOSE', 'CARLOS12396@MAIL.COM', '(802) 901-2929', 49, 148);
EXECUTE registroCliente('800-99-194', 'TODD', 'PARKS', 'STANLEY', '', 'TODD12404@MAIL.COM', '(871) 350-2985', 48, 221);
EXECUTE registroCliente('800-99-195', 'ELAINE', 'HEATHER', 'DUTHIE', '', 'ELAINE12421@MAIL.COM', '(484) 303-9608', 44, 36);
EXECUTE registroCliente('800-99-196', 'RAUL', 'PONCE', 'MIRANDA', 'ASDRUBAL', 'RAUL12756@MAIL.COM', '(526) 648-8494', 28, 164);
EXECUTE registroCliente('800-99-197', 'RAFAEL', 'SOLIS', 'DIAZ', '', 'RAFAEL12758@MAIL.COM', '(696) 406-6174', 20, 164);
EXECUTE registroCliente('800-99-198', 'DIVA', 'OLIVERA', 'DE', '', 'DIVA12773@MAIL.COM', '(731) 436-3900', 21, 198);
EXECUTE registroCliente('800-99-199', 'CARLOS', 'PAVON', 'FLORES', 'GERARDO', 'CARLOS12841@MAIL.COM', '(976) 594-4457', 20, 92);
EXECUTE registroCliente('800-99-200', 'LEONARDO', 'LEPIZ', 'ALFARO', 'JUAN', 'LEONARDO13068@MAIL.COM', '(580) 427-7005', 47, 198);
EXECUTE registroCliente('800-99-201', 'MARGARITO', 'MARTINEZ', 'RODRIGUEZ', '', 'MARGARITO13222@MAIL.COM', '(716) 946-1488', 39, 198);
EXECUTE registroCliente('800-99-202', 'JOSE', 'NUÑEZ', 'ALVAREZ', 'HECTOR', 'JOSE13230@MAIL.COM', '(547) 754-4511', 30, 164);
EXECUTE registroCliente('800-99-203', 'RICARDO', 'BONILLA', 'SALGADO', 'ARTURO', 'RICARDO13248@MAIL.COM', '(426) 636-8404', 33, 92);
EXECUTE registroCliente('800-99-204', 'FELIX', 'BUSTILLO', 'AVIDAN', '', 'FELIX13250@MAIL.COM', '(320) 848-4228', 39, 92);
EXECUTE registroCliente('800-99-205', 'FERNANDO', 'ARGUETA', 'CORADO', '', 'FERNANDO13268@MAIL.COM', '(651) 818-5170', 53, 86);
EXECUTE registroCliente('800-99-206', 'CARLOS', 'RUIZ', 'ANBEL', 'ROLANDO', 'CARLOS13269@MAIL.COM', '(479) 340-5079', 34, 86);
EXECUTE registroCliente('800-99-207', 'ANSELMO', 'SIC', 'TAX', 'BASILIO', 'ANSELMO13335@MAIL.COM', '(975) 991-1058', 60, 86);
EXECUTE registroCliente('800-99-208', 'JUAN', 'CANALES', 'SANTOS', 'CARLOS', 'JUAN13404@MAIL.COM', '(822) 813-0662', 25, 92);
EXECUTE registroCliente('800-99-209', 'JORGE', 'CARCAMO', 'MANCIA', 'ALBERTO', 'JORGE13437@MAIL.COM', '(657) 238-1224', 22, 198);
EXECUTE registroCliente('800-99-210', 'MANUEL', 'VAZQUEZ', 'DIAZ', 'SALVADOR', 'MANUEL13817@MAIL.COM', '(778) 991-5430', 64, 164);
EXECUTE registroCliente('800-99-211', 'HECTOR', 'CRUZ', 'MARQUEZ', 'GRECORIO', 'HECTOR13944@MAIL.COM', '(406) 708-6367', 50, 164);
EXECUTE registroCliente('800-99-212', 'JULIO', 'NAVARRETE', 'LEIRA', 'ERNESTO', 'JULIO13988@MAIL.COM', '(571) 899-6144', 43, 164);
EXECUTE registroCliente('800-99-213', 'NELSON', 'PERALTA', 'CEDEÑO', 'ARIEL', 'NELSON14040@MAIL.COM', '(393) 880-4916', 33, 164);
EXECUTE registroCliente('800-99-214', 'DEMUS', 'VARGAS', 'MORALES', 'RODRIGO', 'DEMUS14137@MAIL.COM', '(293) 391-0543', 31, 164);
EXECUTE registroCliente('800-99-215', 'EUDES', 'LE', 'YVES', 'CLAUDE', 'EUDES14199@MAIL.COM', '(605) 735-3525', 59, 71);
EXECUTE registroCliente('800-99-216', 'PETERS', 'JEFFREY', 'DEAN', '', 'PETERS14214@MAIL.COM', '(627) 362-7185', 40, 221);
EXECUTE registroCliente('800-99-217', 'FRANCISCO', 'ROQUE', 'MOURY', '', 'FRANCISCO14217@MAIL.COM', '(753) 454-5146', 46, 221);
EXECUTE registroCliente('800-99-218', 'NORMAN', 'LOPEZ', 'MARTINEZ', 'PETRONIO', 'NORMAN14292@MAIL.COM', '(234) 864-5012', 57, 221);
EXECUTE registroCliente('800-99-219', 'JORGE', 'MICOPULUS', 'VELASCO', 'ELIAS', 'JORGE14448@MAIL.COM', '(726) 629-0457', 41, 148);
EXECUTE registroCliente('800-99-220', 'PABLO', 'NUCKEL', 'PEREZ', 'JOSE', 'PABLO14538@MAIL.COM', '(658) 768-8237', 57, 53);
EXECUTE registroCliente('800-99-221', 'MIGUEL', 'VANDERHAN', 'SAUCEDO', 'ANGEL', 'MIGUEL14610@MAIL.COM', '(583) 858-0973', 37, 164);
EXECUTE registroCliente('800-99-222', 'KOENISSFEST', 'DE', 'ICAZA', 'ALFREDO', 'KOENISSFEST14713@MAIL.COM', '(711) 569-6128', 42, 164);

----Actualizar guias----

UPDATE GUIAS SET 
  fecha_nacimiento = '13-FEB-1956',
  sexo = 'M',
  ciudad = 'Panamá',
  direccion = 'Punta Pacífica',
  fecha_ingreso = SYSDATE
where id_guia = 1;

UPDATE GUIAS SET 
  fecha_nacimiento = '13-FEB-1994',
  sexo = 'F',
  ciudad = 'Panamá',
  direccion = 'Bella Vista',
  fecha_ingreso = SYSDATE
where id_guia = 2;

EXECUTE registroGuia ('2-589-156', 'Jack', 'Salazar', 'jack.salazar@outlook.com', '68707239', 'Panamá', 'Ciudad de Panamá','M','15-SEP-1992');
EXECUTE registroGuia ('N-58-789', 'Thiago', 'Cutire', 'thiago.cutire@outlook.com', '68707239','Panamá', 'Ciudad de Panamá','M', '23-OCT-1996');
EXECUTE registroGuia ('6-789-589', 'Estella', 'Cutire', 'jasmine.cutire@outlook.com', '68707239', 'Panamá', 'Ciudad de Panamá','F', '12-DEC-2000');



---Execute---
---TOURS---
INSERT INTO TOURS VALUES (1, 'Tour de la ciudad y el Canal de Panamá ', 6, 'Conoce los mejores lugares en la ciudad de Panamá.', 67, 20, 1, 1);
INSERT INTO TOURS VALUES (2, 'Tour privado centro histórico de Panamá', 8, 'La historia de Panamá en un tour.', 100, 5, 1, 2);
INSERT INTO TOURS VALUES (3, 'Ven a San Blas ', 16, 'Las maravillas de la isla San Blas.', 89, 30, 2, 3);
INSERT INTO TOURS VALUES (4, 'Portobelo y destinos del caribe de Panamá', 12, 'Sé parte de la experiencia de Colón y el caribe panameño.', 90, 15, 1, 4);
INSERT INTO TOURS VALUES (5, 'Ida al Valle de Antón', 10, 'Experimenta el valle de Antón.', 120, 20, 2, 5);
INSERT INTO TOURS VALUES (6, 'Tour al volcán Barú', 72, 'Un tour al volcán Barú a pie.', 150, 20, 3, 1);
INSERT INTO TOURS VALUES (7, 'Tour al volcán Barú en 4x4', 48, 'Un tour al volcán Barú.', 200, 10, 2, 2);
INSERT INTO TOURS VALUES (8, 'Ven a Bocas del Toro', 20, 'Playas, buen clima, restaurantes para disfrutar en Bocas del Toro.', 190, 20, 1, 3);
INSERT INTO TOURS VALUES (9, 'La isla de las Flores', 9, 'La isla de las Flores tiene mucho que ofrecer a sus clientes.', 150, 15, 2, 4);
INSERT INTO TOURS VALUES (10, 'El Archipiélago de las Perlas', 6, 'El Archipielago de las Perlas da una gran experiencia para la familia.', 80, 12, 1, 5);


----Execute----
-----RESERVACION---

/*
-- PARAMETROS

   p_id_cliente         IN clientes.id_cliente%TYPE,
    p_id_tour            IN reserva_tours.id_tour1%TYPE,
    p_cantidad_personas  IN reserva_tours.cantidad_personas%TYPE,
    p_fecha_inicio       IN reserva_tours.fecha_inicio%TYPE

*/
-- PRIMERO CREAR TOURS
-- CAMBIAR CADA UNO PARA que quede segun la secuencia
INSERT INTO RESERVACION VALUES (1, 9333, TO_DATE('02-01-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (2, 10020,TO_DATE('03-01-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (3, 10057,TO_DATE('04-01-2019','DD-MM-YYYY'),5);
EXECUTE registroReserva(4,4,1,TO_DATE('05-01-2019','DD-MM-YYYY'));
INSERT INTO RESERVACION VALUES (5, 14713,TO_DATE('09-01-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (6, 12396,TO_DATE('11-01-2019','DD-MM-YYYY'),3);
INSERT INTO RESERVACION VALUES (7, 9251, TO_DATE('12-01-2019','DD-MM-YYYY'),3);
INSERT INTO RESERVACION VALUES (8, 9972, TO_DATE('13-01-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (9, 9010, TO_DATE('18-01-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (10, 13437,TO_DATE('23-01-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (11, 10237,TO_DATE('02-02-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (12, 13222,TO_DATE('08-02-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (13, 10150,TO_DATE('10-02-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (14, 9865, TO_DATE('12-02-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (15, 13944,TO_DATE('14-02-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (16, 14199,TO_DATE('01-03-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (17, 9967, TO_DATE('06-03-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (18, 12758,TO_DATE('10-03-2019','DD-MM-YYYY'),3);
INSERT INTO RESERVACION VALUES (19, 13404,TO_DATE('18-03-2019','DD-MM-YYYY'),3);
INSERT INTO RESERVACION VALUES (20, 13248,TO_DATE('21-03-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (21, 9879, TO_DATE('03-04-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (22, 10912,TO_DATE('10-04-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (23, 11947,TO_DATE('12-04-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (24, 9757, TO_DATE('19-04-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (25, 12773,TO_DATE('21-04-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (26, 9998, TO_DATE('24-04-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (27, 11114,TO_DATE('27-04-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (28, 11027,TO_DATE('27-04-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (29, 9965, TO_DATE('30-04-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (30, 9874, TO_DATE('07-05-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (31, 9873, TO_DATE('12-05-2019','DD-MM-YYYY'),3);
INSERT INTO RESERVACION VALUES (32, 14292,TO_DATE('14-05-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (33, 9877, TO_DATE('19-05-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (34, 10152,TO_DATE('21-05-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (35, 13817,TO_DATE('25-05-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (36, 9235, TO_DATE('25-05-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (37, 9208, TO_DATE('26-05-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (38, 9378, TO_DATE('28-05-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (39, 14040,TO_DATE('30-05-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (40, 10915,TO_DATE('08-06-2019','DD-MM-YYYY'),3);
INSERT INTO RESERVACION VALUES (41, 14448,TO_DATE('19-06-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (42, 10099,TO_DATE('22-06-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (43, 9978, TO_DATE('28-06-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (44, 9274, TO_DATE('30-06-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (45, 9950, TO_DATE('01-07-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (46, 9067, TO_DATE('03-07-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (47, 10053,TO_DATE('04-07-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (48, 13250,TO_DATE('10-07-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (49, 14610,TO_DATE('10-07-2019','DD-MM-YYYY'),3);
INSERT INTO RESERVACION VALUES (50, 9919, TO_DATE('18-07-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (51, 10167,TO_DATE('21-07-2019','DD-MM-YYYY'),3);
INSERT INTO RESERVACION VALUES (52, 10018,TO_DATE('24-07-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (53, 10930,TO_DATE('28-07-2019','DD-MM-YYYY'),3);
INSERT INTO RESERVACION VALUES (54, 9866, TO_DATE('30-07-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (55, 9953, TO_DATE('01-08-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (56, 13068,TO_DATE('02-08-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (57, 11007,TO_DATE('08-08-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (58, 14214,TO_DATE('09-08-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (59, 10004,TO_DATE('17-08-2019','DD-MM-YYYY'),3);
INSERT INTO RESERVACION VALUES (60, 13268,TO_DATE('22-08-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (61, 9829, TO_DATE('01-09-2019','DD-MM-YYYY'),3);
INSERT INTO RESERVACION VALUES (62, 10009,TO_DATE('02-09-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (63, 11454,TO_DATE('04-09-2019','DD-MM-YYYY'),3);
INSERT INTO RESERVACION VALUES (64, 9970, TO_DATE('04-09-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (65, 10128,TO_DATE('17-09-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (66, 12404,TO_DATE('19-09-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (67, 13335,TO_DATE('24-09-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (68, 9868, TO_DATE('26-09-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (69, 11248,TO_DATE('30-09-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (70, 14137,TO_DATE('01-10-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (71, 9917, TO_DATE('03-10-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (72, 9925, TO_DATE('03-10-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (73, 12841,TO_DATE('09-10-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (74, 10149,TO_DATE('20-10-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (75, 9822, TO_DATE('21-10-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (76, 10255,TO_DATE('22-10-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (77, 10223,TO_DATE('23-10-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (78, 10244,TO_DATE('23-10-2019','DD-MM-YYYY'),3);
INSERT INTO RESERVACION VALUES (79, 10198,TO_DATE('26-10-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (80, 12756,TO_DATE('28-10-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (81, 10173,TO_DATE('28-10-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (82, 9992, TO_DATE('29-10-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (83, 9863, TO_DATE('29-10-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (84, 10917,TO_DATE('06-11-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (85, 10896,TO_DATE('08-11-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (86, 10935,TO_DATE('09-11-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (87, 10209,TO_DATE('13-11-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (88, 9173, TO_DATE('15-11-2019','DD-MM-YYYY'),5);
INSERT INTO RESERVACION VALUES (89, 9870, TO_DATE('17-11-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (90, 10195,TO_DATE('17-11-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (91, 14538,TO_DATE('19-11-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (92, 13988,TO_DATE('20-11-2019','DD-MM-YYYY'),3);
INSERT INTO RESERVACION VALUES (93, 10192,TO_DATE('24-11-2019','DD-MM-YYYY'),3);
INSERT INTO RESERVACION VALUES (94, 10906,TO_DATE('25-11-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (95, 14217,TO_DATE('25-11-2019','DD-MM-YYYY'),2);
INSERT INTO RESERVACION VALUES (96, 12421,TO_DATE('27-11-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (97, 13269,TO_DATE('27-11-2019','DD-MM-YYYY'),1);
INSERT INTO RESERVACION VALUES (98, 13230,TO_DATE('27-11-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (99, 10898,TO_DATE('28-11-2019','DD-MM-YYYY'),4);
INSERT INTO RESERVACION VALUES (100, 9248, TO_DATE('28-11-2019','DD-MM-YYYY'),2);

----Trigger----
-----RESERVA_TOURS-------
INSERT INTO RESERVA_TOURS VALUES( 1, 6, TO_DATE('04-01-2019','DD-MM-YYYY'), TO_DATE('07-01-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 2, 1, TO_DATE('05-01-2019','DD-MM-YYYY'), TO_DATE('05-01-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 2, 6, TO_DATE('07-01-2019','DD-MM-YYYY'), TO_DATE('10-01-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 3, 2, TO_DATE('06-01-2019','DD-MM-YYYY'), TO_DATE('06-01-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 3, 1, TO_DATE('08-01-2019','DD-MM-YYYY'), TO_DATE('08-01-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 3, 10, TO_DATE('09-01-2019','DD-MM-YYYY'), TO_DATE('09-01-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 4, 3, TO_DATE('07-01-2019','DD-MM-YYYY'), TO_DATE('07-01-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 5, 1, TO_DATE('11-01-2019','DD-MM-YYYY'), TO_DATE('11-01-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 6, 1, TO_DATE('13-01-2019','DD-MM-YYYY'), TO_DATE('13-01-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 7, 3, TO_DATE('14-01-2019','DD-MM-YYYY'), TO_DATE('14-01-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 8, 1, TO_DATE('15-01-2019','DD-MM-YYYY'), TO_DATE('15-01-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 9, 2, TO_DATE('20-01-2019','DD-MM-YYYY'), TO_DATE('20-01-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 10, 5, TO_DATE('25-01-2019','DD-MM-YYYY'), TO_DATE('25-01-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 11, 3, TO_DATE('04-02-2019','DD-MM-YYYY'), TO_DATE('04-02-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 12, 1, TO_DATE('10-02-2019','DD-MM-YYYY'), TO_DATE('10-02-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 12, 7, TO_DATE('12-02-2019','DD-MM-YYYY'), TO_DATE('14-02-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 13, 3, TO_DATE('12-02-2019','DD-MM-YYYY'), TO_DATE('12-02-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 14, 4, TO_DATE('14-02-2019','DD-MM-YYYY'), TO_DATE('14-02-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 15, 7, TO_DATE('16-02-2019','DD-MM-YYYY'), TO_DATE('18-02-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 16, 8, TO_DATE('03-03-2019','DD-MM-YYYY'), TO_DATE('03-03-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 17, 2, TO_DATE('08-03-2019','DD-MM-YYYY'), TO_DATE('08-03-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 18, 2, TO_DATE('12-03-2019','DD-MM-YYYY'), TO_DATE('12-03-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 18, 3, TO_DATE('13-03-2019','DD-MM-YYYY'), TO_DATE('13-03-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 18, 6, TO_DATE('15-03-2019','DD-MM-YYYY'), TO_DATE('18-03-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 19, 10, TO_DATE('20-03-2019','DD-MM-YYYY'), TO_DATE('20-03-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 19, 5, TO_DATE('22-03-2019','DD-MM-YYYY'), TO_DATE('22-03-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 20, 9, TO_DATE('23-03-2019','DD-MM-YYYY'), TO_DATE('23-03-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 20, 5, TO_DATE('24-03-2019','DD-MM-YYYY'), TO_DATE('24-03-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 21, 9, TO_DATE('05-04-2019','DD-MM-YYYY'), TO_DATE('05-04-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 21, 10, TO_DATE('06-04-2019','DD-MM-YYYY'), TO_DATE('06-04-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 21, 1, TO_DATE('07-04-2019','DD-MM-YYYY'), TO_DATE('07-04-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 22, 8, TO_DATE('12-04-2019','DD-MM-YYYY'), TO_DATE('12-04-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 22, 9, TO_DATE('13-04-2019','DD-MM-YYYY'), TO_DATE('13-04-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 22, 2, TO_DATE('14-04-2019','DD-MM-YYYY'), TO_DATE('14-04-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 23, 9, TO_DATE('14-04-2019','DD-MM-YYYY'), TO_DATE('14-04-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 24, 2, TO_DATE('21-04-2019','DD-MM-YYYY'), TO_DATE('21-04-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 24, 5, TO_DATE('22-04-2019','DD-MM-YYYY'), TO_DATE('22-04-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 25, 4, TO_DATE('23-04-2019','DD-MM-YYYY'), TO_DATE('23-04-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 25, 3, TO_DATE('24-04-2019','DD-MM-YYYY'), TO_DATE('24-04-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 25, 6, TO_DATE('25-04-2019','DD-MM-YYYY'), TO_DATE('28-04-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 26, 5, TO_DATE('26-04-2019','DD-MM-YYYY'), TO_DATE('26-04-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 27, 5, TO_DATE('29-04-2019','DD-MM-YYYY'), TO_DATE('29-04-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 28, 4, TO_DATE('29-04-2019','DD-MM-YYYY'), TO_DATE('29-04-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 28, 7, TO_DATE('30-04-2019','DD-MM-YYYY'), TO_DATE('02-05-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 29, 7, TO_DATE('02-05-2019','DD-MM-YYYY'), TO_DATE('04-05-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 30, 10, TO_DATE('09-05-2019','DD-MM-YYYY'), TO_DATE('09-05-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 31, 2, TO_DATE('14-05-2019','DD-MM-YYYY'), TO_DATE('14-05-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 32, 10, TO_DATE('16-05-2019','DD-MM-YYYY'), TO_DATE('16-05-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 33, 4, TO_DATE('21-05-2019','DD-MM-YYYY'), TO_DATE('21-05-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 34, 2, TO_DATE('23-05-2019','DD-MM-YYYY'), TO_DATE('23-05-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 35, 3, TO_DATE('27-05-2019','DD-MM-YYYY'), TO_DATE('27-05-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 36, 1, TO_DATE('27-05-2019','DD-MM-YYYY'), TO_DATE('27-05-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 36, 7, TO_DATE('28-05-2019','DD-MM-YYYY'), TO_DATE('30-05-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 37, 2, TO_DATE('28-05-2019','DD-MM-YYYY'), TO_DATE('28-05-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 38, 5, TO_DATE('30-05-2019','DD-MM-YYYY'), TO_DATE('30-05-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 39, 4, TO_DATE('01-06-2019','DD-MM-YYYY'), TO_DATE('01-06-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 40, 1, TO_DATE('10-06-2019','DD-MM-YYYY'), TO_DATE('10-06-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 41, 3, TO_DATE('21-06-2019','DD-MM-YYYY'), TO_DATE('21-06-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 42, 8, TO_DATE('24-06-2019','DD-MM-YYYY'), TO_DATE('24-06-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 42, 10, TO_DATE('25-06-2019','DD-MM-YYYY'), TO_DATE('25-06-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 43, 5, TO_DATE('30-06-2019','DD-MM-YYYY'), TO_DATE('30-06-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 43, 3, TO_DATE('01-07-2019','DD-MM-YYYY'), TO_DATE('01-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 43, 7, TO_DATE('02-07-2019','DD-MM-YYYY'), TO_DATE('04-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 44, 9, TO_DATE('02-07-2019','DD-MM-YYYY'), TO_DATE('02-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 45, 5, TO_DATE('03-07-2019','DD-MM-YYYY'), TO_DATE('03-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 45, 6, TO_DATE('04-07-2019','DD-MM-YYYY'), TO_DATE('07-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 46, 7, TO_DATE('05-07-2019','DD-MM-YYYY'), TO_DATE('07-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 46, 2, TO_DATE('11-07-2019','DD-MM-YYYY'), TO_DATE('11-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 47, 3, TO_DATE('06-07-2019','DD-MM-YYYY'), TO_DATE('06-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 48, 3, TO_DATE('12-07-2019','DD-MM-YYYY'), TO_DATE('12-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 48, 4, TO_DATE('13-07-2019','DD-MM-YYYY'), TO_DATE('13-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 48, 10, TO_DATE('14-07-2019','DD-MM-YYYY'), TO_DATE('14-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 49, 2, TO_DATE('12-07-2019','DD-MM-YYYY'), TO_DATE('12-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 50, 3, TO_DATE('20-07-2019','DD-MM-YYYY'), TO_DATE('20-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 50, 5, TO_DATE('21-07-2019','DD-MM-YYYY'), TO_DATE('21-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 50, 6, TO_DATE('22-07-2019','DD-MM-YYYY'), TO_DATE('25-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 51, 10, TO_DATE('23-07-2019','DD-MM-YYYY'), TO_DATE('23-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 51, 2, TO_DATE('24-07-2019','DD-MM-YYYY'), TO_DATE('24-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 52, 9, TO_DATE('26-07-2019','DD-MM-YYYY'), TO_DATE('26-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 52, 2, TO_DATE('27-07-2019','DD-MM-YYYY'), TO_DATE('27-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 53, 1, TO_DATE('30-07-2019','DD-MM-YYYY'), TO_DATE('30-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 53, 3, TO_DATE('31-07-2019','DD-MM-YYYY'), TO_DATE('31-07-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 54, 4, TO_DATE('01-08-2019','DD-MM-YYYY'), TO_DATE('01-08-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 54, 6, TO_DATE('02-08-2019','DD-MM-YYYY'), TO_DATE('05-08-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 55, 6, TO_DATE('03-08-2019','DD-MM-YYYY'), TO_DATE('06-08-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 56, 1, TO_DATE('04-08-2019','DD-MM-YYYY'), TO_DATE('04-08-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 56, 10, TO_DATE('05-08-2019','DD-MM-YYYY'), TO_DATE('05-08-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 57, 7, TO_DATE('10-08-2019','DD-MM-YYYY'), TO_DATE('12-08-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 58, 8, TO_DATE('11-08-2019','DD-MM-YYYY'), TO_DATE('11-08-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 59, 9, TO_DATE('19-08-2019','DD-MM-YYYY'), TO_DATE('19-08-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 60, 9, TO_DATE('24-08-2019','DD-MM-YYYY'), TO_DATE('24-08-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 61, 10, TO_DATE('03-09-2019','DD-MM-YYYY'), TO_DATE('03-09-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 61, 5, TO_DATE('04-09-2019','DD-MM-YYYY'), TO_DATE('04-09-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 62, 1, TO_DATE('04-09-2019','DD-MM-YYYY'), TO_DATE('04-09-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 63, 2, TO_DATE('06-09-2019','DD-MM-YYYY'), TO_DATE('06-09-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 63, 10, TO_DATE('07-09-2019','DD-MM-YYYY'), TO_DATE('07-09-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 64, 2, TO_DATE('06-09-2019','DD-MM-YYYY'), TO_DATE('06-09-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 64, 5, TO_DATE('07-09-2019','DD-MM-YYYY'), TO_DATE('07-09-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 65, 6, TO_DATE('19-09-2019','DD-MM-YYYY'), TO_DATE('22-09-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 65, 1, TO_DATE('23-09-2019','DD-MM-YYYY'), TO_DATE('23-09-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 65, 10, TO_DATE('24-09-2019','DD-MM-YYYY'), TO_DATE('24-09-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 66, 10, TO_DATE('21-09-2019','DD-MM-YYYY'), TO_DATE('21-09-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 67, 1, TO_DATE('26-09-2019','DD-MM-YYYY'), TO_DATE('26-09-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 68, 2, TO_DATE('28-09-2019','DD-MM-YYYY'), TO_DATE('28-09-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 68, 6, TO_DATE('29-09-2019','DD-MM-YYYY'), TO_DATE('02-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 69, 10, TO_DATE('02-10-2019','DD-MM-YYYY'), TO_DATE('02-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 69, 1, TO_DATE('03-10-2019','DD-MM-YYYY'), TO_DATE('03-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 69, 6, TO_DATE('04-10-2019','DD-MM-YYYY'), TO_DATE('07-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 70, 8, TO_DATE('03-10-2019','DD-MM-YYYY'), TO_DATE('03-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 70, 1, TO_DATE('04-10-2019','DD-MM-YYYY'), TO_DATE('04-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 71, 8, TO_DATE('05-10-2019','DD-MM-YYYY'), TO_DATE('05-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 71, 3, TO_DATE('06-10-2019','DD-MM-YYYY'), TO_DATE('06-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 72, 10, TO_DATE('05-10-2019','DD-MM-YYYY'), TO_DATE('05-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 72, 6, TO_DATE('06-10-2019','DD-MM-YYYY'), TO_DATE('09-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 72, 1, TO_DATE('11-10-2019','DD-MM-YYYY'), TO_DATE('11-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 73, 7, TO_DATE('11-10-2019','DD-MM-YYYY'), TO_DATE('13-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 74, 9, TO_DATE('22-10-2019','DD-MM-YYYY'), TO_DATE('22-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 74, 3, TO_DATE('23-10-2019','DD-MM-YYYY'), TO_DATE('23-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 75, 7, TO_DATE('23-10-2019','DD-MM-YYYY'), TO_DATE('25-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 76, 3, TO_DATE('24-10-2019','DD-MM-YYYY'), TO_DATE('24-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 77, 9, TO_DATE('25-10-2019','DD-MM-YYYY'), TO_DATE('25-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 77, 2, TO_DATE('26-10-2019','DD-MM-YYYY'), TO_DATE('26-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 78, 6, TO_DATE('25-10-2019','DD-MM-YYYY'), TO_DATE('28-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 79, 2, TO_DATE('28-10-2019','DD-MM-YYYY'), TO_DATE('28-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 80, 4, TO_DATE('30-10-2019','DD-MM-YYYY'), TO_DATE('30-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 80, 2, TO_DATE('31-10-2019','DD-MM-YYYY'), TO_DATE('31-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 81, 5, TO_DATE('30-10-2019','DD-MM-YYYY'), TO_DATE('30-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 81, 6, TO_DATE('31-10-2019','DD-MM-YYYY'), TO_DATE('03-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 82, 5, TO_DATE('31-10-2019','DD-MM-YYYY'), TO_DATE('31-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 83, 10, TO_DATE('31-10-2019','DD-MM-YYYY'), TO_DATE('31-10-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 84, 4, TO_DATE('08-11-2019','DD-MM-YYYY'), TO_DATE('08-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 84, 9, TO_DATE('09-11-2019','DD-MM-YYYY'), TO_DATE('09-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 85, 2, TO_DATE('10-11-2019','DD-MM-YYYY'), TO_DATE('10-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 85, 1, TO_DATE('11-11-2019','DD-MM-YYYY'), TO_DATE('11-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 86, 3, TO_DATE('11-11-2019','DD-MM-YYYY'), TO_DATE('11-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 87, 1, TO_DATE('15-11-2019','DD-MM-YYYY'), TO_DATE('15-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 87, 3, TO_DATE('16-11-2019','DD-MM-YYYY'), TO_DATE('16-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 87, 4, TO_DATE('17-11-2019','DD-MM-YYYY'), TO_DATE('17-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 88, 4, TO_DATE('17-11-2019','DD-MM-YYYY'), TO_DATE('17-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 89, 6, TO_DATE('19-11-2019','DD-MM-YYYY'), TO_DATE('22-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 90, 2, TO_DATE('19-11-2019','DD-MM-YYYY'), TO_DATE('19-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 90, 5, TO_DATE('20-11-2019','DD-MM-YYYY'), TO_DATE('20-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 90, 9, TO_DATE('21-11-2019','DD-MM-YYYY'), TO_DATE('21-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 91, 1, TO_DATE('21-11-2019','DD-MM-YYYY'), TO_DATE('21-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 91, 3, TO_DATE('22-11-2019','DD-MM-YYYY'), TO_DATE('22-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 92, 5, TO_DATE('22-11-2019','DD-MM-YYYY'), TO_DATE('22-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 93, 9, TO_DATE('26-11-2019','DD-MM-YYYY'), TO_DATE('26-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 93, 6, TO_DATE('27-11-2019','DD-MM-YYYY'), TO_DATE('30-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 94, 3, TO_DATE('27-11-2019','DD-MM-YYYY'), TO_DATE('27-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 94, 6, TO_DATE('27-11-2019','DD-MM-YYYY'), TO_DATE('30-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 95, 3, TO_DATE('27-11-2019','DD-MM-YYYY'), TO_DATE('27-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 96, 8, TO_DATE('29-11-2019','DD-MM-YYYY'), TO_DATE('29-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 96, 3, TO_DATE('30-11-2019','DD-MM-YYYY'), TO_DATE('30-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 97, 4, TO_DATE('29-11-2019','DD-MM-YYYY'), TO_DATE('29-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 98, 6, TO_DATE('29-11-2019','DD-MM-YYYY'), TO_DATE('02-12-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 99, 2, TO_DATE('30-11-2019','DD-MM-YYYY'), TO_DATE('30-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 99, 7, TO_DATE('01-12-2019','DD-MM-YYYY'), TO_DATE('03-12-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 100, 3, TO_DATE('30-11-2019','DD-MM-YYYY'), TO_DATE('30-11-2019','DD-MM-YYYY'));
INSERT INTO RESERVA_TOURS VALUES( 100, 8, TO_DATE('01-12-2019','DD-MM-YYYY'), TO_DATE('01-12-2019','DD-MM-YYYY'));


----Execute----
-----DESTINOS---
INSERT INTO DESTINOS VALUES (1,'Canal de Panamá');
INSERT INTO DESTINOS VALUES (2,'Biomuseo');
INSERT INTO DESTINOS VALUES (3,'Casco Antiguo');
INSERT INTO DESTINOS VALUES (4,'Panamá Viejo');
INSERT INTO DESTINOS VALUES (5,'Portobelo');
INSERT INTO DESTINOS VALUES (6,'San Blas');
INSERT INTO DESTINOS VALUES (7,'Isla Grande');
INSERT INTO DESTINOS VALUES (8,'Valle de Antón');
INSERT INTO DESTINOS VALUES (9,'Cerro Azul');
INSERT INTO DESTINOS VALUES (10,'Volcan Barú');
INSERT INTO DESTINOS VALUES (11,'Archipiélago de las perlas');
INSERT INTO DESTINOS VALUES (12,'Boquete');
INSERT INTO DESTINOS VALUES (13,'Cerro Ancón');
INSERT INTO DESTINOS VALUES (14,'Punta chame');
INSERT INTO DESTINOS VALUES (15,'Calzada amador');
INSERT INTO DESTINOS VALUES (16,'Bocas del Toro');


----Trigger----
----DESTINOS_TOURS---
INSERT INTO DESTINOS_TOURS VALUES (1, 1);
INSERT INTO DESTINOS_TOURS VALUES (2, 1);
INSERT INTO DESTINOS_TOURS VALUES (3, 1);
INSERT INTO DESTINOS_TOURS VALUES (4, 1);
INSERT INTO DESTINOS_TOURS VALUES (15, 1);
INSERT INTO DESTINOS_TOURS VALUES (3, 2);
INSERT INTO DESTINOS_TOURS VALUES (4, 2);
INSERT INTO DESTINOS_TOURS VALUES (6, 3);
INSERT INTO DESTINOS_TOURS VALUES (5, 4);
INSERT INTO DESTINOS_TOURS VALUES (7, 4);
INSERT INTO DESTINOS_TOURS VALUES (8, 5);
INSERT INTO DESTINOS_TOURS VALUES (10, 6);
INSERT INTO DESTINOS_TOURS VALUES (10, 7);
INSERT INTO DESTINOS_TOURS VALUES (16, 8);
INSERT INTO DESTINOS_TOURS VALUES (16, 9);
INSERT INTO DESTINOS_TOURS VALUES (11, 10);





--------------------------------------------------
---La nueva implementacion de los procesos
-- TODO NO CORRER TODAVIA DE AQUI PARA ABAJO
--------------------------------------------------

set SERVEROUTPUT on;

--INVOCACION: REGISTRO DE LA RESERVA DEL CLIENTE
execute registroReserva(9333,1, 5,'28-nov-21');
    p_id_cliente         
    p_id_tour            
    p_cantidad_personas  
    p_fecha_inicio       