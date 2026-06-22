library(readxl)

data <- read_xlsx("222.xlsx")
new_data <- data[1:20,]



cal_mean <- function(df, param_col=c(), n){
  main_mean <- 0
  clusters_sum <- c()
  for (i in c(1:n)){
    print(clusters_sum)
    cluster_sum <- c(clusters_sum, sum((df)[,param_col[i]], na.rm = T))
    print(clusters_sum)
  }
  print(clusters_sum)
  main_mean <- mean(clusters_sum, na.rm = T)
  return(main_mean)
}

cal_variance <- function(df, M, num_cluster, param_col=c(), main_mean, SE = F, N=0){
  clusters_var <- c()
  clusters_mean_diff <- c()
  for (j in c(param_col)){
    count <- 0
    for (i in c(1:nrow(df))){
      count = count + (as.numeric(df[i,j]) - main_mean)^2
    }
    clusters_mean_diff <- c(clusters_mean_diff, count)
    count <- count*(1/(M-1))
    clusters_var <- c(clusters_var, count)
  }
  main_var <- sum(clusters_mean_diff) * (1/((M*num_cluster)-1))
  text <- paste("clusters var : ", paste(clusters_var, collapse = (", ")), "\n",
                "main var : ", main_var)
  cat(text)
  if(SE == T){
    clusters_sd <- sqrt(clusters_var)
    if(N!=0){
      correction <- sqrt(((N-num_cluster)*M)/((N*M)-1))
      sample_SE <- (1/sqrt(M))*(sum(clusters_sd))*(correction)
    }
    if(N==0){
      sample_SE <- (1/sqrt(M))*(sum(clusters_sd))*(correction)
    }
    cat(paste("\n","Standart Error : ", sample_SE))
  }
}

cal_confidance_interval <- function(se, df_mean, alpha){
  Z_value <- qnorm(1-(alpha/2))
  lower_tail <- df_mean - Z_value * se
  upper_tail <- df_mean + Z_value * se
  confidance_interval <- c(lower_tail, upper_tail)
  return(confidance_interval)
}

cal_num_cluster <- function(E, N, alpha, pop_var){
  Z_val <- qnorm(1-alpha/2)
  num_clus <- ((Z_val^2)*N*pop_var)/(((Z_val^2)*pop_var)+((N-1)*E^2))
  return(num_clus)
}
