-- Use the created database
USE GD2C2023;
GO

-- Address related tables
CREATE TABLE Provincia (
    id_provincia INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

CREATE TABLE Localidad (
    id_localidad INT PRIMARY KEY,
    nombre NVARCHAR(100),
    provincia_id INT,
    FOREIGN KEY (provincia_id) REFERENCES Provincia(id_provincia)
);

CREATE TABLE Barrio (
    id_barrio INT PRIMARY KEY,
    nombre NVARCHAR(100),
    localidad_id INT,
    FOREIGN KEY (localidad_id) REFERENCES Localidad(id_localidad)
);

CREATE TABLE Direccion (
    id_direccion INT PRIMARY KEY,
    barrio_id INT,
    calle NVARCHAR(100),
    altura INT,
    FOREIGN KEY (barrio_id) REFERENCES Barrio(id_barrio)
);

-- Property related tables
CREATE TABLE TipoDeInmueble (
    id_tipo_de_inmueble INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

CREATE TABLE Disposicion (
    id_disposicion INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

CREATE TABLE Orientacion (
    id_orientacion INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

CREATE TABLE Estado (
    id_estado INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

CREATE TABLE Inmueble (
    nro_inmueble INT PRIMARY KEY,
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
    FOREIGN KEY (tipo_de_inmueble_id) REFERENCES TipoDeInmueble(id_tipo_de_inmueble),
    FOREIGN KEY (direccion_id) REFERENCES Direccion(id_direccion),
    FOREIGN KEY (disposicion_id) REFERENCES Disposicion(id_disposicion),
    FOREIGN KEY (orientacion_id) REFERENCES Orientacion(id_orientacion),
    FOREIGN KEY (estado_id) REFERENCES Estado(id_estado)
);

CREATE TABLE Persona (
    id_persona INT PRIMARY KEY,
    nombre NVARCHAR(100),
    apellido NVARCHAR(100),
    dni NVARCHAR(100),
    telefono NVARCHAR(100),
    mail NVARCHAR(100),
    fecha_registro DATETIME,
    fecha_nacimiento DATETIME
);


CREATE TABLE Propietario (
    id_propietario INT PRIMARY KEY,
    persona_id INT,
    FOREIGN KEY (persona_id) REFERENCES Persona(id_persona)
);

CREATE TABLE PropietarioDeInmueble (
    id_propietario_de_inmueble INT PRIMARY KEY,
    propietario_id INT,
    inmueble_id INT,
    FOREIGN KEY (propietario_id) REFERENCES Propietario(id_propietario),
    FOREIGN KEY (inmueble_id) REFERENCES Inmueble(nro_inmueble)
);

CREATE TABLE Caracteristica (
    id_caracteristica INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

CREATE TABLE InmuebleCaracteristica (
    inmueble_id INT,
    caracteristica_id INT,
    PRIMARY KEY (inmueble_id, caracteristica_id),
    FOREIGN KEY (inmueble_id) REFERENCES Inmueble(nro_inmueble),
    FOREIGN KEY (caracteristica_id) REFERENCES Caracteristica(id_caracteristica)
);

CREATE TABLE Sucursal (
    codigo_sucursal NUMERIC PRIMARY KEY,
    direccion_id INT,
    nombre NVARCHAR(100),
    telefono NVARCHAR(100),
    FOREIGN KEY (direccion_id) REFERENCES Direccion(id_direccion)
);

CREATE TABLE Agente (
    id_agente INT PRIMARY KEY,
    persona_id INT,
    sucursal_id NUMERIC,
    FOREIGN KEY (sucursal_id) REFERENCES Sucursal(codigo_sucursal),
    FOREIGN KEY (persona_id) REFERENCES Persona(id_persona)
);

CREATE TABLE Inquilino (
    id_inquilino INT PRIMARY KEY,
    persona_id INT,
    FOREIGN KEY (persona_id) REFERENCES Persona(id_persona)
);

CREATE TABLE Comprador (
    id_comprador INT PRIMARY KEY,
    persona_id INT,
    FOREIGN KEY (persona_id) REFERENCES Persona(id_persona)
);

-- Anuncio related tables
CREATE TABLE TipoOperacion (
    id_tipo_operacion INT PRIMARY KEY,
    nombre NVARCHAR(100),

);

CREATE TABLE TipoDeMoneda (
    id_moneda INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

CREATE TABLE TipoPeriodo (
    id_tipo_periodo INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

CREATE TABLE EstadoAnuncio (
    id_estado INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

CREATE TABLE Anuncio (
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
    FOREIGN KEY (tipo_operacion_id) REFERENCES TipoOperacion(id_tipo_operacion),
    FOREIGN KEY (inmueble_id) REFERENCES Inmueble(nro_inmueble),
    FOREIGN KEY (moneda_id) REFERENCES TipoDeMoneda(id_moneda),
    FOREIGN KEY (tipo_periodo_id) REFERENCES TipoPeriodo(id_tipo_periodo),
    FOREIGN KEY (estado_anuncio_id) REFERENCES EstadoAnuncio(id_estado),
    FOREIGN KEY (agente_id) REFERENCES Agente(id_agente)
);

-- Alquiler related tables
CREATE TABLE Duracion (
    id_duracion INT PRIMARY KEY,
    nombre INT,
    cantidad NUMERIC
);

CREATE TABLE DetalleImporte (
    id_detalle_importe INT PRIMARY KEY,
    nro_periodo_inicio NUMERIC,
    nro_periodo_fin NUMERIC,
    precio NUMERIC
);

CREATE TABLE EstadoAlquiler (
    id_estado_alquiler INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

CREATE TABLE PagoAlquiler (
    id_pago_alquiler INT PRIMARY KEY,
    alquiler_id INT,
    fecha_pago DATETIME,
);

CREATE TABLE Alquiler (
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
    pago_alquiler_id INT,
    FOREIGN KEY (anuncio_id) REFERENCES Anuncio(nro_anuncio),
    FOREIGN KEY (inquilino_id) REFERENCES Inquilino(id_inquilino),
    FOREIGN KEY (duracion_id) REFERENCES Duracion(id_duracion),
    FOREIGN KEY (detalle_importe_id) REFERENCES DetalleImporte(id_detalle_importe),
    FOREIGN KEY (estado_alquiler_id) REFERENCES EstadoAlquiler(id_estado_alquiler),
    FOREIGN KEY (pago_alquiler_id) REFERENCES PagoAlquiler(id_pago_alquiler)
);

-- Payment related tables
CREATE TABLE MedioPago (
    id_medio_pago INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

CREATE TABLE PagoVenta (
    id_pago_venta INT PRIMARY KEY,
    importe NUMERIC(18, 2),
    moneda_del_pago_id INT,
    cotizacion NUMERIC(18, 2),
    medio_de_pago_id INT,
    FOREIGN KEY (moneda_del_pago_id) REFERENCES TipoDeMoneda(id_moneda),
    FOREIGN KEY (medio_de_pago_id) REFERENCES MedioPago(id_medio_pago)
);


CREATE TABLE Venta (
    id_venta INT PRIMARY KEY,
    anuncio_id INT,
    comprador_id INT,
    fecha_venta DATETIME,
    precio_venta NUMERIC(18, 2),
    moneda_id INT,
    pago_venta_id INT,
    comision NUMERIC(18, 2),
    
    FOREIGN KEY (anuncio_id) REFERENCES Anuncio(nro_anuncio),
    FOREIGN KEY (comprador_id) REFERENCES Comprador(id_comprador),
    FOREIGN KEY (moneda_id) REFERENCES TipoDeMoneda(id_moneda),
    FOREIGN KEY (pago_venta_id) REFERENCES PagoVenta(id_pago_venta),
);