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
* :white_check_mark: Import raw data into database:
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

  We did some changes in the table called `transects_info.csv` to get the final table that we include in the data paper. These changes are described in the script `script/transecto_info.Rmd`.

### Document structure 
* :white_check_mark: ~~Create a `md` file with the structure of the DP. See this [example](https://github.com/peterdesmet/vascan-data-paper/blob/master/paper.md)~~ 
We create a file called `datapaperv1.md`.

### Taxonomic Status
#### :white_check_mark: Create a table with the protection status of the taxa
* :white_check_mark: ~~Get list of taxa~~. See [this script](https://github.com/ajpelu/dp_dispersantes/blob/master/script/get_taxalist.md)
* :white_check_mark: ~~Fill out a table with status, protection, etc.~~ 

We have to fix:
*~~ A duplicate record. The species *Acanthis cannabina*, now is called *Carduelis cannabina*. We have data from the two records and actually is the same species.~~


* :red_circle: ANTONIO. Check this. I think maybe it is not important, but I noticed these mistakes. There are some species that changed their names. I found this information in the European Red List of Birds (https://ec.europa.eu/environment/nature/conservation/species/redlist/downloads/European_birds.pdf). 

This species are the next: 
* *Serinus citrinella* now is called *Carduelis citrinella* 
* *Periparus ater* now is called *Parus ater*
* *Cyanistes caeruleus* now is called *Parus caeruleus*
* *Saxicola torquata* now is called *Saxicola torquatus*
* *Lophophanes cristatus* now is called *Parus cristatus*