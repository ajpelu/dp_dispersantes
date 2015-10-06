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

We need to fill the full name of the observers. For this purpose: 

* We select all the unique records in `dicc_recorderBy` 
* Then we queried the observers's name in Aspizua et al. 2012. 
* We obtained the following correspondences: 

| recordedBy                | full_name              | status    |
|---------------------------|------------------------|-----------|
| Fanny Archila             | Archila Gallegos, F.   |           |
| Asuncion Arias            | Arias Navarro, A.      |           |
| Jose Miguel Barea Azcón   | Barea-Azcón, J.M.      |           |
| Veronica                  | Bueno de la Rosa, V.   |           |
| Libertad                  | Cobos, L.              |           |
| Fracisco Contreras Parody | Contreras Parody, F.   |           |
| Cristina Debén            | Debén Duarte, C.       |           |
| Javier Foronda            | Foronda, J.            |           |
| Pablo Galdo               | Galdo Fuentes, P.      |           |
| Isacio                    | Hernández Soto, I.     |           |
| Emilio Lopera             | Lopera, E.             |           |
| Andrés López              | López Martinez, A.     |           |
| Rogelio López             | López-Sanjuán, R.      |           |
| Angel                     | Lozano Rubio, A.J.     |           |
| J. M. Marín               | Marín Escribano, J.M.  |           |
| Javier Martín Jaramillo   | Martín Jaramillo, J.   |           |
| Cristina Martos           | Martos García, C.      |           |
| D. Morillar               | Morillas Fernández, D. |           |
| Guillermo Rodríguez       | Rodríguez, G.          |           |
| Mentxu                    | Pulido Poyal, C.       |           |
| Juan Pablo                |                        | DELETE    |

 * We created a table within database (a copy of `dicc_recordedBy`) called `dicc_recordedBy_valid` 

```sql 
CREATE TABLE
  public."dicc_recordedBy_valid" 
AS TABLE 
  public."dicc_recordedBy";
```

 * We updated the combinations of observer with the followings update clauses: 
 
