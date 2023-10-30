use GD2C2023
GO

CREATE PROCEDURE migrar_tipificado
    @TableName NVARCHAR(100),
    @SourceColumn NVARCHAR(100)
AS
BEGIN
    DECLARE @SqlStatement NVARCHAR(MAX);

    SET @SqlStatement = N'
        INSERT INTO ' + @TableName + '
        (nombre)
        SELECT DISTINCT ' + @SourceColumn + '
        FROM gd_esquema.Maestra AS M
        WHERE ' + @SourceColumn + ' IS NOT NULL
        AND NOT EXISTS (
            SELECT 1
            FROM ' + @TableName + ' AS T
            WHERE T.nombre = M.' + @SourceColumn + '
        )';

    EXEC sp_executesql @SqlStatement;
END
GO


CREATE PROCEDURE migrar_tipificados
AS
BEGIN

    EXEC migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.Disposicion', 'INMUEBLE_DISPOSICION'
    EXEC migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.Orientacion', 'INMUEBLE_ORIENTACION'
    EXEC migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.EstadoAlquiler', 'ALQUILER_ESTADO'
    EXEC migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.EstadoAnuncio', 'ANUNCIO_ESTADO'
    EXEC migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.TipoDeMoneda', 'PAGO_VENTA_MONEDA'
    EXEC migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.TipoDeMoneda', 'VENTA_MONEDA'
    EXEC migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.TipoDeMoneda', 'ANUNCIO_MONEDA'
    EXEC migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.TipoOperacion', 'ANUNCIO_TIPO_OPERACION'
    EXEC migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.TipoDeInmueble', 'INMUEBLE_TIPO_INMUEBLE'
    EXEC migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.TipoPeriodo', 'ANUNCIO_TIPO_PERIODO'
    EXEC migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.MedioPago', 'PAGO_ALQUILER_MEDIO_PAGO'
    EXEC migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.MedioPago', 'PAGO_VENTA_MEDIO_PAGO'
    EXEC migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.Estado', 'INMUEBLE_ESTADO'
    EXEC migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.CantAmbientes', 'INMUEBLE_CANT_AMBIENTES'
end
go

CREATE PROCEDURE migrar_carateristica
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Caracteristica (nombre)
    VALUES ('WIFI'),
           ('CABLE'),
           ('CALEFACCION'),
           ('GAS'),
           ('COCHERA'),
           ('PISCINA'),
           ('AIRE ACONDICIONADO'),
           ('AMOBLAMIENTO');
END
GO




CREATE PROCEDURE migrar_inquilinos 
AS
BEGIN
    CREATE TABLE #TempInquilino (id_persona INT);

    INSERT INTO ANDY_Y_SUS_SEMINARAS.Persona (nombre, apellido, dni, fecha_registro, telefono, mail, fecha_nacimiento)
    OUTPUT inserted.id_persona INTO #TempInquilino (id_persona)
    SELECT DISTINCT INQUILINO_NOMBRE, INQUILINO_APELLIDO, INQUILINO_DNI, INQUILINO_FECHA_REGISTRO, INQUILINO_TELEFONO, INQUILINO_MAIL, INQUILINO_FECHA_NAC
    FROM gd_esquema.Maestra 
    WHERE INQUILINO_NOMBRE IS NOT NULL
    AND INQUILINO_APELLIDO IS NOT NULL
    AND INQUILINO_DNI IS NOT NULL
    AND INQUILINO_FECHA_REGISTRO IS NOT NULL
    AND INQUILINO_TELEFONO IS NOT NULL
    AND INQUILINO_MAIL IS NOT NULL
    AND INQUILINO_FECHA_NAC IS NOT NULL; 

    INSERT INTO ANDY_Y_SUS_SEMINARAS.Inquilino (persona_id)
    SELECT id_persona FROM #TempInquilino;

    DROP TABLE #TempInquilino;
END
GO

CREATE PROCEDURE migrar_agentes
AS
BEGIN
    CREATE TABLE #TempAgente (id_persona INT);

    INSERT INTO ANDY_Y_SUS_SEMINARAS.Persona (nombre, apellido, dni, fecha_registro, telefono, mail, fecha_nacimiento)
    OUTPUT inserted.id_persona INTO #TempAgente (id_persona)
    SELECT DISTINCT AGENTE_NOMBRE, AGENTE_APELLIDO, AGENTE_DNI, AGENTE_FECHA_REGISTRO, AGENTE_TELEFONO, AGENTE_MAIL, AGENTE_FECHA_NAC
    FROM gd_esquema.Maestra 
    WHERE AGENTE_NOMBRE IS NOT NULL
    AND AGENTE_APELLIDO IS NOT NULL
    AND AGENTE_DNI IS NOT NULL
    AND AGENTE_FECHA_REGISTRO IS NOT NULL
    AND AGENTE_TELEFONO IS NOT NULL
    AND AGENTE_MAIL IS NOT NULL
    AND AGENTE_FECHA_NAC IS NOT NULL;

    INSERT INTO ANDY_Y_SUS_SEMINARAS.Agente (persona_id)
    SELECT id_persona FROM #TempAgente;

    DROP TABLE #TempAgente;
