
/*
Funcion para calcular la promocion del tour
*/
CREATE OR REPLACE FUNCTION calcularPromo(
    p_id_promo number,
    p_precio number
)
RETURN NUMBER IS
   v_id_promo NUMBER := p_id_promo;
   v_precio NUMBER := p_precio;
   v_fecha_actual NUMBER;
   v_mes_inicio NUMBER;
   v_mes_fin NUMBER;
   v_promocion NUMBER;
   v_precio_promocion NUMBER;
BEGIN
    -- Compara la fecha para ver si la promoción aplica
    v_fecha_actual :=TO_NUMBER(sysdate,'mm');
    SELECT mes_inicio INTO v_mes_inicio FROM PROMOCIONES WHERE id_promo = v_id_promo;
    SELECT mes_fin INTO v_mes_fin FROM PROMOCIONES WHERE id_promo = v_id_promo;
    SELECT v_promocion INTO v_promocion FROM PROMOCIONES WHERE id_promo = v_id_promo;
    IF (v_mes_inicio <= v_fecha_actual AND v_fecha_actual >= v_mes_fin) THEN
    v_precio_promocion := v_precio * (1+v_promocion);
    RETURN v_precio_promocion;
    ELSE
    RETURN v_precio;
    END IF;
    EXCEPTION
   WHEN NO_DATA_FOUND THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: La promoción no ha sido encontrada');

END calcularPromo;
/