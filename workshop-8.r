
PATH <- 'D:/mse/BI/02_data-analytics/02_workshop/00_data/WINE.CSV'

WINE <- read.csv(PATH)
WINE <- scale(WINE[2:14])

WINE_PC <- prcomp(WINE)

biplot(WINE_PC)

PRED <- predict(WINE_PC)
plot(PRED)

WINE_COR <- cor(cbind(WINE, WINE_PC$x[, 1:2]))

library(corrplot)
corrplot(WINE_COR)
