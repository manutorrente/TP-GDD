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


DROP PROCEDURE migrar_provincias;
DROP SCHEMA ANDY_Y_SUS_SEMINARAS;
-- Drop the database if needed
-- DROP DATABASE YourDatabaseName;
