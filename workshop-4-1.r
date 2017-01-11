
PATH <- '00_data/AUTOPREISE.CSV'

AP <- read.csv(PATH)

with(AP, plot(KW, VERBR))

AP_FORMULA <- VERBR ~ KW

AP_MODEL <- lm(AP_FORMULA, AP)
AP_MODEL
summary(AP_MODEL)

abline(AP_MODEL, lwd = 2, col = 'red')
plot(AP_MODEL)

VERBR_PREDICTION <- predict(AP_MODEL, AP)
head(data.frame(AP$VERBR, VERBR_PREDICTION))

plot(AP$VERBR, VERBR_PREDICTION,
		 xlim = c(0, 30),
		 ylim = c(0, 30))
abline(y ~ x, coef = c(0, 1))
