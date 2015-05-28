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

![](/db/raw_query_linaria.png)

* The SQL query is: 

```sql 
SELECT 
  adis_avistamientos.adis_visita_id, 
  adis_visitas.fechai, 
  adis_visitas.fechaf, 
  dicc_unidadesmuestreos.nombre AS transecto_nombre, 
  dicc_unidadesmuestreos.longitud AS transecto_longitud, 
  dicc_vientos.descripcion AS vientos, 
  dicc_nubes.descripcion AS nubes, 
  adis_visitas.niebla AS niebla, 
  dicc_especies.nombre_cientifico, 
  dicc_ecologias.descripcion AS ecologias, 
  dicc_biogeovoous.descripcion AS biogeovoous, 
  dicc_biogeosimples.descripcion AS biogeosimples, 
  dicc_estatussns.descripcion AS status_sn, 
  dicc_ecologiatroficas.descripcion AS ecologia_trofica, 
  adis_avistamientos.numero, 
  adis_avistamientos.distancia, 
  adis_avistamientos.desplazamiento
FROM 
  public.adis_avistamientos, 
  public.dicc_biogeosimples, 
  public.dicc_biogeovoous, 
  public.dicc_ecologias, 
  public.dicc_ecologiatroficas, 
  public.adis_especies_dispersantes, 
  public.adis_visitas, 
  public.dicc_nubes, 
  public.dicc_vientos, 
  public.adis_transectos, 
  public.dicc_unidadesmuestreos, 
  public.dicc_especies, 
  public.dicc_estatussns
WHERE 
  dicc_biogeosimples.id = dicc_especies.dicc_biogeosimple_id AND
  dicc_biogeovoous.id = dicc_especies.dicc_biogeovoou_id AND
  dicc_ecologias.id = dicc_especies.dicc_ecologia_id AND
  dicc_ecologiatroficas.id = dicc_especies.dicc_ecologiatrofica_id AND
  adis_especies_dispersantes.id = adis_avistamientos.adis_especies_dispersante_id AND
  adis_especies_dispersantes.dicc_especie_id = dicc_especies.id AND
  adis_visitas.id = adis_avistamientos.adis_visita_id AND
  adis_visitas.adis_transecto_id = adis_transectos.id AND
  dicc_nubes.id = adis_visitas.dicc_nube_id AND
  dicc_vientos.id = adis_visitas.dicc_viento_id AND
  adis_transectos.dicc_unidadesmuestreo_id = dicc_unidadesmuestreos.id AND
  dicc_estatussns.id = dicc_especies.dicc_estatussn_id;
```

* Export the results as `/db/raw_data_from_linaria.csv`



