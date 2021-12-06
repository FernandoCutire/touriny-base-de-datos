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
    destinos_ids  touriny.destinos_t_pkg.destinos_del_tour)

IS 
    
    v_precio number := p_precio;
    v_status char(2) := 'A';
    v_calificacion number := 0;
    intSeqVal number;

BEGIN
    --inicializacion de la secuencia.
    select sec_id_tour.nextval into intSeqVal from dual;

    
INSERT into TOURS (
    id_tours,tour_nombre,duracion,descripcion,precio,cantidad_cupos,id_dificultad,id_guia,status,CALIFICACION,promocion,fecha_mod
)
VALUES (
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
    p_precio,
    sysdate
    );

    -- se recorren los valores contenidos en el array con los ids de los destinos para el tour.
    FOR i IN destinos_ids.first..destinos_ids.last LOOP
    INSERT INTO DESTINOS_TOURS VALUES(
                destinos_ids(i),
                intSeqVal,
                sysdate
            );
    END LOOP;
  
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('💣 Error: El tour ya existe.');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('💣 Error: validar que los datos ingresados sean correctos.');
END registroTour;
/

CREATE OR REPLACE PACKAGE touriny.destinos_t_pkg IS
   TYPE destinos_del_tour IS TABLE OF number INDEX BY BINARY_INTEGER;
END destinos_t_pkg;
/


