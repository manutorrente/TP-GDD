use GD2C2023
GO

CREATE PROCEDURE Migrar_Tipificado -- con nombre
    @TableName NVARCHAR(100),
    @SourceColumn NVARCHAR(100)
AS
BEGIN
    DECLARE @SqlStatement NVARCHAR(MAX);

    SET @SqlStatement = N'
        INSERT INTO ' + @TableName + '
        (nombre)
        SELECT DISTINCT ' + @SourceColumn + '
        FROM gd_esquema.Maestra
        WHERE ' + @SourceColumn + ' IS NOT NULL';

    EXEC sp_executesql @SqlStatement;
END
GO

CREATE PROCEDURE migrar_tipificados
AS
BEGIN

    EXEC Migrar_Tipificado 'ANDY_Y_SUS_SEMINARAS.Disposicion', 'INMUEBLE_DISPOSICION'
    EXEC Migrar_Tipificado 'ANDY_Y_SUS_SEMINARAS.Orientacion', 'INMUEBLE_ORIENTACION'
    EXEC Migrar_Tipificado 'ANDY_Y_SUS_SEMINARAS.EstadoAlquiler', 'ALQUILER_ESTADO'
    EXEC Migrar_Tipificado 'ANDY_Y_SUS_SEMINARAS.EstadoAnuncio', 'ANUNCIO_ESTADO'
    EXEC Migrar_Tipificado 'ANDY_Y_SUS_SEMINARAS.TipoDeMoneda', 'PAGO_VENTA_MONEDA'
    EXEC Migrar_Tipificado 'ANDY_Y_SUS_SEMINARAS.TipoDeMoneda', 'VENTA_MONEDA'
    EXEC Migrar_Tipificado 'ANDY_Y_SUS_SEMINARAS.TipoDeMoneda', 'ANUNCIO_MONEDA'
    EXEC Migrar_Tipificado 'ANDY_Y_SUS_SEMINARAS.TipoOperacion', 'ANUNCIO_TIPO_OPERACION'
    EXEC Migrar_Tipificado 'ANDY_Y_SUS_SEMINARAS.TipoDeInmueble', 'INMUEBLE_TIPO_INMUEBLE'
    EXEC Migrar_Tipificado 'ANDY_Y_SUS_SEMINARAS.TipoPeriodo', 'ANUNCIO_TIPO_PERIODO'
    EXEC Migrar_Tipificado 'ANDY_Y_SUS_SEMINARAS.MedioPago', 'PAGO_ALQUILER_MEDIO_PAGO'
    EXEC Migrar_Tipificado 'ANDY_Y_SUS_SEMINARAS.MedioPago', 'PAGO_VENTA_MEDIO_PAGO'
    EXEC Migrar_Tipificado 'ANDY_Y_SUS_SEMINARAS.Estado', 'INMUEBLE_ESTADO'
end
go

EXEC migrar_tipificados
GO
DROP PROCEDURE migrar_tipificados

SELECT * FROM ANDY_Y_SUS_SEMINARAS.Disposicion
SELECT * FROM ANDY_Y_SUS_SEMINARAS.Orientacion
SELECT * FROM ANDY_Y_SUS_SEMINARAS.EstadoAlquiler
SELECT * FROM ANDY_Y_SUS_SEMINARAS.EstadoAnuncio
SELECT * FROM ANDY_Y_SUS_SEMINARAS.TipoDeMoneda
SELECT * FROM ANDY_Y_SUS_SEMINARAS.TipoOperacion
SELECT * FROM ANDY_Y_SUS_SEMINARAS.TipoDeInmueble
SELECT * FROM ANDY_Y_SUS_SEMINARAS.TipoPeriodo
SELECT * FROM ANDY_Y_SUS_SEMINARAS.MedioPago
SELECT * FROM ANDY_Y_SUS_SEMINARAS.Estado
go



