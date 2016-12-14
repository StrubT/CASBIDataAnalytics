
PATH <- '00_data/WORLD.CSV'

WORLD <- read.csv(PATH)
WORLD. <- WORLD[c(5,6,8,9,10,12,16:19)]

COR <- cor(WORLD.[c(1:6)], use = 'pairwise')
COR

library(corrplot)
corrplot(COR, type = 'lower')

library(corrgram)
corrgram(COR, upper.panel = NULL)

plot(WORLD.)

library(ggplot2)
library(GGally)
ggpairs(WORLD.)
