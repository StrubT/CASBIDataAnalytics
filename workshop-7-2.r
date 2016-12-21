
NOF_POINTS <- 10000
NOF_CLUSTERS <- 3

X <- runif(NOF_POINTS)
Y <- runif(NOF_POINTS)
DF <- data.frame(X, Y)

CLUSTERS <- kmeans(DF, NOF_CLUSTERS)
plot(X, Y, col = CLUSTERS$cluster + 1)
