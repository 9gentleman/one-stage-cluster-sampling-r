library(dplyr)


set.seed(123)
data <- data.frame(
  ID = 1:100,
  Value = rnorm(100, mean = 15, sd = 3),
  cluster = sample(1:10,100,replace = T)
)

sampled_clusters <- sample(unique(data$cluster), size = 3, replace = FALSE)

cluster_sample <- data[data$cluster %in% sampled_clusters,]

#mean(cluster_sample$Value[cluster_sample$cluster == 6])

#tapply(cluster_sample$Value, cluster_sample$cluster==2 , mean)

#cluster_sample %>%
  #filter(cluster == 6) %>%
  #summarise(mean_value = mean(Value, na.rm = TRUE))