CREATE PROCEDURE migrar_carateristica
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Caracteristica
        (nombre)
    VALUES
        ("WIFI", "CABLE", "CALEFACCION", "GAS", "COCHERA", "PISCINA", "AIRE ACONDICIONADO", "AMOBLAMIENTO")
END
GO



CREATE PROCEDURE migrar_inquilinos 
AS
BEGIN
    -- Create a temporary table to hold the result
    CREATE TABLE #TempInquilino (id_persona INT);

    -- Insert data into the Persona table and capture the id_persona
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Persona (nombre, apellido, dni, fecha_registro, telefono, mail, fecha_nacimiento)
    OUTPUT inserted.id_persona INTO #TempInquilino (id_persona)
    SELECT DISTINCT INQUILINO_NOMBRE, INQUILINO_APELLIDO, INQUILINO_DNI, INQUILINO_FECHA_REGISTRO, INQUILINO_TELEFONO, INQUILINO_MAIL, INQUILINO_FECHA_NAC
    FROM gd_esquema.Maestra;

    -- Now insert data into the Inquilino table from the temporary table
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Inquilino (persona_id)
    SELECT id_persona FROM #TempInquilino;

    -- Clean up the temporary table
    DROP TABLE #TempInquilino;
END
GO

EXEC migrar_inquilinos

SELECT * FROM ANDY_Y_SUS_SEMINARAS.Inquilino

DROP PROCEDURE migrar_inquilinos
GO

CREATE PROCEDURE migrar_agentes
AS
BEGIN
    -- Create a temporary table to hold the result
    CREATE TABLE #TempAgente (id_persona INT);

    -- Insert data into the Persona table and capture the id_persona
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Persona (nombre, apellido, dni, fecha_registro, telefono, mail, fecha_nacimiento)
    OUTPUT inserted.id_persona INTO #TempAgente (id_persona)
    SELECT DISTINCT AGENTE_NOMBRE, AGENTE_APELLIDO, AGENTE_DNI, AGENTE_FECHA_REGISTRO, AGENTE_TELEFONO, AGENTE_MAIL, AGENTE_FECHA_NAC
    FROM gd_esquema.Maestra;

    -- Now insert data into the Agente table from the temporary table
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Agente (persona_id)
    SELECT id_persona FROM #TempAgente;

    -- Clean up the temporary table
    DROP TABLE #TempAgente;
END
GO

CREATE PROCEDURE migrar_propietarios
AS
BEGIN
    -- Create a temporary table to hold the result
    CREATE TABLE #TempPropietario (id_persona INT);

    -- Insert data into the Persona table and capture the id_persona
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Persona (nombre, apellido, dni, fecha_registro, telefono, mail, fecha_nacimiento)
    OUTPUT inserted.id_persona INTO #TempPropietario (id_persona)
    SELECT DISTINCT PROPIETARIO_NOMBRE, PROPIETARIO_APELLIDO, PROPIETARIO_DNI, PROPIETARIO_FECHA_REGISTRO, PROPIETARIO_TELEFONO, PROPIETARIO_MAIL, PROPIETARIO_FECHA_NAC
    FROM gd_esquema.Maestra;

    -- Now insert data into the Propietario table from the temporary table
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Propietario (persona_id)
    SELECT id_persona FROM #TempPropietario;

    -- Clean up the temporary table
    DROP TABLE #TempPropietario;
END
GO

CREATE PROCEDURE migrar_compradores
AS
BEGIN
    -- Create a temporary table to hold the result
    CREATE TABLE #TempComprador (id_persona INT);

    -- Insert data into the Persona table and capture the id_persona
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Persona (nombre, apellido, dni, fecha_registro, telefono, mail, fecha_nacimiento)
    OUTPUT inserted.id_persona INTO #TempComprador (id_persona)
    SELECT DISTINCT COMPRADOR_NOMBRE, COMPRADOR_APELLIDO, COMPRADOR_DNI, COMPRADOR_FECHA_REGISTRO, COMPRADOR_TELEFONO, COMPRADOR_MAIL, COMPRADOR_FECHA_NAC
    FROM gd_esquema.Maestra;

    -- Now insert data into the Comprador table from the temporary table
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Comprador (persona_id)
    SELECT id_persona FROM #TempComprador;

    -- Clean up the temporary table
    DROP TABLE #TempComprador;
