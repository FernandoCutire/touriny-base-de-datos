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

--SECUENCIAS DE AUDITORIA--
CREATE SEQUENCE sec_no_factura
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE;