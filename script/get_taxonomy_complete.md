Add the column Authority to the taxonomy table. Joining the column "Authority" of the `taxa_author.csv`with the `taxonomy.csv`. We will use this table for the Occurences query.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

``` r
#di <- '/Users/ajpelu/ownCloud/MS/MS_DP_DISPERSANTES/dp_dispersantes'

di <- '/Users/iecolab/Documents/Lola/dp_dispersantes'

taxonomia <- read.csv(file=paste(di,"/data/taxonomy.csv", sep=""), header=TRUE, sep=",")
author <- read.csv(file=paste(di,"/data/taxa_author.csv", sep=""), header=TRUE, sep=",")

library('plyr')

aut<- author[,c('id_dicc_especies', 'Authority')]

taxaauthor <- join(aut, taxonomia, by='id_dicc_especies')

write.table(taxaauthor, file = paste(di,"/data/taxonomy_complete.csv", sep=""), row.names=FALSE, quote= FALSE, sep =";")
```