END
GO 

CREATE PROCEDURE migrar_provincias
AS
BEGIN
    INSERT into ANDY_Y_SUS_SEMINARAS.Provincia
        (nombre)
            SELECT DISTINCT INMUEBLE_PROVINCIA
        FROM gd_esquema.Maestra
        WHERE INMUEBLE_PROVINCIA IS NOT NULL
    UNION
        SELECT DISTINCT SUCURSAL_PROVINCIA
        FROM gd_esquema.Maestra
        WHERE SUCURSAL_PROVINCIA IS NOT NULL
END
GO

CREATE PROCEDURE migrar_localidad
AS
BEGIN
    WITH CTE AS (
        SELECT
            INMUEBLE_LOCALIDAD AS localidad,
            INMUEBLE_PROVINCIA AS provincia
        FROM gd_esquema.Maestra
        UNION
        SELECT
            SUCURSAL_LOCALIDAD,
            SUCURSAL_PROVINCIA 
        FROM gd_esquema.Maestra
    )
    
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Localidad (nombre, provincia_id)
    SELECT DISTINCT c.localidad, p.id_provincia
    FROM CTE c
    JOIN ANDY_Y_SUS_SEMINARAS.Provincia p ON c.provincia = p.nombre;
END
GO



CREATE PROCEDURE migrar_barrios
AS
BEGIN
 WITH CTE AS (
        SELECT
            INMUEBLE_BARRIO AS barrio,
            INMUEBLE_LOCALIDAD AS localidad
        FROM gd_esquema.Maestra)
    
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Barrio
        (nombre, localidad_id)
    SELECT DISTINCT c.barrio, l.id_localidad
    FROM CTE c JOIN ANDY_Y_SUS_SEMINARAS.Localidad l ON c.localidad = l.nombre;
END
GO

CREATE PROCEDURE migrar_direccion
AS
BEGIN
    WITH CTE AS (
        SELECT
            INMUEBLE_DIRECCION AS direccion,
            INMUEBLE_BARRIO AS barrio
        FROM gd_esquema.Maestra
        UNION
        SELECT
            SUCURSAL_DIRECCION AS direccion,
            NULL AS barrio
        FROM gd_esquema.Maestra
    )
    
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Direccion (calle, barrio_id)
    SELECT DISTINCT c.direccion, b.id_barrio
    FROM CTE c
    JOIN ANDY_Y_SUS_SEMINARAS.Barrio b ON c.barrio = b.nombre;
END
GO

CREATE PROCEDURE migrar_inmueble
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Inmueble (tipo_de_inmueble_id, descripcion, direccion_id, ambientes, superficie_total, disposicion_id, orientacion_id, estado_id, antiguedad, expensas)
    SELECT DISTINCT
        t.id_tipo_de_inmueble,
        INMUEBLE_DESCRIPCION,
        d.id_direccion,
        INMUEBLE_CANT_AMBIENTES,
        INMUEBLE_SUPERFICIETOTAL,
        dis.id_disposicion,
        ori.id_orientacion,
        e.id_estado,
        INMUEBLE_ANTIGUEDAD,
        INMUEBLE_EXPESAS
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.TipoDeInmueble t ON m.INMUEBLE_TIPO_INMUEBLE = t.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.Direccion d ON m.INMUEBLE_DIRECCION = d.calle
    JOIN ANDY_Y_SUS_SEMINARAS.Disposicion dis ON m.INMUEBLE_DISPOSICION = dis.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.Orientacion ori ON m.INMUEBLE_ORIENTACION = ori.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.Estado e ON m.INMUEBLE_ESTADO = e.nombre
