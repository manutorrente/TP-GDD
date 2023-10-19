use GD2C2023
GO

/* CREATE PROCEDURE migrar_usuarios
AS
BEGIN
    INSERT into ANDY_Y_SUS_SEMINARAS.Persona (nombre, apellido, dni, telefono, mail, fecha_registro, fecha_nacimiento)
    SELECT DISTINCT Propietario_nombre, PROPIETARIO_FECHA_NAC, Propietario_dni, Propietario_telefono, Propietario_mail, Propietario_fecha_registro, Propietario_fecha_nac 
    FROM gd_esquema.Maestra
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Propietario (id_persona) VALUES (persona_id) 
    Necesitamos saber el id de la persona recien insertada para poder agregarla 
END */

CREATE PROCEDURE migrar_provincias
AS
BEGIN
    INSERT into ANDY_Y_SUS_SEMINARAS.Provincia (nombre)
        SELECT DISTINCT INMUEBLE_PROVINCIA
        FROM gd_esquema.Maestra
        WHERE INMUEBLE_PROVINCIA IS NOT NULL
    UNION
        SELECT DISTINCT SUCURSAL_PROVINCIA
        FROM gd_esquema.Maestra
        WHERE SUCURSAL_PROVINCIA IS NOT NULL
END
GO

DROP PROCEDURE migrar_provincias
EXEC migrar_provincias
SELECT * FROM ANDY_Y_SUS_SEMINARAS.Provincia

CREATE PROCEDURE migrar_localidad
AS
BEGIN
    INSERT into ANDY_Y_SUS_SEMINARAS.Localidad
        (nombre)
            SELECT DISTINCT INMUEBLE_LOCALIDAD
        FROM gd_esquema.Maestra
        WHERE INMUEBLE_LOCALIDAD IS NOT NULL
    UNION
        SELECT DISTINCT SUCURSAL_LOCALIDAD
        FROM gd_esquema.Maestra
        WHERE SUCURSAL_LOCALIDAD IS NOT NULL

    SELECT DISTINCT INMUEBLE_PROVINCIA, INMUEBLE_LOCALIDAD, INMUEBLE_BARRIO
    from gd_esquema.Maestra
    where INMUEBLE_PROVINCIA IS NOT NULL
        and INMUEBLE_LOCALIDAD IS NOT NULL
        and INMUEBLE_BARRIO IS NOT NULL
END
GO

SELECT DISTINCT localidad, id_provincia, nombre
FROM (
    SELECT INMUEBLE_LOCALIDAD AS localidad, id_provincia, nombre
    FROM gd_esquema.Maestra M1
    JOIN ANDY_Y_SUS_SEMINARAS.Provincia P1 ON M1.INMUEBLE_PROVINCIA = P1.nombre
) AS subquery;
    SELECT * FROM ANDY_Y_SUS_SEMINARAS.Provincia
GO

CREATE PROCEDURE migrar_barrios
AS
BEGIN
    INSERT into ANDY_Y_SUS_SEMINARAS.Provincia
        (nombre)
    SELECT DISTINCT INMUEBLE_BARRIO
    FROM gd_esquema.Maestra
    WHERE INMUEBLE_BARRIO IS NOT NULL
END