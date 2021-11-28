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

EXECUTE registroDestino('Canal de Panamá','-79.5926900 y 8.9979700');

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
    p_guia     IN tours.id_guia%TYPE,
    p_id_promo     IN tours.id_promo%TYPE
    )

IS 
    v_id_promo number := p_id_promo;
    v_precio number := p_precio;
    v_status char(2) := 'A';
    v_calificacion number := 0;
    v_promocion number;
    v_precio_promocion number;
    intSeqVal number;
BEGIN
    select sec_id_tour.nextval into intSeqVal from dual;
    v_precio_promocion := calcularPromo(v_id_promo,v_precio);
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
    v_precio_promocion,
    sysdate
    );
    COMMIT;
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: El tour ya existe.');
END registroTour;
/

INSERT INTO TOURS VALUES (1, 'Tour de la ciudad y el Canal de Panamá ', 6, 'Conoce los mejores lugares en la ciudad de Panamá.', 67, 20, 1, 1);
EXECUTE registroTour('Tour de la ciudad y el Canal de Panamá ', 6, 'Conoce los mejores lugares en la ciudad de Panamá.', 67, 20, 1, 1,1);