USE GD2C2023;
GO

CREATE SCHEMA ANDY_Y_SUS_SEMINARAS;
GO

-- Address related tables
CREATE TABLE ANDY_Y_SUS_SEMINARAS.Provincia
(
    id_provincia INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Localidad
(
    id_localidad INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100),
    provincia_id INT,
    FOREIGN KEY (provincia_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Provincia(id_provincia)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Barrio
(
    id_barrio INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100),
    localidad_id INT,
    FOREIGN KEY (localidad_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Localidad(id_localidad)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Direccion
(
    id_direccion INT PRIMARY KEY IDENTITY(1,1),
    barrio_id INT,
    calle NVARCHAR(100),
    altura INT,
    FOREIGN KEY (barrio_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Barrio(id_barrio)
);

-- Property related tables
CREATE TABLE ANDY_Y_SUS_SEMINARAS.TipoDeInmueble
(
    id_tipo_de_inmueble INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Disposicion
(
    id_disposicion INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Orientacion
(
    id_orientacion INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Estado
(
    id_estado INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Inmueble
(
    nro_inmueble INT PRIMARY KEY IDENTITY(1,1),
    tipo_de_inmueble_id INT,
    descripcion NVARCHAR(100),
    direccion_id INT,
    ambientes SMALLINT,
    superficie_total NUMERIC,
    disposicion_id INT,
    orientacion_id INT,
    estado_id INT,
    antiguedad INT,
    expensas NUMERIC,
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
    inmueble_id INT,
    caracteristica_id INT,
    id INT IDENTITY(1,1),
    PRIMARY KEY (inmueble_id, caracteristica_id),
    FOREIGN KEY (inmueble_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Inmueble(nro_inmueble),
    FOREIGN KEY (caracteristica_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Caracteristica(id_caracteristica)
);


CREATE TABLE ANDY_Y_SUS_SEMINARAS.Sucursal
(
    codigo_sucursal NUMERIC PRIMARY KEY IDENTITY(1,1),
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

-- Anuncio related tables
CREATE TABLE ANDY_Y_SUS_SEMINARAS.TipoOperacion
(
    id_tipo_operacion INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100),
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.TipoDeMoneda
(
    id_moneda INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100)
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
    nro_anuncio INT PRIMARY KEY IDENTITY(1,1),
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

-- Alquiler related tables
CREATE TABLE ANDY_Y_SUS_SEMINARAS.Duracion
(
    id_duracion INT PRIMARY KEY IDENTITY(1,1),
    nombre INT,
    cantidad NUMERIC
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.DetalleImporte
(
    id_detalle_importe INT PRIMARY KEY IDENTITY(1,1),
    nro_periodo_inicio NUMERIC,
    nro_periodo_fin NUMERIC,
    precio NUMERIC
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.EstadoAlquiler
(
    id_estado_alquiler INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.PagoAlquiler
(
    id_pago_alquiler INT PRIMARY KEY IDENTITY(1,1),
    alquiler_id INT,
    fecha_pago DATETIME,
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Alquiler
(
    id_alquiler INT PRIMARY KEY IDENTITY(1,1),
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
    pago_alquiler_id INT,
    FOREIGN KEY (anuncio_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Anuncio(nro_anuncio),
    FOREIGN KEY (inquilino_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Inquilino(id_inquilino),
    FOREIGN KEY (duracion_id) REFERENCES ANDY_Y_SUS_SEMINARAS.Duracion(id_duracion),
    FOREIGN KEY (detalle_importe_id) REFERENCES ANDY_Y_SUS_SEMINARAS.DetalleImporte(id_detalle_importe),
    FOREIGN KEY (estado_alquiler_id) REFERENCES ANDY_Y_SUS_SEMINARAS.EstadoAlquiler(id_estado_alquiler),
    FOREIGN KEY (pago_alquiler_id) REFERENCES ANDY_Y_SUS_SEMINARAS.PagoAlquiler(id_pago_alquiler)
);

-- Payment related tables
CREATE TABLE ANDY_Y_SUS_SEMINARAS.MedioPago
(
    id_medio_pago INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.PagoVenta
(
    id_pago_venta INT PRIMARY KEY IDENTITY(1,1),
    importe NUMERIC(18, 2),
    moneda_del_pago_id INT,
    cotizacion NUMERIC(18, 2),
    medio_de_pago_id INT,
    FOREIGN KEY (moneda_del_pago_id) REFERENCES ANDY_Y_SUS_SEMINARAS.TipoDeMoneda(id_moneda),
    FOREIGN KEY (medio_de_pago_id) REFERENCES ANDY_Y_SUS_SEMINARAS.MedioPago(id_medio_pago)
);

CREATE TABLE ANDY_Y_SUS_SEMINARAS.Venta
(
    id_venta INT PRIMARY KEY IDENTITY(1,1),
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
