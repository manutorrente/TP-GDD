-- Creación de tablas de dimensiones
CREATE TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo (
    id_tiempo numeric PRIMARY KEY IDENTITY(1,1),
    anio numeric,
    cuatrimestre numeric,
    mes numeric
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion (
    id_ubicacion numeric PRIMARY KEY IDENTITY(1,1),
    provincia nvarchar(100), 
    localidad nvarchar(100), 
    barrio NVARCHAR(100)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_sucursal (
    nombre nvarchar(100),
    codigo_sucursal numeric PRIMARY KEY
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario (
    id_rango_etario numeric PRIMARY KEY IDENTITY(1,1),
    rango_inicio numeric,
    rango_fin numeric
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble (
    id_tipo_inmueble numeric PRIMARY KEY IDENTITY(1,1),
    nombre nvarchar(100)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_ambientes (
    id_ambientes numeric PRIMARY KEY IDENTITY(1,1),
    ambientes NVARCHAR(100)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_rango_m2 (
    id_rango_m2 numeric PRIMARY KEY IDENTITY(1,1),
    rango_inicio numeric,
    rango_fin numeric
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_operacion (
    id_tipo_operacion numeric PRIMARY KEY IDENTITY(1,1),
    nombre nvarchar(100)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_moneda (
    id_tipo_moneda numeric PRIMARY KEY IDENTITY(1,1),
    nombre nvarchar(100)
);

-- Creación de tablas de hechos
CREATE TABLE ANDY_Y_SUS_SEMINARAS.BI_hecho_anuncio (
    tiempo numeric, 
    ubicacion numeric, 
    sucursal numeric, 
    rango_etario_agentes numeric, 
    tipo_inmueble numeric, 
    ambientes numeric, 
    rango_m2 numeric, 
    tipo_operacion numeric, 
    tipo_moneda numeric, 
    promedio_tiempo_publicado numeric,
    precio_promedio numeric,
    cant_anuncios numeric,
    cant_operaciones_concretadas numeric,
    monto_total_operaciones_concretadas numeric,
    promedio_comision numeric,
    FOREIGN KEY (tiempo) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo(id_tiempo),
    FOREIGN KEY (ubicacion) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion(id_ubicacion),
    FOREIGN KEY (sucursal) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_sucursal(codigo_sucursal),
    FOREIGN KEY (rango_etario_agentes) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario(id_rango_etario),
    FOREIGN KEY (tipo_inmueble) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble(id_tipo_inmueble),
    FOREIGN KEY (ambientes) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_ambientes(id_ambientes),
    FOREIGN KEY (rango_m2) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_m2(id_rango_m2),
    FOREIGN KEY (tipo_operacion) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_operacion(id_tipo_operacion),
    FOREIGN KEY (tipo_moneda) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_moneda(id_tipo_moneda),
    CONSTRAINT PK_BI_hecho_anuncio PRIMARY KEY (tiempo, ubicacion, sucursal, rango_etario_agentes, tipo_inmueble, ambientes, rango_m2, tipo_operacion, tipo_moneda)
);


CREATE TABLE ANDY_Y_SUS_SEMINARAS.BI_hecho_alquiler (
    tiempo numeric, 
    ubicacion numeric, 
    sucursal numeric, 
    rango_etario_inquilinos numeric, 
    rango_etario_agentes numeric, 
    tipo_inmueble numeric, 
    ambientes numeric, 
    rango_m2 numeric, 
    tipo_moneda numeric, 
    cant_alquileres numeric,
    porcentaje_incumplimiento_pagos numeric,
    cantPagos numeric,
    FOREIGN KEY (tiempo) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo(id_tiempo),
    FOREIGN KEY (ubicacion) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion(id_ubicacion),
    FOREIGN KEY (sucursal) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_sucursal(codigo_sucursal),
    FOREIGN KEY (rango_etario_inquilinos) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario(id_rango_etario),
    FOREIGN KEY (rango_etario_agentes) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario(id_rango_etario),
    FOREIGN KEY (tipo_inmueble) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble(id_tipo_inmueble),
    FOREIGN KEY (ambientes) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_ambientes(id_ambientes),
    FOREIGN KEY (rango_m2) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_m2(id_rango_m2),
    FOREIGN KEY (tipo_moneda) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_moneda(id_tipo_moneda),
    CONSTRAINT PK_BI_hecho_alquiler PRIMARY KEY (tiempo, ubicacion, sucursal, rango_etario_inquilinos, rango_etario_agentes, tipo_inmueble, ambientes, rango_m2, tipo_moneda)
);


CREATE TABLE ANDY_Y_SUS_SEMINARAS.BI_hecho_venta (
    tiempo numeric, 
    ubicacion numeric, 
    sucursal numeric, 
    rango_etario_agentes numeric, 
    rango_etario_compradores numeric, 
    tipo_inmueble numeric, 
    ambientes numeric, 
    rango_m2 numeric, 
    tipo_moneda numeric, 
    cant_ventas numeric,
    precio_promedio_por_m2 numeric,
    FOREIGN KEY (tiempo) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo(id_tiempo),
    FOREIGN KEY (ubicacion) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion(id_ubicacion),
    FOREIGN KEY (sucursal) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_sucursal(codigo_sucursal),
    FOREIGN KEY (rango_etario_agentes) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario(id_rango_etario),
    FOREIGN KEY (rango_etario_compradores) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario(id_rango_etario),
    FOREIGN KEY (tipo_inmueble) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble(id_tipo_inmueble),
    FOREIGN KEY (ambientes) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_ambientes(id_ambientes),
    FOREIGN KEY (rango_m2) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_m2(id_rango_m2),
    FOREIGN KEY (tipo_moneda) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_moneda(id_tipo_moneda),
    CONSTRAINT PK_BI_hecho_venta PRIMARY KEY (tiempo, ubicacion, sucursal, rango_etario_agentes, rango_etario_compradores, tipo_inmueble, ambientes, rango_m2, tipo_moneda)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.BI_hecho_pago_alquiler (
    tiempo numeric, 
    promedio_aumento numeric,
    cant_pagos numeric,
    FOREIGN KEY (tiempo) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo(id_tiempo),
    CONSTRAINT PK_BI_hecho_pago_alquiler PRIMARY KEY (tiempo)

)


GO



-- Funcion Auxiliar para dimensiones
CREATE FUNCTION ANDY_Y_SUS_SEMINARAS.CUATRIMESTRE
(
    @fecha DATETIME
)
RETURNS INT
AS
BEGIN
    DECLARE @mes INT;
    DECLARE @cuatrimestre INT;

    SET @mes = MONTH(@fecha);

    SET @cuatrimestre = 
        CASE 
            WHEN @mes BETWEEN 1 AND 4 THEN 1
            WHEN @mes BETWEEN 5 AND 8 THEN 2
            WHEN @mes BETWEEN 9 AND 12 THEN 3
            ELSE 0  
        END;

    RETURN @cuatrimestre;
END
GO


-- Migracion de dimensiones
CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionSucursal
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_dim_sucursal (nombre, codigo_sucursal)
    SELECT DISTINCT nombre, codigo_sucursal FROM ANDY_Y_SUS_SEMINARAS.Sucursal
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionTiempo
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo (anio, mes, cuatrimestre)
    SELECT DISTINCT YEAR(fecha_publicacion), MONTH(fecha_publicacion), ANDY_Y_SUS_SEMINARAS.CUATRIMESTRE(fecha_publicacion) FROM ANDY_Y_SUS_SEMINARAS.Anuncio
    UNION 
    SELECT DISTINCT YEAR(fecha_finalizacion), MONTH(fecha_finalizacion), ANDY_Y_SUS_SEMINARAS.CUATRIMESTRE(fecha_finalizacion) FROM ANDY_Y_SUS_SEMINARAS.Anuncio
    UNION
    SELECT DISTINCT YEAR(fecha_inicio), MONTH(fecha_inicio), ANDY_Y_SUS_SEMINARAS.CUATRIMESTRE(fecha_inicio) FROM ANDY_Y_SUS_SEMINARAS.Alquiler
    UNION
    SELECT DISTINCT YEAR(fecha_fin), MONTH(fecha_fin), ANDY_Y_SUS_SEMINARAS.CUATRIMESTRE(fecha_fin) FROM ANDY_Y_SUS_SEMINARAS.Alquiler
    UNION
    SELECT DISTINCT YEAR(fecha_venta), MONTH(fecha_venta), ANDY_Y_SUS_SEMINARAS.CUATRIMESTRE(fecha_venta) FROM ANDY_Y_SUS_SEMINARAS.Venta
    UNION   
    SELECT DISTINCT YEAR(fecha_pago), MONTH(fecha_pago), ANDY_Y_SUS_SEMINARAS.CUATRIMESTRE(fecha_pago) FROM ANDY_Y_SUS_SEMINARAS.PagoAlquiler
    UNION
    SELECT DISTINCT YEAR(fecha_inicio_periodo), MONTH(fecha_inicio_periodo), ANDY_Y_SUS_SEMINARAS.CUATRIMESTRE(fecha_inicio_periodo) FROM ANDY_Y_SUS_SEMINARAS.PagoAlquiler
    UNION
    SELECT DISTINCT YEAR(fecha_fin_periodo), MONTH(fecha_fin_periodo), ANDY_Y_SUS_SEMINARAS.CUATRIMESTRE(fecha_fin_periodo) FROM ANDY_Y_SUS_SEMINARAS.PagoAlquiler
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionRangoEtario
AS
BEGIN 
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario (rango_inicio, rango_fin)
    VALUES (0, 25);
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario (rango_inicio, rango_fin)
    VALUES (25, 35);
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario (rango_inicio, rango_fin)
    VALUES (35, 50);
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario (rango_inicio, rango_fin)
    VALUES (50, 100);
END
GO


CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.MigracionRangoMetrosCuadrados
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_dim_rango_m2 (rango_inicio, rango_fin)
    VALUES 
        (0, 35),
        (35, 55),
        (55, 75),
        (75, 100),
        (100, 100000);
END
GO


CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionTipoMoneda 
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_moneda (nombre)
    SELECT DISTINCT nombre FROM ANDY_Y_SUS_SEMINARAS.TipoDeMoneda
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionTipoOperacion
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_operacion (nombre)
    SELECT nombre FROM ANDY_Y_SUS_SEMINARAS.TipoOperacion
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionTipoInmueble
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble (nombre)
    SELECT DISTINCT nombre FROM ANDY_Y_SUS_SEMINARAS.TipoDeInmueble
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionAmbientes
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_dim_ambientes (ambientes)
    SELECT DISTINCT nombre FROM ANDY_Y_SUS_SEMINARAS.CantAmbientes
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionUbicacion
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion (provincia, localidad, barrio)
    SELECT DISTINCT
        provincia.nombre,
        localidad.nombre,
        barrio.nombre 
    FROM ANDY_Y_SUS_SEMINARAS.Barrio barrio
    JOIN ANDY_Y_SUS_SEMINARAS.Localidad localidad ON barrio.localidad_id = localidad.id_localidad
    JOIN ANDY_Y_SUS_SEMINARAS.Provincia provincia ON localidad.provincia_id = provincia.id_provincia
END
GO 

EXEC ANDY_Y_SUS_SEMINARAS.BI_MigracionSucursal;
EXEC ANDY_Y_SUS_SEMINARAS.BI_MigracionTiempo;
EXEC ANDY_Y_SUS_SEMINARAS.BI_MigracionRangoEtario;
EXEC ANDY_Y_SUS_SEMINARAS.MigracionRangoMetrosCuadrados;
EXEC ANDY_Y_SUS_SEMINARAS.BI_MigracionTipoMoneda;
EXEC ANDY_Y_SUS_SEMINARAS.BI_MigracionTipoOperacion;
EXEC ANDY_Y_SUS_SEMINARAS.BI_MigracionTipoInmueble;
EXEC ANDY_Y_SUS_SEMINARAS.BI_MigracionAmbientes;
EXEC ANDY_Y_SUS_SEMINARAS.BI_MigracionUbicacion;
GO


-- Migracion Hechos
-- Funciones Auxiliar para Hechos
CREATE FUNCTION ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID (@fechaNacimiento DATE)
RETURNS INT
AS
BEGIN
    DECLARE @edad INT
    DECLARE @rangoEtarioID INT

    
    SET @edad = DATEDIFF(YEAR, @fechaNacimiento, GETDATE())

    
    IF @edad <= 25
        SET @rangoEtarioID = 1;
    ELSE IF @edad <= 35
        SET @rangoEtarioID = 2;
    ELSE IF @edad <= 50
        SET @rangoEtarioID = 3;
    ELSE
        SET @rangoEtarioID = 4;

    RETURN @rangoEtarioID;
END;
GO

CREATE FUNCTION ANDY_Y_SUS_SEMINARAS.ObtenerRangoM2ID (@metrosCuadrados NUMERIC)
RETURNS INT
AS
BEGIN
    DECLARE @rangoM2ID INT

   
    SELECT @rangoM2ID = id_rango_m2
    FROM ANDY_Y_SUS_SEMINARAS.BI_dim_rango_m2
    WHERE @metrosCuadrados >= rango_inicio AND @metrosCuadrados <= rango_fin;

    RETURN @rangoM2ID;
END;
GO

CREATE FUNCTION ANDY_Y_SUS_SEMINARAS.ObtenerTiempoID(@fecha DATETIME)
RETURNS INT
AS
BEGIN
    DECLARE @anio INT
    DECLARE @mes INT
    DECLARE @cuatrimestre INT
    DECLARE @id_tiempo INT

    SET @anio = YEAR(@fecha)
    SET @mes = MONTH(@fecha)
    SET @cuatrimestre = ANDY_Y_SUS_SEMINARAS.CUATRIMESTRE(@fecha)

    SELECT @id_tiempo = id_tiempo
    FROM ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo
    WHERE anio = @anio AND mes = @mes AND cuatrimestre = @cuatrimestre

    RETURN @id_tiempo
END;
GO

-- Hacia muy lento las consultas
CREATE FUNCTION ANDY_Y_SUS_SEMINARAS.ObtenerUbicacionID(@direccion INT)
RETURNS INT 
AS
BEGIN 
    DECLARE @id_ubicacion INT

    SELECT @id_ubicacion = u.id_ubicacion
    FROM ANDY_Y_SUS_SEMINARAS.Direccion direccion 
    JOIN ANDY_Y_SUS_SEMINARAS.Barrio barrio ON direccion.barrio_id = barrio.id_barrio
    JOIN ANDY_Y_SUS_SEMINARAS.Localidad localidad ON barrio.localidad_id = localidad.id_localidad
    JOIN ANDY_Y_SUS_SEMINARAS.Provincia provincia ON localidad.provincia_id = provincia.id_provincia
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion u ON provincia.nombre = u.provincia AND localidad.nombre = u.localidad AND barrio.nombre = u.barrio
    WHERE direccion.id_direccion = @direccion
    RETURN @id_ubicacion

END;
GO




CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionHechoAnuncio
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_hecho_anuncio (tiempo, ubicacion, sucursal, rango_etario_agentes, tipo_inmueble, ambientes, rango_m2, tipo_operacion, tipo_moneda, promedio_tiempo_publicado, precio_promedio, cant_anuncios, cant_operaciones_concretadas, monto_total_operaciones_concretadas, promedio_comision)
    SELECT 
    ANDY_Y_SUS_SEMINARAS.ObtenerTiempoID(a.fecha_publicacion),
    u.id_ubicacion,
    sucursal.codigo_sucursal,
    ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona.fecha_nacimiento),
    tipoInm.id_tipo_inmueble,
    inmueble.cantAmbientes_id,
    ANDY_Y_SUS_SEMINARAS.ObtenerRangoM2ID(inmueble.superficie_total),
    tipoOp.id_tipo_operacion,
    tipoMoneda.id_tipo_moneda,
    AVG(DATEDIFF(DAY, a.fecha_publicacion, a.fecha_finalizacion)) AS promedioTiempoPublicado,
    AVG(a.precio_publicado) AS precioPromedio,
    COUNT(DISTINCT a.nro_anuncio) AS cantAnuncios,
    SUM(CASE WHEN alq.id_alquiler IS NOT NULL OR v.id_venta IS NOT NULL THEN 1 ELSE 0 END) AS cantOperacionesConcretadas,
    SUM(CASE WHEN alq.id_alquiler IS NOT NULL OR v.id_venta IS NOT NULL THEN a.precio_publicado ELSE 0 END) AS montoTotalOperacionesConcretadas,
    AVG(CASE WHEN tipoOp.nombre = 'Tipo Operación Alquiler Contrato'  OR tipoOp.nombre = 'Tipo Operación Alquiler Temporario' THEN alq.comision WHEN tipoOp.nombre = 'Tipo Operación Venta' THEN v.comision ELSE 0 END) AS promedioComision
    FROM ANDY_Y_SUS_SEMINARAS.Anuncio a
    JOIN ANDY_Y_SUS_SEMINARAS.Inmueble inmueble ON a.inmueble_id = inmueble.nro_inmueble
    JOIN ANDY_Y_SUS_SEMINARAS.Agente ag ON ag.id_agente = a.agente_id
    JOIN ANDY_Y_SUS_SEMINARAS.Sucursal s ON s.codigo_sucursal = ag.sucursal_id
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_sucursal sucursal ON s.codigo_sucursal = sucursal.codigo_sucursal
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_operacion tipoOp ON a.tipo_operacion_id = tipoOp.id_tipo_operacion
    JOIN ANDY_Y_SUS_SEMINARAS.TipoDeMoneda tm ON a.moneda_id = tm.id_moneda
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_moneda tipoMoneda ON tm.nombre = tipoMoneda.nombre
    JOIN ANDY_Y_SUS_SEMINARAS.Persona persona ON ag.persona_id = persona.id_persona
    JOIN ANDY_Y_SUS_SEMINARAS.TipoDeInmueble ti ON inmueble.tipo_de_inmueble_id = ti.id_tipo_de_inmueble
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble tipoInm ON ti.id_tipo_de_inmueble = tipoInm.id_tipo_inmueble
    JOIN ANDY_Y_SUS_SEMINARAS.Direccion direccion ON inmueble.direccion_id = direccion.id_direccion
    JOIN ANDY_Y_SUS_SEMINARAS.Barrio barrio ON direccion.barrio_id = barrio.id_barrio
    JOIN ANDY_Y_SUS_SEMINARAS.Localidad localidad ON barrio.localidad_id = localidad.id_localidad
    JOIN ANDY_Y_SUS_SEMINARAS.Provincia provincia ON localidad.provincia_id = provincia.id_provincia
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion u ON provincia.nombre = u.provincia AND localidad.nombre = u.localidad AND barrio.nombre = u.barrio
    LEFT JOIN ANDY_Y_SUS_SEMINARAS.Venta v ON a.nro_anuncio = v.anuncio_id
    LEFT JOIN ANDY_Y_SUS_SEMINARAS.Alquiler alq ON alq.anuncio_id = a.nro_anuncio
    WHERE a.fecha_publicacion IS NOT NULL
    GROUP BY
        ANDY_Y_SUS_SEMINARAS.ObtenerTiempoID(a.fecha_publicacion),
        u.id_ubicacion,
        sucursal.codigo_sucursal,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona.fecha_nacimiento),
        tipoInm.id_tipo_inmueble,
        inmueble.cantAmbientes_id,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoM2ID(inmueble.superficie_total),
        tipoOp.id_tipo_operacion,
        tipoMoneda.id_tipo_moneda;
END
GO



CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionHechoAlquiler
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_hecho_alquiler (tiempo, ubicacion, sucursal, rango_etario_inquilinos, rango_etario_agentes, tipo_inmueble, ambientes, rango_m2, tipo_moneda, cant_alquileres, porcentaje_incumplimiento_pagos, cantPagos)
    SELECT DISTINCT
        -- Dimensiones
        ANDY_Y_SUS_SEMINARAS.ObtenerTiempoID(a.fecha_inicio),
        u.id_ubicacion,
        s.codigo_sucursal,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona_inquilino.fecha_nacimiento),
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona_agente.fecha_nacimiento),
        tipoInm.id_tipo_inmueble,
        inmueble.cantAmbientes_id,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoM2ID(inmueble.superficie_total),
        tipoMoneda.id_tipo_moneda,
        -- Medidas
        COUNT(DISTINCT a.id_alquiler) AS cantAlquileres,
        SUM(CASE WHEN (DATEDIFF(DAY, pa.fecha_pago, pa.fecha_vencimiento) > 0) THEN 1 ELSE 0 END) / COUNT(*) * 100 AS porcentajeIncumplimientoPagos,
        COUNT(DISTINCT pa.id_pago_alquiler) AS cantPagos
        
        --todo porcentaje de aumento
        FROM ANDY_Y_SUS_SEMINARAS.Alquiler a
        JOIN ANDY_Y_SUS_SEMINARAS.Anuncio anuncio ON a.anuncio_id = anuncio.nro_anuncio
        JOIN ANDY_Y_SUS_SEMINARAS.Inmueble inmueble ON anuncio.inmueble_id = inmueble.nro_inmueble
        JOIN ANDY_Y_SUS_SEMINARAS.Agente ag ON ag.id_agente = anuncio.agente_id
        JOIN ANDY_Y_SUS_SEMINARAS.Sucursal s ON s.codigo_sucursal = ag.sucursal_id
        JOIN ANDY_Y_SUS_SEMINARAS.TipoDeMoneda tm ON anuncio.moneda_id = tm.id_moneda
        JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_moneda tipoMoneda ON tm.nombre = tipoMoneda.nombre
        JOIN ANDY_Y_SUS_SEMINARAS.Persona persona_agente ON ag.persona_id = persona_agente.id_persona
        JOIN ANDY_Y_SUS_SEMINARAS.Inquilino inquilino ON a.inquilino_id = inquilino.id_inquilino
        JOIN ANDY_Y_SUS_SEMINARAS.Persona persona_inquilino ON inquilino.persona_id = persona_inquilino.id_persona
        JOIN ANDY_Y_SUS_SEMINARAS.TipoDeInmueble ti ON inmueble.tipo_de_inmueble_id = ti.id_tipo_de_inmueble
        JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble tipoInm ON ti.id_tipo_de_inmueble = tipoInm.id_tipo_inmueble
        JOIN ANDY_Y_SUS_SEMINARAS.EstadoAlquiler ea ON a.estado_alquiler_id = ea.id_estado_alquiler
		JOIN ANDY_Y_SUS_SEMINARAS.Direccion direccion ON inmueble.direccion_id = direccion.id_direccion
        JOIN ANDY_Y_SUS_SEMINARAS.Barrio barrio ON direccion.barrio_id = barrio.id_barrio
        JOIN ANDY_Y_SUS_SEMINARAS.Localidad localidad ON barrio.localidad_id = localidad.id_localidad
        JOIN ANDY_Y_SUS_SEMINARAS.Provincia provincia ON localidad.provincia_id = provincia.id_provincia
        JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion u ON provincia.nombre = u.provincia AND localidad.nombre = u.localidad AND barrio.nombre = u.barrio
        LEFT JOIN ANDY_Y_SUS_SEMINARAS.PagoAlquiler pa ON a.id_alquiler = pa.alquiler_id
        WHERE a.fecha_inicio IS NOT NULL
        GROUP BY
        ANDY_Y_SUS_SEMINARAS.ObtenerTiempoID(a.fecha_inicio),
        u.id_ubicacion,
        s.codigo_sucursal,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona_inquilino.fecha_nacimiento),
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona_agente.fecha_nacimiento),
        tipoInm.id_tipo_inmueble,
        inmueble.cantAmbientes_id,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoM2ID(inmueble.superficie_total),
        tipoMoneda.id_tipo_moneda
END
GO


CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionHechoPagoAlquiler
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_hecho_pago_alquiler (tiempo, promedio_aumento, cant_pagos)
    SELECT DISTINCT
        ANDY_Y_SUS_SEMINARAS.ObtenerTiempoID(pa.fecha_pago),
        SUM((pa.importe - pago_anterior.importe)/pago_anterior.importe*100)/ COUNT(*) AS promedioPorcentajeAumento,
        COUNT(*) AS cantPagos
        --todo porcentaje de aumento
        FROM ANDY_Y_SUS_SEMINARAS.Alquiler a
        JOIN ANDY_Y_SUS_SEMINARAS.EstadoAlquiler ea ON a.estado_alquiler_id = ea.id_estado_alquiler --AND ea.nombre = 'Activo'
        JOIN ANDY_Y_SUS_SEMINARAS.PagoAlquiler pa ON a.id_alquiler = pa.alquiler_id
        JOIN ANDY_Y_SUS_SEMINARAS.PagoAlquiler pago_anterior ON pago_anterior.alquiler_id = pa.alquiler_id AND YEAR(pago_anterior.fecha_pago) * 12 + MONTH(pago_anterior.fecha_pago) = YEAR(pa.fecha_pago) * 12 + MONTH(pa.fecha_pago) - 1 AND pago_anterior.importe != pa.importe
        WHERE pa.fecha_pago IS NOT NULL
        
        

        GROUP BY
        ANDY_Y_SUS_SEMINARAS.ObtenerTiempoID(pa.fecha_pago)
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionHechoVenta
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_hecho_venta (tiempo, ubicacion, sucursal, rango_etario_agentes, rango_etario_compradores, tipo_inmueble, ambientes, rango_m2, tipo_moneda, cant_ventas, precio_promedio_por_m2)
    SELECT DISTINCT
        -- Dimensiones
        ANDY_Y_SUS_SEMINARAS.ObtenerTiempoID(v.fecha_venta),
        u.id_ubicacion,
        s.codigo_sucursal,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona_agente.fecha_nacimiento),
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona_comprador.fecha_nacimiento),
        tipoInm.id_tipo_inmueble,
        inmueble.cantAmbientes_id,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoM2ID(inmueble.superficie_total),
        tipoMoneda.id_tipo_moneda,
        -- Medidas
        COUNT(DISTINCT v.id_venta) AS cantVentas,
        AVG(v.precio_venta / inmueble.superficie_total) AS precioPromedioPorM2
        FROM ANDY_Y_SUS_SEMINARAS.Venta v
        JOIN ANDY_Y_SUS_SEMINARAS.Anuncio anuncio ON v.anuncio_id = anuncio.nro_anuncio
        JOIN ANDY_Y_SUS_SEMINARAS.Agente ag ON ag.id_agente = anuncio.agente_id
        JOIN ANDY_Y_SUS_SEMINARAS.Sucursal s ON s.codigo_sucursal = ag.sucursal_id
        JOIN ANDY_Y_SUS_SEMINARAS.TipoDeMoneda tm ON anuncio.moneda_id = tm.id_moneda
        JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_moneda tipoMoneda ON tm.nombre = tipoMoneda.nombre
        JOIN ANDY_Y_SUS_SEMINARAS.Persona persona_agente ON ag.persona_id = persona_agente.id_persona
        JOIN ANDY_Y_SUS_SEMINARAS.Comprador comprador ON v.comprador_id = comprador.id_comprador
        JOIN ANDY_Y_SUS_SEMINARAS.Persona persona_comprador ON comprador.persona_id = persona_comprador.id_persona
        JOIN ANDY_Y_SUS_SEMINARAS.Inmueble inmueble ON anuncio.inmueble_id = inmueble.nro_inmueble
        JOIN ANDY_Y_SUS_SEMINARAS.TipoDeInmueble ti ON inmueble.tipo_de_inmueble_id = ti.id_tipo_de_inmueble
        JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble tipoInm ON ti.id_tipo_de_inmueble = tipoInm.id_tipo_inmueble
		JOIN ANDY_Y_SUS_SEMINARAS.Direccion direccion ON inmueble.direccion_id = direccion.id_direccion
        JOIN ANDY_Y_SUS_SEMINARAS.Barrio barrio ON direccion.barrio_id = barrio.id_barrio
        JOIN ANDY_Y_SUS_SEMINARAS.Localidad localidad ON barrio.localidad_id = localidad.id_localidad
        JOIN ANDY_Y_SUS_SEMINARAS.Provincia provincia ON localidad.provincia_id = provincia.id_provincia
        JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion u ON provincia.nombre = u.provincia AND localidad.nombre = u.localidad AND barrio.nombre = u.barrio
        WHERE v.fecha_venta IS NOT NULL
        GROUP BY
        ANDY_Y_SUS_SEMINARAS.ObtenerTiempoID(v.fecha_venta),
        u.id_ubicacion,      
        s.codigo_sucursal,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona_agente.fecha_nacimiento),
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona_comprador.fecha_nacimiento),
        tipoInm.id_tipo_inmueble,
        inmueble.cantAmbientes_id,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoM2ID(inmueble.superficie_total),
        tipoMoneda.id_tipo_moneda
