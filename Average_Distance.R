library(ggplot2)
library(igraph)

#plot(make_lattice(c(2.5, 2.5)))

N <- seq(1, 1000, 100)

calculate_average <- function(n, dim = 1){
  return (mean_distance(make_lattice(rep(n ** (1/dim), each = dim), directed = 
                                       FALSE)))
}

average_distans <- function(n){
  tmp <- c()
  for (i in 1:50)
    tmp <- c(tmp, mean_distance(erdos.renyi.game(n, min(3/n, 1))))
  return(mean(tmp))
}

one_dim <- unlist(lapply(N, calculate_average, dim = 1))
two_dim <-  unlist(lapply(N, calculate_average, dim = 2))
three_dim <-  unlist(lapply(N, calculate_average, dim = 3))
random_graph <-  unlist(lapply(N, average_distans))

df <- data.frame(one_dim, two_dim, three_dim, random_graph)

matplot(N, df, type = 'l', log = 'y', col = c('red', 'blue', 'green',
                                                'purple'))
legend("topleft", legend = c('1d', '2d', '3d', 'random'), col =
         c('red', 'blue', 'green', 'purple'), lty = 1:2, cex = 0.8)
