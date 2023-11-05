-- Creación de tablas de dimensiones
CREATE TABLE BI_DimTiempo (
    idTiempo numeric PRIMARY KEY IDENTITY(1,1),
    anio numeric,
    cuatrimestre numeric,
    mes numeric
);

CREATE TABLE BI_DimUbicacion (
    idUbicacion numeric PRIMARY KEY IDENTITY(1,1),
    provincia numeric, -- Reemplaza "Provincia" con el tipo de dato adecuado
    localidad numeric, -- Reemplaza "Localidad" con el tipo de dato adecuado
    barrio numeric -- Reemplaza "Barrio" con el tipo de dato adecuado
);

CREATE TABLE BI_DimSucursal (
    idSucursal numeric PRIMARY KEY IDENTITY(1,1),
    nombre nvarchar(100)
);

CREATE TABLE BI_DimRangoEtario (
    idRangoEtario numeric PRIMARY KEY IDENTITY(1,1),
    rango_inicio numeric,
    rango_fin numeric
);

CREATE TABLE BI_DimTipoInmueble (
    idTipoInmueble numeric PRIMARY KEY IDENTITY(1,1),
    nombre nvarchar(100)
);

CREATE TABLE BI_DimAmbientes (
    idAmbientes numeric PRIMARY KEY IDENTITY(1,1),
    ambientes numeric
);

CREATE TABLE BI_DimRangoM2 (
    idRangoM2 numeric PRIMARY KEY IDENTITY(1,1),
    rango_inicio numeric,
    rango_fin numeric
);

CREATE TABLE BI_DimTipoOperacion (
    idTipoOperacion numeric PRIMARY KEY IDENTITY(1,1),
    nombre nvarchar(100)
);

CREATE TABLE BI_DimTipoMoneda (
    idTipoMoneda numeric PRIMARY KEY IDENTITY(1,1),
    nombre nvarchar(100)
);

-- Creación de tablas de hechos
CREATE TABLE BI_HechoAnuncio (
    idHechoAnuncio numeric PRIMARY KEY IDENTITY(1,1),
    tiempo numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    ubicacion numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    sucursal numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    rangoEtarioAgentes numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    tipoInmueble numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    ambientes numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    rangoM2 numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    tipoOperacion numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    tipoMoneda numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    promedioTiempoPublicado numeric,
    precioPromedio numeric,
    cantAnuncios numeric,
    cantOperacionesConcretadas numeric,
    montoTotalOperacionesConcretadas numeric,
    FOREIGN KEY (tiempo) REFERENCES BI_DimTiempo(idTiempo),
    FOREIGN KEY (ubicacion) REFERENCES BI_DimUbicacion(idUbicacion),
    FOREIGN KEY (sucursal) REFERENCES BI_DimSucursal(idSucursal),
    FOREIGN KEY (rangoEtarioAgentes) REFERENCES BI_DimRangoEtario(idRangoEtario),
    FOREIGN KEY (tipoInmueble) REFERENCES BI_DimTipoInmueble(idTipoInmueble),
    FOREIGN KEY (ambientes) REFERENCES BI_DimAmbientes(idAmbientes),
    FOREIGN KEY (rangoM2) REFERENCES BI_DimRangoM2(idRangoM2),
    FOREIGN KEY (tipoOperacion) REFERENCES BI_DimTipoOperacion(idTipoOperacion),
    FOREIGN KEY (tipoMoneda) REFERENCES BI_DimTipoMoneda(idTipoMoneda)
);

CREATE TABLE BI_HechoAlquiler (
    idHechoAlquiler numeric PRIMARY KEY IDENTITY(1,1),
    tiempo numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    ubicacion numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    sucursal numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    rangoEtarioInquilinos numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    rangoEtarioAgentes numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    tipoInmueble numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    ambientes numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    rangoM2 numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    tipoMoneda numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    cantAlquileres numeric,
    porcentajeIncumplimientoPagos numeric,
    promedioComision numeric,
    FOREIGN KEY (tiempo) REFERENCES BI_DimTiempo(idTiempo),
    FOREIGN KEY (ubicacion) REFERENCES BI_DimUbicacion(idUbicacion),
    FOREIGN KEY (sucursal) REFERENCES BI_DimSucursal(idSucursal),
    FOREIGN KEY (rangoEtarioInquilinos) REFERENCES BI_DimRangoEtario(idRangoEtario),
    FOREIGN KEY (rangoEtarioAgentes) REFERENCES BI_DimRangoEtario(idRangoEtario),
    FOREIGN KEY (tipoInmueble) REFERENCES BI_DimTipoInmueble(idTipoInmueble),
    FOREIGN KEY (ambientes) REFERENCES BI_DimAmbientes(idAmbientes),
    FOREIGN KEY (rangoM2) REFERENCES BI_DimRangoM2(idRangoM2),
    FOREIGN KEY (tipoMoneda) REFERENCES BI_DimTipoMoneda(idTipoMoneda)
);

