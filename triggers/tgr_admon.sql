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