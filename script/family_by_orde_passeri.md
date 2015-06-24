Get Families by Order.
======================

We want to create graphs of the number of records of each family into each order.

We have a file with all the records within the folder `db`, it's called `raw_data_from_linaria_corregida.csv`and also we have other file with the taxonomy within the folder `data`, called `taxonomy.csv`.

These two archives share the same column, id\_dicc\_especies. First we join the taxonomy ranks with the records of all species.

``` r
#di <- '/Users/ajpelu/ownCloud/MS/MS_DP_DISPERSANTES/dp_dispersantes'

di <- '/Users/iecolab/Documents/Lola/dp_dispersantes'

taxonomy <- read.csv(file=paste(di,"/data/taxonomy.csv", sep=""), header=TRUE, sep=",")
raw_data <- read.csv(file=paste(di,"/db/raw_data_from_linaria_corregida.csv", sep=""), header=TRUE, sep=";")
id <- raw_data[,c('id','nombre_cientifico','id_dicc_especies')]
```

Join the records of the species with the taxonomy data.

``` r
library('plyr')
data <- join(id, taxonomy, by='id_dicc_especies')
```

Now, we have all the records with it's taxonomy ranks (`data`). We can get all the records of the Order that we want, we are interested in the order with the highest number of recods (28437), Passeriformes. Then, we save the output as `/data/passeriformes.csv`.

``` r
passeri <- subset(data, order == "Passeriformes")
write.csv(passeri, file = paste(di,"/data/passeriformes.csv", sep=""), row.names=FALSE, quote= FALSE)
```

Finally, we aggregate each record by it's family. We get how many records we have of each family of Passeriformes.

``` r
families_passeri <- aggregate(passeri$id, by=list(passeri$family), length)
names(families_passeri) <- c('Families','records')
families_passeri$per <- round((families_passeri$records/sum(families_passeri$records)*100),2)

write.csv(families_passeri, file = paste(di,"/data/familes_passeri.csv", sep=""), row.names=FALSE, quote= FALSE)

families_passeri
```

    ##          Families records   per
    ## 1    Aegithalidae     492  1.73
    ## 2       Alaudidae    1443  5.07
    ## 3      Certhiidae    1053  3.70
    ## 4       Cinclidae      11  0.04
    ## 5        Corvidae    1461  5.14
    ## 6    Fringillidae    7731 27.19
    ## 7        Laniidae     140  0.49
    ## 8    Motacillidae     575  2.02
    ## 9    Muscicapidae    3771 13.26
    ## 10        Paridae    5601 19.70
    ## 11     Passeridae     204  0.72
    ## 12 Phylloscopidae     609  2.14
    ## 13       Sittidae     489  1.72
    ## 14      Sturnidae       9  0.03
    ## 15      Sylviidae    1248  4.39
    ## 16       Turdidae    3600 12.66

Also, we aggregate each record by it's genus. We get how many records we have of each genus of Passeriformes.

``` r
genus_passeri <- aggregate(passeri$id, by=list(passeri$genus), length)
names(genus_passeri) <- c('Genus','records')
genus_passeri$per <- round((genus_passeri$records/sum(genus_passeri$records)*100),2)

write.csv(genus_passeri, file = paste(di,"/data/genus_passeri.csv", sep=""), row.names=FALSE, quote= FALSE)

genus_passeri
```

    ##             Genus records   per
    ## 1      Aegithalos     492  1.73
    ## 2          Alauda     888  3.12
    ## 3          Anthus     556  1.96
    ## 4       Carduelis    1371  4.82
    ## 5         Certhia     513  1.80
    ## 6         Cinclus      11  0.04
    ## 7  Coccothraustes      20  0.07
    ## 8          Corvus      10  0.04
    ## 9       Cyanistes    2869 10.09
    ## 10       Emberiza    3552 12.49
    ## 11      Erithacus     967  3.40
    ## 12      Fringilla    2443  8.59
    ## 13       Galerida     203  0.71
    ## 14       Garrulus     915  3.22
    ## 15      Hippolais     154  0.54
    ## 16         Lanius     140  0.49
    ## 17    Lophophanes     129  0.45
    ## 18          Loxia      35  0.12
    ## 19        Lullula     352  1.24
    ## 20       Luscinia       3  0.01
    ## 21       Miliaria      20  0.07
    ## 22      Monticola      43  0.15
    ## 23      Motacilla      19  0.07
    ## 24      Muscicapa      18  0.06
    ## 25       Oenanthe    1258  4.42
    ## 26        Oriolus       9  0.03
    ## 27          Parus    1773  6.23
    ## 28         Passer       6  0.02
    ## 29      Periparus     830  2.92
    ## 30       Petronia      16  0.06
    ## 31    Phoenicurus    1235  4.34
    ## 32   Phylloscopus     609  2.14
    ## 33           Pica     413  1.45
    ## 34       Prunella     182  0.64
    ## 35    Pyrrhocorax     114  0.40
    ## 36        Regulus     128  0.45
    ## 37       Saxicola    1260  4.43
    ## 38        Serinus     282  0.99
    ## 39          Sitta     489  1.72
    ## 40         Spinus       8  0.03
    ## 41        Sturnus       9  0.03
    ## 42         Sylvia     966  3.40
    ## 43    Troglodytes     540  1.90
    ## 44         Turdus    2587  9.10
