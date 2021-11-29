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
ON RESERVACION
FOR EACH ROW

BEGIN
IF INSERTING THEN

INSERT INTO AUDITORIA(id_auditoria, id_reserva, id_cliente, id_tour, fecha_reserva, cantidad_personas, cantidad_tours, fecha_inicio, fecha_fin, precio_total, usuario, fecha_insercion)
VALUES (sec_cod_aut.nextval, :NEW.ID_RESERVA, :NEW.id_cliente, :NEW.id_tour, :NEW.fecha_reserva, :NEW.cantidad_personas, :NEW.cantidad_tours, :NEW.fecha_inicio, NEW.fecha_fin, :NEW.precio_total, USER, SYSDATE);

END IF;


END ACTUALIZAR_AUDITORIA;
/