END
GO


EXEC ANDY_Y_SUS_SEMINARAS.BI_MigracionHechoAnuncio;
EXEC ANDY_Y_SUS_SEMINARAS.BI_MigracionHechoAlquiler;
EXEC ANDY_Y_SUS_SEMINARAS.BI_MigracionHechoVenta;
EXEC ANDY_Y_SUS_SEMINARAS.BI_MigracionHechoPagoAlquiler;
go

--1. Duración promedio (en días) que se encuentran publicados los anuncios
-- según el tipo de operación (alquiler, venta, etc), barrio y ambientes para cada
-- cuatrimestre de cada año. Se consideran todos los anuncios que se dieron de alta
-- en ese cuatrimestre. La duración se calcula teniendo en cuenta la fecha de alta y
-- la fecha de finalización.

go
CREATE VIEW ANDY_Y_SUS_SEMINARAS.VistaDuracionPromedioAnuncios
AS
SELECT 
    t.anio,
    t.cuatrimestre,
    u.barrio,
    ambientes.ambientes,
    tipoOp.nombre AS tipoOperacion,
    SUM(a.promedio_tiempo_publicado * a.cant_anuncios) / SUM(a.cant_anuncios) AS duracionPromedio
FROM
    ANDY_Y_SUS_SEMINARAS.BI_hecho_anuncio a
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo t ON a.tiempo = t.id_tiempo
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion u ON a.ubicacion = u.id_ubicacion
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_operacion tipoOp ON a.tipo_operacion = tipoOp.id_tipo_operacion
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_ambientes ambientes ON a.ambientes = ambientes.id_ambientes
GROUP BY
    t.anio,
    t.cuatrimestre,
    u.barrio,
    ambientes.ambientes,
    tipoOp.nombre
