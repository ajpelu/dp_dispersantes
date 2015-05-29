## Create DwC-A files

#### Create a database

* We create the `dp_dispersantes` database

#### Get RecorderBy field
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

* Create a table in the `dp_dispersantes` database called `dicc_recordedBy`. The sql code is:
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

#### Get raw data from Linaria

* We create a raw table with data from `linaria_desarrollo` database.

* :red_circle: incluir imagen consulta

* The SQL query is: 

```sql 
SELECT 
  adis_avistamientos.id,
  dicc_especies.nombre_cientifico, 
  adis_avistamientos.numero, 
  adis_avistamientos.distancia, 
  adis_avistamientos.desplazamiento, 
  adis_visitas.adis_transecto_id, 
  adis_visitas.fechai, 
  adis_visitas.fechaf, 
  adis_avistamientos.adis_visita_id,
  dicc_especies.id AS id_dicc_especies
FROM 
  public.adis_avistamientos, 
  public.adis_especies_dispersantes, 
  public.dicc_especies, 
  public.adis_visitas, 
  public.adis_transectos, 
  public.dicc_unidadesmuestreos
WHERE 
  adis_avistamientos.adis_visita_id = adis_visitas.id AND
  adis_especies_dispersantes.id = adis_avistamientos.adis_especies_dispersante_id AND
  adis_especies_dispersantes.dicc_especie_id = dicc_especies.id AND
  adis_visitas.adis_transecto_id = adis_transectos.id AND
  adis_transectos.dicc_unidadesmuestreo_id = dicc_unidadesmuestreos.id AND 
  dicc_especies.nombre_cientifico NOT IN ('Valor nulo');
```

* Query contains 30324 rows. 

* Export the results as `/db/raw_data_from_linaria.csv`

* Create a table in the `dp_dispersantes` database called `dis_raw`. The sql code is:
```sql
CREATE TABLE dis_raw
(
  id integer
  nombre_cientifico character varying(255),
  numero integer,
  distancia integer,
  desplazamiento integer,
  adis_transecto_id integer,
  fechai timestamp without time zone,
  fechaf timestamp without time zone,
  adis_visita_id integer,
  id_dicc_especies integer
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dis_raw
  OWNER TO antonioj_perez;
```

* Import into `dis_raw`

##### Problem with Acanthis cannabina. 
We update the Acanthis cannabina in the table `dis_raw` to Carduelis cannabina 

```sql
UPDATE dis_raw
SET nombre_cientifico='Carduelis cannabina', id_dicc_especies='447'
WHERE nombre_cientifico='Acanthis cannabina'; 
```
* Export the table with updated taxonomy to  `/db/raw_data_from_linaria_corregida.csv` by the query: 
```sql 
SELECT * FROM dis_raw;
```