CREATE TABLE BI_HechoVenta (
    idHechoVenta numeric PRIMARY KEY IDENTITY(1,1),
    tiempo numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    ubicacion numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a la dimensión
    sucursal numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a the dimension
    rangoEtarioAgentes numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a the dimension
    rangoEtarioCompradores numeric, -- Reemplaza con the tipo de dato adecuado y the referencia a the dimension
    tipoInmueble numeric, -- Reemplaza con el tipo de dato adecuado y la referencia a the dimension
    ambientes numeric, -- Reemplaza con the tipo de dato adecuado and the referencia a the dimension
    rangoM2 numeric, -- Reemplaza con the tipo de dato adecuado y the referencia a the dimension
    tipoMoneda numeric, -- Reemplaza con the tipo de dato adecuado y the referencia a the dimension
    cantVentas numeric,
    precioPromedioPorM2 numeric,
    promedioComision numeric,
    FOREIGN KEY (tiempo) REFERENCES BI_DimTiempo(idTiempo),
    FOREIGN KEY (ubicacion) REFERENCES BI_DimUbicacion(idUbicacion),
    FOREIGN KEY (sucursal) REFERENCES BI_DimSucursal(idSucursal),
    FOREIGN KEY (rangoEtarioAgentes) REFERENCES BI_DimRangoEtario(idRangoEtario),
    FOREIGN KEY (rangoEtarioCompradores) REFERENCES BI_DimRangoEtario(idRangoEtario),
    FOREIGN KEY (tipoInmueble) REFERENCES BI_DimTipoInmueble(idTipoInmueble),
    FOREIGN KEY (ambientes) REFERENCES BI_DimAmbientes(idAmbientes),
    FOREIGN KEY (rangoM2) REFERENCES BI_DimRangoM2(idRangoM2),
    FOREIGN KEY (tipoMoneda) REFERENCES BI_DimTipoMoneda(idTipoMoneda)
);
GO


-- MIGRACIONES 

-- ● Rango etario agentes/inquilinos
-- ○ < 25
-- ○ 25 - 35
-- ○ 35 - 50
-- ○ > 50

CREATE PROCEDURE BI_MigracionRangoEtarioAgentesInquilinos
AS
BEGIN 
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_DimRangoEtario (rango_inicio, rango_fin)
    VALUES (0, 25);
    INSERT INTO BI_DimRangoEtario (rango_inicio, rango_fin)
    VALUES (25, 35);
    INSERT INTO BI_DimRangoEtario (rango_inicio, rango_fin)
    VALUES (35, 50);
    INSERT INTO BI_DimRangoEtario (rango_inicio, rango_fin)
    VALUES (50, 100);
END
GO


CREATE PROCEDURE MigracionRangoEtarioCompradores
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_DimRangoM2 (rango_inicio, rango_fin)
    VALUES (0, 35);
    INSERT INTO BI_DimRangoM2 (rango_inicio, rango_fin)
    VALUES (35, 55);
    INSERT INTO BI_DimRangoM2 (rango_inicio, rango_fin)
    VALUES (55, 75);
    INSERT INTO BI_DimRangoM2 (rango_inicio, rango_fin)
    VALUES (75, 100);
    INSERT INTO BI_DimRangoM2 (rango_inicio, rango_fin)
    VALUES (100, 100000);
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionTipoMoneda 
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_DimTipoMoneda (nombre)
    SELECT DISTINCT * FROM ANDY_Y_SUS_SEMINARAS.TipoDeMoneda
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionTipoOperacion
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_DimTipoOperacion (nombre)
    SELECT * FROM ANDY_Y_SUS_SEMINARAS.TipoDeOperacion
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionTipoInmueble
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_DimTipoInmueble (nombre)
    SELECT DISTINCT * FROM ANDY_Y_SUS_SEMINARAS.TipoDeInmueble
END
GO

CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionAmbientes
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_DimAmbientes (ambientes)
    SELECT DISTINCT * FROM ANDY_Y_SUS_SEMINARAS.CantAmbientes
END
GO




CREATE PROCEDURE ANDY_Y_SUS_SEMINARAS.BI_MigracionSucursal
AS
BEGIN
    INSERT INTO ANDY_Y_SUS_SEMINARAS.BI_DimSucursal (nombre)
    SELECT DISTINCT * FROM ANDY_Y_SUS_SEMINARAS.Sucursal
END