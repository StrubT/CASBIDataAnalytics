
PATH <- 'D:/mse/BI/02_data-analytics/03_data/GOLF_MIXT.CSV'
GOLF_MIXT <- read.csv(PATH)

library(rpart)

GOLF_FORM <- Play ~ .
GOLF_MODEL <- rpart(GOLF_FORM, data = GOLF_MIXT, method = "class", minsplit = 1)
GOLF_MODEL

plot(GOLF_MODEL, uniform = TRUE, main = "")
text(GOLF_MODEL, use.n = TRUE, all = TRUE, cex = 0.9, fancy = FALSE, minlength = 10)
