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
    id_sucursal numeric PRIMARY KEY IDENTITY(1,1),
    nombre nvarchar(100),
    codigo_sucursal numeric
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
    id_hecho_anuncio numeric PRIMARY KEY IDENTITY(1,1),
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
    FOREIGN KEY (tiempo) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo(id_tiempo),
    FOREIGN KEY (ubicacion) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion(id_ubicacion),
    FOREIGN KEY (sucursal) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_sucursal(id_sucursal),
    FOREIGN KEY (rango_etario_agentes) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario(id_rango_etario),
    FOREIGN KEY (tipo_inmueble) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble(id_tipo_inmueble),
    FOREIGN KEY (ambientes) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_ambientes(id_ambientes),
    FOREIGN KEY (rango_m2) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_m2(id_rango_m2),
    FOREIGN KEY (tipo_operacion) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_operacion(id_tipo_operacion),
    FOREIGN KEY (tipo_moneda) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_moneda(id_tipo_moneda)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.BI_hecho_alquiler (
    id_hecho_alquiler numeric PRIMARY KEY IDENTITY(1,1),
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
    promedio_comision numeric,
    FOREIGN KEY (tiempo) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo(id_tiempo),
    FOREIGN KEY (ubicacion) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion(id_ubicacion),
    FOREIGN KEY (sucursal) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_sucursal(id_sucursal),
    FOREIGN KEY (rango_etario_inquilinos) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario(id_rango_etario),
    FOREIGN KEY (rango_etario_agentes) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario(id_rango_etario),
    FOREIGN KEY (tipo_inmueble) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble(id_tipo_inmueble),
    FOREIGN KEY (ambientes) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_ambientes(id_ambientes),
    FOREIGN KEY (rango_m2) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_m2(id_rango_m2),
    FOREIGN KEY (tipo_moneda) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_moneda(id_tipo_moneda)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.BI_hecho_venta (
    id_hecho_venta numeric PRIMARY KEY IDENTITY(1,1),
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
    promedio_comision numeric,
    FOREIGN KEY (tiempo) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo(id_tiempo),
    FOREIGN KEY (ubicacion) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion(id_ubicacion),
    FOREIGN KEY (sucursal) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_sucursal(id_sucursal),
    FOREIGN KEY (rango_etario_agentes) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario(id_rango_etario),
    FOREIGN KEY (rango_etario_compradores) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_etario(id_rango_etario),
    FOREIGN KEY (tipo_inmueble) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble(id_tipo_inmueble),
    FOREIGN KEY (ambientes) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_ambientes(id_ambientes),
    FOREIGN KEY (rango_m2) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_rango_m2(id_rango_m2),
    FOREIGN KEY (tipo_moneda) REFERENCES ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_moneda(id_tipo_moneda)
);
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
            ELSE 0  -- Si el mes es inválido
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
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo (anio, cuatrimestre, mes)
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


-- MIGRACION HECHOS

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


CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionHechoAnuncio
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_hecho_anuncio (tiempo, ubicacion, sucursal, rango_etario_agentes, tipo_inmueble, ambientes, rango_m2, tipo_operacion, tipo_moneda, promedio_tiempo_publicado, precio_promedio, cant_anuncios, cant_operaciones_concretadas, monto_total_operaciones_concretadas)
    SELECT DISTINCT
        -- Dimensiones
        t.id_tiempo,
        u.id_ubicacion,
        s.codigo_sucursal,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona.fecha_nacimiento),
        tipoInm.id_tipo_inmueble,
        inmueble.cantAmbientes_id,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoM2ID(inmueble.superficie_total),
        tipoOp.id_tipo_operacion,
        tm.id_moneda,
        -- Medidas
        AVG(DATEDIFF(DAY, a.fecha_publicacion, a.fecha_finalizacion)) AS promedioTiempoPublicado,
        AVG(a.precio_publicado) AS precioPromedio,
        COUNT(*) AS cantAnuncios,
        SUM(CASE WHEN a.fecha_finalizacion IS NOT NULL THEN 1 ELSE 0 END) AS cantOperacionesConcretadas,
        SUM(CASE WHEN a.fecha_finalizacion IS NOT NULL THEN a.precio_publicado ELSE 0 END) AS montoTotalOperacionesConcretadas
        FROM ANDY_Y_SUS_SEMINARAS.Anuncio a
        JOIN ANDY_Y_SUS_SEMINARAS.Agente ag ON ag.id_agente = a.agente_id
        JOIN ANDY_Y_SUS_SEMINARAS.Sucursal s ON s.codigo_sucursal = ag.sucursal_id
        JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_operacion tipoOp ON a.tipo_operacion_id = tipoOp.id_tipo_operacion
        JOIN ANDY_Y_SUS_SEMINARAS.TipoDeMoneda tm ON a.moneda_id = tm.id_moneda
        JOIN ANDY_Y_SUS_SEMINARAS.Persona persona ON ag.persona_id = persona.id_persona
        JOIN ANDY_Y_SUS_SEMINARAS.Inmueble inmueble ON a.inmueble_id = inmueble.nro_inmueble
        JOIN ANDY_Y_SUS_SEMINARAS.TipoDeInmueble ti ON inmueble.tipo_de_inmueble_id = ti.id_tipo_de_inmueble
        JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble tipoInm ON ti.id_tipo_de_inmueble = tipoInm.id_tipo_inmueble
        JOIN ANDY_Y_SUS_SEMINARAS.Direccion direccion ON inmueble.direccion_id = direccion.id_direccion
        JOIN ANDY_Y_SUS_SEMINARAS.Barrio barrio ON direccion.barrio_id = barrio.id_barrio
        JOIN ANDY_Y_SUS_SEMINARAS.Localidad localidad ON barrio.localidad_id = localidad.id_localidad
        JOIN ANDY_Y_SUS_SEMINARAS.Provincia provincia ON localidad.provincia_id = provincia.id_provincia
        JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion u ON provincia.nombre = u.provincia AND localidad.nombre = u.localidad AND barrio.nombre = u.barrio
        JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo t ON YEAR(a.fecha_publicacion) = t.anio AND MONTH(a.fecha_publicacion) = t.mes
        WHERE a.fecha_publicacion IS NOT NULL
        GROUP BY
            -- Dimensiones
        t.id_tiempo,
        u.id_ubicacion,
        s.codigo_sucursal,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona.fecha_nacimiento),
        tipoInm.id_tipo_inmueble,
        inmueble.cantAmbientes_id,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoM2ID(inmueble.superficie_total),
        tipoOp.id_tipo_operacion,
        tm.id_moneda
