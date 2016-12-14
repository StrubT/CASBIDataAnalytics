
PATH <- 'D:/mse/BI/02_data-analytics/02_workshop/workshop-1-3_babies-stoerche.csv'

JAHR <-     c(1965, 1971, 1974, 1977, 1978, 1979, 1980)
BABIES <-   c(1061,  788,  631,  583,  577,  580,  654)
STOERCHE <- c(1910, 1295, 1071,  904, 1019,  974,  910)

TAB <- cbind(JAHR, BABIES, STOERCHE)
DF <- data.frame(TAB)
#DF <- data.frame(JAHR, BABIES, STOERCHE)
str(DF)
summary(DF)

write.table(DF, PATH, quote = FALSE, sep = ',', row.names = FALSE)

DF2 <- read.csv(PATH)
str(DF2)
summary(DF2)
