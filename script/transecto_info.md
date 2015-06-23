This is the process to achive a table with information about the transect.
--------------------------------------------------------------------------

First, we complete the transect information

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

write.csv(transects_info, file = paste(di,"/data/transects_info.csv", sep=""), row.names=FALSE, quote= FALSE, fileEncoding='UTF-8')
```

Then, we need to add the elevational values. We get these values with Qgis. This is the process:

-   1.  Read the `/data/transects_info.csv`
-   1.  Create a shape file of points, x= long y =lat. This shape is called `/geoinfo/coordenates.shp`. The coordenate reference is EPSG 4326. The encoding is UTF 8.
-   1.  Reproject to EPSG 23030. And save as `/geoinfo/coordenates_Project.shp` (Note that we write coordenate, but actually it is correct to say coordinate).
-   1.  Read the MDE shape file, `\\NAS-IECOLAB\cartografia\Informacion_Ambiental\CARTO_TEMATICA\Medio_biofisico\Relieve\mde_10m_cma`. Now we have a raster shape with elevational values and the coordenates of our points.
-   1.  With the extension Point sampling tools, we generate a new shape file `/geoinfo/trans_altvalida.shp`. In the attributes of this shape we can see the information of the transect and one new column, the elevational values.
-   1.  Export the shape file `data/transects_info_altura.csv`.
