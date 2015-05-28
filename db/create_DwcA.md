## Create DwC-A files

### Create a database

### Get RecorderBy field
The aim of this task is to get a `RecordedBy` field for every `visit` event. The RecordedBy field contains all the observer who sampled the transect. 

* SQL-Query to get all observers by each visit 

```sql 
SELECT
v.adis_visita_id, array_to_string(array_agg(aux_censadores.nombre), ', ') as RecordedBy
FROM 
  (SELECT DISTINCT 
    aux_v.adis_visita_id, 
    aux_v.adis_censadore_id 
  FROM adis_censadores_adis_visitas as aux_v) as v,
  (SELECT 
    a.nombre, 
    c.id 
  FROM 
    adis_censadores c, 
    dicc_autores_seguimientos a 
  WHERE 
    a.id = c.dicc_autores_seguimiento_id) as aux_censadores
WHERE
  v.adis_censadore_id = aux_censadores.id
GROUP BY
  adis_visita_id
ORDER BY
  adis_visita_id;
```

* Export the results as `/db/recordedBy.csv` 

* Create a table in the `r dp_dispersantes` database called `dicc_recordedBy`. The sql code is:
```sql
CREATE TABLE "dicc_recordedBy"
(
  adis_visita_id integer,
  recordedby character varying(255)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "dicc_recordedBy"
  OWNER TO antonioj_perez;
```


