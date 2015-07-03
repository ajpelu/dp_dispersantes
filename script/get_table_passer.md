We want to generate the table1passer with information about the next fields: nombre\_cientifico, id\_dicc\_especies, Spanish Red List, IUCN Global, Birds Directive, Bern, Born, Authority, English name and Spanish name and save as `./tables/table1passer.md`

We have information of the species `./data/taxa_list_STATUS.csv`. we created this csv by hand with information of the 'Libro Rojo de Aves de España'. To know what species are Passeriformes, we need to add the 'order' column from `./data/taxonomy.csv`

We save this table as `/data/taxa_list_STATUS_passer.csv`. With the tables generator tool, we will create the `table1passer`.

``` r
#di <- '/Users/ajpelu/ownCloud/MS/MS_DP_DISPERSANTES/dp_dispersantes'

di <- '/Users/iecolab/Documents/Lola/dp_dispersantes'

taxonomy <- read.csv(file=paste(di,"/data/taxonomy.csv", sep=""), header=TRUE, sep=",")

##Unimos a la tabla del Status de las especies, la columna orden
tax_status <- read.csv(file=paste(di,"/data/taxa_list_STATUS.csv", sep=""), header=TRUE, sep=",")
order <- taxonomy[,c('order','id_dicc_especies')]
library('plyr')
status_passer <- join(tax_status, order, by='id_dicc_especies')

## Nos quedamos solo con las especies cuyo orden sea passeriformes.
status_passeri <- subset(status_passer,order=="Passeriformes")

#Ahora borramos la columna orden y IUCN.Global. 
status_passeri$order <- NULL
status_passeri$IUCN.Global <- NULL

##Guardamos esta tabla como `/data/taxa_list_STATUS_passer.csv`. Con este archivo, en el generador de tablas crearemos la tabla1passer. 

write.table(status_passeri, file = paste(di,"/data/taxa_list_STATUS_passer.csv", sep=""), row.names=FALSE, quote= FALSE, sep = ";")
```
