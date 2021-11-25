
/*
Funcion para calcula edad
*/
CREATE OR REPLACE FUNCTION calcularEdadCliente(p_fecha date)
RETURN NUMBER IS 
v_clienteEdad number(3);
v_fecha date := p_fecha;
BEGIN
  -- Necesitamos eso en años
  v_clienteEdad := (SYSDATE - v_fecha) / 365;

  RETURN v_clienteEdad;
  
  EXCEPTION
   WHEN ZERO_DIVIDE THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: Fecha no valida.');
END calcularEdadCliente;
/
/*
Funcion para calcula el total
*/