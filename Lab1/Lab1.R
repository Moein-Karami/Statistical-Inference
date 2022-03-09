sum <- T + F
typeof(sum)
sum <- as.logical(sum)
sum

feature_1 <- c(50 : 250)
length(feature_1)
mean(feature_1)
var(feature_1)
sd(feature_1)
median(feature_1)

plot(feature_1)

a <- feature_1[6 : 22]

b <- c(feature_1[6], feature_1[13], feature_1[21 : 22], feature_1[43])

c <- c(a, b)

str <- c("joey","phoebe","monica","chandler","ross","rachel")

install.packages("stringr")
library(stringr)
str_contains(str, 'a')
ifelse(grepl("a", c), 1, 0)
