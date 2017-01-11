
PATH <- '00_data/AUTOPREISE.CSV'

AP <- read.csv(PATH)
AP <- subset(AP, PREIS < 200000)

AP_FORMULA <- PREIS ~ KW + BESCHLEU + HOECHSTG + VERBR + HUBRAUM
AP_MODEL <- lm(AP_FORMULA, AP)
AP_STEP <- step(AP_MODEL)

summary(AP_MODEL)
summary(AP_STEP)

PREIS_PREDICTION <- predict(AP_MODEL, AP)
head(data.frame(AP$PREIS, PREIS_PREDICTION))

plot(AP$PREIS, PREIS_PREDICTION)
abline(y ~ x, coef = c(0, 1))
