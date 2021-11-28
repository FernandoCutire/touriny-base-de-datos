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

CREATE OR REPLACE TRIGGER ACTUALIZAR_TABLA_AUDITORIA

AFTER INSERT, UPDATE OR DELETE 
ON RESERVACION
FOR EACH ROW


BEGIN
  id_auditoria
  id_reserva
  id_cliente
  id_tour
  fecha_reserva
  cantidad_personas
  cantidad_tours
  fecha_inicio
  fecha_fin
  status
  precio_total
  usuario,
  fecha_insercion
  UPDATE AUDITORIA
    SET
      id_reserva = :NEW.id_reserva,
      id_cliente = :NEW.id_cliente,
      id_tour = :NEW.id_tour,
      fecha_reserva = :NEW.fecha_reserva,
      cantidad_personas = :NEW.cantidad_personas,
      cantidad_tours = :NEW.cantidad_tours,
      fecha_inicio = :NEW.fecha_inicio,
      fecha_fin = :NEW.fecha_fin,
      precio_total = :NEW.precio_total,
      usuario = :NEW.usuario,
      fecha_insercion = :NEW.fecha_insercion,
      WHERE id_auditoria = :NEW.id_auditoria;

EXCEPTION
-- Inicio de la sección de excepciones

END ACTUALIZAR_TABLA_AUDITORIA;
/