


# set wd

di <- '/Users/ajpelu/ownCloud/MS/MS_DP_DISPERSANTES/dp_dispersantes'

library(dplyr)
library(ggplot2)
  
df <- read.csv(file=paste(di,"/data/dicc_dwc/ocurrences.csv", sep=""), header=TRUE, sep=";")



Turdus viscivorus Linnaeus, 1758
Garrulus glandarius Linnaeus, 1758

df1 <- df %>% 
  select(year, month, day, eventdate, scientificname, ocurrenceid) %>% 
  filter(scientificname %in% c("Turdus viscivorus Linnaeus, 1758", "Garrulus glandarius Linnaeus, 1758")) %>%
  # filter(scientificname == "Turdus viscivorus Linnaeus, 1758") %>%
  mutate(count=1) %>% 
  mutate(fecha = as.Date(as.yearmon(paste(year,month, sep='-'), format='%Y-%m'))) %>%
  group_by(scientificname, fecha) %>% 
  summarise(numero=length(scientificname))



df1_aux <- dcast(df1, scientificname ~ fecha, value.var = 'numero') 

mizoo <- zoo(df1, df1$fecha)
plot(mizoo)

df1ts <- read.zoo(df1[,c("numero","fecha")], format = "%Y-%m-%d")
read.zoo
?horizonplot
horizonplot(mizoo) 
, 
            +             layout(c(1,ncol(mizoo))))


ggplot(df1, aes(fecha, group=1)) +
  geom_point(colour=numero) + 
  facet_wrap(~scientificname)
library(lattice)
library(latticeExtra)
library(reshape2)

library(zoo)
as.yearmon(paste(Year, Month, sep = "-")
