##Tabla 1. Información Status.
# Generate table of taxa information. 
We create a table with information about the species we found in our study (scientific name and id).
* Export the data and save as `./data/taxa_list.csv`

We create a table with information about status, protection, etc by taxa.
We add the common names in english with information of [Word Bird Names] (http://www.worldbirdnames.org/). Also, we add the common names in spanish with information of [Lista de Aves de España 2012, SEO Birdlife] (http://www.seo.org/wp-content/uploads/2012/10/Lista_-Aves_Espana_2012.pdf)

* Export the data and save as `./data/taxa_list_STATUS.csv`

We create a table adding only information about Author of the specie.(We´ll need this table for our data base).
* Export the data and save as `./data/taxa_author.csv`

## First, we create the table with all the species (table1). Then, we create the table with species only of the order Passeriformes (table1passer). 

We generate the table1 with information about the next fields: nombre_cientifico, id_dicc_especies, Spanish Red List, IUCN Global, Birds Directive, Bern, Born, Authority, English name and Spanish name and save as `./tables/table1.md`


| nombre_cientifico             | Spanish Red List | Birds Directive | Bern | Bonn | Authority        | English Name              | Spanish Name           |
|-------------------------------|------------------|-----------------|------|------|------------------|---------------------------|------------------------|
| Acanthis cannabina            |                  |                 |      |      |                  |                           |                        |
| Accipiter gentilis            | NE               |                 | III  | II   | Linnaeus, 1758   | European Bee-eater        | Abejaruco europeo      |
| Accipiter nisus               | NE               |                 | III  |      | Linnaeus, 1758   | Eurasian Hoopoe           | Abubilla               |
| Aegithalos caudatus           | NE               |                 | III  |      | Scopoli, 1769    | Alpine Accentor           | Acentor alpino         |
| Alauda arvensis               | NE               |                 | III  |      | Linnaeus, 1758   | Dunnock                   | Acentor común          |
| Alectoris rufa                | DD               |                 | III  |      | Brehm, CL, 1820  | Short-toed Treecreeper    | Agateador europeo      |
| Anthus campestris             | NE               |                 | III  |      | Linnaeus, 1758   | Woodchat Shrike           | Alcaudón común         |
| Anthus spinoletta             | NE               |                 |      |      | Linnaeus, 1758   | Great Grey Shrike         | Alcaudón norteńo       |
| Athene noctua                 | NE               | II              | III  |      | Linnaeus, 1758   | Eurasian Skylark          | Alondra común          |
| Caprimulgus europaeus         | NE               | I               | III  |      | Linnaeus, 1758   | Woodlark                  | Alondra totovía        |
| Carduelis cannabina           | NE               | II              |      |      | Linnaeus, 1758   | Eurasian Jay              | Arrendajo euroasiático |
| Carduelis carduelis           | NE               | I               | III  | II   | Linnaeus, 1758   | Northern Goshawk          | Azor común             |
| Carduelis chloris             | NE               |                 | III  |      | Linnaeus, 1758   | Water Pipit               | Bisbita alpina         |
| Carduelis spinus              | NE               | I               | III  |      | Linnaeus, 1758   | Tawny Pipit               | Bisbita campestre      |
| Certhia brachydactyla         | NE               |                 | III  |      | Linnaeus, 1758   | Great Tit                 | Carbonero común        |
| Cinclus cinclus               | NE               |                 | III  |      | Linnaeus, 1758   | Coal Tit                  | Carbonero garrapinos   |
| Clamator glandarius           | NE               |                 | III  | II   | Linnaeus, 1758   | Common Kestrel            | Cernícalo vulgar       |
| Coccothraustes coccothraustes | NE               |                 | III  |      | Linnaeus, 1758   | Eurasian Wren             | Chochín común          |
| Columba palumbus              | NE               | I               | III  |      | Linnaeus, 1758   | European Nightjar         | Chotacabras europeo    |
| Corvus corax                  | NE               | I               | III  |      | Linnaeus, 1758   | Red-billed Chough         | Chova piquirroja       |
| Corvus monedula               | NE               |                 | III  |      | Linnaeus, 1758   | Crested Lark              | Cogujada común         |
| Cuculus canorus               | NE               |                 | III  |      | Brehm, AE, 1857  | Thekla Lark               | Cogujada montesina     |
| Cyanistes caeruleus           | NE               |                 | III  | II   | Linnaeus, 1758   | Common Redstart           | Colirrojo real         |
| Dendrocopos major             |                  |                 | III  | II   | Gmelin, SG, 1774 | Black Redstart            | Colirrojo tizón        |
| Emberiza cia                  | NE               |                 | III  | II   | Linnaeus, 1758   | Northern Wheatear         | Collalba gris          |
| Emberiza cirlus               | NE               |                 | III  | II   | Linnaeus, 1758   | Black-eared Wheatear      | Collalba rubia         |
| Emberiza hortulana            | NE               |                 | III  |      | Linnaeus, 1758   | Great Spotted Cuckoo      | Críalo europeo         |
| Erithacus rubecula            | NE               |                 | III  |      | Linnaeus, 1758   | Common Cuckoo             | Cuco común             |
| Falco tinnunculus             | NE               |                 | III  |      | Linnaeus, 1758   | Northern Raven            | Cuervo grande          |
| Fringilla coelebs             | NE               |                 | III  | II   | Gmelin, JF, 1789 | Sardinian Warbler         | Curruca cabecinegra    |
| Fringilla montifringilla      | NE               |                 | III  | II   | Linnaeus, 1758   | Eurasian Blackcap         | Curruca capirotada     |
| Galerida cristata             | NE               |                 | III  | II   | Pallas, 1764     | Subalpine Warbler         | Curruca carrasqueńa    |
| Galerida theklae              | NE               | I               | III  | II   | Boddaert, 1783   | Dartford Warbler          | Curruca rabilarga      |
| Garrulus glandarius           | NE               |                 | III  | II   | Temminck, 1820   | Spectacled Warbler        | Curruca tomillera      |
| Hippolais polyglotta          | NE               |                 | III  | II   | Latham, 1787     | Common Whitethroat        | Curruca zarcera        |
| Lanius excubitor              |                  | I               | III  |      | Linnaeus, 1758   | Ortolan Bunting           | Escribano hortelano    |
| Lanius senator                | NT               |                 | III  |      | Linnaeus, 1766   | Rock Bunting              | Escribano montesino    |
| Lophophanes cristatus         |                  |                 | III  |      | Linnaeus, 1766   | Cirl Bunting              | Escribano soteńo       |
| Loxia curvirostra             | NE               |                 | III  |      | Linnaeus, 1758   | Corn Bunting              | Escribano triguero     |
| Lullula arborea               | NE               |                 | III  |      | Temminck, 1820   | Spotless Starling         | Estornino negro        |
| Luscinia megarhynchos         | NE               | I               | III  | II   | Linnaeus, 1758   | Eurasian Sparrowhawk      | Gavilán común          |
| Merops apiaster               | NE               |                 | III  |      | Linnaeus, 1766   | Rock Sparrow              | Gorrión chillón        |
| Miliaria calandra             | NE               |                 |      |      | Linnaeus, 1758   | House Sparrow             | Gorrión común          |
| Monticola saxatilis           | NE               | II              |      |      | Linnaeus, 1758   | Eurasian Jackdaw          | Grajilla occidental    |
| Motacilla alba                | NE               |                 |      |      | Linnaeus, 1758   | European Crested Tit      | Herrerillo capuchino   |
| Motacilla cinerea             | NE               |                 |      |      | Linnaeus, 1758   | Eurasian Blue Tit         | Herrerillo común       |
| Muscicapa striata             | NE               |                 | III  |      | Linnaeus, 1758   | European Goldfinch        | Jilguero europeo       |
| Oenanthe hispanica            | NT               |                 | III  |      | Linnaeus, 1758   | Eurasian Siskin           | Jilguero lúgano        |
| Oenanthe oenanthe             | NE               |                 | III  |      | Linnaeus, 1758   | White Wagtail             | Lavandera alba         |
| Oriolus oriolus               | NE               |                 | III  |      | Tunstall, 1771   | Grey Wagtail              | Lavandera cascadeńa    |
| Parus major                   | NE               |                 | III  |      | Linnaeus, 1758   | White-throated Dipper     | Mirlo acuático europeo |
| Passer domesticus             | NE               |                 | III  | II   | Linnaeus, 1758   | Ring Ouzel                | Mirlo capiblanco       |
| Periparus ater                | NE               |                 | III  | II   | Linnaeus, 1758   | Common Blackbird          | Mirlo común            |
| Petronia petronia             | NE               |                 | III  |      | Linnaeus, 1758   | Long-tailed Tit           | Mito común             |
| Phoenicurus ochruros          | NE               |                 | III  |      | Scopoli, 1769    | Little Owl                | Mochuelo común         |
| Phoenicurus phoenicurus       | VU               |                 | III  | II   | Vieillot, 1817   | Common Chiffchaff         | Mosquitero común       |
| Phylloscopus bonelli          | NE               |                 | III  | II   | Vieillot, 1819   | Western Bonelli's Warbler | Mosquitero papialbo    |
| Phylloscopus collybita        | NE               |                 | III  |      | Linnaeus, 1758   | Eurasian Golden Oriole    | Oropéndola europea     |
| Pica pica                     | NE               | I,II,III        |      |      | Linnaeus, 1758   | Common Wood Pigeon        | Paloma torcaz          |
| Picus viridis                 | NE               |                 | III  | II   | Pallas, 1764     | Spotted Flycatcher        | Papamoscas gris        |
| Prunella collaris             | NE               |                 | III  |      | Linnaeus, 1758   | Common Linnet             | Pardillo común         |
| Prunella modularis            | NE               | II,III          | III  |      | Linnaeus, 1758   | Red-legged Partridge      | Perdiz roja            |
| Pyrrhocorax pyrrhocorax       | NT               |                 | III  | II   | Linnaeus, 1758   | European Robin            | Petirrojo europeo      |
| Regulus ignicapillus          | NE               | I               | III  |      | Linnaeus, 1758   | Great Spotted Woodpecker  | Pico picapinos         |
| Saxicola rubetra              | NE               |                 | III  |      | Linnaeus, 1758   | Hawfinch                  | Picogordo común        |
| Saxicola torquata             | NE               |                 | III  |      | Linnaeus, 1758   | Brambling                 | Pinzón real            |
| Serinus citrinella            | NE               | I               | III  |      | Linnaeus, 1758   | Common Chaffinch          | Pinzón vulgar          |
| Serinus serinus               | NE               |                 | III  |      | Linnaeus, 1758   | Red Crossbill             | Piquituerto común      |
| Sitta europaea                | NE               |                 | III  |      | Linnaeus, 1758   | European Green Woodpecker | Pito real              |
| Streptopelia turtur           | VU               |                 | III  | II   | Temminck, 1820   | Common Firecrest          | Reyezuelo listado      |
| Sturnus unicolor              | NE               |                 | III  | II   | Linnaeus, 1766   | Common Rock Thrush        | Roquero rojo           |
| Sylvia atricapilla            | NE               |                 | III  | II   | Brehm, CL, 1831  | Common Nightingale        | Ruiseńor común         |
| Sylvia cantillans             | NE               |                 | III  |      | Linnaeus, 1766   | European Serin            | Serín verdecillo       |
| Sylvia communis               | NE               |                 | III  | II   | Linnaeus, 1766   | African Stonechat         | Tarabilla común        |
| Sylvia conspicillata          | LC*              |                 | III  | II   | Linnaeus, 1758   | Whinchat                  | Tarabilla norteńa      |
| Sylvia melanocephala          | NE               | II              | III  |      | Linnaeus, 1758   | European Turtle Dove      | Tórtola europea        |
| Sylvia undata                 | NE               |                 | III  |      | Linnaeus, 1758   | Eurasian Nuthatch         | Trepador azul          |
| Troglodytes troglodytes       | NE               | II              |      |      | Linnaeus, 1758   | Eurasian Magpie           | Urraca común           |
| Turdus iliacus                | NE               |                 | III  |      | Linnaeus, 1758   | Greenfinch                | Verderón común         |
| Turdus merula                 | NE               |                 | III  |      | Pallas, 1764     | Alpine Citril Finch       | Verderón serrano       |
| Turdus philomelos             | NE               |                 | III  | II   | Vieillot, 1817   | Melodious Warbler         | Zarcero políglota      |
| Turdus pilaris                | NE               | II              | III  | II   | Linnaeus, 1758   | Redwing                   | Zorzal alirrojo        |
| Turdus torquatus              | NE               | II              | III  | II   | Linnaeus, 1758   | Mistle Thrush             | Zorzal charlo          |
| Turdus viscivorus             | NE               | II              | III  | II   | Brehm, CL, 1831  | Song Thrush               | Zorzal común           |
| Upupa epops                   | NE               | II              | III  | II   | Linnaeus, 1758   | Fieldfare                 | Zorzal real            |




We generate the table1passer with information about the next fields: nombre_cientifico, id_dicc_especies, Spanish Red List, IUCN Global, Birds Directive, Bern, Born, Authority, English name and Spanish name and save as `./tables/table1passer.md`. 

We have information of the species `./data/taxa_list_STATUS.csv`. we created this csv by hand with information of the 'Libro Rojo de Aves de España'. 
To know what species are Passeriformes, we need to add the 'order' column from `./data/taxonomy.csv`
We save this table as `/data/taxa_list_STATUS_passer.csv`. With the tables generator tool, we will create the `table1passer`.

Te information of the process to get `/data/taxa_list_STATUS_passer.csv` is on `/script/get_table_passer.Rmd`

| nombre_cientifico             | id_dicc_especies | Spanish.Red.List | Birds.Directive | Bern | Bonn | Authority | Spanish.Name | English.Name           |                           |                   |                 |
|-------------------------------|------------------|------------------|-----------------|------|------|-----------|--------------|------------------------|---------------------------|-------------------|-----------------|
| Aegithalos caudatus           | 380              | NE               |                 | III  |      | Scopoli   | 1769         | Acentor alpino         | Long-tailed Tit           |                   |                 |
| Alauda arvensis               | 234              | NE               |                 | III  |      | Linnaeus  | 1758         | Acentor común          | Eurasian Skylark          |                   |                 |
| Anthus campestris             | 264              | NE               |                 | III  |      | Linnaeus  | 1758         | Alcaudón común         | Tawny Pipit               |                   |                 |
| Anthus spinoletta             | 261              | NE               |                 |      |      | Linnaeus  | 1758         | Alcaudón norteńo       | Water Pipit               |                   |                 |
| Carduelis cannabina           | 447              | NE               | II              |      |      | Linnaeus  | 1758         | Arrendajo euroasiático | Common Linnet             |                   |                 |
| Carduelis carduelis           | 446              | NE               | I               | III  | II   | Linnaeus  | 1758         | Azor común             | European Goldfinch        |                   |                 |
| Carduelis chloris             | 445              | NE               |                 | III  |      | Linnaeus  | 1758         | Bisbita alpina         | European Greenfinch       |                   |                 |
| Carduelis spinus              | 448              | NE               | I               | III  |      | Linnaeus  | 1758         | Bisbita campestre      | Eurasian Siskin           |                   |                 |
| Certhia brachydactyla         | 392              | NE               |                 | III  |      | Linnaeus  | 1758         | Carbonero común        | Short-toed Treecreeper    |                   |                 |
| Cinclus cinclus               | 279              | NE               |                 | III  |      | Linnaeus  | 1758         | Carbonero garrapinos   | White-throated Dipper     |                   |                 |
| Coccothraustes coccothraustes | 440              | NE               |                 | III  |      | Linnaeus  | 1758         | Chochín común          | Hawfinch                  |                   |                 |
| Corvus corax                  | 419              | NE               | I               | III  |      | Linnaeus  | 1758         | Chova piquirroja       | Northern Raven            |                   |                 |
| Corvus monedula               | 420              | NE               |                 | III  |      | Linnaeus  | 1758         | Cogujada común         | Eurasian Jackdaw          |                   |                 |
| Cyanistes caeruleus           | 375              | NE               |                 | III  | II   | Linnaeus  | 1758         | Colirrojo real         | Eurasian Blue Tit         |                   |                 |
| Emberiza cia                  | 466              | NE               |                 | III  | II   | Linnaeus  | 1758         | Collalba gris          | Rock Bunting              |                   |                 |
| Emberiza cirlus               | 464              | NE               |                 | III  | II   | Linnaeus  | 1758         | Collalba rubia         | Cirl Bunting              |                   |                 |
| Emberiza hortulana            | 465              | NE               |                 | III  |      | Linnaeus  | 1758         | Críalo europeo         | Ortolan Bunting           |                   |                 |
| Erithacus rubecula            | 296              | NE               |                 | III  |      | Linnaeus  | 1758         | Cuco común             | European Robin            |                   |                 |
| Fringilla coelebs             | 436              | NE               |                 | III  | II   | Gmelin    | JF           | 1789                   | Curruca cabecinegra       | Common Chaffinch  |                 |
| Fringilla montifringilla      | 437              | NE               |                 | III  | II   | Linnaeus  | 1758         | Curruca capirotada     | Brambling                 |                   |                 |
| Galerida cristata             | 238              | NE               |                 | III  | II   | Pallas    | 1764         | Curruca carrasqueńa    | Crested Lark              |                   |                 |
| Galerida theklae              | 239              | NE               | I               | III  | II   | Boddaert  | 1783         | Curruca rabilarga      | Thekla Lark               |                   |                 |
| Garrulus glandarius           | 433              | NE               |                 | III  | II   | Temminck  | 1820         | Curruca tomillera      | Eurasian Jay              |                   |                 |
| Hippolais polyglotta          | 347              | NE               |                 | III  | II   | Latham    | 1787         | Curruca zarcera        | Melodious Warbler         |                   |                 |
| Lanius excubitor              | 406              |                  | I               | III  |      | Linnaeus  | 1758         | Escribano hortelano    | Great Grey Shrike         |                   |                 |
| Lanius senator                | 405              | NT               |                 | III  |      | Linnaeus  | 1766         | Escribano montesino    | Woodchat Shrike           |                   |                 |
| Lophophanes cristatus         | 377              |                  |                 | III  |      | Linnaeus  | 1766         | Escribano soteńo       | European Crested Tit      |                   |                 |
| Loxia curvirostra             | 452              | NE               |                 | III  |      | Linnaeus  | 1758         | Escribano triguero     | Red Crossbill             |                   |                 |
| Lullula arborea               | 236              | NE               |                 | III  |      | Temminck  | 1820         | Estornino negro        | Woodlark                  |                   |                 |
| Luscinia megarhynchos         | 298              | NE               | I               | III  | II   | Linnaeus  | 1758         | Gavilán común          | Common Nightingale        |                   |                 |
| Miliaria calandra             | 474              | NE               |                 |      |      | Linnaeus  | 1758         | Gorrión común          | Corn Bunting              |                   |                 |
| Monticola saxatilis           | 314              | NE               | II              |      |      | Linnaeus  | 1758         | Grajilla occidental    | Common Rock Thrush        |                   |                 |
| Motacilla alba                | 268              | NE               |                 |      |      | Linnaeus  | 1758         | Herrerillo capuchino   | White Wagtail             |                   |                 |
| Motacilla cinerea             | 269              | NE               |                 |      |      | Linnaeus  | 1758         | Herrerillo común       | Grey Wagtail              |                   |                 |
| Muscicapa striata             | 364              | NE               |                 | III  |      | Linnaeus  | 1758         | Jilguero europeo       | Spotted Flycatcher        |                   |                 |
| Oenanthe hispanica            | 310              | NT               |                 | III  |      | Linnaeus  | 1758         | Jilguero lúgano        | Black-eared Wheatear      |                   |                 |
| Oenanthe oenanthe             | 309              | NE               |                 | III  |      | Linnaeus  | 1758         | Lavandera alba         | Northern Wheatear         |                   |                 |
| Oriolus oriolus               | 402              | NE               |                 | III  |      | Tunstall  | 1771         | Lavandera cascadeńa    | Eurasian Golden Oriole    |                   |                 |
| Parus major                   | 371              | NE               |                 | III  |      | Linnaeus  | 1758         | Mirlo acuático europeo | Great Tit                 |                   |                 |
| Passer domesticus             | 412              | NE               |                 | III  | II   | Linnaeus  | 1758         | Mirlo capiblanco       | House Sparrow             |                   |                 |
| Periparus ater                | 373              | NE               |                 | III  | II   | Linnaeus  | 1758         | Mirlo común            | Coal Tit                  |                   |                 |
| Petronia petronia             | 416              | NE               |                 | III  |      | Linnaeus  | 1758         | Mito común             | Rock Sparrow              |                   |                 |
| Phoenicurus ochruros          | 304              | NE               |                 | III  |      | Scopoli   | 1769         | Mochuelo común         | Black Redstart            |                   |                 |
| Phoenicurus phoenicurus       | 303              | VU               |                 | III  | II   | Vieillot  | 1817         | Mosquitero común       | Common Redstart           |                   |                 |
| Phylloscopus bonelli          | 350              | NE               |                 | III  | II   | Vieillot  | 1819         | Mosquitero papialbo    | Western Bonelli's Warbler |                   |                 |
| Phylloscopus collybita        | 353              | NE               |                 | III  |      | Linnaeus  | 1758         | Oropéndola europea     | Common Chiffchaff         |                   |                 |
| Pica pica                     | 431              | NE               | I               | II   | III  |           |              | Linnaeus               | 1758                      | Paloma torcaz     | Eurasian Magpie |
| Prunella collaris             | 286              | NE               |                 | III  |      | Linnaeus  | 1758         | Pardillo común         | Alpine Accentor           |                   |                 |
| Prunella modularis            | 285              | NE               | II              | III  | III  |           | Linnaeus     | 1758                   | Perdiz roja               | Dunnock           |                 |
| Pyrrhocorax pyrrhocorax       | 426              | NT               |                 | III  | II   | Linnaeus  | 1758         | Petirrojo europeo      | Red-billed Chough         |                   |                 |
| Regulus ignicapillus          | 361              | NE               | I               | III  |      | Linnaeus  | 1758         | Pico picapinos         | Common Firecrest          |                   |                 |
| Saxicola rubetra              | 307              | NE               |                 | III  |      | Linnaeus  | 1758         | Picogordo común        | Whinchat                  |                   |                 |
| Saxicola torquata             | 306              | NE               |                 | III  |      | Linnaeus  | 1758         | Pinzón real            | African Stonechat         |                   |                 |
| Serinus citrinella            | 443              | NE               | I               | III  |      | Linnaeus  | 1758         | Pinzón vulgar          | Citril Finch              |                   |                 |
| Serinus serinus               | 442              | NE               |                 | III  |      | Linnaeus  | 1758         | Piquituerto común      | European Serin            |                   |                 |
| Sitta europaea                | 386              | NE               |                 | III  |      | Linnaeus  | 1758         | Pito real              | Eurasian Nuthatch         |                   |                 |
| Sturnus unicolor              | 459              | NE               |                 | III  | II   | Linnaeus  | 1766         | Roquero rojo           | Spotless Starling         |                   |                 |
| Sylvia atricapilla            | 324              | NE               |                 | III  | II   | Brehm     | CL           | 1831                   | Ruiseńor común            | Eurasian Blackcap |                 |
| Sylvia cantillans             | 320              | NE               |                 | III  |      | Linnaeus  | 1766         | Serín verdecillo       | Subalpine Warbler         |                   |                 |
| Sylvia communis               | 323              | NE               |                 | III  | II   | Linnaeus  | 1766         | Tarabilla común        | Common Whitethroat        |                   |                 |
| Sylvia conspicillata          | 321              | LC*              |                 | III  | II   | Linnaeus  | 1758         | Tarabilla norteńa      | Spectacled Warbler        |                   |                 |
| Sylvia melanocephala          | 326              | NE               | II              | III  |      | Linnaeus  | 1758         | Tórtola europea        | Sardinian Warbler         |                   |                 |
| Sylvia undata                 | 318              | NE               |                 | III  |      | Linnaeus  | 1758         | Trepador azul          | Dartford Warbler          |                   |                 |
| Troglodytes troglodytes       | 282              | NE               | II              |      |      | Linnaeus  | 1758         | Urraca común           | Eurasian Wren             |                   |                 |
| Turdus iliacus                | 291              | NE               |                 | III  |      | Linnaeus  | 1758         | Verderón común         | Redwing                   |                   |                 |
| Turdus merula                 | 293              | NE               |                 | III  |      | Pallas    | 1764         | Verderón serrano       | Common Blackbird          |                   |                 |
| Turdus philomelos             | 290              | NE               |                 | III  | II   | Vieillot  | 1817         | Zarcero políglota      | Song Thrush               |                   |                 |
| Turdus pilaris                | 292              | NE               | II              | III  | II   | Linnaeus  | 1758         | Zorzal alirrojo        | Fieldfare                 |                   |                 |
| Turdus torquatus              | 294              | NE               | II              | III  | II   | Linnaeus  | 1758         | Zorzal charlo          | Ring Ouzel                |                   |                 |
| Turdus viscivorus             | 289              | NE               | II              | III  | II   | Brehm     | CL           | 1831                   | Zorzal común              | Mistle Thrush     |                 |



To get the final table we did some changes. This `./data/taxa_passer_modif2.csv`. is the table that we include in the data paper:


| Scientific name                              | Spanish Red List | Birds Directive | Bern | Bonn | IUCN Red List Category (Europe) |
|----------------------------------------------|------------------|-----------------|------|------|---------------------------------|
| Aegithalos caudatus Linnaeus, 1758           | NE               |                 | III  |      | LC                              |
| Alauda arvensis Linnaeus, 1758               | NE               |                 | III  |      | LC                              |
| Anthus campestris Linnaeus, 1758             | NE               |                 | III  |      | LC                              |
| Anthus spinoletta Linnaeus, 1758             | NE               |                 |      |      | LC                              |
| Carduelis cannabina Linnaeus, 1758           | NE               | II              |      |      | LC                              |
| Carduelis carduelis Linnaeus, 1758           | NE               | I               | III  | II   | LC                              |
| Carduelis chloris Linnaeus, 1758             | NE               |                 | III  |      | LC                              |
| Carduelis spinus Linnaeus, 1758              | NE               | I               | III  |      | LC                              |
| Certhia brachydactyla Brehm, CL, 1820        | NE               |                 | III  |      | LC                              |
| Cinclus cinclus Linnaeus, 1758               | NE               |                 | III  |      | LC                              |
| Coccothraustes coccothraustes Linnaeus, 1758 | NE               |                 | III  |      | LC                              |
| Corvus corax Linnaeus, 1758                  | NE               | I               | III  |      | LC                              |
| Corvus monedula Linnaeus, 1758               | NE               |                 | III  |      | LC                              |
| Cyanistes caeruleus Linnaeus, 1758           | NE               |                 | III  | II   | LC                              |
| Emberiza cia Linnaeus, 1766                  | NE               |                 | III  | II   | LC                              |
| Emberiza cirlus Linnaeus, 1766               | NE               |                 | III  | II   | LC                              |
| Emberiza hortulana Linnaeus, 1758            | NE               |                 | III  |      | LC                              |
| Erithacus rubecula Linnaeus, 1758            | NE               |                 | III  |      | LC                              |
| Fringilla coelebs Linnaeus, 1758             | NE               |                 | III  | II   | LC                              |
| Fringilla montifringilla Linnaeus, 1758      | NE               |                 | III  | II   | LC                              |
| Galerida cristata Linnaeus, 1758             | NE               |                 | III  | II   | LC                              |
| Galerida theklae Brehm, AE, 1857             | NE               | I               | III  | II   | LC                              |
| Garrulus glandarius Linnaeus, 1758           | NE               |                 | III  | II   | LC                              |
| Hippolais polyglotta Vieillot, 1817          | NE               |                 | III  | II   | LC                              |
| Lanius excubitor Linnaeus, 1758              |                  | I               | III  |      | VU                              |
| Lanius senator Linnaeus, 1758                | NT               |                 | III  |      | LC                              |
| Lophophanes cristatus Linnaeus, 1758         |                  |                 | III  |      | LC                              |
| Loxia curvirostra Linnaeus, 1758             | NE               |                 | III  |      | LC                              |
| Lullula arborea Linnaeus, 1758               | NE               |                 | III  |      | LC                              |
| Luscinia megarhynchos Brehm, CL, 1831        | NE               | I               | III  | II   | LC                              |
| Miliaria calandra Linnaeus, 1758             | NE               |                 |      |      | LC                              |
| Monticola saxatilis Linnaeus, 1766           | NE               | II              |      |      | LC                              |
| Motacilla alba Linnaeus, 1758                | NE               |                 |      |      | LC                              |
| Motacilla cinerea Tunstall, 1771             | NE               |                 |      |      | LC                              |
| Muscicapa striata Pallas, 1764               | NE               |                 | III  |      | LC                              |
| Oenanthe hispanica Linnaeus, 1758            | NT               |                 | III  |      | LC                              |
| Oenanthe oenanthe Linnaeus, 1758             | NE               |                 | III  |      | LC                              |
| Oriolus oriolus Linnaeus, 1758               | NE               |                 | III  |      | LC                              |
| Parus major Linnaeus, 1758                   | NE               |                 | III  |      | LC                              |
| Passer domesticus Linnaeus, 1758             | NE               |                 | III  | II   | LC                              |
| Periparus ater Linnaeus, 1758                | NE               |                 | III  | II   | LC                              |
| Petronia petronia Linnaeus, 1766             | NE               |                 | III  |      | LC                              |
| Phoenicurus ochruros Gmelin, SG, 1774        | NE               |                 | III  |      | LC                              |
| Phoenicurus phoenicurus Linnaeus, 1758       | VU               |                 | III  | II   | LC                              |
| Phylloscopus bonelli Vieillot, 1819          | NE               |                 | III  | II   | LC                              |
| Phylloscopus collybita Vieillot, 1817        | NE               |                 | III  |      | LC                              |
| Pica pica Linnaeus, 1758                     | NE               | I,II,III        |      |      | LC                              |
| Prunella collaris Scopoli, 1769              | NE               |                 | III  |      | LC                              |
| Prunella modularis Linnaeus, 1758            | NE               | II,III          | III  |      | LC                              |
| Pyrrhocorax pyrrhocorax Linnaeus, 1758       | NT               |                 | III  | II   | LC                              |
| Regulus ignicapillus Temminck, 1820          | NE               | I               | III  |      | LC                              |
| Saxicola rubetra Linnaeus, 1758              | NE               |                 | III  |      | LC                              |
| Saxicola torquata Linnaeus, 1766             | NE               |                 | III  |      | LC                              |
| Serinus citrinella Pallas, 1764              | NE               | I               | III  |      | LC                              |
| Serinus serinus Linnaeus, 1766               | NE               |                 | III  |      | LC                              |
| Sitta europaea Linnaeus, 1758                | NE               |                 | III  |      | LC                              |
| Sturnus unicolor Temminck, 1820              | NE               |                 | III  | II   | LC                              |
| Sylvia atricapilla Linnaeus, 1758            | NE               |                 | III  | II   | LC                              |
| Sylvia cantillans Pallas, 1764               | NE               |                 | III  |      | LC                              |
| Sylvia communis Latham, 1787                 | NE               |                 | III  | II   | LC                              |
| Sylvia conspicillata Temminck, 1820          | LC*              |                 | III  | II   | LC                              |
| Sylvia melanocephala Gmelin, JF, 1789        | NE               | II              | III  |      | LC                              |
| Sylvia undata Boddaert, 1783                 | NE               |                 | III  |      | NT                              |
| Troglodytes troglodytes Linnaeus, 1758       | NE               | II              |      |      | LC                              |
| Turdus iliacus Linnaeus, 1758                | NE               |                 | III  |      | NT                              |
| Turdus merula Linnaeus, 1758                 | NE               |                 | III  |      | LC                              |
| Turdus philomelos Brehm, CL, 1831            | NE               |                 | III  | II   | LC                              |
| Turdus pilaris Linnaeus, 1758                | NE               | II              | III  | II   | LC                              |
| Turdus torquatus Linnaeus, 1758              | NE               | II              | III  | II   | LC                              |
| Turdus viscivorus Linnaeus, 1758             | NE               | II              | III  | II   | LC                              |



