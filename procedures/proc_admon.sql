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
-- 2- Proc de auditoria
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

