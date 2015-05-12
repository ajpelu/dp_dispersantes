## Generar Apendice 

Con este script vamos obenter la información de los transectos para generar el apéndice. 

### Obtener informacion de transectos

* Creo una consulta en la base de datos para obtener informacion de los transectos
```sql 
SELECT 
  dicc_unidadesmuestreos.nombre, 
  dicc_unidadesmuestreos.longitud, 
  dicc_habitats.habitat
FROM 
  public.adis_transectos, 
  public.dicc_unidadesmuestreos, 
  public.dicc_habitats
WHERE 
  adis_transectos.dicc_unidadesmuestreo_id = dicc_unidadesmuestreos.id AND
  dicc_unidadesmuestreos.dicc_habitat_id = dicc_habitats.id;
```

``` 
SELECT 
  dicc_unidadesmuestreos.nombre, 
  dicc_unidadesmuestreos.longitud, 
  dicc_habitats.habitat
FROM 
  public.adis_transectos, 
  public.dicc_unidadesmuestreos, 
  public.dicc_habitats
WHERE 
  adis_transectos.dicc_unidadesmuestreo_id = dicc_unidadesmuestreos.id AND
  dicc_unidadesmuestreos.dicc_habitat_id = dicc_habitats.id;
```