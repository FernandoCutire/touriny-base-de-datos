create or replace function descuento(descuento number, precio number)
return number IS
v_resultado number;

BEGIN
v_resultado := precio -(descuento * precio);
return v_resultado;
END descuento;
/