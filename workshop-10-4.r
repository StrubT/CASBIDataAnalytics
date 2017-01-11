
# init

library(mlbench)
data(PimaIndiansDiabetes)

N <- nrow(PimaIndiansDiabetes)
CLASS_COL <- ncol(PimaIndiansDiabetes)

IN_TRAIN <- sample(1:N, N * 2 / 3)
PIMA_TRAIN <- PimaIndiansDiabetes[IN_TRAIN,]
PIMA_TEST <- PimaIndiansDiabetes[ - IN_TRAIN,]

PIMA_FORM <- diabetes ~ .

### KNN ###

library(class)

PIMA_PRED <- knn(PIMA_TRAIN[, - CLASS_COL], PIMA_TEST[ - CLASS_COL], PIMA_TRAIN[, CLASS_COL], 3)
(PIMA_TAB <- table(PIMA_TEST[, CLASS_COL], PIMA_PRED))
(ERR_KNN <- 1 - sum(diag(PIMA_TAB)) / sum(PIMA_TAB))

### RPART ###

library(rpart)

(PIMA_MODEL <- rpart(PIMA_FORM, data = PIMA_TRAIN))

PIMA_PRED <- predict(PIMA_MODEL, PIMA_TEST, type = "class")
(PIMA_TAB <- table(PIMA_TEST[, CLASS_COL], PIMA_PRED))
(ERR_RPART <- 1 - sum(diag(PIMA_TAB)) / sum(PIMA_TAB))

### NAIVEBAYES ###

library(e1071)

(PIMA_MODEL <- naiveBayes(PIMA_FORM, data = PIMA_TRAIN))

PIMA_PRED <- predict(PIMA_MODEL, PIMA_TEST, type = "class")
(PIMA_TAB <- table(PIMA_TEST[, CLASS_COL], PIMA_PRED))
(ERR_NAIVEBAYES <- 1 - sum(diag(PIMA_TAB)) / sum(PIMA_TAB))

### SVM ###

(PIMA_MODEL <- svm(PIMA_FORM, PIMA_TRAIN))

PIMA_PRED <- predict(PIMA_MODEL, PIMA_TEST, type = "class")
(PIMA_TAB <- table(PIMA_TEST[, CLASS_COL], PIMA_PRED))
(ERR_SVM <- 1 - sum(diag(PIMA_TAB)) / sum(PIMA_TAB))

### NNET ###

library(nnet)

(PIMA_MODEL <- nnet(PIMA_FORM, PIMA_TRAIN, size = 1, maxit = 1000, decay = 1e-3))

PIMA_PRED <- predict(PIMA_MODEL, PIMA_TEST, type = "class")
(PIMA_TAB <- table(PIMA_TEST[, CLASS_COL], PIMA_PRED))
(ERR_NNET <- 1 - sum(diag(PIMA_TAB)) / sum(PIMA_TAB))

# summary

ERR_VAL <- c(ERR_KNN, ERR_RPART, ERR_NAIVEBAYES, ERR_SVM, ERR_NNET)
ERR_NAME <- c('KNN', 'RPART', 'NAIVEBAYES', 'SVM', 'NNET')
X <- barplot(ERR_VAL, names.arg = ERR_NAME, ylim = c(0, 1), col = '#800000')
text(X, y = ERR_VAL + 0.05, labels = paste(format(ERR_VAL * 100, digits = 3), "%", sep = ""))
