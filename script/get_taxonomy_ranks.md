Primer cargo los paquetes

``` r
# Load packages 
# install.packages("taxize")
library("taxize")
```

    ## 
    ## 
    ## New to taxize? Tutorial at http://ropensci.org/tutorials/taxize_tutorial.html 
    ## citation(package='taxize') for the citation for this package 
    ## API key names have changed. Use tropicosApiKey, eolApiKey, ubioApiKey, and pmApiKey in your .Rprofile file. 
    ## Use suppressPackageStartupMessages() to suppress these startup messages in the future

``` r
library(plyr)
```

Establezco el directorio y leo el archivo de datos.

``` r
# Directorio 
di <- '/Users/ajpelu/ownCloud/MS/MS_DP_DISPERSANTES/dp_dispersantes'

## Leer datos
datos <- read.csv(file=paste(di,"/data/taxa_list.csv", sep=""), header=TRUE, sep=",")
```

Ahora utilizo el paquet tal y obtengo una tabla que la exporto en tal directorio... `./data/fasdf`

``` r
### Obtener tabla con jerarquia taxonomica 
jerarquia <- cbind(id_dicc_especies=datos$id_dicc_especies, 
                   nombre_cientifico=datos$nombre_cientifico,
                   tax_name(query = datos$nombre_cientifico, 
                      get=c("kingdom", "phylum", "subphylum", "class", "order", "family", "genus"), 
                      db="both")) 
```

    ## 
    ## Retrieving data for taxon 'Anthus campestris'
    ## 
    ## 
    ## Retrieving data for taxon 'Anthus campestris'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Anthus campestris
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=558640
    ## 
    ## Retrieving data for taxon 'Coccothraustes coccothraustes'
    ## 
    ## 
    ## Retrieving data for taxon 'Coccothraustes coccothraustes'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Coccothraustes coccothraustes
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=179170
    ## 
    ## Retrieving data for taxon 'Sturnus unicolor'
    ## 
    ## 
    ## Retrieving data for taxon 'Sturnus unicolor'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Sturnus unicolor
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=563175
    ## 
    ## Retrieving data for taxon 'Accipiter gentilis'
    ## 
    ## 
    ## Retrieving data for taxon 'Accipiter gentilis'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Accipiter gentilis
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=175300
    ## 
    ## Retrieving data for taxon 'Parus major'
    ## 
    ## 
    ## Retrieving data for taxon 'Parus major'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Parus major
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=561864
    ## 
    ## Retrieving data for taxon 'Upupa epops'
    ## 
    ## 
    ## Retrieving data for taxon 'Upupa epops'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Upupa epops
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=178117
    ## 
    ## Retrieving data for taxon 'Petronia petronia'
    ## 
    ## 
    ## Retrieving data for taxon 'Petronia petronia'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Petronia petronia
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=561948
    ## 
    ## Retrieving data for taxon 'Turdus merula'
    ## 
    ## 
    ## Retrieving data for taxon 'Turdus merula'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Turdus merula
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=179757
    ## 
    ## Retrieving data for taxon 'Alauda arvensis'
    ## 
    ## 
    ## Retrieving data for taxon 'Alauda arvensis'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Alauda arvensis
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=178398
    ## 
    ## Retrieving data for taxon 'Pica pica'
    ## 
    ## 
    ## Retrieving data for taxon 'Pica pica'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Pica pica
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=179720
    ## 
    ## Retrieving data for taxon 'Dendrocopos major'
    ## 
    ## 
    ## Retrieving data for taxon 'Dendrocopos major'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Dendrocopos major
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=554048
    ## 
    ## Retrieving data for taxon 'Falco tinnunculus'
    ## 
    ## 
    ## Retrieving data for taxon 'Falco tinnunculus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Falco tinnunculus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=175620
    ## 
    ## Retrieving data for taxon 'Emberiza cia'
    ## 
    ## 
    ## Retrieving data for taxon 'Emberiza cia'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Emberiza cia
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=559875
    ## 
    ## Retrieving data for taxon 'Athene noctua'
    ## 
    ## 
    ## Retrieving data for taxon 'Athene noctua'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Athene noctua
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=555471
    ## 
    ## Retrieving data for taxon 'Turdus iliacus'
    ## 
    ## 
    ## Retrieving data for taxon 'Turdus iliacus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Turdus iliacus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=179769
    ## 
    ## Retrieving data for taxon 'Lanius excubitor'
    ## 
    ## 
    ## Retrieving data for taxon 'Lanius excubitor'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Lanius excubitor
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=178511
    ## 
    ## Retrieving data for taxon 'Fringilla coelebs'
    ## 
    ## 
    ## Retrieving data for taxon 'Fringilla coelebs'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Fringilla coelebs
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=179168
    ## 
    ## Retrieving data for taxon 'Oenanthe oenanthe'
    ## 
    ## 
    ## Retrieving data for taxon 'Oenanthe oenanthe'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Oenanthe oenanthe
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=179814
    ## 
    ## Retrieving data for taxon 'Loxia curvirostra'
    ## 
    ## 
    ## Retrieving data for taxon 'Loxia curvirostra'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Loxia curvirostra
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=179259
    ## 
    ## Retrieving data for taxon 'Corvus corax'
    ## 
    ## 
    ## Retrieving data for taxon 'Corvus corax'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Corvus corax
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=179725
    ## 
    ## Retrieving data for taxon 'Turdus viscivorus'
    ## 
    ## 
    ## Retrieving data for taxon 'Turdus viscivorus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Turdus viscivorus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=563619
    ## 
    ## Retrieving data for taxon 'Phylloscopus'
    ## 
    ## 
    ## Retrieving data for taxon 'Phylloscopus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Phylloscopus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=179840
    ## 
    ## Retrieving data for taxon 'Troglodytes troglodytes'
    ## 
    ## 
    ## Retrieving data for taxon 'Troglodytes troglodytes'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Troglodytes troglodytes
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=178547
    ## 
    ## Retrieving data for taxon 'Columba palumbus'
    ## 
    ## 
    ## Retrieving data for taxon 'Columba palumbus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Columba palumbus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=177103
    ## 
    ## Retrieving data for taxon 'Motacilla alba'
    ## 
    ## 
    ## Retrieving data for taxon 'Motacilla alba'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Motacilla alba
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=178476
    ## 
    ## Retrieving data for taxon 'Clamator glandarius'
    ## 
    ## 
    ## Retrieving data for taxon 'Clamator glandarius'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Clamator glandarius
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=554674
    ## 
    ## Retrieving data for taxon 'Carduelis cannabina'
    ## 
    ## 
    ## Retrieving data for taxon 'Carduelis cannabina'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Carduelis cannabina
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=559043
    ## 
    ## Retrieving data for taxon 'Anthus spinoletta'
    ## 
    ## 
    ## Retrieving data for taxon 'Anthus spinoletta'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Anthus spinoletta
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=178489
    ## 
    ## Retrieving data for taxon 'Miliaria calandra'
    ## 
    ## 
    ## Retrieving data for taxon 'Miliaria calandra'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Miliaria calandra
    ## Not found. Consider checking the spelling or alternate classification
    ## No TSN found for species 'Miliaria calandra'!
    ## 
    ## 
    ## Retrieving data for taxon 'Carduelis carduelis'
    ## 
    ## 
    ## Retrieving data for taxon 'Carduelis carduelis'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Carduelis carduelis
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=179226
    ## 
    ## Retrieving data for taxon 'Alectoris rufa'
    ## 
    ## 
    ## Retrieving data for taxon 'Alectoris rufa'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Alectoris rufa
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=175913
    ## 
    ## Retrieving data for taxon 'Sylvia communis'
    ## 
    ## 
    ## Retrieving data for taxon 'Sylvia communis'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Sylvia communis
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=563188
    ## 
    ## Retrieving data for taxon 'Saxicola rubetra'
    ## 
    ## 
    ## Retrieving data for taxon 'Saxicola rubetra'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Saxicola rubetra
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=562837
    ## 
    ## Retrieving data for taxon 'Motacilla cinerea'
    ## 
    ## 
    ## Retrieving data for taxon 'Motacilla cinerea'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Motacilla cinerea
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=178480
    ## 
    ## Retrieving data for taxon 'Lullula arborea'
    ## 
    ## 
    ## Retrieving data for taxon 'Lullula arborea'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Lullula arborea
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=560894
    ## 
    ## Retrieving data for taxon 'Cuculus canorus'
    ## 
    ## 
    ## Retrieving data for taxon 'Cuculus canorus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Cuculus canorus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=177822
    ## 
    ## Retrieving data for taxon 'Valor nulo'
    ## 
    ## Not found. Consider checking the spelling or alternate classification
    ## No UID found for species 'Valor nulo'!
    ## 
    ## 
    ## Retrieving data for taxon 'Valor nulo'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Valor nulo
    ## No TSN found for species 'Valor nulo'!
    ## 
    ## 
    ## Retrieving data for taxon 'Sylvia conspicillata'
    ## 
    ## 
    ## Retrieving data for taxon 'Sylvia conspicillata'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Sylvia conspicillata
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=563189
    ## 
    ## Retrieving data for taxon 'Sylvia'
    ## 
    ## 
    ## Retrieving data for taxon 'Sylvia'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Sylvia
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=558266
    ## 
    ## Retrieving data for taxon 'Garrulus glandarius'
    ## 
    ## 
    ## Retrieving data for taxon 'Garrulus glandarius'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Garrulus glandarius
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=560214
    ## 
    ## Retrieving data for taxon 'Cinclus cinclus'
    ## 
    ## 
    ## Retrieving data for taxon 'Cinclus cinclus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Cinclus cinclus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=559287
    ## 
    ## Retrieving data for taxon 'Carduelis chloris'
    ## 
    ## 
    ## Retrieving data for taxon 'Carduelis chloris'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Carduelis chloris
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=559044
    ## 
    ## Retrieving data for taxon 'Galerida theklae'
    ## 
    ## 
    ## Retrieving data for taxon 'Galerida theklae'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Galerida theklae
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=560134
    ## 
    ## Retrieving data for taxon 'Picus viridis'
    ## 
    ## 
    ## Retrieving data for taxon 'Picus viridis'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Picus viridis
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=554121
    ## 
    ## Retrieving data for taxon 'Sylvia atricapilla'
    ## 
    ## 
    ## Retrieving data for taxon 'Sylvia atricapilla'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Sylvia atricapilla
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=563183
    ## 
    ## Retrieving data for taxon 'Muscicapa striata'
    ## 
    ## 
    ## Retrieving data for taxon 'Muscicapa striata'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Muscicapa striata
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=561250
    ## 
    ## Retrieving data for taxon 'Turdus torquatus'
    ## 
    ## 
    ## Retrieving data for taxon 'Turdus torquatus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Turdus torquatus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=563617
    ## 
    ## Retrieving data for taxon 'Acanthis cannabina'
    ## 
    ## Not found. Consider checking the spelling or alternate classification
    ## No UID found for species 'Acanthis cannabina'!
    ## 
    ## 
    ## Retrieving data for taxon 'Acanthis cannabina'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Acanthis cannabina
    ## No TSN found for species 'Acanthis cannabina'!
    ## 
    ## 
    ## Retrieving data for taxon 'Carduelis spinus'
    ## 
    ## 
    ## Retrieving data for taxon 'Carduelis spinus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Carduelis spinus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=554147
    ## 
    ## Retrieving data for taxon 'Serinus serinus'
    ## 
    ## 
    ## Retrieving data for taxon 'Serinus serinus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Serinus serinus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=562967
    ## 
    ## Retrieving data for taxon 'Sylvia cantillans'
    ## 
    ## 
    ## Retrieving data for taxon 'Sylvia cantillans'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Sylvia cantillans
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=563187
    ## 
    ## Retrieving data for taxon 'Turdus philomelos'
    ## 
    ## 
    ## Retrieving data for taxon 'Turdus philomelos'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Turdus philomelos
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=563604
    ## 
    ## Retrieving data for taxon 'Emberiza hortulana'
    ## 
    ## 
    ## Retrieving data for taxon 'Emberiza hortulana'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Emberiza hortulana
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=559883
    ## 
    ## Retrieving data for taxon 'Phoenicurus phoenicurus'
    ## 
    ## 
    ## Retrieving data for taxon 'Phoenicurus phoenicurus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Phoenicurus phoenicurus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=562037
    ## 
    ## Retrieving data for taxon 'Pyrrhocorax pyrrhocorax'
    ## 
    ## 
    ## Retrieving data for taxon 'Pyrrhocorax pyrrhocorax'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Pyrrhocorax pyrrhocorax
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=562653
    ## 
    ## Retrieving data for taxon 'Luscinia megarhynchos'
    ## 
    ## 
    ## Retrieving data for taxon 'Luscinia megarhynchos'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Luscinia megarhynchos
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=560897
    ## 
    ## Retrieving data for taxon 'Fringilla montifringilla'
    ## 
    ## 
    ## Retrieving data for taxon 'Fringilla montifringilla'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Fringilla montifringilla
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=179167
    ## 
    ## Retrieving data for taxon 'Erithacus rubecula'
    ## 
    ## 
    ## Retrieving data for taxon 'Erithacus rubecula'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Erithacus rubecula
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=559964
    ## 
    ## Retrieving data for taxon 'Oenanthe hispanica'
    ## 
    ## 
    ## Retrieving data for taxon 'Oenanthe hispanica'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Oenanthe hispanica
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=561650
    ## 
    ## Retrieving data for taxon 'Aegithalos caudatus'
    ## 
    ## 
    ## Retrieving data for taxon 'Aegithalos caudatus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Aegithalos caudatus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=558441
    ## 
    ## Retrieving data for taxon 'Phylloscopus bonelli'
    ## 
    ## 
    ## Retrieving data for taxon 'Phylloscopus bonelli'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Phylloscopus bonelli
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=562123
    ## 
    ## Retrieving data for taxon 'Regulus ignicapillus'
    ## 
    ## 
    ## Retrieving data for taxon 'Regulus ignicapillus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Regulus ignicapillus
    ## Not found. Consider checking the spelling or alternate classification
    ## No TSN found for species 'Regulus ignicapillus'!
    ## 
    ## 
    ## Retrieving data for taxon 'Hippolais polyglotta'
    ## 
    ## 
    ## Retrieving data for taxon 'Hippolais polyglotta'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Hippolais polyglotta
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=560451
    ## 
    ## Retrieving data for taxon 'Sitta europaea'
    ## 
    ## 
    ## Retrieving data for taxon 'Sitta europaea'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Sitta europaea
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=563018
    ## 
    ## Retrieving data for taxon 'Monticola saxatilis'
    ## 
    ## 
    ## Retrieving data for taxon 'Monticola saxatilis'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Monticola saxatilis
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=561216
    ## 
    ## Retrieving data for taxon 'Prunella collaris'
    ## 
    ## 
    ## Retrieving data for taxon 'Prunella collaris'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Prunella collaris
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=562483
    ## 
    ## Retrieving data for taxon 'Cyanistes caeruleus'
    ## 
    ## 
    ## Retrieving data for taxon 'Cyanistes caeruleus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Cyanistes caeruleus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=559612
    ## 
    ## Retrieving data for taxon 'Caprimulgus europaeus'
    ## 
    ## 
    ## Retrieving data for taxon 'Caprimulgus europaeus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Caprimulgus europaeus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=555569
    ## 
    ## Retrieving data for taxon 'Serinus citrinella'
    ## 
    ## 
    ## Retrieving data for taxon 'Serinus citrinella'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Serinus citrinella
    ## Not found. Consider checking the spelling or alternate classification
    ## No TSN found for species 'Serinus citrinella'!
    ## 
    ## 
    ## Retrieving data for taxon 'Passer domesticus'
    ## 
    ## 
    ## Retrieving data for taxon 'Passer domesticus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Passer domesticus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=179628
    ## 
    ## Retrieving data for taxon 'Lophophanes cristatus'
    ## 
    ## 
    ## Retrieving data for taxon 'Lophophanes cristatus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Lophophanes cristatus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=560873
    ## 
    ## Retrieving data for taxon 'Sylvia melanocephala'
    ## 
    ## 
    ## Retrieving data for taxon 'Sylvia melanocephala'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Sylvia melanocephala
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=563196
    ## 
    ## Retrieving data for taxon 'Anthus'
    ## 
    ## 
    ## Retrieving data for taxon 'Anthus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Anthus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=178488
    ## 
    ## Retrieving data for taxon 'Lanius senator'
    ## 
    ## 
    ## Retrieving data for taxon 'Lanius senator'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Lanius senator
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=560732
    ## 
    ## Retrieving data for taxon 'Galerida cristata'
    ## 
    ## 
    ## Retrieving data for taxon 'Galerida cristata'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Galerida cristata
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=560129
    ## 
    ## Retrieving data for taxon 'Turdus'
    ## 
    ## 
    ## Retrieving data for taxon 'Turdus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Turdus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=179752
    ## 
    ## Retrieving data for taxon 'Accipiter nisus'
    ## 
    ## 
    ## Retrieving data for taxon 'Accipiter nisus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Accipiter nisus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=175333
    ## 
    ## Retrieving data for taxon 'Periparus ater'
    ## 
    ## 
    ## Retrieving data for taxon 'Periparus ater'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Periparus ater
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=561927
    ## 
    ## Retrieving data for taxon 'Saxicola torquata'
    ## 
    ## 
    ## Retrieving data for taxon 'Saxicola torquata'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Saxicola torquata
    ## Not found. Consider checking the spelling or alternate classification
    ## No TSN found for species 'Saxicola torquata'!
    ## 
    ## 
    ## Retrieving data for taxon 'Phoenicurus ochruros'
    ## 
    ## 
    ## Retrieving data for taxon 'Phoenicurus ochruros'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Phoenicurus ochruros
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=562036
    ## 
    ## Retrieving data for taxon 'Turdus pilaris'
    ## 
    ## 
    ## Retrieving data for taxon 'Turdus pilaris'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Turdus pilaris
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=179766
    ## 
    ## Retrieving data for taxon 'Emberiza cirlus'
    ## 
    ## 
    ## Retrieving data for taxon 'Emberiza cirlus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Emberiza cirlus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=559878
    ## 
    ## Retrieving data for taxon 'Phylloscopus collybita'
    ## 
    ## 
    ## Retrieving data for taxon 'Phylloscopus collybita'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Phylloscopus collybita
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=562129
    ## 
    ## Retrieving data for taxon 'Streptopelia turtur'
    ## 
    ## 
    ## Retrieving data for taxon 'Streptopelia turtur'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Streptopelia turtur
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=177149
    ## 
    ## Retrieving data for taxon 'Sylvia undata'
    ## 
    ## 
    ## Retrieving data for taxon 'Sylvia undata'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Sylvia undata
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=563205
    ## 
    ## Retrieving data for taxon 'Oriolus oriolus'
    ## 
    ## 
    ## Retrieving data for taxon 'Oriolus oriolus'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Oriolus oriolus
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=561707
    ## 
    ## Retrieving data for taxon 'Corvus monedula'
    ## 
    ## 
    ## Retrieving data for taxon 'Corvus monedula'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Corvus monedula
    ## Not found. Consider checking the spelling or alternate classification
    ## No TSN found for species 'Corvus monedula'!
    ## 
    ## 
    ## Retrieving data for taxon 'Prunella modularis'
    ## 
    ## 
    ## Retrieving data for taxon 'Prunella modularis'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Prunella modularis
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=562489
    ## 
    ## Retrieving data for taxon 'Merops apiaster'
    ## 
    ## 
    ## Retrieving data for taxon 'Merops apiaster'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Merops apiaster
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=554661
    ## 
    ## Retrieving data for taxon 'Certhia brachydactyla'
    ## 
    ## 
    ## Retrieving data for taxon 'Certhia brachydactyla'
    ## 
    ## http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=Certhia brachydactyla
    ## http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN?tsn=559138

