# TODO TASK 

In this list we annotate the tasks and their status. We'll label each task with a symbol to view the status of the task. 

* :red_circle: 
* :white_check_mark:
* :large_orange_diamond:

Please, strike out a task when it is finished. For this purpose use `~~` both at the begining and the end of the text. 

Example: If you type `~~This is a finished task~~` you get ~~This is a finished task~~

--- 

## DarwinCore-Related Task 
## Database   
* :white_check_mark: ~~Creation of the database with tables (@ajpelu)~~
* :large_orange_diamond: Import raw data into database:
  * :white_check_mark:~~Observations (@ajpelu)~~
  * :white_check_mark:~~Transects info~~ We created a table called `transects_info.csv` with the next fields: id_transecto, nombre, longitud, habitat, long, lat, datum, continent, country, province, town.
* :white_check_mark: Create query to generate Dwc-occurrences and Dwc-measurementOrFActs

### Taxonomic Coverage 
* :white_check_mark: ~~Create a table with taxonomic coverage (taxonomic ranks) using `taxize` package.~~ 
* :white_check_mark: ~~Complete the table with `Authorship`. See [World Bird Names](http://www.worldbirdnames.org). We added the common names in spanish with information of [Lista de Aves de España 2012, SEO Birdlife] (http://www.seo.org/wp-content/uploads/2012/10/Lista_-Aves_Espana_2012.pdf)~~


## Metadata-Related Task
### Figures 
#### :white_check_mark: ~~Create a location map with information about transects~~ 
I created two maps using ArcGIS, one of Sierra Nevada (with the transects) and other of the Iberian Peninsula. 

### Tables 

* :white_check_mark: ~~Format table of status (taxonomic info) with `md`. See [tables generator](http://www.tablesgenerator.com/markdown_tables)~~

* :white_check_mark:~~Creat a table with info of the transects with two targets: metadata table and Dwc-occurrences table.~~

### Document structure 
* :white_check_mark: ~~Create a `md` file with the structure of the DP. See this [example](https://github.com/peterdesmet/vascan-data-paper/blob/master/paper.md)~~ 
We create a file called `datapaperv1.md`.

### Taxonomic Status
#### :large_orange_diamond: Create a table with the protection status of the taxa
We have to complete the IUCN Global Status column.
* :white_check_mark: ~~Get list of taxa~~. See [this script](https://github.com/ajpelu/dp_dispersantes/blob/master/script/get_taxalist.md)
* :white_check_mark: ~~Fill out a table with status, protection, etc.~~ 

We have to fix:
* A duplicate record. The species *Acanthis cannabina*, now is called *Carduelis cannabina*. We have data from the two records and actually is the same species.

* We have to change the name of *Serinus citrinella* that now is called *Carduelis citrinella*, *Periparus ater* that now is called *Parus ater* and *Cyanistes caeruleus* now is called *Parus caeruleus*.


