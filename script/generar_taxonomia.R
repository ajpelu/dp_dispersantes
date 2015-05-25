
## Load packages
install.packages("taxize")
library("taxize")
library(plyr)

## Directorio 
di <- '/Users/ajpelu/ownCloud/MS/MS_DP_DISPERSANTES/dp_dispersantes'

## Leer datos
datos <- read.csv(file=paste(di,"/data/taxa_list.csv", sep=""), header=TRUE, sep=",")


#######Taxonomy

get_ids(datos$nombre_cientifico) ##get taxonomic IDs
get_colid(datos$nombre_cientifico)

tnrs(nombre_cientifico) ##get correct spellings. Corrige los que están mal. Me dice que Acanthis cannabina se llama Carduelis cannabina. 

classification(datos$nombre_cientifico, db = 'itis') ##me da la clasificación de cada especie y el id

family<- tax_name(query = datos$nombre_cientifico, get = "family", db = "ncbi")## me da solo el rango taxonómico que le indique. Subkingdom, infrakingdom y superclase no existen.

genus<- tax_name(query = datos$nombre_cientifico, get = "genus", db = "ncbi")

order<- tax_name(query = datos$nombre_cientifico, get = "order", db = "ncbi")

class<- tax_name(query = datos$nombre_cientifico, get = "class", db = "ncbi")

subphylum<- tax_name(query = datos$nombre_cientifico, get = "subphylum", db = "ncbi")

phylum<- tax_name(query = datos$nombre_cientifico, get = "phylum", db = "ncbi")

kingdom<- tax_name(query = datos$nombre_cientifico, get = "kingdom", db = "ncbi")


#juntamos las dos bases de datos con la función merge().
##Para unir los dos data frames, tienen que tener una columna en común. Por eso añado al data frame "datos" una columna llamada query.

query=vector(mode='character', length=5)
query<- c(1:90)
datos2=data.frame(datos,query)
datos2$query <- as.character (datos2$query)


taxonomy<- merge(x = datos2, y = genus[c("genus")], by = "query", all.y = T)## Lo quería hacer así para juntar solo la columna "genus", pero me da error, así que junto las dos tablas y luego eliminaré las columnas que sobren. 
taxonomy <- merge(datos2, genus, by ="query", all.y = T)
taxonomy <- merge(taxonomy, family, by ="query", all.y = T)
taxonomy <- merge(taxonomy, order, by ="query", all.y = T)
taxonomy <- merge(taxonomy, class, by ="query", all.y = T)
taxonomy <- merge(taxonomy, subphylum, by ="query", all.y = T)
taxonomy <- merge(taxonomy, phylum, by ="query", all.y = T)
taxonomy <- merge(taxonomy, kingdom, by ="query", all.y = T)

##Eliminar filas que sobran
taxonomy<- taxonomy[ , -23]
taxonomy<- taxonomy[ , -21]
taxonomy<- taxonomy[ , -19]
taxonomy<- taxonomy[ , -17]
taxonomy<- taxonomy[ , -15]
taxonomy<- taxonomy[ , -13]
taxonomy<- taxonomy[ , -11]

##guardar como csv

write.csv(taxonomy, file = "taxonomy.csv")
