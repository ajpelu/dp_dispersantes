##Tabla 2. Transects info.
# Generate table of transects information
We create a table with information about the transects of our study (id_transecto, nombre, longitud, habitat, long, lat, datum, continent, country, province, town, elevation). 
The process to achieve this table is in `script/transecto_info.md`.

* To create this table, we use `/data/transects_info_complete.csv`.

We generate the table2 and save as `./tables/table2_transectinfo.md`

| id_transec | nombre                  | longitud  | habitat  | long              | lat              | datum     | continent | country | province | town          | Elevation |
|------------|-------------------------|-----------|----------|-------------------|------------------|-----------|-----------|---------|----------|---------------|-----------|
| 2          | Robledal de Cáñar       | 2556.5298 | Robledal | -3.42922477432114 | 36.9532887435748 | EPSG:4326 | Europe    | Spain   | Granada  | Cáñar         | 1736      |
| 3          | Dehesa del Río Dúrcal   | 3292.0968 | Matorral | -3.4825484185117  | 37.0255219615825 | EPSG:4326 | Europe    | Spain   | Granada  | Dúrcal        | 2033      |
| 4          | Robledal de Dílar       | 2553.5233 | Robledal | -3.4779923344565  | 37.0582435559381 | EPSG:4326 | Europe    | Spain   | Granada  | Dílar         | 1605      |
| 5          | Collado de Matas Verdes | 2237.8476 | Matorral | -3.44706525163785 | 37.0909104320862 | EPSG:4326 | Europe    | Spain   | Granada  | Monachil      | 1918      |
| 6          | El Purche               | 1944.6154 | Matorral | -3.47800522790772 | 37.1311703196516 | EPSG:4326 | Europe    | Spain   | Granada  | Monachil      | 1453      |
| 7          | Collado del Sabinar     | 2745.7166 | Enebral  | -3.41847579389466 | 37.1199648466673 | EPSG:4326 | Europe    | Spain   | Granada  | Güejar Sierra | 2036      |
| 8          | Campos de Otero         | 2264.3894 | Enebral  | -3.39303899145178 | 37.110002259989  | EPSG:4326 | Europe    | Spain   | Granada  | Güejar Sierra | 2143      |
| 9          | Cortijo del Hornillo    | 3044.1891 | Robledal | -3.36805976575712 | 37.1246708701512 | EPSG:4326 | Europe    | Spain   | Granada  | Güejar Sierra | 1585      |
| 10         | Loma Papeles            | 2539.1295 | Enebral  | -3.34016301032019 | 37.1434473847064 | EPSG:4326 | Europe    | Spain   | Granada  | Güejar Sierra | 2113      |
| 11         | Dehesa de las Hoyas     | 2436.9556 | Enebral  | -3.31736455361945 | 37.1724322915398 | EPSG:4326 | Europe    | Spain   | Granada  | Güejar Sierra | 2074      |
| 12         | Dehesa del Camarate     | 2805.2497 | Robledal | -3.25376437527153 | 37.179745620126  | EPSG:4326 | Europe    | Spain   | Granada  | Lugros        | 1575      |
| 13         | Lanteira                | 2515.5455 | Matorral | -3.17253571891539 | 37.1409148327318 | EPSG:4326 | Europe    | Spain   | Granada  | Lanteira      | 1794      |
| 14         | Laguna Seca             | 2530.9713 | Altas    | -2.96153251681199 | 37.0992089463673 | EPSG:4326 | Europe    | Spain   | Granada  | Huéneja       | 2295      |
| 15         | Aguas Verdes            | 2431.8785 | Altas    | -3.35893193419854 | 37.0540490753807 | EPSG:4326 | Europe    | Spain   | Granada  | Capileira     | 3149      |
| 16         | Hoya Mora               | 2046.6233 | Altas    | -3.37719365945146 | 37.0896246101516 | EPSG:4326 | Europe    | Spain   | Granada  | Güejar Sierra | 2407      |
| 17         | Papeles alto            | 2309.5885 | Altas    | -3.30981228543378 | 37.1357062152652 | EPSG:4326 | Europe    | Spain   | Granada  | Güejar Sierra | 2420      |


We have to do some changes in `/data/transects_info_complete.csv`to get the final table. This changes are:

* 1. Delete the next columns: country, continent, datum and id_transect. 
* 2. Change the names of the columns. 
* 3. Change the name of Habitats: Robledal -> Forest, Matorral -> Shrub, Altas -> Summit
* 4. Round values of longitude (transect) and longitude and latitude (coordinates). 
* 5. Finally, we export the csv. as `/data/transects_info_table.csv`.

The final table that we include in the data paper is:

| Location                | Lenght | Habitat | Longitude | Latitude | Town          | Elevation |
|-------------------------|--------|---------|-----------|----------|---------------|-----------|
| Robledal de Cáñar       | 2557   | Forest  | -3.42922  | 36.95329 | Cáñar         | 1736      |
| Dehesa del Río Dúrcal   | 3292   | Shrub   | -3.48255  | 37.02552 | Dúrcal        | 2033      |
| Robledal de Dílar       | 2554   | Forest  | -3.47799  | 37.05824 | Dílar         | 1605      |
| Collado de Matas Verdes | 2238   | Shrub   | -3.44707  | 37.09091 | Monachil      | 1918      |
| El Purche               | 1945   | Shrub   | -3.47801  | 37.13117 | Monachil      | 1453      |
| Collado del Sabinar     | 2746   | Shrub   | -3.41848  | 37.11996 | Güejar Sierra | 2036      |
| Campos de Otero         | 2264   | Shrub   | -3.39304  | 37.11    | Güejar Sierra | 2143      |
| Cortijo del Hornillo    | 3044   | Forest  | -3.36806  | 37.12467 | Güejar Sierra | 1585      |
| Loma Papeles            | 2539   | Shrub   | -3.34016  | 37.14345 | Güejar Sierra | 2113      |
| Dehesa de las Hoyas     | 2437   | Shrub   | -3.31736  | 37.17243 | Güejar Sierra | 2074      |
| Dehesa del Camarate     | 2805   | Forest  | -3.25376  | 37.17975 | Lugros        | 1575      |
| Lanteira                | 2516   | Shrub   | -3.17254  | 37.14091 | Lanteira      | 1794      |
| Laguna Seca             | 2531   | Summit  | -2.96153  | 37.09921 | Huéneja       | 2295      |
| Aguas Verdes            | 2432   | Summit  | -3.35893  | 37.05405 | Capileira     | 3149      |
| Hoya Mora               | 2047   | Summit  | -3.37719  | 37.08962 | Güejar Sierra | 2407      |
| Papeles alto            | 2310   | Summit  | -3.30981  | 37.13571 | Güejar Sierra | 2420      |