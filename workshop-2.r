
PATH <- '00_data/WORLD.CSV'

WORLD <- read.csv(PATH)

### METRISCH ###

WORLD_MET <- WORLD[c(5,6,8,9,10,12)]
names(WORLD_MET)
summary(WORLD_MET)

#...

### KATEGORIAL ###

WORLD_KAT <- WORLD[c(16:19)]
names(WORLD_KAT)
summary(WORLD_KAT)

length(table(WORLD_KAT$GOVERN))
names(which.max(table(WORLD_KAT$GOVERN)))

length(table(WORLD_KAT$GOVERN_S))
names(which.max(table(WORLD_KAT$GOVERN_S)))

length(table(WORLD_KAT$RELIGION))
names(which.max(table(WORLD_KAT$RELIGION)))

length(table(WORLD_KAT$RELIGION_S))
names(which.max(table(WORLD_KAT$RELIGION_S)))

