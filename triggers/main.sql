/*
Triggers.
*/

/*
1. trigger cuando se genera una nueva reserva
*/

CREATE OR REPLACE TRIGGER 

AFTER UPDATE OF 
ON 
FOR EACH ROW

BEGIN

EXCEPTION WHEN dup_val_on_index THEN
  null;

END;
/

/*
trigger cuando se crea un tour o se agrega un nuevo destino
*/



/*
trigger para el promedio de calificaciones
*/