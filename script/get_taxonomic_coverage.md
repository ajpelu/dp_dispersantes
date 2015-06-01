Our aim is get the taxonomic coverage. First of all, we read our file within all the records (30324), `raw_data_from_linaria_corregida.csv`. This archive is located in the folder `db`. Then, we select the 'id', 'nombre\_cientifico' and 'id\_dicc\_especies' variables.

``` r
#di <- '/Users/ajpelu/ownCloud/MS/MS_DP_DISPERSANTES/dp_dispersantes'

di <- '/Users/iecolab/Documents/Lola/dp_dispersantes'

# Read the archive of the species records
registros <- read.csv(file=paste(di,"/db/raw_data_from_linaria_corregida.csv", sep=""), header=TRUE, sep=";")
reg <- registros[,c('id','nombre_cientifico','id_dicc_especies')]

# Leo datos de cobertura taxonomica (incluir enlace)
taxonomy <- read.csv(file=paste(di,"/data/taxonomy.csv", sep=""), header=TRUE, sep=",")
```

Join the records of the species with the taxonomy data.

``` r
library('plyr')
df <- join(reg, taxonomy, by='id_dicc_especies')
```

Get the taxonomic coverage. We get the number of records of each taxonomy rank and the percentage to total records. Finally, we save the results as a .csv in the folder `/data/taxo_coverage_output`.

``` r
# Orden
orden <- aggregate(df$id, by=list(df$order), length)
names(orden) <- c('Order','records')

orden$per <- round((orden$records/sum(orden$records)*100),2)

#Test that we have 30324 records. 
sum(orden$records)
```

    ## [1] 30324

``` r
write.csv(orden, file = paste(di,"/data/taxo_coverage_output/orden_cov.csv", sep=""), row.names=FALSE, quote= FALSE)

orden 
```

    ##               Order records   per
    ## 1  Caprimulgiformes       6  0.02
    ## 2     Columbiformes     387  1.28
    ## 3     Coraciiformes      18  0.06
    ## 4      Cuculiformes      94  0.31
    ## 5     Falconiformes      60  0.20
    ## 6       Galliformes    1082  3.57
    ## 7     Passeriformes   28437 93.78
    ## 8        Piciformes     190  0.63
    ## 9      Strigiformes       8  0.03
    ## 10      Upupiformes      42  0.14

``` r
# Family
family <- aggregate(df$id, by=list(df$family), length)
names(family) <- c('Family','records')

family$per <- round((family$records/sum(family$records)*100),2)

#Test that we have 30324 records. 
sum(family$records)
```

    ## [1] 30324

``` r
write.csv(family, file = paste(di,"/data/taxo_coverage_output/family_cov.csv", sep=""), row.names=FALSE, quote= FALSE)

family 
```

    ##            Family records   per
    ## 1    Accipitridae       9  0.03
    ## 2    Aegithalidae     492  1.62
    ## 3       Alaudidae    1443  4.76
    ## 4   Caprimulgidae       6  0.02
    ## 5      Certhiidae    1053  3.47
    ## 6       Cinclidae      11  0.04
    ## 7      Columbidae     387  1.28
    ## 8        Corvidae    1461  4.82
    ## 9       Cuculidae      94  0.31
    ## 10     Falconidae      51  0.17
    ## 11   Fringillidae    7731 25.49
    ## 12       Laniidae     140  0.46
    ## 13      Meropidae      18  0.06
    ## 14   Motacillidae     575  1.90
    ## 15   Muscicapidae    3771 12.44
    ## 16        Paridae    5601 18.47
    ## 17     Passeridae     204  0.67
    ## 18    Phasianidae    1082  3.57
    ## 19 Phylloscopidae     609  2.01
    ## 20        Picidae     190  0.63
    ## 21       Sittidae     489  1.61
    ## 22      Strigidae       8  0.03
    ## 23      Sturnidae       9  0.03
    ## 24      Sylviidae    1248  4.12
    ## 25       Turdidae    3600 11.87
    ## 26       Upupidae      42  0.14

``` r
# Genus
genus <- aggregate(df$id, by=list(df$genus), length)
names(genus) <- c('Genus','records')

genus$per <- round((genus$records/sum(genus$records)*100),2)

#Test that we have 30324 records. 
sum(genus$records)
```

    ## [1] 30324

``` r
write.csv(genus, file = paste(di,"/data/taxo_coverage_output/genus_cov.csv", sep=""), row.names=FALSE, quote= FALSE)

genus
```

    ##             Genus records   per
    ## 1       Accipiter       9  0.03
    ## 2      Aegithalos     492  1.62
    ## 3          Alauda     888  2.93
    ## 4       Alectoris    1082  3.57
    ## 5          Anthus     556  1.83
    ## 6          Athene       8  0.03
    ## 7     Caprimulgus       6  0.02
    ## 8       Carduelis    1371  4.52
    ## 9         Certhia     513  1.69
    ## 10        Cinclus      11  0.04
    ## 11       Clamator      10  0.03
    ## 12 Coccothraustes      20  0.07
    ## 13        Columba     380  1.25
    ## 14         Corvus      10  0.03
    ## 15        Cuculus      84  0.28
    ## 16      Cyanistes    2869  9.46
    ## 17    Dendrocopos       2  0.01
    ## 18       Emberiza    3552 11.71
    ## 19      Erithacus     967  3.19
    ## 20          Falco      51  0.17
    ## 21      Fringilla    2443  8.06
    ## 22       Galerida     203  0.67
    ## 23       Garrulus     915  3.02
    ## 24      Hippolais     154  0.51
    ## 25         Lanius     140  0.46
    ## 26    Lophophanes     129  0.43
    ## 27          Loxia      35  0.12
    ## 28        Lullula     352  1.16
    ## 29       Luscinia       3  0.01
    ## 30         Merops      18  0.06
    ## 31       Miliaria      20  0.07
    ## 32      Monticola      43  0.14
    ## 33      Motacilla      19  0.06
    ## 34      Muscicapa      18  0.06
    ## 35       Oenanthe    1258  4.15
    ## 36        Oriolus       9  0.03
    ## 37          Parus    1773  5.85
    ## 38         Passer       6  0.02
    ## 39      Periparus     830  2.74
    ## 40       Petronia      16  0.05
    ## 41    Phoenicurus    1235  4.07
    ## 42   Phylloscopus     609  2.01
    ## 43           Pica     413  1.36
    ## 44          Picus     188  0.62
    ## 45       Prunella     182  0.60
    ## 46    Pyrrhocorax     114  0.38
    ## 47        Regulus     128  0.42
    ## 48       Saxicola    1260  4.16
    ## 49        Serinus     282  0.93
    ## 50          Sitta     489  1.61
    ## 51         Spinus       8  0.03
    ## 52   Streptopelia       7  0.02
    ## 53        Sturnus       9  0.03
    ## 54         Sylvia     966  3.19
    ## 55    Troglodytes     540  1.78
    ## 56         Turdus    2587  8.53
    ## 57          Upupa      42  0.14
