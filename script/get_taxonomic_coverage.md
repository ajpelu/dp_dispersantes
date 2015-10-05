Get taxonomic coverage
======================

Our aim is get the taxonomic coverage. First of all, we read our occurences file within all the records (27847), `ocurrences.csv`. This archive is located in the folder `data/dicc_dwc/`.

At the same time, we get the taxonomy coverage only of the order Passeriformes, because we will use only these data for our dp. We get the families and genus of Passeriformes.

``` r
library(dplyr) 
```

    ## 
    ## Attaching package: 'dplyr'
    ## 
    ## The following object is masked from 'package:stats':
    ## 
    ##     filter
    ## 
    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
# Set wd 
machine <- 'ajpeluLap'

di <- paste('/Users/', machine, '/ownCloud/MS/MS_DP_DISPERSANTES/dp_dispersantes', sep='')

# di <- '/Users/iecolab/Documents/Lola/dp_dispersantes'

# We work with occurrences table 
df <- read.csv(file=paste(di,"/data/dicc_dwc/ocurrences.csv", sep=""), header=TRUE, sep=";")

# Read the archive of the species records
# registros <- read.csv(file=paste(di,"/db/raw_data_from_linaria_corregida.csv", sep=""), header=TRUE, sep=";")
# reg <- registros[,c('id','nombre_cientifico','id_dicc_especies')]


# Leo datos de cobertura taxonomica (incluir enlace)
# taxonomy <- read.csv(file=paste(di,"/data/taxonomy.csv", sep=""), header=TRUE, sep=",")

# Select only taxonomy info 
df_tax <- df %>% 
  select(order, family, genus, specificepithet) %>%
  mutate(scientific_name_noAutor = paste(genus, specificepithet, sep=' '))
```

For Passeriformes and data from 2008 we got the taxonomic coverage. We got the number of records of each taxonomy rank and the percentage to total records. Finally, we save the results as a `.csv` in the folder `/data/taxo_coverage_output`.

#### Faimlies

``` r
# Family Coverage
fam_cov <- df_tax %>% 
  group_by(family) %>% 
  summarise(n_records=length(scientific_name_noAutor)) %>%
  mutate(per=(n_records/sum(n_records))*100)

write.csv(fam_cov, file = paste(di,"/data/taxo_coverage_output/fam_cov2008.csv", sep=""), row.names=FALSE, quote= FALSE)

# Check n total (27847)
sum(fam_cov$n_records)
```

    ## [1] 27847

#### Genus

``` r
# Genus Coverage
gen_cov <- df_tax %>% 
  group_by(genus) %>% 
  summarise(n_records=length(scientific_name_noAutor)) %>%
  mutate(per=(n_records/sum(n_records))*100)

write.csv(gen_cov, file = paste(di,"/data/taxo_coverage_output/gen_cov2008.csv", sep=""), row.names=FALSE, quote= FALSE)

# Check n total (27847)
sum(gen_cov$n_records)
```

    ## [1] 27847

``` r
gen_cov
```

    ## Source: local data frame [44 x 3]
    ## 
    ##             genus n_records         per
    ## 1      Aegithalos       487  1.74884189
    ## 2          Alauda       886  3.18167128
    ## 3          Anthus       549  1.97148705
    ## 4       Carduelis      1350  4.84791899
    ## 5         Certhia       508  1.82425396
    ## 6         Cinclus        11  0.03950156
    ## 7  Coccothraustes        20  0.07182102
    ## 8          Corvus        10  0.03591051
    ## 9       Cyanistes      2822 10.13394621
    ## 10       Emberiza      3533 12.68718354
    ## ..            ...       ...         ...

#### Species Coverage

``` r
# Sp Coverage
sp_cov <- df_tax %>% 
  group_by(scientific_name_noAutor) %>% 
  summarise(n_records=length(scientific_name_noAutor)) %>%
  mutate(per=(n_records/sum(n_records))*100)

write.csv(sp_cov, file = paste(di,"/data/taxo_coverage_output/sp_cov2008.csv", sep=""), row.names=FALSE, quote= FALSE)

