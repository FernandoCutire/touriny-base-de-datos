-- -----------------------------------------------------
-- 1- Proc Registro del guia
-- Recordar correr la funcion calcularEdad y correr las secuencias
-- -----------------------------------------------------
CREATE OR REPLACE PROCEDURE registroGuia(
    p_dni         IN guias.dni%TYPE,
    p_Nombre1     IN guias.nombre1%TYPE,
    p_apellido1   IN guias.apellido1%TYPE,
    p_email       IN guias.email%TYPE,
    p_telefono    IN guias.telefono%TYPE,
    p_ciudad      IN guias.ciudad%TYPE,
    p_direccion   IN guias.direccion%TYPE,
    p_sexo        IN guias.sexo%TYPE,
    p_fecha       IN guias.fecha_nacimiento%TYPE
    )

IS 
    intSeqVal number;
    v_edad number(3) := calcularEdadCliente(p_fecha);
BEGIN
    select sec_id_guia.nextval into intSeqVal from dual;
INSERT into GUIAS VALUES (
    intSeqVal,
    p_dni,
    p_Nombre1,
    p_apellido1,
    p_email,
    p_telefono,
    v_edad,
    p_ciudad,
    p_direccion,
    to_date(p_fecha,'DD-MM-YYYY'),
    p_sexo,
    sysdate
    );
    COMMIT;
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: El guia ya existe.');
END registroGuia;
/


-- -----------------------------------------------------
-- 2- registro de la factura
-- -----------------------------------------------------

create or replace procedure registrarFactura(
    l_no_reserva      in facturacion.id_reserva%TYPE,
    l_id_cliente      in facturacion.id_cliente%TYPE,
    l_monto           in facturacion.monto_pago%TYPE,
    l_tipo_transac    in facturacion.tipo_transac%TYPE
)
IS
v_secuencia number;
v_monto number;
BEGIN
select precio_total into v_monto from reservacion
    where id_reserva = l_no_reserva and id_cliente = l_id_cliente;

IF SQL%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('Error de registro: Los valores ingresados no son validos.');

ELSE
select sec_no_factura.nextval into v_secuencia from dual;

INSERT INTO facturacion VALUES(
        v_secuencia,
        l_no_reserva,
        l_id_cliente,
        l_monto,
        l_tipo_transac,
        sysdate
);

END IF;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error de registro: Los valores ingresados no son validos.');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error de registro: Los valores ingresados no son validos.');
END registrarFactura;
/

