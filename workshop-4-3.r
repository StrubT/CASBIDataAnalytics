
PATH <- '00_data/GELD.CSV'

GELD <- read.csv(PATH)
head(GELD)
str(GELD)

plot(GELD[1:6], col = as.numeric(GELD$ECHT) + 1)
with(GELD, plot(RIGHT, DIAGONAL, col = as.numeric(ECHT) + 1))
with(GELD, plot(TOP, DIAGONAL, col = as.numeric(ECHT) + 1))

IS_ECHT <- ifelse(GELD$ECHT == "WAHR", 1, 0)

GELD_FORMULA = IS_ECHT ~ GELD$DIAGONAL
GELD_MODEL = glm(GELD_FORMULA, data = GELD, family = binomial)

B0 <- GELD_MODEL$coefficients[1]
B1 <- GELD_MODEL$coefficients[2]
plot(GELD_FORMULA)
curve(1 / (1 + exp(-B0 - B1 * x)), add = TRUE)