END
GO

CREATE PROCEDURE migrar_propietarios
AS
BEGIN
    CREATE TABLE #TempPropietario (id_persona INT);

    INSERT INTO ANDY_Y_SUS_SEMINARAS.Persona (nombre, apellido, dni, fecha_registro, telefono, mail, fecha_nacimiento)
    OUTPUT inserted.id_persona INTO #TempPropietario (id_persona)
    SELECT DISTINCT PROPIETARIO_NOMBRE, PROPIETARIO_APELLIDO, PROPIETARIO_DNI, PROPIETARIO_FECHA_REGISTRO, PROPIETARIO_TELEFONO, PROPIETARIO_MAIL, PROPIETARIO_FECHA_NAC
    FROM gd_esquema.Maestra
    WHERE PROPIETARIO_NOMBRE IS NOT NULL
    AND PROPIETARIO_APELLIDO IS NOT NULL
    AND PROPIETARIO_DNI IS NOT NULL
    AND PROPIETARIO_FECHA_REGISTRO IS NOT NULL
    AND PROPIETARIO_TELEFONO IS NOT NULL
    AND PROPIETARIO_MAIL IS NOT NULL
    AND PROPIETARIO_FECHA_NAC IS NOT NULL;

    INSERT INTO ANDY_Y_SUS_SEMINARAS.Propietario (persona_id)
    SELECT id_persona FROM #TempPropietario;

    DROP TABLE #TempPropietario;
END
GO

CREATE PROCEDURE migrar_compradores
AS
BEGIN
    CREATE TABLE #TempComprador (id_persona INT);

    INSERT INTO ANDY_Y_SUS_SEMINARAS.Persona (nombre, apellido, dni, fecha_registro, telefono, mail, fecha_nacimiento)
    OUTPUT inserted.id_persona INTO #TempComprador (id_persona)
    SELECT DISTINCT COMPRADOR_NOMBRE, COMPRADOR_APELLIDO, COMPRADOR_DNI, COMPRADOR_FECHA_REGISTRO, COMPRADOR_TELEFONO, COMPRADOR_MAIL, COMPRADOR_FECHA_NAC
    FROM gd_esquema.Maestra 
    WHERE COMPRADOR_NOMBRE IS NOT NULL
    AND COMPRADOR_APELLIDO IS NOT NULL
    AND COMPRADOR_DNI IS NOT NULL
    AND COMPRADOR_FECHA_REGISTRO IS NOT NULL
    AND COMPRADOR_TELEFONO IS NOT NULL
    AND COMPRADOR_MAIL IS NOT NULL
    AND COMPRADOR_FECHA_NAC IS NOT NULL;

    INSERT INTO ANDY_Y_SUS_SEMINARAS.Comprador (persona_id)
    SELECT id_persona FROM #TempComprador;

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
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Localidad
        (nombre, provincia_id)
    SELECT DISTINCT 
        INMUEBLE_LOCALIDAD,
        p.id_provincia
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.Provincia p ON m.INMUEBLE_PROVINCIA = p.nombre
    WHERE INMUEBLE_LOCALIDAD IS NOT NULL
    UNION
    SELECT DISTINCT
        SUCURSAL_LOCALIDAD,
        p.id_provincia
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.Provincia p ON m.SUCURSAL_PROVINCIA = p.nombre
    WHERE SUCURSAL_LOCALIDAD IS NOT NULL
END
GO



CREATE PROCEDURE migrar_barrios
AS
BEGIN
 WITH CTE AS (
        SELECT DISTINCT
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
        SELECT DISTINCT
            INMUEBLE_DIRECCION AS direccion,
            INMUEBLE_BARRIO AS barrio
        FROM gd_esquema.Maestra
        UNION
        SELECT DISTINCT
            SUCURSAL_DIRECCION AS direccion,
            NULL AS barrio
        FROM gd_esquema.Maestra
        
    )
    
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Direccion (calle, barrio_id)
    SELECT DISTINCT c.direccion, b.id_barrio
    FROM CTE c
    LEFT JOIN ANDY_Y_SUS_SEMINARAS.Barrio b ON c.barrio = b.nombre;
END
GO

