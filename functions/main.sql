
/*
Funcion para calcula edad
*/
CREATE OR REPLACE FUNCTION calcular()
RETURN NUMBER IS
BEGIN

EXCEPTION
  WHEN ZERO_DIVIDE THEN
      DBMS_OUTPUT.PUT_LINE('💣 Error: El tipo de correo ya existe.');
END;

/*
Funcion para calcula el total
*/