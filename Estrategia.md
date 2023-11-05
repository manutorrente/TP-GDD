# Coreecciones reentrega Creacion Inicial

## Modificacion del der
Nos dimos cuenta que en realidad el alquiler no debe tener muchos detalles importe dado que nos sucedia que teniamos muchos alquileres con todos los mismos atributos a excepcion del detalle importe

Por ende, a partir de ahora un detalle importe tiene el codigo del alquiler al que hacer referencia. Esto nos mejora la normalizacion de datos al evitar tener todos estos datos repetidos


```sql
entity alquiler {
    idAlquiler: numeric PK
    --
    anuncio: Anuncio FK
    inquilino: inquilino FK
    duracion: numeric(18, 2)
    fechaInicio: DateTime
    fechaFin: DateTime
    deposito: numeric (18, 2)
    comision: numeric (18, 2)
    gastosAveriguaciones: numeric (18, 2)
    estadoAlquiler: Estado FK
}


entity detalleImporte {
    idDetalleImporte: numeric
    alquiler_id : Alquiler FK
    nroPeriodoInicio: numeric
    nroPeriodoFin: numeric
    precio: numeric
}
```

## Modificacion del procedure
Ahora a la hora de mirar alquiler no se hace un left join con la tabla detalle_importe, sino que detalle importe hace join con la tabla alquiler y guarda su id.
Ademas, ahora la migracion de pago_alquiler no hace un join con detalle importe, ni un between con las fechas debido a que el detalle importe posee el alquiler.
