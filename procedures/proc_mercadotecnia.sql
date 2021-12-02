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

create or replace procedure activarPromo(no_promocion number)
IS
v_id_promo number;
v_promo number;
v_descuento number;

BEGIN
select promocion into v_promo from promociones where id_promo = no_promocion;
update Tours
SET promocion = descuento(v_promo,precio)
where id_promo = no_promocion;

END activarPromo;
/

create or replace function descuento(descuento number, precio number)
return number IS
v_resultado number;

BEGIN
v_resultado := precio -(descuento * precio);
return v_resultado;
END descuento;
/

