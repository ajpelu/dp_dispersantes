# Generate table of taxa information

We create a table with information about status, protection, etc by taxa. For this purpose: 

* First, we create a list with the taxa included in the database
* Then we fill out a table with information of the taxa from several sources 

### Get list of the taxa 
* SQL Query on the database 

```sql 
SELECT DISTINCT
  dicc_especies.nombre_cientifico, 
  dicc_especies.id AS id_dicc_especies
FROM 
  public.adis_avistamientos, 
  public.adis_especies_dispersantes, 
  public.dicc_especies
WHERE 
  adis_avistamientos.adis_especies_dispersante_id = adis_especies_dispersantes.id AND
  adis_especies_dispersantes.dicc_especie_id = dicc_especies.id;
```

* Export the data and save as `./data/taxa_list.csv` 