```sql
UPDATE "dicc_recordedBy_valid"
SET recordedby='Hernández Soto, I., Contreras Parody, F.'
WHERE recordedby='Isacio, Francisco Contreras Parody'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Archila Gallegos, F., Hernández Soto, I.'
WHERE recordedby='Fanny Archila, Isacio'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Pulido Poyal, C., Archila Gallegos, F.'
WHERE recordedby='Mentxu, Fanny Archila'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Archila Gallegos, F.'
WHERE recordedby='Fanny Archila'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Contreras Parody, F., Galdo Fuentes, P.'
WHERE recordedby='Francisco Contreras Parody, Pablo Galdo'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Martos García, C., Pulido Poyal, C.'
WHERE recordedby='Cristina Martos, Mentxu'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Galdo Fuentes, P., Pulido Poyal, C.,'
WHERE recordedby='Pablo Galdo, Mentxu'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='López-Sanjuán, R., Barea-Azcón, J.M.'
WHERE recordedby='Rogelio López, Jose Miguel Barea Azcón';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Contreras Parody, F., Pulido Poyal, C.'
WHERE recordedby='Mentxu, Francisco Contreras Parody';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Rodríguez, G., Archila Gallegos, F., Hernández Soto, I.'
WHERE recordedby='Guillermo Rodriguez, Fanny Archila, Isacio';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Hernández Soto, I.'
WHERE recordedby='Isacio'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Morillas Fernández, D., Martín Jaramillo, J.'
WHERE recordedby='D. Morillar, Javier Martín Jaramillo'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Galdo Fuentes, P.'
WHERE recordedby='Pablo Galdo'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Galdo Fuentes, P., Archila Gallegos, F.'
WHERE recordedby='Pablo Galdo, Fanny Archila'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Debén Duarte, C., Pulido Poyal, C.'
WHERE recordedby='Cristina Debén, Mentxu'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Martín Jaramillo, J., Barea-Azcón, J.M.'
WHERE recordedby='Javier Martín Jaramillo, Jose Miguel Barea Azcón'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Hernández Soto, I., Archila Gallegos, F.'
WHERE recordedby='Isacio, Fanny Archila'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Hernández Soto, I., Martos García, C.'
WHERE recordedby='Isacio, Cristina Martos'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Galdo Fuentes, P., Martín Jaramillo, J.'
WHERE recordedby='Pablo Galdo, Javier Martín Jaramillo'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='López-Sanjuán, R.'
WHERE recordedby='Rogelio López';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Martín Jaramillo, J., Morillas Fernández, D., Barea-Azcón, J.M.'
WHERE recordedby='Javier Martín Jaramillo, D. Morillar, Jose Miguel Barea Azcón';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Contreras Parody, F., Hernández Soto, I.'
WHERE recordedby='Francisco Contreras Parody, Isacio'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Martos García, C.'
WHERE recordedby='Cristina Martos';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Archila Gallegos, F., Marín Escribano, J.M.'
WHERE recordedby='Fanny Archila, J. M. Marín'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Marín Escribano, J.M., Archila Gallegos, F.'
WHERE recordedby='J. M. Marín, Fanny Archila'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='López-Sanjuán, R., Martín Jaramillo, J.'
WHERE recordedby='Rogelio López, Javier Martín Jaramillo';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Martín Jaramillo, J.,'
WHERE recordedby='Javier Martín Jaramillo';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Rodríguez, G., Hernández Soto, I.'
WHERE recordedby='Guillermo Rodriguez, Isacio';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Contreras Parody, F., Martín Jaramillo, J.'
WHERE recordedby='Francisco Contreras Parody, Javier Martín Jaramillo';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Hernández Soto, I., Pulido Poyal, C.'
WHERE recordedby='Mentxu, Isacio'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Archila Gallegos, F., Contreras Parody, F.'
WHERE recordedby='Fanny Archila, Francisco Contreras Parody';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Debén Duarte, C.'
WHERE recordedby='Cristina Debén'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Archila Gallegos, F., Galdo Fuentes, P.'
WHERE recordedby='Fanny Archila, Pablo Galdo';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Archila Gallegos, F., Lopera, E.'
WHERE recordedby='Fanny Archila, Emilio Lopera';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Martín Jaramillo, J., Galdo Fuentes, P.'
WHERE recordedby='Javier Martín Jaramillo, Pablo Galdo';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Archila Gallegos, F., Pulido Poyal, C.'
WHERE recordedby='Fanny Archila, Mentxu';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Pulido Poyal, C., Morillas Fernández, D.'
WHERE recordedby='Mentxu, D. Morillar';

UPDATE "dicc_recordedBy_valid"
SET recordedby='López-Sanjuán, R., Foronda, J.'
WHERE recordedby='Rogelio López, Javier Foronda';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Pulido Poyal, C.'
WHERE recordedby='Mentxu';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Contreras Parody, F., Archila Gallegos, F.'
WHERE recordedby='Francisco Contreras Parody, Fanny Archila';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Galdo Fuentes, P., Rodríguez, G., Hernández Soto, I.'
WHERE recordedby='Pablo Galdo, Guillermo Rodriguez, Isacio';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Lopera, E., Archila Gallegos, F.'
WHERE recordedby='Emilio Lopera, Fanny Archila';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Martín Jaramillo, J., Hernández Soto, I.'
WHERE recordedby='Javier Martín Jaramillo, Isacio';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Morillas Fernández, D., López-Sanjuán, R.'
WHERE recordedby='D. Morillar, Rogelio López';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Cobos, L., Martín Jaramillo, J.'
WHERE recordedby='Libertad, Javier Martín Jaramillo';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Contreras Parody, F., Arias Navarro, A.'
WHERE recordedby='Francisco Contreras Parody, Asuncion Arias'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Lozano Rubio, A.J., Galdo Fuentes, P.'
WHERE recordedby='Angel, Pablo Galdo'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Pulido Poyal, C., Martos García, C.'
WHERE recordedby='Mentxu, Cristina Martos'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Contreras Parody, F., Pulido Poyal, C.'
WHERE recordedby='Francisco Contreras Parody, Mentxu'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Contreras Parody, F.'
WHERE recordedby='Juan Pablo, Francisco Contreras Parody'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Bueno de la Rosa, V., Martín Jaramillo, J.'
WHERE recordedby='Verónica, Javier Martín Jaramillo';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Martos García, C., Hernández Soto, I.'
WHERE recordedby='Cristina Martos, Isacio';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Martín Jaramillo, J., Pulido Poyal, C.'
WHERE recordedby='Javier Martín Jaramillo, Mentxu';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Pulido Poyal, C., Debén Duarte, C.'
WHERE recordedby='Mentxu, Cristina Debén'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Debén Duarte, C., Archila Gallegos, F.'
WHERE recordedby='Cristina Debén, Fanny Archila'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Martín Jaramillo, J., López-Sanjuán, R.'
WHERE recordedby='Javier Martín Jaramillo, Rogelio López';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Pulido Poyal, C., Galdo Fuentes, P.'
WHERE recordedby='Mentxu, Pablo Galdo'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Barea-Azcón, J.M.'
WHERE recordedby='Jose Miguel Barea Azcón'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Contreras Parody, F.'
WHERE recordedby='Francisco Contreras Parody'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Galdo Fuentes, P., Hernández Soto, I.'
WHERE recordedby='Pablo Galdo, Isacio'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Martín Jaramillo, J., López Martinez, A.'
WHERE recordedby='Javier Martín Jaramillo, Andrés López';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Martín Jaramillo, J., Martos García, C.'
WHERE recordedby='Javier Martín Jaramillo, Cristina Martos';

UPDATE "dicc_recordedBy_valid"
SET recordedby='Hernández Soto, I., Galdo Fuentes, P.'
WHERE recordedby='Isacio, Pablo Galdo'; 

UPDATE "dicc_recordedBy_valid"
SET recordedby='Galdo Fuentes, P., Foronda, J.'
WHERE recordedby='Pablo Galdo, Javier Foronda';
```

