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
INSERT into REVIEWS VALUES (
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
    p_duracion     IN tours.duracion%TYPE,
    p_descripcion     IN tours.descripcion%TYPE,
    p_precio     IN tours.precio%TYPE,
    p_cupos     IN tours.cantidad_cupos%TYPE,
    p_dificultad     IN tours.id_dificultad%TYPE,
    p_guia     IN tours.guia%TYPE,
    p_temporada     IN tours.id_temporada%TYPE
    )

IS 
    v_tempo number := p_temporada;
    v_status char(2) := 'A';
    v_calificacion number := 0;
    v_decuento number;
    intSeqVal number;
BEGIN
    select sec_id_tour.nextval into intSeqVal from dual;
    SELECT descuento INTO v_descuento FROM TEMPORADAS WHERE id_tempo = v_tempo;
INSERT into REVIEWS VALUES (
    intSeqVal,
    p_nombre,
    p_duracion,
    p_descripcion,
    p_cupos,
    p_dificultad,
    p_guia,
    v_status,
    v_calificacion,
    p_temporada,
    v_descuento,
    sysdate
    );
    COMMIT;
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: El tour ya existe.');
END registroDestino;
/