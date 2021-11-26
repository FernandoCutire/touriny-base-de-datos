/*
Triggers.
*/

/*
1. trigger cuando se genera una nueva reserva
*/

CREATE OR REPLACE TRIGGER 
AFTER INSERT OR DELETE OR UPDATE
ON RESERVACION
FOR EACH ROW

BEGIN
IF INSERTING THEN
INSERT INTO CLIENTES_RESERVA VALUES(
:NEW.
);

EXCEPTION WHEN dup_val_on_index THEN
  null;

END;
/





/*
trigger para el promedio de calificaciones
*/