-- Drop the tables in reverse order to avoid foreign key constraints
DROP TABLE ANDY_Y_SUS_SEMINARAS.PagoAlquiler;
DROP TABLE ANDY_Y_SUS_SEMINARAS.PagoVenta;
DROP TABLE ANDY_Y_SUS_SEMINARAS.MedioPago;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Alquiler;
DROP TABLE ANDY_Y_SUS_SEMINARAS.EstadoAlquiler;
DROP TABLE ANDY_Y_SUS_SEMINARAS.DetalleImporte;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Duracion;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Anuncio;
DROP TABLE ANDY_Y_SUS_SEMINARAS.EstadoAnuncio;
DROP TABLE ANDY_Y_SUS_SEMINARAS.TipoPeriodo;
DROP TABLE ANDY_Y_SUS_SEMINARAS.TipoDeMoneda;
DROP TABLE ANDY_Y_SUS_SEMINARAS.TipoOperacion;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Comprador;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Inquilino;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Agente;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Propietario;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Persona;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Estado;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Orientacion;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Disposicion;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Caracteristica;
DROP TABLE ANDY_Y_SUS_SEMINARAS.InmuebleCaracteristica;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Inmueble;
DROP TABLE ANDY_Y_SUS_SEMINARAS.PropietarioDeInmueble;
DROP TABLE ANDY_Y_SUS_SEMINARAS.TipoDeInmueble;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Direccion;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Barrio;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Localidad;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Provincia;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Venta;
DROP TABLE ANDY_Y_SUS_SEMINARAS.Sucursal;


DROP SCHEMA ANDY_Y_SUS_SEMINARAS;


IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'Migrar_Tipificado')
BEGIN
    DROP PROCEDURE Migrar_Tipificado;
END;

-- Drop Procedure migrar_tipificados
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_tipificados')
BEGIN
    DROP PROCEDURE migrar_tipificados;
END;

-- Drop Procedure migrar_carateristica (Nota: Corregí el nombre a "migrar_caracteristica")
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_caracteristica')
BEGIN
    DROP PROCEDURE migrar_caracteristica;
END;

-- Drop Procedure migrar_inquilinos
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_inquilinos')
BEGIN
    DROP PROCEDURE migrar_inquilinos;
END;

-- Drop Procedure migrar_agentes
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_agentes')
BEGIN
    DROP PROCEDURE migrar_agentes;
END;

-- Drop Procedure migrar_propietarios
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_propietarios')
BEGIN
    DROP PROCEDURE migrar_propietarios;
END;

-- Drop Procedure migrar_compradores
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_compradores')
BEGIN
    DROP PROCEDURE migrar_compradores;
END;

-- Drop Procedure migrar_provincias
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_provincias')
BEGIN
    DROP PROCEDURE migrar_provincias;
END;

-- Drop Procedure migrar_localidad
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_localidad')
BEGIN
    DROP PROCEDURE migrar_localidad;
END;

-- Drop Procedure migrar_barrios
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_barrios')
BEGIN
    DROP PROCEDURE migrar_barrios;
END;

-- Drop Procedure migrar_direccion
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_direccion')
BEGIN
    DROP PROCEDURE migrar_direccion;
END;

-- Drop Procedure migrar_inmueble
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_inmueble')
BEGIN
    DROP PROCEDURE migrar_inmueble;
END;

-- Drop Procedure migrar_sucursal
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_sucursal')
BEGIN
    DROP PROCEDURE migrar_sucursal;
END;

-- Drop Function GetPersonaID
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'GetPersonaID')
BEGIN
    DROP FUNCTION GetPersonaID;
END;

-- Drop Procedure migrar_anuncio
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_anuncio')
BEGIN
    DROP PROCEDURE migrar_anuncio;
END;



