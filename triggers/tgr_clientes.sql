/*
Triggers.
*/

/*
1. trigger cuando se genera una nueva reserva
*/

CREATE OR REPLACE TRIGGER promCalificacion 
AFTER INSERT
ON REVIEWS
FOR EACH ROW
DECLARE
--PRAGMA autonomous_transaction;
l_prom number := avg(old.calificaion);

BEGIN
-- select avg(calificacion) into l_prom
-- WHERE id_tour = :new.id_tour;

UPDATE tours
  set calificacion = l_prom
  where id_tours = :new.id_tour;


END promCalificacion;
/






/*
trigger para el promedio de calificaciones
*/