GO



-- 2. Precio promedio de los anuncios de inmuebles según el tipo de operación
-- (alquiler, venta, etc), tipo de inmueble y rango m2 para cada cuatrimestre/año.
-- Se consideran todos los anuncios que se dieron de alta en ese cuatrimestre. El
-- precio se debe expresar en el tipo de moneda que corresponda, identificando de
-- cuál se trata.
go
CREATE VIEW ANDY_Y_SUS_SEMINARAS.VistaPrecioPromedioAnuncios
AS
SELECT 
    t.anio,
    t.cuatrimestre,
    tipoOp.nombre AS tipoOperacion,
    tipoInm.nombre AS tipoInmueble,
    rangoM2.rango_inicio,
    rangoM2.rango_fin,
    tipoMoneda.nombre AS tipoMoneda,
    SUM(a.precio_promedio * a.cant_anuncios) / SUM(a.cant_anuncios) AS precioPromedio
FROM
    ANDY_Y_SUS_SEMINARAS.BI_hecho_anuncio a
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo t ON a.tiempo = t.id_tiempo
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_operacion tipoOp ON a.tipo_operacion = tipoOp.id_tipo_operacion
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble tipoInm ON a.tipo_inmueble = tipoInm.id_tipo_inmueble
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_rango_m2 rangoM2 ON a.rango_m2 = rangoM2.id_rango_m2
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_moneda tipoMoneda ON a.tipo_moneda = tipoMoneda.id_tipo_moneda
GROUP BY
    t.anio,
    t.cuatrimestre,
    tipoOp.nombre,
    tipoInm.nombre,
    rangoM2.rango_inicio,
    rangoM2.rango_fin,
    tipoMoneda.nombre
