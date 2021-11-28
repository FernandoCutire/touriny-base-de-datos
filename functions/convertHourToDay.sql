create or replace function calcularhoras(l_horas number)
return number IS
v_dias number;

BEGIN

if l_horas/24 <= 1 then
v_dias := 1;
elsif l_horas/24 > 1 and l_horas/24 <= 2 THEN
v_dias := 2;
elsif l_horas/24 >2 and l_horas/24 <=3 THEN
v_dias := 3;
end if;

return v_dias;
EXCEPTION
   WHEN ZERO_DIVIDE THEN
       DBMS_OUTPUT.PUT_LINE('💣 Error: hora ingresada no valida.');
END calcularhoras;
/



--invocacion para probar la funcion.
DECLARE
horas number := 49;
dias number;
BEGIN
dias := calcularhoras(horas);

DBMS_OUTPUT.PUT_LINE('LOS DIAS SON: ' || dias);
END;