CREATE PROCEDURE migrar_inmueble
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Inmueble (tipo_de_inmueble_id, descripcion, direccion_id, cantAmbientes_id, superficie_total, disposicion_id, orientacion_id, estado_id, antiguedad, expensas)
    SELECT DISTINCT
        t.id_tipo_de_inmueble,
        INMUEBLE_DESCRIPCION,
        d.id_direccion,
        c.id_cant_ambientes,
        INMUEBLE_SUPERFICIETOTAL,
        dis.id_disposicion,
        ori.id_orientacion,
        e.id_estado,
        INMUEBLE_ANTIGUEDAD,
        INMUEBLE_EXPESAS
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.CantAmbientes c ON m.INMUEBLE_CANT_AMBIENTES = c.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.TipoDeInmueble t ON m.INMUEBLE_TIPO_INMUEBLE = t.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.Direccion d ON m.INMUEBLE_DIRECCION = d.callenull
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

    RETURN @id_persona;
END
GO

CREATE PROCEDURE migrar_anuncio
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Anuncio (nro_anuncio, fecha_publicacion, tipo_operacion_id, agente_id, inmueble_id, precio_publicado, moneda_id, tipo_periodo_id, estado_anuncio_id, fecha_finalizacion, costo_publicacion)
    SELECT DISTINCT
        ANUNCIO_CODIGO,
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
    JOIN ANDY_Y_SUS_SEMINARAS.Agente a ON dbo.GetPersonaID(em.AGENTE_NOMBRE, em.AGENTE_APELLIDO, em.AGENTE_DNI, em.AGENTE_TELEFONO, em.AGENTE_MAIL, em.AGENTE_FECHA_REGISTRO, em.AGENTE_FECHA_NAC) = a.persona_id
END
GO

CREATE PROCEDURE migrar_propietario_inmueble
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.PropietarioDeInmueble (propietario_id, inmueble_id)
    SELECT DISTINCT
        p.id_propietario,
        i.nro_inmueble
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.Propietario p ON dbo.GetPersonaID(m.PROPIETARIO_NOMBRE, m.PROPIETARIO_APELLIDO, m.PROPIETARIO_DNI, m.PROPIETARIO_TELEFONO, m.PROPIETARIO_MAIL, m.PROPIETARIO_FECHA_REGISTRO, m.PROPIETARIO_FECHA_NAC) = p.persona_id
    JOIN ANDY_Y_SUS_SEMINARAS.Inmueble i ON m.INMUEBLE_CODIGO = i.nro_inmueble 
END
GO

CREATE PROCEDURE migrar_pago_alquiler
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.PagoAlquiler (alquiler_id, fecha_pago, nro_periodo_pago, fecha_inicio_periodo, fecha_fin_periodo, importe, medioPago_id, descripcion_periodo)
    SELECT DISTINCT
        a.id_alquiler,
        PAGO_ALQUILER_FECHA,
        PAGO_ALQUILER_NRO_PERIODO,
        PAGO_ALQUILER_FEC_INI,
        PAGO_ALQUILER_FEC_FIN,
        PAGO_ALQUILER_IMPORTE,
        mp.id_medio_pago,
        PAGO_ALQUILER_DESC
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.Alquiler a ON m.ALQUILER_CODIGO = a.id_alquiler
    JOIN ANDY_Y_SUS_SEMINARAS.MedioPago mp ON m.PAGO_ALQUILER_MEDIO_PAGO = mp.nombre
END
GO


CREATE PROCEDURE migrar_duracion
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Duracion (tipo_periodo_id, cantidad)
    SELECT DISTINCT
        tp.id_tipo_periodo,
        ALQUILER_CANT_PERIODOS
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.TipoPeriodo tp ON m.ANUNCIO_TIPO_PERIODO = tp.nombre
    where ALQUILER_CANT_PERIODOS IS NOT NULL
END
GO


CREATE PROCEDURE migrar_venta
AS
BEGIN   
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Venta (anuncio_id, comprador_id, fecha_venta, precio_venta, moneda_id, pago_venta_id, comision)
    SELECT DISTINCT
        v.nro_anuncio,
        c.id_comprador,
        VENTA_FECHA,
        VENTA_PRECIO_VENTA,
        tm.id_moneda,
        p.id_pago_venta,
        VENTA_COMISION
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.Anuncio v ON m.ANUNCIO_CODIGO = v.nro_anuncio
    JOIN ANDY_Y_SUS_SEMINARAS.Comprador c ON dbo.GetPersonaID(m.COMPRADOR_NOMBRE, m.COMPRADOR_APELLIDO, m.COMPRADOR_DNI, m.COMPRADOR_TELEFONO, m.COMPRADOR_MAIL, m.COMPRADOR_FECHA_REGISTRO, m.COMPRADOR_FECHA_NAC) = c.persona_id
    JOIN ANDY_Y_SUS_SEMINARAS.TipoDeMoneda tm ON m.PAGO_VENTA_MONEDA = tm.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.PagoVenta p ON m.PAGO_VENTA_IMPORTE = p.importe AND m.PAGO_VENTA_COTIZACION = p.cotizacion AND m.PAGO_VENTA_MEDIO_PAGO = p.medio_de_pago_id AND m.PAGO_VENTA_MONEDA = p.moneda_del_pago_id  