GO
-- 3. Los 5 barrios más elegidos para alquilar en función del rango etario de los
-- inquilinos para cada cuatrimestre/año. Se calcula en función de los alquileres
-- dados de alta en dicho periodo.

CREATE VIEW ANDY_Y_SUS_SEMINARAS.VistaBarriosMasElegidosAlquilar
AS
SELECT TOP (5)
    t.anio,
    t.cuatrimestre,
    rangoEtario.rango_inicio,
    rangoEtario.rango_fin,
    u.barrio,
    COUNT(*) AS cantAlquileres
FROM
    ANDY_Y_SUS_SEMINARAS.BI_hecho_alquiler a
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo t ON a.tiempo = t.id_tiempo
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario rangoEtario ON a.rango_etario_inquilinos = rangoEtario.id_rango_etario
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion u ON a.ubicacion = u.id_ubicacion
GROUP BY
    t.anio,
    t.cuatrimestre,
    rangoEtario.rango_inicio,
    rangoEtario.rango_fin,
    u.barrio
ORDER BY
    cantAlquileres DESC
GO
-- 4. Porcentaje de incumplimiento de pagos de alquileres en término por cada
-- mes/año. Se calcula en función de las fechas de pago y fecha de vencimiento del
-- mismo. El porcentaje es en función del total de pagos en dicho periodo.

