
PATH <- 'D:/mse/BI/02_data-analytics/02_workshop/00_data/WINE.CSV'

WINE <- read.csv(PATH)

WINE_PC <- prcomp(WINE[2:14])

biplot(WINE_PC)

PRED <- predict(WINE_PC)
plot(PRED)

WINE_COR <- cor(cbind(WINE[2:14], WINE_PC$x[,1:2]))

library(corrplot)
corrplot(WINE_COR)