END
GO

CREATE PROCEDURE migrar_pago_venta
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.PagoVenta (importe, cotizacion, medio_de_pago_id, moneda_del_pago_id)
    SELECT DISTINCT
        PAGO_VENTA_IMPORTE,
        PAGO_VENTA_COTIZACION,
        mp.id_medio_pago,
        tm.id_moneda
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.MedioPago mp ON m.PAGO_VENTA_MEDIO_PAGO = mp.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.TipoDeMoneda tm ON m.PAGO_VENTA_MONEDA = tm.nombre

END
GO


CREATE PROCEDURE migrar_detalle_importe
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.DetalleImporte (nro_periodo_inicio, nro_periodo_fin, precio)
    SELECT DISTINCT
        DETALLE_ALQ_NRO_PERIODO_INI,
        DETALLE_ALQ_NRO_PERIODO_FIN,
        DETALLE_ALQ_PRECIO
    FROM gd_esquema.Maestra em
END
GO

CREATE PROCEDURE migrar_alquiler 
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Alquiler (id_alquiler, fecha_inicio, fecha_fin, inquilino_id, estado_alquiler_id, detalle_importe_id, duracion_id, deposito, comision, gastos_averiguaciones, anuncio_id)
    SELECT DISTINCT
        em.ALQUILER_CODIGO,
        em.ALQUILER_FECHA_INICIO,
        em.ALQUILER_FECHA_FIN,
        inq.id_inquilino,
        e.id_estado_alquiler,
        d.id_detalle_importe,
        du.id_duracion,
        em.ALQUILER_DEPOSITO,
        em.ALQUILER_COMISION,
        em.ALQUILER_GASTOS_AVERIGUA,
        a.nro_anuncio
    FROM gd_esquema.Maestra em
    JOIN ANDY_Y_SUS_SEMINARAS.Inmueble i ON em.INMUEBLE_CODIGO = i.nro_inmueble
    JOIN ANDY_Y_SUS_SEMINARAS.Inquilino inq ON DBO.GetPersonaID(em.INQUILINO_NOMBRE, em.INQUILINO_APELLIDO, em.INQUILINO_DNI, em.INQUILINO_TELEFONO, em.INQUILINO_MAIL, em.INQUILINO_FECHA_REGISTRO, em.INQUILINO_FECHA_NAC) = inq.persona_id
    JOIN ANDY_Y_SUS_SEMINARAS.TipoPeriodo t ON em.ANUNCIO_TIPO_PERIODO = t.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.EstadoAlquiler e ON em.ALQUILER_ESTADO = e.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.DetalleImporte d ON em.DETALLE_ALQ_NRO_PERIODO_INI = d.nro_periodo_inicio AND em.DETALLE_ALQ_NRO_PERIODO_FIN = d.nro_periodo_fin AND em.DETALLE_ALQ_PRECIO = d.precio
    JOIN ANDY_Y_SUS_SEMINARAS.Duracion du ON t.id_tipo_periodo = du.tipo_periodo_id AND em.ALQUILER_CANT_PERIODOS = du.cantidad
    JOIN ANDY_Y_SUS_SEMINARAS.Anuncio a ON em.ANUNCIO_CODIGO = a.nro_anuncio
END
GO

-- Primero, migra los datos de tipificados
EXEC migrar_tipificados;

-- A continuación, migrar las tablas de características
EXEC migrar_carateristica;

-- Migrar los datos de personas
EXEC migrar_inquilinos;
EXEC migrar_agentes;
EXEC migrar_propietarios;
EXEC migrar_compradores;

-- Migrar localidades, provincias, barrios, direcciones e inmuebles
EXEC migrar_provincias;
EXEC migrar_localidad;
EXEC migrar_barrios;
EXEC migrar_direccion;
EXEC migrar_inmueble;

-- Migrar sucursales, anuncios y detalles de importe
EXEC migrar_sucursal;
EXEC migrar_anuncio;
EXEC migrar_detalle_importe;

-- Migrar propietarios de inmuebles, duraciones y pagos
EXEC migrar_propietario_inmueble;
EXEC migrar_duracion;
EXEC migrar_pago_alquiler;

-- Migrar venta, pago de venta y alquiler
EXEC migrar_venta;
EXEC migrar_pago_venta;
EXEC migrar_alquiler;




DROP FUNCTION dbo.GetPersonaID