CREATE VIEW ANDY_Y_SUS_SEMINARAS.VistaPorcentajeIncumplimientoPagos
AS
SELECT 
    t.anio as anio,
    t.cuatrimestre as cuatrimestre,
    t.mes as mes,
    SUM(a.porcentaje_incumplimiento_pagos * a.cantPagos) / SUM(a.cantPagos) as porcentajeIncumplimientoPagos
FROM
    ANDY_Y_SUS_SEMINARAS.BI_hecho_alquiler a
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo t ON a.tiempo = t.id_tiempo
GROUP BY
    t.anio,
    t.cuatrimestre,
    t.mes
GO

-- 5. Porcentaje promedio de incremento del valor de los alquileres para los
-- contratos en curso por mes/año. Se calcula tomando en cuenta el último pago
-- con respecto al del mes en curso, únicamente de aquellos alquileres que hayan
-- tenido aumento y están activos.

CREATE VIEW ANDY_Y_SUS_SEMINARAS.VistaPorcentajePromedioIncrementoAlquileres
AS
SELECT 
    t.anio,
    t.cuatrimestre,
    t.mes,
    SUM(a.promedio_aumento * a.cant_pagos) / SUM(a.cant_pagos) AS porcentajePromedioIncrementoAlquileres
FROM
    ANDY_Y_SUS_SEMINARAS.BI_hecho_pago_alquiler a
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo t ON a.tiempo = t.id_tiempo
GROUP BY
    t.anio,
    t.cuatrimestre,
    t.mes
