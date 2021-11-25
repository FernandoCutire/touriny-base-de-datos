-- -----------------------------------------------------
-- 1- Proc Registro del cliente
-- -----------------------------------------------------
CREATE OR REPLACE PROCEDURE registroCliente(
    p_dni         IN clientes.dni%TYPE,
    p_Nombre1     IN clientes.nombre1%TYPE,
    p_Nombre2     IN clientes.nombre2%TYPE,
    p_apellido1   IN clientes.apellido1%TYPE,
    p_apellido2   IN clientes.apellido2%TYPE,
    p_email       IN clientes.email%TYPE,
    p_telefono    IN clientes.telefono%TYPE,
    p_fecha       IN clientes.fecha_nacimiento%TYPE,
    p_sexo        IN clientes.sexo%TYPE,
    p_pais        IN clientes.cod_pais%TYPE,
    p_ciudad      IN clientes.ciudad%TYPE,
    p_direccion   IN clientes.direccion%TYPE
    )

IS 
    intSeqVal number;
    v_edad number(3) := calcularEdadCliente(p_fecha);
BEGIN
    select sec_id_cliente.nextval into intSeqVal from dual;
INSERT into CLIENTES VALUES (
    intSeqVal,
    p_dni,
    p_Nombre1,
    p_Nombre2,
    p_apellido1,
    p_apellido2,
    p_email,
    p_telefono,
    v_edad,
    p_pais,
    p_ciudad,
    p_direccion,
    to_date(p_fecha,'DD-MM-YYYY'),
    p_sexo,
    sysdate
    );
    COMMIT;
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: El cliente ya existe.');
END registroCliente;
/


-- -----------------------------------------------------
-- 2- Proc Registro de reserva del cliente
-- -----------------------------------------------------


-- -----------------------------------------------------
-- 3- Proc Registro de reviews del cliente
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE registroReview(
    p_ciente          IN reviews.id_cliente%TYPE,
    p_tour            IN reviews.id_tour%TYPE,
    p_descripcion     IN reviews.descripcion%TYPE,
    p_calificacion    IN reviews.calificacion%TYPE
    )

IS 
    intSeqVal number;
BEGIN
    select sec_id_review.nextval into intSeqVal from dual;
INSERT into REVIEWS VALUES (
    intSeqVal,
    p_ciente,
    p_tour,
    p_descripcion,
    p_calificacion,
    sysdate
    );
    COMMIT;
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: El cliente ya existe.');
END registroReview;
/
