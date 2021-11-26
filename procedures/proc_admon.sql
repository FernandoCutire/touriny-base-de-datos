-- -----------------------------------------------------
-- 1- Proc Registro del cliente
-- -----------------------------------------------------
CREATE OR REPLACE PROCEDURE registroGuia(
    p_dni         IN guia.dni%TYPE,
    p_Nombre1     IN guia.nombre1%TYPE,
    p_apellido1   IN guia.apellido1%TYPE,
    p_email       IN guia.email%TYPE,
    p_telefono    IN guia.telefono%TYPE,
    p_ciudad      IN guia.ciudad%TYPE,
    p_direccion   IN guia.direccion%TYPE,
    p_sexo        IN guia.sexo%TYPE,
    p_fecha       IN guia.fecha_nacimiento%TYPE
    )

IS 
    intSeqVal number;
    v_edad number(3) := calcularEdadCliente(p_fecha);
BEGIN
    select sec_id_guia.nextval into intSeqVal from dual;
INSERT into CLIENTES VALUES (
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