END
GO


EXEC ANDY_Y_SUS_SEMINARAS.BI_MigracionHechoAnuncio;


SELECT * FROM ANDY_Y_SUS_SEMINARAS.BI_hecho_anuncio
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionHechoAlquiler
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_hecho_alquiler (tiempo, ubicacion, sucursal, rango_etario_inquilinos, rango_etario_agentes, tipo_inmueble, ambientes, rango_m2, tipo_moneda, cant_alquileres, porcentaje_incumplimiento_pagos, promedio_comision)
    SELECT DISTINCT
        -- Dimensiones
        t.id_tiempo,
        u.id_ubicacion,
        s.codigo_sucursal,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona_inquilino.fecha_nacimiento),
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona_agente.fecha_nacimiento),
        tipoInm.id_tipo_inmueble,
        inmueble.cantAmbientes_id,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoM2ID(inmueble.superficie_total),
        tm.id_moneda,
        -- Medidas
        COUNT(*) AS cantAlquileres,
        SUM(CASE WHEN pa.fecha_pago IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS porcentajeIncumplimientoPagos,
        AVG(pa.comision) AS promedioComision
        FROM ANDY_Y_SUS_SEMINARAS.Alquiler a
        JOIN ANDY_Y_SUS_SEMINARAS.Anuncio anuncio ON a.anuncio_id = anuncio.nro_anuncio
        JOIN ANDY_Y_SUS_SEMINARAS.Agente ag ON ag.id_agente = anuncio.agente
        JOIN ANDY_Y_SUS_SEMINARAS.Sucursal s ON s.codigo_sucursal = ag.sucursal_id
        JOIN ANDY_Y_SUS_SEMINARAS.TipoDeMoneda tm ON a.moneda_id = tm.id_moneda
        JOIN ANDY_Y_SUS_SEMINARAS.Persona persona_agente ON ag.persona_id = persona.id_persona
        JOIN ANDY_Y_SUS_SEMINARAS.Inquilino inquilino ON a.inquilino_id = inquilino.id_inquilino
        JOIN ANDY_Y_SUS_SEMINARAS.Persona persona_inquilino ON inquilino.persona_id = persona.id_persona
        JOIN ANDY_Y_SUS_SEMINARAS.Inmueble inmueble ON a.inmueble_id = inmueble.nro_inmueble
        JOIN ANDY_Y_SUS_SEMINARAS.TipoDeInmueble ti ON inmueble.tipo_de_inmueble_id = ti.id_tipo_de_inmueble
        JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tipo_inmueble tipoInm ON ti.id_tipo_de_inmueble = tipoInm.id_tipo_inmueble
        JOIN ANDY_Y_SUS_SEMINARAS.Direccion direccion ON inmueble.direccion_id = direccion.id_direccion
        JOIN ANDY_Y_SUS_SEMINARAS.Barrio barrio ON direccion.barrio_id = barrio.id_barrio
        JOIN ANDY_Y_SUS_SEMINARAS.Localidad localidad ON barrio.localidad_id = localidad.id_localidad
        JOIN ANDY_Y_SUS_SEMINARAS.Provincia provincia ON localidad.provincia_id = provincia.id_provincia
        JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_ubicacion u ON provincia.nombre = u.provincia AND localidad.nombre = u.localidad AND barrio.nombre = u.barrio
        JOIN ANDY_Y_SUS_SEMINARAS.BI_dim_tiempo t ON YEAR(a.fecha_inicio) = t.anio AND MONTH(a.fecha_inicio) = t.mes
        LEFT JOIN ANDY_Y_SUS_SEMINARAS.PagoAlquiler pa ON a.id_alquiler = pa.alquiler_id
        WHERE a.fecha_inicio IS NOT NULL
        GROUP BY
            -- Dimensiones
        t.id_tiempo,
        u.id_ubicacion,
        s.codigo_sucursal,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona_inquilino.fecha_nacimiento),
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoEtarioID(persona_agente.fecha_nacimiento),
        tipoInm.id_tipo_inmueble,
        inmueble.cantAmbientes_id,
        ANDY_Y_SUS_SEMINARAS.ObtenerRangoM2ID(inmueble.superficie_total),
        tm.id_moneda
        END









