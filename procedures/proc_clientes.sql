-- -----------------------------------------------------
-- 1- Proc Registro del cliente
-- Primero correr funcion calcularEdad
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
-- Correr primer calcular horas
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE registroReserva(
    p_id_cliente         IN clientes.id_cliente%TYPE,
    p_id_tour            IN reserva_tours.id_tour1%TYPE,
    p_cantidad_personas  IN reserva_tours.cantidad_personas%TYPE,
    p_fecha_inicio       IN reserva_tours.fecha_inicio%TYPE
    )

IS 
    intSeqVal number;
    v_id_cliente number;
    v_precio number;
    v_status CHAR(2) := 'PE';
    v_cantidad_max number;
    v_cupos number;
    limite_cupos_exeed EXCEPTION;
    v_dias number;
    v_horas number;
    v_precio_total number;
    PRAGMA exception_init(limite_cupos_exeed, -20111);
BEGIN

--validacion de no exceder el maximo de personas por solicitud y que la fecha
--de inicio del tour sea mayor a la fecha de solicutud. por lo menos 24h antes.
IF p_cantidad_personas <= 10 AND p_fecha_inicio > sysdate THEN
    --se extraen la cantidad maxima de personas del id tour ingresado.
    SELECT cantidad_cupos INTO v_cantidad_max 
    FROM TOURS
    WHERE id_tours = p_id_tour;

    --se realiza una sumatoria con las condiciones del id tour ingresado.
    --si el tour esta en estado pendiente y si esta en la misma fecha.
    SELECT SUM(cantidad_personas) INTO v_cupos
    FROM RESERVA_TOURS
    WHERE id_tour1 = p_id_tour
    AND fecha_inicio = p_fecha_inicio
    AND status = 'PE';

    --el numero de perosnas para un dia, no puede exeder el limite de personas del tour.
    IF v_cupos > v_cantidad_max THEN
        raise_application_error(-20111,'Limite de cupos exedido.');
    ELSE
    --antes de la insercion se valida con el trigger ValidarCupos
    select sec_id_reserva.nextval into intseqval from dual;
    --extrae el precio del tour seleccionado;
    select promocion into v_precio from tours where id_tours = p_id_tour;
    v_precio_total := v_precio * p_cantidad_personas;
    INSERT INTO RESERVACION
        VALUES (
        intseqval,
        p_id_cliente,
        sysdate,
        p_cantidad_personas,
        v_status,
        v_precio_total);

    
    --extrae la duracion del tour selecionado.
    select duracion into v_horas from tours where id_tours = p_id_tour;
    --conversion de las horas de duracion a -> dias.
    v_dias := calcularhoras(v_horas);

    --FINALIZA LA TRANSACCION INSERTANTO LOS VALORES EN RESERVA_TOUR.
    INSERT INTO RESERVA_TOURS(
        id_reserva1,
        id_tour1,
        fecha_inicio,
        fecha_fin,
        precio_tour,
        cantidad_personas,
        status,
        fecha_ingreso)
        VALUES(
            intseqval,
            p_id_tour,
            to_date(p_fecha_inicio,'dd-mm-yy'),
            to_date(p_fecha_inicio,'dd-mm-yy') + v_dias,
            v_precio,
            p_cantidad_personas,
            v_status,
            sysdate
        );
    END IF;
ELSE
    DBMS_OUTPUT.PUT_LINE('💣 Advertencia: El numero maximo de personas es 10. Validar fecha de inicio.');
END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: Advertencia: No se han encontrado datos.');
    WHEN limite_cupos_exeed THEN
        DBMS_OUTPUT.PUT_LINE('💣 Advertencia: Cupos agotados para este tour. Elija una fecha diferente.');
END registroReserva;
/


-- -----------------------------------------------------
-- 3- Proc Registro de reviews del cliente
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE registroReview(
    p_cLiente          IN reviews.id_cliente%TYPE,
    p_tour            IN reviews.id_tour%TYPE,
    p_descripcion     IN reviews.descripcion%TYPE,
    p_calificacion    IN reviews.calificacion%TYPE
    )

IS 
    intSeqVal number;
BEGIN

IF p_calificacion <= 5 then
    select sec_id_review.nextval into intSeqVal from dual;
INSERT into REVIEWS VALUES (
    intSeqVal,
    p_cliente,
    p_tour,
    p_descripcion,
    p_calificacion,
    sysdate
    );
    COMMIT;
ELSE
DBMS_OUTPUT.PUT_LINE('💣 Error: la calificacion es de 1 a 5');
END IF;

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: El cliente ya existe.');
    WHEN NO_DATA_FOUND THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: Los datos ingresados son incorrectos.');
END registroReview;
/

execute registroReview (9333,2,'bueno',3);
execute registroReview (9333,2,'bueno',3);
execute registroReview (9333,2,'bueno',1);
execute registroReview (9333,2,'bueno',5);
execute registroReview (9333,2,'bueno',2);