~~NOTE THAT WE NEED TO CONFIRM SOME NAMES~~. Once, we will use `dicc_recordedBy_valid` for the dwc queries. 

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

##### Limit the temporal range 
We selected only records sampled from 01/01/2008. 
* Export the table with updated taxonomy to  `/db/raw_data_from_linaria_corregida.csv` by the query: 
```sql 
SELECT * FROM dis_raw WHERE
/*Temporal constraint*/ dis_raw.fechai > '2007-12-31'; 

```

#### Taxonomic info

We need to create a table (`taxonomy_complete`) in database to store taxonomic info. The sql code to create the table is:

```sql
CREATE TABLE public.taxonomy_complete
(
   id_dicc_especies integer, 
   "Authority" character varying(100), 
   nombre_cientifico character varying(200), 
   kingdom character varying(50), 
   phylum character varying(50), 
   subphylum character varying(100), 
   class character varying(100), 
   "order" character varying(100), 
   family character varying(100), 
   genus character varying(100)
) 
WITH (
  OIDS = FALSE
);
```

Import info about taxonomy from `/data/taxonomy_complete.csv` into taxomomy_complete table of the database. 


Some taxa did not have information about Authority. We updated them with the following queries (using http://www.zoonomen.net/avtax/frame.html):

```sql
UPDATE taxonomy_complete
SET "Authority" = 'Linnaeus, 1758'
WHERE nombre_cientifico='Turdus';

UPDATE taxonomy_complete
SET "Authority" = 'Bechstein, 1805'
WHERE nombre_cientifico='Anthus';

UPDATE taxonomy_complete
SET "Authority" = 'Boie, 1826'
WHERE nombre_cientifico='Phylloscopus';

UPDATE taxonomy_complete
SET "Authority" = 'Scopoli, 1769'
WHERE nombre_cientifico='Sylvia';
```

#### Transect info 

We need to create a table (`transect_info_complete`) in database to store info about transect. The sql code to create the table is:

```sql
CREATE TABLE transect_info_complete
(
  id_transect integer,
  nombre character varying(80),
  longitud numeric(10,4),
  habitat character varying(50),
  "long" numeric(50,8),
  lat numeric(50,8),
  datum character varying(50),
  continent character varying(50),
  country character varying(50),
  province character varying(50),
  town character varying(100),
  "Elevation" integer
)
WITH (
  OIDS=FALSE
);
```

The info to fill this table is located in `/data/transect_info_complete.csv`



## Create SQL Query to match DwC standard 

A manual with the terms of DwC is available at [http://www.sibcolombia.net/repositorio-de-documentos](http://www.sibcolombia.net/repositorio-de-documentos): 

* TDWG (2011). DarwinCore: una guía de referencia rápida. (Versión original producida por TDWG, traducida al idioma español por Escobar, D., Roldan, L.; versión 2.0). Bogotá: SiB Colombia, 33 pp.

Some key fields are: 

* Catalog number: the Catalog number is a combination of observation id and `ADIS` particle. Example: `ADIS-23682`
 * `ADIS` is the collection code abbreviation
 * `23682` is the identifier of the observation (`dis_raw.id`; This idenfitier comes from `adis_avistamiento.id` see above sql code to create `dis_raw` table) 
 
 
* ocurrenceID: Recommended format `urn:catálogo:[código institución]:[códigocolección:[número catálogo].` 
 * `urn:catalog:`
 * `OBSNEV:`
 * `ADIS:`
 * catalog number (`ADIS-`dis_raw.id) 
 

We create a intermediate table (`adis_dwca`) to generate the `occurences` and `measurementorFacts` tables. We obtained 30012 rows. There is a discrepancy between records number of this new table and records of dis_raw. We checked that there is a fail, because there are some visits without recorders. We noticed that with the following sql query:

```sql 
SELECT DISTINCT 
  dis_raw.adis_visita_id 
FROM 
  public.dis_raw LEFT JOIN public."dicc_recordedBy" ON
  dis_raw.adis_visita_id = "dicc_recordedBy_valid".adis_visita_id 
WHERE 
  "dicc_recordedBy".adis_visita_id IS NULL;
```

Anyway, the sql code to generate `adis_dwca` table is: 

We filter to 'Passeriformes' order, then the `adis_dwca` got 27847 records (`select count(*) from adis_dwca;`). 

```sql
CREATE TABLE adis_dwca AS
(SELECT 
/* Recommended format from TDWG 2011 http://www.sibcolombia.net/repositorio-de-documentos */

  CONCAT('urn:catalog:','OBSNEV:','ADIS:','ADIS-', dis_raw.id) AS ocurrenceID,
  now() AS modified,
  'es' AS language,
  'OBSNEV' AS institutionCode, 
  'ADIS' AS collectionCode,
  'humanObservation' AS basisOfRecord, 
  CONCAT('ADIS-', dis_raw.id) AS catalogNumber,
  "dicc_recordedBy_valid".recordedby AS recordedBy, 
  
 /* Temporal Coverage */
  dis_raw.fechai AS eventDate,
  EXTRACT(YEAR FROM dis_raw.fechai) AS year,
  EXTRACT(MONTH FROM dis_raw.fechai) AS month,
  EXTRACT(DAY FROM dis_raw.fechai) AS day,
 
 /* Spatial Coverage */
  transect_info_complete.continent AS continent, 
  transect_info_complete.country AS country, 
  'ESP' AS countryCode,
  'GR' AS stateProvince,
  transect_info_complete.town AS county, 
  transect_info_complete.nombre AS locality, 
  transect_info_complete."Elevation" AS minimumElevationInMeters,
  transect_info_complete."Elevation" AS maximumElevationInMeters,
  ROUND(cast(transect_info_complete."long" as numeric), 5) AS decimalLongitude,
  ROUND(cast(transect_info_complete.lat as numeric), 5) AS decimalLatitude,
  transect_info_complete.datum AS geodeticDatum,
  '5' AS coordinateUncertaintyInMeters,
  
    /* Taxonomic Coverage */ 
  CONCAT(taxonomy_complete.nombre_cientifico, ' ', taxonomy_complete."Authority") AS scientificName,  
  taxonomy_complete.kingdom AS kingdom, 
  taxonomy_complete.phylum AS phylum, 
  taxonomy_complete.class AS class, 
  taxonomy_complete."order" AS order,
  taxonomy_complete.family AS family, 
  taxonomy_complete.genus AS genus, 
  SUBSTRING(taxonomy_complete.nombre_cientifico, strpos(taxonomy_complete.nombre_cientifico, ' ')+1,length(taxonomy_complete.nombre_cientifico)) AS specificEpithet,
  taxonomy_complete."Authority" AS scientificNameAuthorship,
  
  /* Accesory Fields*/
  transect_info_complete.longitud AS longitud_transecto, 
  transect_info_complete.habitat AS habitat, 
  dis_raw.numero AS Bird_numbers, 
  dis_raw.distancia, 
  dis_raw.desplazamiento
FROM 
  public."dicc_recordedBy_valid", 
  public.dis_raw, 
  public.taxonomy_complete, 
  public.transect_info_complete
WHERE 
  /*Temporal constraint*/ dis_raw.fechai > '2007-12-31' AND 
  "dicc_recordedBy_valid".adis_visita_id = dis_raw.adis_visita_id AND
  dis_raw.adis_transecto_id = transect_info_complete.id_transect AND
  dis_raw.id_dicc_especies = taxonomy_complete.id_dicc_especies AND 
  taxonomy_complete."order" = 'Passeriformes');
```


## Generate `occurrences` table

The `occurences` table is created by the query: 

```sql
CREATE TABLE adis_dwc_ocurrences AS
(SELECT 
  m.ocurrenceid,
  m.modified,
  m.language,
  m.institutioncode,
  m.collectioncode,
  m.basisofrecord,
  m.catalognumber,
  m.recordedby,
  m.eventdate, 
  m.year,
  m.month,
  m.day,
  m.continent,
  m.country,
  m.countrycode,
  m.stateprovince,
  m.county,
  m.locality,
  m.minimumelevationinmeters,
  m.maximumelevationinmeters,
  m.decimallongitude,
  m.decimallatitude,
  m.geodeticdatum,
  m.coordinateuncertaintyinmeters,
  m.scientificname,
  m.kingdom,
  m.phylum,
  m.class, 
  m.order, 
  m.family, 
  m.genus, 
  m.specificepithet,
  m.scientificnameauthorship
FROM adis_dwca m); 
```
Export `adis_dwc_ocurrences` table from pgadminIII into `./data/dicc_dwc/occurrences.csv`


## Generate MeasurementOrFacts table

```sql
CREATE TABLE adis_dwc_measurement AS
(
SELECT
  CONCAT(m.ocurrenceid, '-1') AS measurementID,
  m.ocurrenceid,
  m.bird_numbers AS measurementValue,
  'Bird Count' AS measurementType, 
  1 AS measurementAccuracy,
  'number of individuals' AS measurementUnit, 
  m.eventdate AS measurementDeterminedDate,
  m.recordedby AS measurementDeterminedBy,
  'Linear transect. Recording birds on either side (band of 50-width) of the observer' AS measurementMethod
FROM 
  adis_dwca m

UNION ALL 
  
(SELECT
  CONCAT(m.ocurrenceid, '-2') AS measurementID,
  m.ocurrenceid,
  m.desplazamiento AS measurementValue,
  'distance to line-transect' AS measurementType, 
  1 AS measurementAccuracy,
  'm' AS measurementUnit, 
  m.eventdate AS measurementDeterminedDate,
  m.recordedby AS measurementDeterminedBy,
  'Distance of the bird to line estimated by eye' AS measurementMethod
FROM 
  adis_dwca m)
  
ORDER BY ocurrenceid); 
```

Export `adis_dwc_measurement` table from pgadminIII into `./data/dicc_dwc/measurementOrFacts.csv`


