Complete the transect information
=================================

``` r
#di <- '/Users/ajpelu/ownCloud/MS/MS_DP_DISPERSANTES/dp_dispersantes'

di <- '/Users/iecolab/Documents/Lola/dp_dispersantes'

# Read the archive of the transect information. Note that we change the encoding. 
transectos <- read.table(file=paste(di,"/data/transectos.csv", sep=""), header=TRUE, sep=",", fileEncoding='UTF-8')
```

Create a variable called continent, country, province and town. We get the information of the towns adding a shape file of towns on our map and exploring it. We save it as `/data/transects_info.csv`.

``` r
transectos$continent <- rep('Europe', nrow(transectos))

transectos$country <- rep('Spain', nrow(transectos))

transectos$province <- rep('Granada', nrow(transectos))

town <- data.frame(id_transecto=c(2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17),
                   town=c("Cáñar","Dúrcal","Dílar","Monachil","Monachil","Güejar Sierra","Güejar Sierra",
          "Güejar Sierra","Güejar Sierra","Güejar Sierra","Lugros", "Lanteira",
          "Huéneja","Capileira","Güejar Sierra","Güejar Sierra"))

transects_info <- merge(transectos,town, by="id_transecto")

write.csv(transects_info, file = paste(di,"/data/transects_info.csv", sep=""), row.names=FALSE, quote= FALSE)
```
