Get family list
---------------

Cargamos la tabla `/taxonomy.csv`

``` r
#Establecer directorio 
di <- '/Users/ajpelu/ownCloud/MS/MS_DP_DISPERSANTES/dp_dispersantes'

#di <- '/Users/iecolab/Documents/Lola/dp_dispersantes'

## Leer datos
datos <- read.csv(file=paste(di,"/data/taxonomy.csv", sep=""), header=TRUE, sep=",")
```

Queremos una lista de todas las familias de aves que tenemos.

``` r
##Convertimos la variable "family"" de factor a character. La ordenamos.

family <- as.character(sort(datos$family))

##Guardamos la tabla como `/family.csv`
write.table(t(family), file = paste(di,"/data/family.csv", sep=""), 
          row.names=FALSE, col.names = FALSE, quote=FALSE, sep=", ")
```
