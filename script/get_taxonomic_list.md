Get taxonomic lists
-------------------

Cargamos la tabla `/taxonomy.csv`

``` r
#Establecer directorio 
#di <- '/Users/ajpelu/ownCloud/MS/MS_DP_DISPERSANTES/dp_dispersantes'

di <- '/Users/iecolab/Documents/Lola/dp_dispersantes'

## Leer datos
datos <- read.csv(file=paste(di,"/data/taxonomy.csv", sep=""), header=TRUE, sep=",")
```

Creamos una lista de todas las familias, órdenes y géneros de aves que tenemos, la guardamos como `/family.csv` `/order.csv`y `/genus.csv` respectivamente.

``` r
##Convertimos la variable "family"" de factor a character. La ordenamos.

family <- as.character(sort(datos$family))

##Guardamos la tabla como `/family.csv`
write.table(t(family), file = paste(di,"/data/family.csv", sep=""), 
          row.names=FALSE, col.names = FALSE, quote=FALSE, sep=", ")

## Hacemos lo mismo con los órdenes

order<- as.character(sort(datos$order))

##Guardamos la tabla como `/order.csv`
write.table(t(order), file = paste(di,"/data/order.csv", sep=""), 
          row.names=FALSE, col.names = FALSE, quote=FALSE, sep=", ")


## Y con los géneros

genus<- as.character(sort(datos$genus))

##Guardamos la tabla como `/order.csv`
write.table(t(genus), file = paste(di,"/data/genus.csv", sep=""), 
          row.names=FALSE, col.names = FALSE, quote=FALSE, sep=", ")
```