GO


-- 6. Precio promedio de m2 de la venta de inmuebles según el tipo de inmueble y
-- la localidad para cada cuatrimestre/año. Se calcula en función de las ventas
-- concretadas.


CREATE VIEW ANDY_Y_SUS_SEMINARAS.VistaPrecioPromedioM2Ventas
AS
SELECT 
    t.anio,
    t.cuatrimestre,
    tipoInm.nombre AS tipoInmueble,
    u.localidad,
    m.nombre,
    SUM(a.precio_promedio_por_m2 * a.cant_ventas)/SUM(a.cant_ventas) AS precioPromedioPorM2
FROM
    ANDY_Y_SUS_SEMINARAS.BI_hecho_venta a
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo t ON a.tiempo = t.id_tiempo
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble tipoInm ON a.tipo_inmueble = tipoInm.id_tipo_inmueble
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion u ON a.ubicacion = u.id_ubicacion
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_moneda m ON a.tipo_moneda = m.id_tipo_moneda
GROUP BY
    t.anio,
    t.cuatrimestre,
    tipoInm.nombre,
    u.localidad,
    m.nombre
GO

-- 7. Valor promedio de la comisión según el tipo de operación (alquiler, venta, etc)
-- y sucursal para cada cuatrimestre/año. Se calcula en función de los alquileres y
-- ventas concretadas dentro del periodo.

