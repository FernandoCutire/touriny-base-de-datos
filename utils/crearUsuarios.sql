/* CREACION DE USUARIOS */
CREATE USER usuario IDENTIFIED BY contrasena;
/*CONCEDER PERMISOS*/
GRANT CREATE SESSION TO miusuario;

GRANT CONNECT TO usuario;
GRANT RESOURCE TO usuario;
GRANT CREATE VIEW TO usuario; 
GRANT CREATE ANY PROCEDURE TO usuario;