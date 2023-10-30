# Migración de tipo de datos tipificados

Los datos tipificados fueron lo primero que decidimos migrar, ya que no tiene Foreign Keys y son muy simples. 

La primera complicación que surgió fue migrar a la misma tabla datos tipificados que se podían encontrar en muchas columnas de la tabla maestra. La solución fue hacer el `INSERT` desde más de un `SELECT` unidos por `UNION`. Con esto el código ya funcionaba, pero teníamos muchas repeticiones de la forma

```sql
INSERT INTO table
        (nombre)
        SELECT DISTINCT column
        FROM gd_esquema.Maestra
        WHERE column IS NOT NULL;

```

Para solucionarlo, decidimos hacer un procedure que reciba dos parámetros, tabla de destino y columna de origen, y que implementara este formato. Mientras que esto no contempla los casos con un `UNION`, estos se puede emular llamando al nuevo procedure más de una vez con columnas de origen diferentes.`INSERT`

# Migración de personas

La principal complicación de esto es que en la bases de datos original no existen las personas, sino que estas pueden ser Inquilinos, Propietarios, Agentes, o Compradores, cada cual tiene sus propias columnas. Si se hubieran migrado todos los datos a la entidad Persona sin tener en cuenta el resto de las Entidades, hubiera sido dificil recuperar la información