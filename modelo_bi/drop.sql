USE GD2C2023;

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