# Check n total (27847)
sum(sp_cov$n_records)
```

    ## [1] 27847

``` r
sp_cov
```

    ## Source: local data frame [74 x 3]
    ## 
    ##    scientific_name_noAutor n_records        per
    ## 1      Aegithalos caudatus       487 1.74884189
    ## 2          Alauda arvensis       886 3.18167128
    ## 3            Anthus Anthus        28 0.10054943
    ## 4        Anthus campestris       508 1.82425396
    ## 5        Anthus spinoletta        13 0.04668366
    ## 6      Carduelis cannabina      1227 4.40621970
    ## 7      Carduelis carduelis        86 0.30883039
    ## 8        Carduelis chloris        37 0.13286889
    ## 9    Certhia brachydactyla       508 1.82425396
    ## 10         Cinclus cinclus        11 0.03950156
    ## ..                     ...       ...        ...

``` r
# Our aim is get the taxonomic coverage. First of all, we read our file within all the records (30324), `raw_data_from_linaria_corregida.csv`. This archive is located in the folder `db`. Then, we select the 'id', 'nombre_cientifico' and 'id_dicc_especies' variables.
# 
# At the same time, we get the taxonomy coverage only of the order Passeriformes, because we will use only these data for our dp. We get the families and genus of Passeriformes. 


# # Join the records of the species with the taxonomy data. 
# 
# 
# library('plyr')
# df <- join(reg, taxonomy, by='id_dicc_especies')
# 
# 
# Get the taxonomic coverage. We get the number of records of each taxonomy rank and the percentage to total records. Finally, we save the results as a `.csv` in the folder `/data/taxo_coverage_output`.
# 
# 
# # Orden
# orden <- aggregate(df$id, by=list(df$order), length)
# names(orden) <- c('Order','records')
# 
# orden$per <- round((orden$records/sum(orden$records)*100),2)
# 
# #Test that we have 30324 records. 
# sum(orden$records)
#               
# write.csv(orden, file = paste(di,"/data/taxo_coverage_output/orden_cov.csv", sep=""), row.names=FALSE, quote= FALSE)
# 
# # Family
# family <- aggregate(df$id, by=list(df$family), length)
# names(family) <- c('Family','records')
# 
# family$per <- round((family$records/sum(family$records)*100),2)
# 
# #Test that we have 30324 records. 
# sum(family$records)
#               
# write.csv(family, file = paste(di,"/data/taxo_coverage_output/family_cov.csv", sep=""), row.names=FALSE, quote= FALSE)
# 
# 
# # Families of Passeriformes. 
# 
# #en df tenemos todos los registros. Queremos coger solo aquellos en los que el orden sea passeriformes. 
# dfpasser <- subset(df,order=="Passeriformes")
# familypasser <- aggregate(dfpasser$id, by=list(dfpasser$family), length)
# names(familypasser) <- c('Family','records')
# 
# familypasser$per <- round((familypasser$records/sum(familypasser$records)*100),2)
# 
# #Test that we have 28437 records. 
# sum(familypasser$records)
#               
# write.csv(familypasser, file = paste(di,"/data/taxo_coverage_output/passerfamily_cov.csv", sep=""), row.names=FALSE, quote= FALSE)
# 
# familypasser 
# 
# # Genus
# genus <- aggregate(df$id, by=list(df$genus), length)
# names(genus) <- c('Genus','records')
# 
# genus$per <- round((genus$records/sum(genus$records)*100),2)
# 
# #Test that we have 28437 records. 
# sum(genus$records)
#               
# write.csv(genus, file = paste(di,"/data/taxo_coverage_output/genus_cov.csv", sep=""), row.names=FALSE, quote= FALSE, sep="")
# 
# 
# # Genus of Passeriformes. 
# 
# genuspasser <- aggregate(dfpasser$id, by=list(dfpasser$genus), length)
# names(genuspasser) <- c('Genus','records')
# 
# genuspasser$per <- round((genuspasser$records/sum(genuspasser$records)*100),2)
# 
# #Test that we have 28437 records. 
# sum(genuspasser$records)
#               
# write.csv(family, file = paste(di,"/data/taxo_coverage_output/passergenus_cov.csv", sep=""), row.names=FALSE, quote= FALSE)
# 
# genuspasser 
```
