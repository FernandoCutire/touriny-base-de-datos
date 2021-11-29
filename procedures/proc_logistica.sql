-- -----------------------------------------------------
-- 1- Proc Registro de destinos
-- -----------------------------------------------------
CREATE OR REPLACE PROCEDURE registroDestino(
    p_nombre          IN destinos.destino_nombre%TYPE,
    p_coordenadas     IN destinos.coordenadas%TYPE
    )

IS 
    intSeqVal number;
BEGIN
    select sec_id_destino.nextval into intSeqVal from dual;
INSERT into DESTINOS VALUES (
    intSeqVal,
    p_nombre,
    p_coordenadas,
    sysdate
    );
    COMMIT;
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: El destino ya existe.');
END registroDestino;
/


-- -----------------------------------------------------
-- 2- Proc Registro de los tours
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE registroTour(
    p_nombre          IN tours.tour_nombre%TYPE,
    p_duracion        IN tours.duracion%TYPE,
    p_descripcion     IN tours.descripcion%TYPE,
    p_precio          IN tours.precio%TYPE,
    p_cupos           IN tours.cantidad_cupos%TYPE,
    p_dificultad      IN tours.id_dificultad%TYPE,
    p_guia            IN tours.id_guia%TYPE,
    p_id_promo        IN tours.id_promo%TYPE,
    p_destino1        number,
    p_destino2        number,
    p_destino3        number)

IS 
    
    v_precio number := p_precio;
    v_status char(2) := 'A';
    v_calificacion number := 0;
    v_promocion number;
    intSeqVal number;

    v_dest1 number := p_destino1;
    v_dest2 number := p_destino2;
    v_dest3 number := p_destino3;
    --array asociativo para guardar los destinos que tendra el tour.
    TYPE destinos IS TABLE OF NUMBER INDEX BY VARCHAR2(15);
    destino_id destinos;
    Idx VARCHAR2(15);

BEGIN
    --inicializacion de la secuencia.
    select sec_id_tour.nextval into intSeqVal from dual;

    --extraccion del valor de la promocion en promociones.
    select promocion into v_promocion from promociones where id_promo = p_id_promo;
    
INSERT into TOURS VALUES (
    intSeqVal,
    p_nombre,
    p_duracion,
    p_descripcion,
    p_precio,
    p_cupos,
    p_dificultad,
    p_guia,
    v_status,
    v_calificacion,
    p_id_promo,
    v_promocion,
    sysdate
    );

    --asignacion de los valores de los destinos para el tour.
    destino_id('destino1') := v_dest1;
    destino_id('destino2') := v_dest2;
    destino_id('destino3') := v_dest3;

    --asignacion del primer valor del array.
    idx := destino_id.first;

    --loop en el array para insertar el id del tour y el destino en la relacion muchos a muchos.
    WHILE Idx IS NOT NULL LOOP
        INSERT INTO DESTINOS_TOURS VALUES(
            destino_id(idx),
            intSeqVal,
            sysdate
        );
        Idx := destino_id.NEXT(Idx);
    END LOOP;

EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: El tour ya existe.');
END registroTour;
/

execute registroTour('prueba',8,'hola',50,60,1,1,2,5,1,1);