Duración promedio (en días) que se encuentran publicados los anuncios
según el tipo de operación (alquiler, venta, etc), barrio y ambientes para cada
cuatrimestre de cada año. Se consideran todos los anuncios que se dieron de alta
12
en ese cuatrimestre. La duración se calcula teniendo en cuenta la fecha de alta y
la fecha de finalización.
2. Precio promedio de los anuncios de inmuebles según el tipo de operación
(alquiler, venta, etc), tipo de inmueble y rango m2 para cada cuatrimestre/año.
Se consideran todos los anuncios que se dieron de alta en ese cuatrimestre. El
precio se debe expresar en el tipo de moneda que corresponda, identificando de
cuál se trata.
3. Los 5 barrios más elegidos para alquilar en función del rango etario de los
inquilinos para cada cuatrimestre/año. Se calcula en función de los alquileres
dados de alta en dicho periodo.
4. Porcentaje de incumplimiento de pagos de alquileres en término por cada
mes/año. Se calcula en función de las fechas de pago y fecha de vencimiento del
mismo. El porcentaje es en función del total de pagos en dicho periodo.
5. Porcentaje promedio de incremento del valor de los alquileres para los
contratos en curso por mes/año. Se calcula tomando en cuenta el último pago
con respecto al del mes en curso, únicamente de aquellos alquileres que hayan
tenido aumento y están activos.
6. Precio promedio de m2 de la venta de inmuebles según el tipo de inmueble y
la localidad para cada cuatrimestre/año. Se calcula en función de las ventas
concretadas.
7. Valor promedio de la comisión según el tipo de operación (alquiler, venta, etc)
y sucursal para cada cuatrimestre/año. Se calcula en función de los alquileres y
ventas concretadas dentro del periodo.
8. Porcentaje de operaciones concretadas (tanto de alquileres como ventas) por
cada sucursal, según el rango etario de los empleados por año en función de la
cantidad de anuncios publicados en ese mismo año.
9. Monto total de cierre de contratos por tipo de operación (tanto de alquileres
como ventas) por cada cuatrimestre y sucursal, diferenciando el tipo de moneda.
