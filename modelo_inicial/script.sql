USE GD2C2023;
GO

CREATE SCHEMA ANDY_Y_SUS_SEMINARAS;
GO

-- Address related tables
CREATE TABLE ANDY_Y_SUS_SEMINARAS.Provincia
(
    id_provincia INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100) UNIQUE
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Localidad
(
    id_localidad INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100),
    provincia_id INT,
    FOREIGN KEY (provincia_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Provincia(id_provincia),
    CONSTRAINT UC_Localidad_NombreProvincia UNIQUE (nombre, provincia_id)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Barrio
(
    id_barrio INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100),
    localidad_id INT,
    FOREIGN KEY (localidad_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Localidad(id_localidad),
    CONSTRAINT UC_Barrio_NombreLocalidad UNIQUE (nombre, localidad_id)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Direccion
(
    id_direccion INT PRIMARY KEY IDENTITY(1,1),
    barrio_id INT,
    calle NVARCHAR(100),
    FOREIGN KEY (barrio_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Barrio(id_barrio),
    CONSTRAINT UC_Direccion_CalleBarrio UNIQUE (calle, barrio_id)
);

-- Property related tables
CREATE TABLE ANDY_Y_SUS_SEMINARAS.TipoDeInmueble
(
    id_tipo_de_inmueble INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100) UNIQUE
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Disposicion
(
    id_disposicion INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100) UNIQUE
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Orientacion
(
    id_orientacion INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100) UNIQUE
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Estado
(
    id_estado INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100) UNIQUE
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.CantAmbientes
(
    id_cant_ambientes INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100) UNIQUE
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Inmueble
(
    nro_inmueble INT PRIMARY KEY,
    tipo_de_inmueble_id INT,
    descripcion NVARCHAR(100),
    direccion_id INT,
    cantAmbientes_id INT,
    superficie_total NUMERIC,
    disposicion_id INT,
    orientacion_id INT,
    estado_id INT,
    antiguedad INT,
    expensas NUMERIC,
    FOREIGN KEY(cantAmbientes_id) REFERENCES ANDY_Y_SUS_SEMINARAS.CantAmbientes(id_cant_ambientes), 
    FOREIGN KEY (tipo_de_inmueble_id) REFERENCES ANDY_Y_SUS_SEMINARAS.TipoDeInmueble(id_tipo_de_inmueble),
    FOREIGN KEY (direccion_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Direccion(id_direccion),
    FOREIGN KEY (disposicion_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Disposicion(id_disposicion),
    FOREIGN KEY (orientacion_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Orientacion(id_orientacion),
    FOREIGN KEY (estado_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Estado(id_estado)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Persona
(
    id_persona INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100),
    apellido NVARCHAR(100),
    dni NVARCHAR(100),
    telefono NVARCHAR(100),
    mail NVARCHAR(100),
    fecha_registro DATETIME,
    fecha_nacimiento DATETIME
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Propietario
(
    id_propietario INT PRIMARY KEY IDENTITY(1,1),
    persona_id INT,
    FOREIGN KEY (persona_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Persona(id_persona)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.PropietarioDeInmueble
(
    id_propietario_de_inmueble INT PRIMARY KEY IDENTITY(1,1),
    propietario_id INT,
    inmueble_id INT,
    FOREIGN KEY (propietario_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Propietario(id_propietario),
    FOREIGN KEY (inmueble_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Inmueble(nro_inmueble)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Caracteristica
(
    id_caracteristica INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.InmuebleCaracteristica
(
    id INT PRIMARY KEY IDENTITY(1,1),
    inmueble_id INT,
    caracteristica_id INT,
    valor BIT,
    FOREIGN KEY (inmueble_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Inmueble(nro_inmueble),
    FOREIGN KEY (caracteristica_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Caracteristica(id_caracteristica)
);


CREATE TABLE ANDY_Y_SUS_SEMINARAS.Sucursal
(
    codigo_sucursal NUMERIC PRIMARY KEY,
    direccion_id INT,
    nombre NVARCHAR(100),
    telefono NVARCHAR(100),
    FOREIGN KEY (direccion_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Direccion(id_direccion)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Agente
(
    id_agente INT PRIMARY KEY IDENTITY(1,1),
    persona_id INT,
    sucursal_id NUMERIC,
    FOREIGN KEY (sucursal_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Sucursal(codigo_sucursal),
    FOREIGN KEY (persona_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Persona(id_persona)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Inquilino
(
    id_inquilino INT PRIMARY KEY IDENTITY(1,1),
    persona_id INT,
    FOREIGN KEY (persona_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Persona(id_persona)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Comprador
(
    id_comprador INT PRIMARY KEY IDENTITY(1,1),
    persona_id INT,
    FOREIGN KEY (persona_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Persona(id_persona)
);


CREATE TABLE ANDY_Y_SUS_SEMINARAS.TipoOperacion
(
    id_tipo_operacion INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100),
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.TipoDeMoneda
(
    id_moneda INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100) UNIQUE
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.TipoPeriodo
(
    id_tipo_periodo INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.EstadoAnuncio
(
    id_estado INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Anuncio
(
    nro_anuncio INT PRIMARY KEY,
    fecha_publicacion DATETIME,
    tipo_operacion_id INT,
    inmueble_id INT,
    precio_publicado NUMERIC,
    moneda_id INT,
    tipo_periodo_id INT,
    estado_anuncio_id INT,
    fecha_finalizacion DATETIME,
    costo_publicacion NUMERIC,
    agente_id INT,
    FOREIGN KEY (tipo_operacion_id) REFERENCES ANDY_Y_SUS_SEMINARAS.TipoOperacion(id_tipo_operacion),
    FOREIGN KEY (inmueble_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Inmueble(nro_inmueble),
    FOREIGN KEY (moneda_id) REFERENCES ANDY_Y_SUS_SEMINARAS.TipoDeMoneda(id_moneda),
    FOREIGN KEY (tipo_periodo_id) REFERENCES ANDY_Y_SUS_SEMINARAS.TipoPeriodo(id_tipo_periodo),
    FOREIGN KEY (estado_anuncio_id) REFERENCES ANDY_Y_SUS_SEMINARAS.EstadoAnuncio(id_estado),
    FOREIGN KEY (agente_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Agente(id_agente)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Duracion
(
    id_duracion INT PRIMARY KEY IDENTITY(1,1),
    tipo_periodo_id INT,
    cantidad NUMERIC,
    FOREIGN KEY (tipo_periodo_id) REFERENCES ANDY_Y_SUS_SEMINARAS.TipoPeriodo(id_tipo_periodo)
);


CREATE TABLE ANDY_Y_SUS_SEMINARAS.EstadoAlquiler
(
    id_estado_alquiler INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100)
);


CREATE TABLE ANDY_Y_SUS_SEMINARAS.Alquiler
(
    id_alquiler INT PRIMARY KEY,
    anuncio_id INT,
    inquilino_id INT,
    duracion_id INT,
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    detalle_importe_id INT,
    deposito NUMERIC(18, 2),
    comision NUMERIC(18, 2),
    gastos_averiguaciones NUMERIC(18, 2),
    estado_alquiler_id INT,
    FOREIGN KEY (anuncio_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Anuncio(nro_anuncio),
    FOREIGN KEY (inquilino_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Inquilino(id_inquilino),
    FOREIGN KEY (estado_alquiler_id) REFERENCES ANDY_Y_SUS_SEMINARAS.EstadoAlquiler(id_estado_alquiler),
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.DetalleImporte
(
    id_detalle_importe INT PRIMARY KEY IDENTITY(1,1),
    nro_periodo_inicio NUMERIC,
    nro_periodo_fin NUMERIC,
    precio NUMERIC(18,2),
    alquiler_id INT,
    FOREIGN KEY (alquiler_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Alquiler(id_alquiler)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.MedioPago
(
    id_medio_pago INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.PagoAlquiler
(
    id_pago_alquiler INT PRIMARY KEY,
    alquiler_id INT,
    fecha_pago DATETIME,
    nro_periodo_pago NUMERIC,
    fecha_inicio_periodo DATETIME,
    fecha_fin_periodo DATETIME,
    importe NUMERIC,
    medioPago_id INT,
    descripcion_periodo NVARCHAR(100),
    fecha_vencimiento DATETIME,
    FOREIGN KEY (alquiler_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Alquiler(id_alquiler),
    FOREIGN KEY (medioPago_id) REFERENCES ANDY_Y_SUS_SEMINARAS.MedioPago(id_medio_pago)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.PagoVenta
(
    id_pago_venta INT PRIMARY KEY IDENTITY(1,1),
    importe NUMERIC(18, 2),
    cotizacion NUMERIC(18, 2),
    medio_de_pago_id INT,
    moneda_del_pago_id INT,
    FOREIGN KEY (moneda_del_pago_id) REFERENCES ANDY_Y_SUS_SEMINARAS.TipoDeMoneda(id_moneda),
    FOREIGN KEY (medio_de_pago_id) REFERENCES ANDY_Y_SUS_SEMINARAS.MedioPago(id_medio_pago)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Venta
(
    id_venta INT PRIMARY KEY,
    anuncio_id INT,
    comprador_id INT,
    fecha_venta DATETIME,
    precio_venta NUMERIC(18, 2),
    moneda_id INT,
    pago_venta_id INT,
    comision NUMERIC(18, 2),

    FOREIGN KEY (anuncio_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Anuncio(nro_anuncio),
    FOREIGN KEY (comprador_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Comprador(id_comprador),
    FOREIGN KEY (moneda_id) REFERENCES ANDY_Y_SUS_SEMINARAS.TipoDeMoneda(id_moneda),
    FOREIGN KEY (pago_venta_id) REFERENCES ANDY_Y_SUS_SEMINARAS.PagoVenta(id_pago_venta),
);
GO


CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_tipificado
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


CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_tipificados
AS
BEGIN

    EXEC ANDY_Y_SUS_SEMINARAS.migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.Disposicion', 'INMUEBLE_DISPOSICION'
    EXEC ANDY_Y_SUS_SEMINARAS.migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.Orientacion', 'INMUEBLE_ORIENTACION'
    EXEC ANDY_Y_SUS_SEMINARAS.migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.EstadoAlquiler', 'ALQUILER_ESTADO'
    EXEC ANDY_Y_SUS_SEMINARAS.migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.EstadoAnuncio', 'ANUNCIO_ESTADO'
    EXEC ANDY_Y_SUS_SEMINARAS.migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.TipoDeMoneda', 'PAGO_VENTA_MONEDA'
    EXEC ANDY_Y_SUS_SEMINARAS.migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.TipoDeMoneda', 'VENTA_MONEDA'
    EXEC ANDY_Y_SUS_SEMINARAS.migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.TipoDeMoneda', 'ANUNCIO_MONEDA'
    EXEC ANDY_Y_SUS_SEMINARAS.migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.TipoOperacion', 'ANUNCIO_TIPO_OPERACION'
    EXEC ANDY_Y_SUS_SEMINARAS.migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.TipoDeInmueble', 'INMUEBLE_TIPO_INMUEBLE'
    EXEC ANDY_Y_SUS_SEMINARAS.migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.TipoPeriodo', 'ANUNCIO_TIPO_PERIODO'
    EXEC ANDY_Y_SUS_SEMINARAS.migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.MedioPago', 'PAGO_ALQUILER_MEDIO_PAGO'
    EXEC ANDY_Y_SUS_SEMINARAS.migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.MedioPago', 'PAGO_VENTA_MEDIO_PAGO'
    EXEC ANDY_Y_SUS_SEMINARAS.migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.Estado', 'INMUEBLE_ESTADO'
    EXEC ANDY_Y_SUS_SEMINARAS.migrar_tipificado 'ANDY_Y_SUS_SEMINARAS.CantAmbientes', 'INMUEBLE_CANT_AMBIENTES'
END
GO 


CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_carateristicas
AS
BEGIN
   INSERT INTO ANDY_Y_SUS_SEMINARAS.Caracteristica (nombre)
    VALUES ('cable'), ('calefaccion'), ('gas'), ('wifi');
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_caracteristica_inmueble
AS 
BEGIN
    INSERT INTO  ANDY_Y_SUS_SEMINARAS.InmuebleCaracteristica (inmueble_id, caracteristica_id, valor)
    SELECT DISTINCT
        i.nro_inmueble,
        c.id_caracteristica,
        m.INMUEBLE_CARACTERISTICA_CABLE
    FROM gd_esquema.Maestra AS m
    JOIN ANDY_Y_SUS_SEMINARAS.Inmueble AS i ON m.INMUEBLE_CODIGO = i.nro_inmueble
    JOIN ANDY_Y_SUS_SEMINARAS.Caracteristica AS c ON c.nombre = 'cable';

    INSERT INTO ANDY_Y_SUS_SEMINARAS.InmuebleCaracteristica (inmueble_id, caracteristica_id, valor)
    SELECT DISTINCT
        i.nro_inmueble,
        c.id_caracteristica,
        m.INMUEBLE_CARACTERISTICA_CALEFACCION
    FROM gd_esquema.Maestra AS m
    JOIN ANDY_Y_SUS_SEMINARAS.Inmueble AS i ON m.INMUEBLE_CODIGO = i.nro_inmueble
    JOIN ANDY_Y_SUS_SEMINARAS.Caracteristica AS c ON c.nombre = 'calefaccion';

    INSERT INTO ANDY_Y_SUS_SEMINARAS.InmuebleCaracteristica (inmueble_id, caracteristica_id, valor)
    SELECT DISTINCT
        i.nro_inmueble,
        c.id_caracteristica,
        m.INMUEBLE_CARACTERISTICA_GAS
    FROM gd_esquema.Maestra AS m
    JOIN ANDY_Y_SUS_SEMINARAS.Inmueble AS i ON m.INMUEBLE_CODIGO = i.nro_inmueble
    JOIN ANDY_Y_SUS_SEMINARAS.Caracteristica AS c ON c.nombre = 'gas';

    INSERT INTO ANDY_Y_SUS_SEMINARAS.InmuebleCaracteristica (inmueble_id, caracteristica_id, valor)
    SELECT DISTINCT
        i.nro_inmueble,
        c.id_caracteristica,
        m.INMUEBLE_CARACTERISTICA_WIFI
    FROM gd_esquema.Maestra AS m
    JOIN ANDY_Y_SUS_SEMINARAS.Inmueble AS i ON m.INMUEBLE_CODIGO = i.nro_inmueble
    JOIN ANDY_Y_SUS_SEMINARAS.Caracteristica AS c ON c.nombre = 'wifi';
END 
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_provincias
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

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_localidad
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Localidad
        (nombre, provincia_id)
    (SELECT DISTINCT 
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
    WHERE SUCURSAL_LOCALIDAD IS NOT NULL)
END
GO



CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_barrios
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Barrio
        (nombre, localidad_id)
      SELECT DISTINCT
        INMUEBLE_BARRIO,
        l.id_localidad
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.Provincia p ON m.INMUEBLE_PROVINCIA = p.nombre
	JOIN ANDY_Y_SUS_SEMINARAS.Localidad l ON m.INMUEBLE_LOCALIDAD = l.nombre AND p.id_provincia = l.provincia_id 
    WHERE INMUEBLE_BARRIO IS NOT NULL
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_direccion
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Direccion
        (calle, barrio_id)
    SELECT DISTINCT
        INMUEBLE_DIRECCION,
        b.id_barrio
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.Provincia p ON m.INMUEBLE_PROVINCIA = p.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.Localidad l ON m.INMUEBLE_LOCALIDAD = l.nombre AND p.id_provincia = l.provincia_id
    JOIN ANDY_Y_SUS_SEMINARAS.Barrio b ON m.INMUEBLE_BARRIO = b.nombre AND l.id_localidad = b.localidad_id
    WHERE INMUEBLE_DIRECCION IS NOT NULL
    UNION
    SELECT DISTINCT
        SUCURSAL_DIRECCION,
        null as barrio
    FROM gd_esquema.Maestra m
    WHERE SUCURSAL_DIRECCION IS NOT NULL
END
GO



CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_sucursal
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Sucursal (codigo_sucursal, direccion_id, nombre, telefono)
    SELECT DISTINCT
        SUCURSAL_CODIGO,
        d.id_direccion,
        SUCURSAL_NOMBRE,
        SUCURSAL_TELEFONO
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.Direccion d ON m.SUCURSAL_DIRECCION = d.calle AND d.barrio_id IS NULL
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_inquilinos 
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


CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_agentes
AS
BEGIN 
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Persona (nombre, apellido, dni, fecha_registro, telefono, mail, fecha_nacimiento)
    SELECT DISTINCT AGENTE_NOMBRE, AGENTE_APELLIDO, AGENTE_DNI, AGENTE_FECHA_REGISTRO, AGENTE_TELEFONO, AGENTE_MAIL, AGENTE_FECHA_NAC
    FROM gd_esquema.Maestra
    WHERE AGENTE_NOMBRE IS NOT NULL

    INSERT INTO ANDY_Y_SUS_SEMINARAS.Agente (persona_id, sucursal_id)
    SELECT DISTINCT p.id_persona, SUCURSAL_CODIGO
    FROM gd_esquema.Maestra m 
    JOIN ANDY_Y_SUS_SEMINARAS.Persona p ON m.AGENTE_DNI = p.dni AND m.AGENTE_MAIL = p.mail
END
GO



CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_propietarios
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

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_compradores
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

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_inmueble
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Inmueble (nro_inmueble,tipo_de_inmueble_id, descripcion, direccion_id, cantAmbientes_id, superficie_total, disposicion_id, orientacion_id, estado_id, antiguedad, expensas)
    SELECT DISTINCT
        INMUEBLE_CODIGO,
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
    JOIN ANDY_Y_SUS_SEMINARAS.Barrio b ON m.INMUEBLE_BARRIO = b.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.Direccion d ON m.INMUEBLE_DIRECCION = d.calle AND b.id_barrio = d.barrio_id 
    JOIN ANDY_Y_SUS_SEMINARAS.Disposicion dis ON m.INMUEBLE_DISPOSICION = dis.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.Orientacion ori ON m.INMUEBLE_ORIENTACION = ori.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.Estado e ON m.INMUEBLE_ESTADO = e.nombre
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_anuncio
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
        tp.id_tipo_periodo,
        e.id_estado,
        ANUNCIO_FECHA_FINALIZACION,
        ANUNCIO_COSTO_ANUNCIO
    FROM gd_esquema.Maestra em
    JOIN ANDY_Y_SUS_SEMINARAS.TipoOperacion t ON em.ANUNCIO_TIPO_OPERACION = t.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.Persona p ON em.AGENTE_DNI = p.dni AND em.AGENTE_MAIL = p.mail
    JOIN ANDY_Y_SUS_SEMINARAS.Agente a ON a.persona_id = p.id_persona
    JOIN ANDY_Y_SUS_SEMINARAS.Inmueble i ON em.INMUEBLE_CODIGO = i.nro_inmueble 
    JOIN ANDY_Y_SUS_SEMINARAS.TipoDeMoneda m ON em.ANUNCIO_MONEDA = m.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.TipoPeriodo tp ON em.ANUNCIO_TIPO_PERIODO = tp.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.EstadoAnuncio e ON em.ANUNCIO_ESTADO = e.nombre
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_propietario_inmueble
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.PropietarioDeInmueble (propietario_id, inmueble_id)
    SELECT DISTINCT
        pr.id_propietario,
        i.nro_inmueble
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.Persona p ON m.PROPIETARIO_DNI = p.dni AND m.PROPIETARIO_MAIL = p.mail
    JOIN ANDY_Y_SUS_SEMINARAS.Propietario pr ON pr.persona_id = p.id_persona
    JOIN ANDY_Y_SUS_SEMINARAS.Inmueble i ON m.INMUEBLE_CODIGO = i.nro_inmueble
END
GO


CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_alquiler
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Alquiler (id_alquiler, fecha_inicio, fecha_fin, inquilino_id, estado_alquiler_id, duracion_id, deposito, comision, gastos_averiguaciones, anuncio_id)
    SELECT DISTINCT
        em.ALQUILER_CODIGO,
        em.ALQUILER_FECHA_INICIO,
        em.ALQUILER_FECHA_FIN,
        inq.id_inquilino,
        e.id_estado_alquiler,
        em.ALQUILER_CANT_PERIODOS,
        em.ALQUILER_DEPOSITO,
        em.ALQUILER_COMISION,
        em.ALQUILER_GASTOS_AVERIGUA,
        a.nro_anuncio
    FROM gd_esquema.Maestra em
    JOIN ANDY_Y_SUS_SEMINARAS.Persona p ON em.INQUILINO_DNI = p.dni AND em.INQUILINO_MAIL = p.mail
    JOIN ANDY_Y_SUS_SEMINARAS.Inquilino inq ON inq.persona_id =  p.id_persona
    JOIN ANDY_Y_SUS_SEMINARAS.TipoPeriodo t ON em.ANUNCIO_TIPO_PERIODO = t.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.EstadoAlquiler e ON em.ALQUILER_ESTADO = e.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.Anuncio a ON em.ANUNCIO_CODIGO = a.nro_anuncio
END
GO


CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_detalle_importe
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.DetalleImporte (nro_periodo_inicio, nro_periodo_fin, precio, alquiler_id)
    SELECT DISTINCT
        DETALLE_ALQ_NRO_PERIODO_INI,
        DETALLE_ALQ_NRO_PERIODO_FIN,
        DETALLE_ALQ_PRECIO,
        alq.id_alquiler
    FROM gd_esquema.Maestra em
    JOIN ANDY_Y_SUS_SEMINARAS.Alquiler alq ON em.ALQUILER_CODIGO = alq.id_alquiler
    WHERE DETALLE_ALQ_NRO_PERIODO_INI IS NOT NULL
    AND DETALLE_ALQ_NRO_PERIODO_FIN IS NOT NULL
END
GO




CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_pago_alquiler
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.PagoAlquiler (id_pago_alquiler, alquiler_id, fecha_pago, nro_periodo_pago, descripcion_periodo, fecha_inicio_periodo, fecha_fin_periodo, importe, medioPago_id, fecha_vencimiento)
    SELECT DISTINCT
        PAGO_ALQUILER_CODIGO,
        a.id_alquiler,
        PAGO_ALQUILER_FECHA,
        PAGO_ALQUILER_NRO_PERIODO,
        PAGO_ALQUILER_DESC,
        PAGO_ALQUILER_FEC_INI,
        PAGO_ALQUILER_FEC_FIN,
        PAGO_ALQUILER_IMPORTE,
        mp.id_medio_pago,
        PAGO_ALQUILER_FECHA_VENCIMIENTO
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.Alquiler a ON m.ALQUILER_CODIGO = a.id_alquiler 
    JOIN ANDY_Y_SUS_SEMINARAS.MedioPago mp ON m.PAGO_ALQUILER_MEDIO_PAGO = mp.nombre 
END
GO


CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_pago_venta
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


CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_venta
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.Venta (id_venta, anuncio_id, comprador_id, fecha_venta, precio_venta, moneda_id, pago_venta_id, comision)
    
	SELECT DISTINCT
		VENTA_CODIGO,
        v.nro_anuncio,
        c.id_comprador,
        VENTA_FECHA,
        VENTA_PRECIO_VENTA,
        tm.id_moneda,
        pv.id_pago_venta,
        VENTA_COMISION
    FROM gd_esquema.Maestra m
    JOIN ANDY_Y_SUS_SEMINARAS.Anuncio v ON m.ANUNCIO_CODIGO = v.nro_anuncio
    JOIN ANDY_Y_SUS_SEMINARAS.Persona p ON m.COMPRADOR_DNI = p.dni AND m.COMPRADOR_MAIL = p.mail
    JOIN ANDY_Y_SUS_SEMINARAS.Comprador c ON c.persona_id = p.id_persona
    JOIN ANDY_Y_SUS_SEMINARAS.TipoDeMoneda tm ON m.VENTA_MONEDA = tm.nombre
	JOIN ANDY_Y_SUS_SEMINARAS.MedioPago mp on PAGO_VENTA_MEDIO_PAGO = mp.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.PagoVenta pv ON m.PAGO_VENTA_IMPORTE = pv.importe 
	AND m.PAGO_VENTA_COTIZACION = pv.cotizacion 
	AND mp.id_medio_pago = pv.medio_de_pago_id 
	AND tm.id_moneda = pv.moneda_del_pago_id 
END
GO


EXEC ANDY_Y_SUS_SEMINARAS.migrar_provincias;
EXEC ANDY_Y_SUS_SEMINARAS.migrar_localidad;
EXEC ANDY_Y_SUS_SEMINARAS.migrar_barrios;
EXEC ANDY_Y_SUS_SEMINARAS.migrar_direccion;
EXEC ANDY_Y_SUS_SEMINARAS.migrar_sucursal;

EXEC ANDY_Y_SUS_SEMINARAS.migrar_tipificados;

EXEC ANDY_Y_SUS_SEMINARAS.migrar_carateristicas;

EXEC ANDY_Y_SUS_SEMINARAS.migrar_inquilinos;
EXEC ANDY_Y_SUS_SEMINARAS.migrar_agentes;
EXEC ANDY_Y_SUS_SEMINARAS.migrar_propietarios;
EXEC ANDY_Y_SUS_SEMINARAS.migrar_compradores;

EXEC ANDY_Y_SUS_SEMINARAS.migrar_inmueble;
EXEC ANDY_Y_SUS_SEMINARAS.migrar_caracteristica_inmueble;
EXEC ANDY_Y_SUS_SEMINARAS.migrar_propietario_inmueble;

EXEC ANDY_Y_SUS_SEMINARAS.migrar_anuncio;

EXEC ANDY_Y_SUS_SEMINARAS.migrar_alquiler;
EXEC ANDY_Y_SUS_SEMINARAS.migrar_detalle_importe;
EXEC ANDY_Y_SUS_SEMINARAS.migrar_pago_alquiler;

EXEC ANDY_Y_SUS_SEMINARAS.migrar_pago_venta;
EXEC ANDY_Y_SUS_SEMINARAS.migrar_venta;


-- DROP TABLE ANDY_Y_SUS_SEMINARAS.PagoAlquiler;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.PagoVenta;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.MedioPago;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Alquiler;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.EstadoAlquiler;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.DetalleImporte;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Duracion;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Anuncio;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.EstadoAnuncio;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.TipoPeriodo;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.TipoDeMoneda;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.TipoOperacion;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Comprador;


-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Inquilino;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Agente;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Propietario;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Persona;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Estado;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Orientacion;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Disposicion;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Caracteristica;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.CantAmbientes;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.InmuebleCaracteristica;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Inmueble;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.PropietarioDeInmueble;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.TipoDeInmueble;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Direccion;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Barrio;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Localidad;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Provincia;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Venta;
-- DROP TABLE ANDY_Y_SUS_SEMINARAS.Sucursal;


-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_tipificado;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_tipificados;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_carateristica;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_inquilinos;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_agentes;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_propietarios;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_compradores;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_provincias;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_localidad;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_barrios;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_direccion;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_inmueble;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_sucursal;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_anuncio;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_propietario_inmueble;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_tipo_periodo;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_duracion;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_pago_venta;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_detalle_importe;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_alquiler;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_pago_alquiler;
-- DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.migrar_venta;

-- DROP SCHEMA ANDY_Y_SUS_SEMINARAS;