## Generar Apendice 

Con este script vamos obenter la información de los transectos para generar el apéndice. 

### Obtener informacion de transectos

* Creo una consulta en la base de datos para obtener informacion de los transectos. 
* Utilizo las tablas `dicc_unidadesmuestreos`, `dicc_habitats` y `adis_transectos` procedentes de la bd `linaria_desarrollo`

```sql 
SELECT 
  adis_transectos.id AS id_transecto,
  dicc_unidadesmuestreos.nombre, 
  dicc_unidadesmuestreos.longitud, 
  dicc_habitats.habitat,
  ST_X(ST_Centroid(dicc_unidadesmuestreos.geometria)) As long,
  ST_Y(ST_Centroid(dicc_unidadesmuestreos.geometria)) As lat
FROM 
  public.adis_transectos, 
  public.dicc_unidadesmuestreos, 
  public.dicc_habitats
WHERE 
  adis_transectos.dicc_unidadesmuestreo_id = dicc_unidadesmuestreos.id AND
  dicc_unidadesmuestreos.dicc_habitat_id = dicc_habitats.id
ORDER BY adis_transectos.id;
```

