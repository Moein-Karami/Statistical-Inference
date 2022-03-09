library(igraph)

p <- 2 ** seq(0, -15, -0.5)

calculate_clustering <- function(prob){
  tmp <- c()
  for (i in 1:50)
    tmp <- c(tmp, transitivity(sample_smallworld(dim = 1, size = 1000, nei = 5,
                                                 prob)))
  return(mean(tmp))
}
calculate_dist <- function(prob){
  tmp <- c()
  for (i in 1:50){
    tmp <- c(tmp, mean_distance(sample_smallworld(dim = 1, size = 1000,
                                                     nei = 5, prob)))
  }
  return(mean(tmp))
}

average_cluster <- unlist(lapply(p, calculate_clustering))
average_dist <- unlist(lapply(p, calculate_dist))

base_cluster = calculate_clustering(0)
base_dist = calculate_dist(0)

average_cluster <- average_cluster / base_cluster
average_dist <- average_dist / base_dist

df <- data.frame(average_cluster, average_dist)

matplot(p, df, type = 'l', log = 'x', col = c('red', 'blue'))
legend("bottomleft", legend = c('cluster', 'dist'), col =
         c('red', 'blue'), lty = 1:2, cex = 0.8)
