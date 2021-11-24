/*
Triggers. Para las actualizaciones en la tabla de sucursales los montos de los 
ahorros.
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