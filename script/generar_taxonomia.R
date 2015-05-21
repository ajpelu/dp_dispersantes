install.packages("taxize")
library("taxize")
library(plyr)


datos <- read.csv(file="taxa_list.csv", header=TRUE, sep=",")


#######Taxonomy

get_ids(datos$nombre_cientifico) ##get taxonomic IDs
get_colid(datos$nombre_cientifico)

tnrs(nombre_cientifico) ##get correct spellings. Corrige los que están mal. Me dice que Acanthis cannabina se llama Carduelis cannabina. 

classification(datos$nombre_cientifico, db = 'itis') ##me da la clasificación de cada especie y el id

out<- tax_name(query = datos$nombre_cientifico, get = "family", db = "ncbi")## me da solo el rango taxonómico que le indique. Subkingdom, infrakingdom y superclase no existen.

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

taxonomy <- merge(x = datos2, y = genus[c("genus")], by = "query", all.y = T)