``` r
jerarquia 
```

    ##    id_dicc_especies             nombre_cientifico kingdom   phylum
    ## 1               264             Anthus campestris Metazoa Chordata
    ## 2               440 Coccothraustes coccothraustes Metazoa Chordata
    ## 3               459              Sturnus unicolor Metazoa Chordata
    ## 4               700            Accipiter gentilis Metazoa Chordata
    ## 5               371                   Parus major Metazoa Chordata
    ## 6               851                   Upupa epops Metazoa Chordata
    ## 7               416             Petronia petronia Metazoa Chordata
    ## 8               293                 Turdus merula Metazoa Chordata
    ## 9               234               Alauda arvensis Metazoa Chordata
    ## 10              431                     Pica pica Metazoa Chordata
    ## 11              858             Dendrocopos major Metazoa Chordata
    ## 12              731             Falco tinnunculus Metazoa Chordata
    ## 13              466                  Emberiza cia Metazoa Chordata
    ## 14              823                 Athene noctua Metazoa Chordata
    ## 15              291                Turdus iliacus Metazoa Chordata
    ## 16              406              Lanius excubitor Metazoa Chordata
    ## 17              436             Fringilla coelebs Metazoa Chordata
    ## 18              309             Oenanthe oenanthe Metazoa Chordata
    ## 19              452             Loxia curvirostra Metazoa Chordata
    ## 20              419                  Corvus corax Metazoa Chordata
    ## 21              289             Turdus viscivorus Metazoa Chordata
    ## 22              349                  Phylloscopus Metazoa Chordata
    ## 23              282       Troglodytes troglodytes Metazoa Chordata
    ## 24              796              Columba palumbus Metazoa Chordata
    ## 25              268                Motacilla alba Metazoa Chordata
    ## 26              808           Clamator glandarius Metazoa Chordata
    ## 27              447           Carduelis cannabina Metazoa Chordata
    ## 28              261             Anthus spinoletta Metazoa Chordata
    ## 29              474             Miliaria calandra Metazoa Chordata
    ## 30              446           Carduelis carduelis Metazoa Chordata
    ## 31              747                Alectoris rufa Metazoa Chordata
    ## 32              323               Sylvia communis Metazoa Chordata
    ## 33              307              Saxicola rubetra Metazoa Chordata
    ## 34              269             Motacilla cinerea Metazoa Chordata
    ## 35              236               Lullula arborea Metazoa Chordata
    ## 36              806               Cuculus canorus Metazoa Chordata
    ## 37            24604                    Valor nulo    <NA>     <NA>
    ## 38              321          Sylvia conspicillata Metazoa Chordata
    ## 39              317                        Sylvia Metazoa Chordata
    ## 40              433           Garrulus glandarius Metazoa Chordata
    ## 41              279               Cinclus cinclus Metazoa Chordata
    ## 42              445             Carduelis chloris Metazoa Chordata
    ## 43              239              Galerida theklae Metazoa Chordata
    ## 44              854                 Picus viridis Metazoa Chordata
    ## 45              324            Sylvia atricapilla Metazoa Chordata
    ## 46              364             Muscicapa striata Metazoa Chordata
    ## 47              294              Turdus torquatus Metazoa Chordata
    ## 48              454            Acanthis cannabina    <NA>     <NA>
    ## 49              448              Carduelis spinus Metazoa Chordata
    ## 50              442               Serinus serinus Metazoa Chordata
    ## 51              320             Sylvia cantillans Metazoa Chordata
    ## 52              290             Turdus philomelos Metazoa Chordata
    ## 53              465            Emberiza hortulana Metazoa Chordata
    ## 54              303       Phoenicurus phoenicurus Metazoa Chordata
    ## 55              426       Pyrrhocorax pyrrhocorax Metazoa Chordata
    ## 56              298         Luscinia megarhynchos Metazoa Chordata
    ## 57              437      Fringilla montifringilla Metazoa Chordata
    ## 58              296            Erithacus rubecula Metazoa Chordata
    ## 59              310            Oenanthe hispanica Metazoa Chordata
    ## 60              380           Aegithalos caudatus Metazoa Chordata
    ## 61              350          Phylloscopus bonelli Metazoa Chordata
    ## 62              361          Regulus ignicapillus Metazoa Chordata
    ## 63              347          Hippolais polyglotta Metazoa Chordata
    ## 64              386                Sitta europaea Metazoa Chordata
    ## 65              314           Monticola saxatilis Metazoa Chordata
    ## 66              286             Prunella collaris Metazoa Chordata
    ## 67              375           Cyanistes caeruleus Metazoa Chordata
    ## 68              831         Caprimulgus europaeus Metazoa Chordata
    ## 69              443            Serinus citrinella Metazoa Chordata
    ## 70              412             Passer domesticus Metazoa Chordata
    ## 71              377         Lophophanes cristatus Metazoa Chordata
    ## 72              326          Sylvia melanocephala Metazoa Chordata
    ## 73              259                        Anthus Metazoa Chordata
    ## 74              405                Lanius senator Metazoa Chordata
    ## 75              238             Galerida cristata Metazoa Chordata
    ## 76              288                        Turdus Metazoa Chordata
    ## 77              699               Accipiter nisus Metazoa Chordata
    ## 78              373                Periparus ater Metazoa Chordata
    ## 79              306             Saxicola torquata Metazoa Chordata
    ## 80              304          Phoenicurus ochruros Metazoa Chordata
    ## 81              292                Turdus pilaris Metazoa Chordata
    ## 82              464               Emberiza cirlus Metazoa Chordata
    ## 83              353        Phylloscopus collybita Metazoa Chordata
    ## 84              801           Streptopelia turtur Metazoa Chordata
    ## 85              318                 Sylvia undata Metazoa Chordata
    ## 86              402               Oriolus oriolus Metazoa Chordata
    ## 87              420               Corvus monedula Metazoa Chordata
    ## 88              285            Prunella modularis Metazoa Chordata
    ## 89              844               Merops apiaster Metazoa Chordata
    ## 90              392         Certhia brachydactyla Metazoa Chordata
    ##    subphylum class            order         family          genus
    ## 1   Craniata  Aves    Passeriformes   Motacillidae         Anthus
    ## 2   Craniata  Aves    Passeriformes   Fringillidae Coccothraustes
    ## 3   Craniata  Aves    Passeriformes      Sturnidae        Sturnus
    ## 4   Craniata  Aves    Falconiformes   Accipitridae      Accipiter
    ## 5   Craniata  Aves    Passeriformes        Paridae          Parus
    ## 6   Craniata  Aves      Upupiformes       Upupidae          Upupa
    ## 7   Craniata  Aves    Passeriformes     Passeridae       Petronia
    ## 8   Craniata  Aves    Passeriformes       Turdidae         Turdus
    ## 9   Craniata  Aves    Passeriformes      Alaudidae         Alauda
    ## 10  Craniata  Aves    Passeriformes       Corvidae           Pica
    ## 11  Craniata  Aves       Piciformes        Picidae    Dendrocopos
    ## 12  Craniata  Aves    Falconiformes     Falconidae          Falco
    ## 13  Craniata  Aves    Passeriformes   Fringillidae       Emberiza
    ## 14  Craniata  Aves     Strigiformes      Strigidae         Athene
    ## 15  Craniata  Aves    Passeriformes       Turdidae         Turdus
    ## 16  Craniata  Aves    Passeriformes       Laniidae         Lanius
    ## 17  Craniata  Aves    Passeriformes   Fringillidae      Fringilla
    ## 18  Craniata  Aves    Passeriformes   Muscicapidae       Oenanthe
    ## 19  Craniata  Aves    Passeriformes   Fringillidae          Loxia
    ## 20  Craniata  Aves    Passeriformes       Corvidae         Corvus
    ## 21  Craniata  Aves    Passeriformes       Turdidae         Turdus
    ## 22  Craniata  Aves    Passeriformes Phylloscopidae   Phylloscopus
    ## 23  Craniata  Aves    Passeriformes     Certhiidae    Troglodytes
    ## 24  Craniata  Aves    Columbiformes     Columbidae        Columba
    ## 25  Craniata  Aves    Passeriformes   Motacillidae      Motacilla
    ## 26  Craniata  Aves     Cuculiformes      Cuculidae       Clamator
    ## 27  Craniata  Aves    Passeriformes   Fringillidae      Carduelis
    ## 28  Craniata  Aves    Passeriformes   Motacillidae         Anthus
    ## 29  Craniata  Aves    Passeriformes   Fringillidae       Miliaria
    ## 30  Craniata  Aves    Passeriformes   Fringillidae      Carduelis
    ## 31  Craniata  Aves      Galliformes    Phasianidae      Alectoris
    ## 32  Craniata  Aves    Passeriformes      Sylviidae         Sylvia
    ## 33  Craniata  Aves    Passeriformes   Muscicapidae       Saxicola
    ## 34  Craniata  Aves    Passeriformes   Motacillidae      Motacilla
    ## 35  Craniata  Aves    Passeriformes      Alaudidae        Lullula
    ## 36  Craniata  Aves     Cuculiformes      Cuculidae        Cuculus
    ## 37      <NA>  <NA>             <NA>           <NA>           <NA>
    ## 38  Craniata  Aves    Passeriformes      Sylviidae         Sylvia
    ## 39  Craniata  Aves    Passeriformes      Sylviidae         Sylvia
    ## 40  Craniata  Aves    Passeriformes       Corvidae       Garrulus
    ## 41  Craniata  Aves    Passeriformes      Cinclidae        Cinclus
    ## 42  Craniata  Aves    Passeriformes   Fringillidae      Carduelis
    ## 43  Craniata  Aves    Passeriformes      Alaudidae       Galerida
    ## 44  Craniata  Aves       Piciformes        Picidae          Picus
    ## 45  Craniata  Aves    Passeriformes      Sylviidae         Sylvia
    ## 46  Craniata  Aves    Passeriformes   Muscicapidae      Muscicapa
    ## 47  Craniata  Aves    Passeriformes       Turdidae         Turdus
    ## 48      <NA>  <NA>             <NA>           <NA>           <NA>
    ## 49  Craniata  Aves    Passeriformes   Fringillidae         Spinus
    ## 50  Craniata  Aves    Passeriformes   Fringillidae        Serinus
    ## 51  Craniata  Aves    Passeriformes      Sylviidae         Sylvia
    ## 52  Craniata  Aves    Passeriformes       Turdidae         Turdus
    ## 53  Craniata  Aves    Passeriformes   Fringillidae       Emberiza
    ## 54  Craniata  Aves    Passeriformes   Muscicapidae    Phoenicurus
    ## 55  Craniata  Aves    Passeriformes       Corvidae    Pyrrhocorax
    ## 56  Craniata  Aves    Passeriformes       Turdidae       Luscinia
    ## 57  Craniata  Aves    Passeriformes   Fringillidae      Fringilla
    ## 58  Craniata  Aves    Passeriformes       Turdidae      Erithacus
    ## 59  Craniata  Aves    Passeriformes   Muscicapidae       Oenanthe
    ## 60  Craniata  Aves    Passeriformes   Aegithalidae     Aegithalos
    ## 61  Craniata  Aves    Passeriformes Phylloscopidae   Phylloscopus
    ## 62  Craniata  Aves    Passeriformes      Sylviidae        Regulus
    ## 63  Craniata  Aves    Passeriformes      Sylviidae      Hippolais
    ## 64  Craniata  Aves    Passeriformes       Sittidae          Sitta
    ## 65  Craniata  Aves    Passeriformes       Turdidae      Monticola
    ## 66  Craniata  Aves    Passeriformes     Passeridae       Prunella
    ## 67  Craniata  Aves    Passeriformes        Paridae      Cyanistes
    ## 68  Craniata  Aves Caprimulgiformes  Caprimulgidae    Caprimulgus
    ## 69  Craniata  Aves    Passeriformes   Fringillidae        Serinus
    ## 70  Craniata  Aves    Passeriformes     Passeridae         Passer
    ## 71  Craniata  Aves    Passeriformes        Paridae    Lophophanes
    ## 72  Craniata  Aves    Passeriformes      Sylviidae         Sylvia
    ## 73  Craniata  Aves    Passeriformes   Motacillidae         Anthus
    ## 74  Craniata  Aves    Passeriformes       Laniidae         Lanius
    ## 75  Craniata  Aves    Passeriformes      Alaudidae       Galerida
    ## 76  Craniata  Aves    Passeriformes       Turdidae         Turdus
    ## 77  Craniata  Aves    Falconiformes   Accipitridae      Accipiter
    ## 78  Craniata  Aves    Passeriformes        Paridae      Periparus
    ## 79  Craniata  Aves    Passeriformes   Muscicapidae       Saxicola
    ## 80  Craniata  Aves    Passeriformes   Muscicapidae    Phoenicurus
    ## 81  Craniata  Aves    Passeriformes       Turdidae         Turdus
    ## 82  Craniata  Aves    Passeriformes   Fringillidae       Emberiza
    ## 83  Craniata  Aves    Passeriformes Phylloscopidae   Phylloscopus
    ## 84  Craniata  Aves    Columbiformes     Columbidae   Streptopelia
    ## 85  Craniata  Aves    Passeriformes      Sylviidae         Sylvia
    ## 86  Craniata  Aves    Passeriformes       Corvidae        Oriolus
    ## 87  Craniata  Aves    Passeriformes       Corvidae         Corvus
    ## 88  Craniata  Aves    Passeriformes     Passeridae       Prunella
    ## 89  Craniata  Aves    Coraciiformes      Meropidae         Merops
    ## 90  Craniata  Aves    Passeriformes     Certhiidae        Certhia

``` r
##guardar como csv
write.csv(jerarquia, file = paste(di,"/data/taxonomy.csv", sep=""), row.names=FALSE)
```
