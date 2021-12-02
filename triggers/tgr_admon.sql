/*
1. trigger de secuencia automatica de nueva reservacion
*/

-- create or replace TRIGGER  "INSERT_RESERVA"
-- BEFORE INSERT ON RESERVACION
-- FOR EACH ROW
-- DECLARE
--   reserva_id number;
-- BEGIN
-- select sec_id_reserva.nextval into reserva_id from dual;
--   :new.id_reserva := reserva_id;
-- END;


/*
1. trigger de secuencia automatica de nueva reservacion
*/


-- CREATE OR REPLACE TRIGGER "INSERT_RESERVA_TOUR"
-- BEFORE INSERT 
-- ON RESERVA_TOUR
-- FOR EACH ROW
-- DECLARE
--     reserva_id number;
-- BEGIN
--     select id_reserva into reserva_id from reservacion;
--     :new.id_reserva1 := reserva_id;
-- END;
-- /

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


-------------------------------------------------------------------------
-- TRIGGER DE ACTUALIZACION DE LA FACTURA EN LA RESERVACION
------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER facturacion
after INSERT
ON facturacion 
FOR EACH ROW
declare
l_transac number := case
    when :new.tipo_transac = 'CO' then 1
    else 2 end; 

BEGIN

    IF l_transac = 1 THEN
        UPDATE reservacion
        SET
        status = 'CO'
        WHERE
        id_reserva = :new.id_reserva;
        
        UPDATE reserva_tours
        set
        status = 'CO'
        WHERE
        id_reserva1 = :new.id_reserva;
       
    ELSIF l_transac = 2 then
            UPDATE reservacion
            SET
            status = 'CA'
            WHERE
            id_reserva = :new.id_reserva;
            UPDATE reserva_tours
            set
            status = 'CA'
            WHERE
            id_reserva1 = :new.id_reserva;
    END IF;
    
END facturacion;
/


