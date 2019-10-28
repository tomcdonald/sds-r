# 1 - Po(lambda=4) variable, sample n within-set realisations, what proportion lie between 1 and 5 inclusive?

pois_list <- rpois(n=10000, lambda=4)
pois_filtered <- pois_list[(pois_list >= 1) & (pois_list <= 5)]
(proportion = length(pois_filtered) / length(pois_list))

# 2 - Replicate the above 1000 times with n = 10, 100, 1000. Give quartiles.

calc_proportion <- function(n_realisations){
  pois_list <- rpois(n=n_realisations, lambda=4)
  pois_filtered <- pois_list[(pois_list >= 1) & (pois_list <= 5)]
  proportion = length(pois_filtered) / length(pois_list)
}

for (n_val in c(10, 100, 1000)){
  cat("n_realisations = ", n_val)
  set.seed(1993)
  prop_list <- replicate(n=1000, calc_proportion(n_val))
  print(quantile(prop_list, probs=c(0.025, 0.975)))
  hist(prop_list, main=n_val)
}

# 3 - Replicate the above 5 times

for (n_val in c(10, 100, 1000)){
  cat("n_realisations = ", n_val)
  set.seed(1993)
  prop_list <- replicate(n=5, calc_proportion(n_val))
  print(quantile(prop_list, probs=c(0.025, 0.975)))
  hist(prop_list, main=n_val)
}

# The results of 3 aren't as useful as 2, as we haven't
# simulated the process enough times to give a sufficiently
# low level of error.