CREATE VIEW ANDY_Y_SUS_SEMINARAS.VistaValorPromedioComision
AS
SELECT 
    t.anio,
    t.cuatrimestre,
    tipoOp.nombre AS tipoOperacion,
    sucursal.nombre AS sucursal,
    SUM(a.promedio_comision * a.cant_anuncios) / SUM(a.cant_anuncios) AS valorPromedioComision
FROM
    ANDY_Y_SUS_SEMINARAS.BI_hecho_anuncio a
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo t ON a.tiempo = t.id_tiempo
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_operacion tipoOp ON a.tipo_operacion = tipoOp.id_tipo_operacion
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_sucursal sucursal ON a.sucursal = sucursal.codigo_sucursal
GROUP BY
    t.anio,
    t.cuatrimestre,
    tipoOp.nombre,
    sucursal.nombre
GO


-- 8. Porcentaje de operaciones concretadas (tanto de alquileres como ventas) por
-- cada sucursal, según el rango etario de los empleados por año en función de la
-- cantidad de anuncios publicados en ese mismo año.

CREATE VIEW ANDY_Y_SUS_SEMINARAS.VistaPorcentajeOperacionesConcretadas
AS
SELECT 
    t.anio,
    t.cuatrimestre,
    sucursal.nombre AS sucursal,
    rangoEtario.rango_inicio,
    rangoEtario.rango_fin,
    SUM(a.cant_operaciones_concretadas) / SUM(a.cant_anuncios) * 100 AS porcentajeOperacionesConcretadas