END
GO

CREATE PROCEDURE migrar_sucursal
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Sucursal (direccion_id, nombre, telefono)
    SELECT DISTINCT
        d.id_direccion,
        SUCURSAL_NOMBRE,
        SUCURSAL_TELEFONO
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.Direccion d ON m.SUCURSAL_DIRECCION = d.calle
    END
GO

-- CREATE PROCEDURE migrarDetalleImporte

CREATE FUNCTION GetPersonaID
(
    @nombre NVARCHAR(100),
    @apellido NVARCHAR(100),
    @dni NVARCHAR(100),
    @telefono NVARCHAR(100),
    @mail NVARCHAR(100),
    @fecha_registro DATETIME,
    @fecha_nacimiento DATETIME
)
RETURNS INT
AS
BEGIN
    DECLARE @id_persona INT;

    -- Retrieve the id_persona based on the provided parameters
    SELECT @id_persona = id_persona
    FROM ANDY_Y_SUS_SEMINARAS.Persona
    WHERE
        nombre = @nombre
        AND apellido = @apellido
        AND dni = @dni
        AND telefono = @telefono
        AND mail = @mail
        AND fecha_registro = @fecha_registro
        AND fecha_nacimiento = @fecha_nacimiento;

    -- Return the id_persona
    RETURN @id_persona;
END
GO


CREATE PROCEDURE migrar_anuncio
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Anuncio (fecha_publicacion, tipo_operacion_id, agente_id, inmueble_id, precio_publicado, moneda_id, tipo_periodo_id, estado_anuncio_id, fecha_finalizacion, costo_publicacion)
    SELECT DISTINCT
        ANUNCIO_FECHA_PUBLICACION,
        t.id_tipo_operacion,
        a.id_agente,
        i.nro_inmueble,
        ANUNCIO_PRECIO_PUBLICADO,
        m.id_moneda,
        p.id_tipo_periodo,
        e.id_estado,
        ANUNCIO_FECHA_FINALIZACION,
        ANUNCIO_COSTO_ANUNCIO
    FROM gd_esquema.Maestra em
    JOIN ANDY_Y_SUS_SEMINARAS.TipoOperacion t ON em.ANUNCIO_TIPO_OPERACION = t.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.Inmueble i ON em.INMUEBLE_CODIGO = i.nro_inmueble
    JOIN ANDY_Y_SUS_SEMINARAS.TipoDeMoneda m ON em.ANUNCIO_MONEDA = m.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.TipoPeriodo p ON em.ANUNCIO_TIPO_PERIODO = p.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.EstadoAnuncio e ON em.ANUNCIO_ESTADO = e.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.Agente a ON GetPersonaID(em.AGENTE_NOMBRE, em.AGENTE_APELLIDO, em.AGENTE_DNI, em.AGENTE_TELEFONO, em.AGENTE_MAIL, em.AGENTE_FECHA_REGISTRO, em.AGENTE_FECHA_NAC) = a.persona_id
END
GO




EXEC migrar_disposicion
EXEC migrar_orientacion
EXEC migrar_estadoAlquiler
EXEC migrar_tipo_de_moneda
EXEC migrar_tipo_operacion
EXEC migrar_tipoDeInmueble
EXEC migrar_tipoPeriodo
EXEC migrar_carateristica
EXEC migrar_medio_de_pago
EXEC migrar_estado
EXEC migrar_inquilinos
EXEC migrar_agentes
EXEC migrar_propietarios
EXEC migrar_compradores
EXEC migrar_provincias
EXEC migrar_localidad
EXEC migrar_barrios
EXEC migrar_direccion
EXEC migrar_inmueble
EXEC migrar_sucursal
EXEC migrar_anuncio


-- PropietarioDeInmueble
-- inmueble
-- anuncio 
-- alquiler 
-- PagoAlquiler
-- TipoPeriodo
-- Duracion 
-- Venta 
-- DetalleImporte
