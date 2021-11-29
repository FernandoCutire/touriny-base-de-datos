/*
1. trigger de secuencia automatica de nueva reservacion
*/

create or replace TRIGGER  "INSERT_RESERVA"
BEFORE INSERT ON RESERVACION
FOR EACH ROW
DECLARE
  reserva_id number;
BEGIN
select sec_id_reserva.nextval into reserva_id from dual;
  :new.id_reserva := reserva_id;
END;


/*
1. trigger de secuencia automatica de nueva reservacion
*/


CREATE OR REPLACE TRIGGER "INSERT_RESERVA_TOUR"
BEFORE INSERT 
ON RESERVA_TOUR
FOR EACH ROW
DECLARE
    reserva_id number;
BEGIN
    select id_reserva into reserva_id from reservacion;
    :new.id_reserva1 := reserva_id;
END;
/

/*
Actualización de datos de la tabla de auditoria. 	
*/


CREATE OR REPLACE TRIGGER ACTUALIZAR_AUDITORIA
AFTER INSERT OR UPDATE 
ON RESERVA_TOURS
FOR EACH ROW

BEGIN
IF INSERTING THEN

INSERT INTO AUDITORIA VALUES (
  sec_cod_aut.nextval,
  :new.id_reserva1,
  :new.id_tour1,
  'I',
  'RESERVA_TOUR',
  :new.cantidad_personas,
  :new.fecha_inicio,
  :new.fecha_fin,
  :new.status,
  :new.precio_tour,
  USER,
  SYSDATE);

ELSIF UPDATING THEN

INSERT INTO AUDITORIA VALUES (
  sec_cod_aut.nextval,
  :new.id_reserva1,
  :new.id_tour1,
  'U',
  'RESERVA_TOUR',
  :new.cantidad_personas,
  :new.fecha_inicio,
  :new.fecha_fin,
  :new.status,
  :new.precio_tour,
  USER,
  SYSDATE);
END IF;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('Erro numero:');
END ACTUALIZAR_AUDITORIA;
/

--AUDITORIA
CREATE TABLE AUDITORIA (
  id_auditoria NUMBER NOT NULL,
  no_reserva NUMBER,
  id_tour NUMBER,
  tipo_operacion CHAR(2),
  tabla varchar2(45),
  cantidad_personas NUMBER,
  fecha_inicio DATE,
  fecha_fin DATE,
  status Char(2),
  precio_total NUMBER,
  usuario VARCHAR2(250),
  fecha_insercion DATE,
  CONSTRAINT auditoria_pk PRIMARY KEY (id_auditoria),
  CONSTRAINT auditoria_RESERVACION_fk FOREIGN KEY (no_reserva)
      REFERENCES RESERVACION (id_reserva)
);

DROP TABLE AUDITORIA;