FROM
    ANDY_Y_SUS_SEMINARAS.BI_hecho_anuncio a
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo t ON a.tiempo = t.id_tiempo
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_sucursal sucursal ON a.sucursal = sucursal.codigo_sucursal
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario rangoEtario ON a.rango_etario_agentes = rangoEtario.id_rango_etario
GROUP BY
    t.anio,
    t.cuatrimestre,
    sucursal.nombre,
    rangoEtario.rango_inicio,
    rangoEtario.rango_fin
GO

-- 9. Monto total de cierre de contratos por tipo de operación (tanto de alquileres
-- como ventas) por cada cuatrimestre y sucursal, diferenciando el tipo de moneda.

CREATE VIEW ANDY_Y_SUS_SEMINARAS.BI_Vista_CierreContratos AS
SELECT
    t.anio,
    t.cuatrimestre,
    s.codigo_sucursal,
    tipoOp.nombre as operacion,
    tipoMon.nombre as moneda,
    SUM(a.monto_total_operaciones_concretadas) AS montoTotalCierreContratos
FROM
    ANDY_Y_SUS_SEMINARAS.BI_hecho_anuncio a
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_operacion tipoOp ON a.tipo_operacion = tipoOp.id_tipo_operacion
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_moneda tipoMon ON a.tipo_moneda = id_tipo_moneda
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo t ON a.tiempo = t.id_tiempo
    JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_sucursal s ON a.sucursal = s.codigo_sucursal
WHERE
    a.tiempo IS NOT NULL
GROUP BY
    t.anio,
    t.cuatrimestre,
    s.codigo_sucursal,
    tipoOp.nombre,
    tipoMon.nombre
GO

/* 


-- Eliminar vistas
DROP VIEW ANDY_Y_SUS_SEMINARAS.VistaPrecioPromedioAnuncios;
DROP VIEW ANDY_Y_SUS_SEMINARAS.VistaDuracionPromedioAnuncios;
DROP VIEW ANDY_Y_SUS_SEMINARAS.VistaBarriosMasElegidosAlquilar;
DROP VIEW ANDY_Y_SUS_SEMINARAS.VistaPorcentajeIncumplimientoPagos;
DROP VIEW ANDY_Y_SUS_SEMINARAS.VistaPorcentajePromedioIncrementoAlquileres;
DROP VIEW ANDY_Y_SUS_SEMINARAS.VistaPrecioPromedioM2Ventas;
DROP VIEW ANDY_Y_SUS_SEMINARAS.VistaValorPromedioComision;
DROP VIEW ANDY_Y_SUS_SEMINARAS.VistaPorcentajeOperacionesConcretadas; 
DROP VIEW ANDY_Y_SUS_SEMINARAS.BI_Vista_CierreContratos;





-- Eliminar procedimientos almacenados
DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionHechoAnuncio;
DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionHechoAlquiler;
DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionHechoVenta
DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionHechoPagoAlquiler;
DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionSucursal;
DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionTiempo;
DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionRangoEtario;
DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.MigracionRangoMetrosCuadrados;
DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionTipoMoneda;
DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionTipoOperacion;
DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionTipoInmueble;
DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionAmbientes;
DROP PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionUbicacion;

-- Eliminar funciones
DROP FUNCTION ANDY_Y_SUS_SEMINARAS.CUATRIMESTRE;
DROP FUNCTION ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID;
DROP FUNCTION ANDY_Y_SUS_SEMINARAS.ObtenerRangoM2ID;
DROP FUNCTION ANDY_Y_SUS_SEMINARAS.ObtenerTiempoID;
DROP FUNCTION ANDY_Y_SUS_SEMINARAS.ObtenerUbicacionID;
-- Eliminar tablas
DROP TABLE ANDY_Y_SUS_SEMINARAS.BI_hecho_anuncio;
DROP TABLE ANDY_Y_SUS_SEMINARAS.BI_hecho_alquiler;
DROP TABLE ANDY_Y_SUS_SEMINARAS.BI_hecho_venta;
DROP TABLE ANDY_Y_SUS_SEMINARAS.BI_hecho_pago_alquiler;
DROP TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo;
DROP TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion;
DROP TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_sucursal;
DROP TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario;
DROP TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble;
DROP TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_ambientes;
DROP TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_rango_m2;
DROP TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_operacion;
DROP TABLE ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_moneda;


*/