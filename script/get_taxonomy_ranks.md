## Get taxonomy ranks

Primero instalo el paquete "Taxize" y lo cargo junto con el paquete "plyr".


```r
# Load packages 
# install.packages("taxize")
library("taxize")
library(plyr)
```

Establecer el directorio y leer el archivo de datos:
Establezco el directorio raíz asignándolo a un objeto, en este caso "di". De este modo, puedo leer mis datos, añadiendo el final de la ruta a "di" con la función paste. El directorio raíz será diferente en cada ordenador donde esté el repositorio. Creo las diferentes rutas al directorio raíz y ejecuto la que corresponda según desde donde esté accediendo. 



```r
#Establecer directorio 
#di <- '/Users/ajpelu/ownCloud/MS/MS_DP_DISPERSANTES/dp_dispersantes'

di <- '/Users/iecolab/Documents/Lola/dp_dispersantes'

## Leer datos
datos <- read.csv(file=paste(di,"/data/taxa_list.csv", sep=""), header=TRUE, sep=",")
```

Para obtener la tabla con la clasificación taxonómica, utilizamos el paquete "Taxize". Generamos la clasificación taxonómica de cada especie y unimos las columnas de rangos taxonómicos mediante la función "cbind" a la columna id_dicc_especies y nombre_cientifico. La tabla se llama jerarquia.


```r
### Obtener tabla con jerarquía taxonómica 

jerarquia <- cbind(id_dicc_especies=datos$id_dicc_especies, 
                   nombre_cientifico=datos$nombre_cientifico,
                   tax_name (query = datos$nombre_cientifico, 
                      get=c("kingdom", "phylum", "subphylum", "class", "order", "family", "genus"), 
                      db="ncbi")[,c("kingdom", "phylum", "subphylum", "class", "order", "family", "genus")])
```

Eliminamos el valor nulo.

```r
# Eliminar Valor Nulo 
jerarquia <- subset(jerarquia, nombre_cientifico != "Valor nulo")

jerarquia
```

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
```

Exportamos la tabla en el directorio `./data/taxonomy.csv`

```r
##guardar como csv
write.csv(jerarquia, file = paste(di,"/data/taxonomy.csv", sep=""), row.names=FALSE, quote= FALSE)
```

