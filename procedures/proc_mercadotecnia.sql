-- -----------------------------------------------------
-- 1- Proc Registro de promociones
-- -----------------------------------------------------
CREATE OR REPLACE PROCEDURE registroPromociones(
    p_descripcion       IN promociones.descripcion%TYPE,
    p_mes_inicio       IN promociones.mes_inicio%TYPE,
    p_mes_fin      IN promociones.mes_fin%TYPE,
    p_promocion      IN promociones.promocion%TYPE
    )
IS 
    intSeqVal number;
BEGIN
    select sec_id_promo.nextval into intSeqVal from dual;
INSERT into promociones VALUES (
    intSeqVal,
    p_descripcion,
    p_mes_inicio,
    p_mes_fin,
    p_promocion
    );
    COMMIT;
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: La promoción ya existe.');
END registroPromociones;
/

-- -----------------------------------------------------
-- 2- Proc activacion de las promociones
-- -----------------------------------------------------

create or replace procedure activarDesactivartPromo(
    no_tour IN tours.id_tours%TYPE, 
    no_promocion IN promociones.id_promo%type,
    ActivarDesactivar number )
IS
v_id_promo number;
v_promo number;
v_nombre_promo VARCHAR2(100);
v_nombre_tour VARCHAR2(100);

cursor c_promo is 
select
    id_promo,
    descripcion,
    promocion
from promociones
WHERE id_promo = no_promocion;

BEGIN
select tour_nombre into v_nombre_tour from tours where id_tours = no_tour;

open c_promo;
    LOOP
    FETCH c_promo INTO
    v_id_promo,
    v_nombre_promo,
    v_promo;
    EXIT WHEN c_promo%NOTFOUND;




--para activar promocion = 1, para desactivar =2
IF no_promocion is NOT NULL AND ActivarDesactivar = 1 THEN
update Tours
SET id_promo = v_id_promo,
    promocion = descuento(v_promo,precio) 
where id_tours = no_tour;


DBMS_OUTPUT.PUT_LINE('Se ha activado la promocion de: ' || v_nombre_promo
    || ' en el tour: ' || v_nombre_tour);


ELSIF no_promocion is NOT NULL and ActivarDesactivar = 2 THEN
update Tours
SET id_promo = 5,
    promocion = precio
where id_tours = no_tour;

DBMS_OUTPUT.PUT_LINE('Se ha desactivado las promociones en el tour: ' || v_nombre_tour);
END IF;

    END LOOP;
close c_promo;

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Por favor verificar que los valores ingresados sean correctos.');

END activarDesactivartPromo;
/



create or replace function descuento(descuento number, precio number)
return number IS
v_resultado number;

BEGIN
v_resultado := precio -(descuento * precio);
return v_resultado;
END descuento;
/

DECLARE
PROMPTPROMPT Please enter a valid departmentPROMPT For example:  10SELECT DEPARTMENT_NAME FROM EMP_DETAILS_VIEWWHERE DEPARTMENT_ID = &NEWDEPT
BEGIN

END;


