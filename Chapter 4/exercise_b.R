# section 5 "Try this:"
calculate_proportion_in_interval_from_normal <- function(threshold_low, threshold_high, realisations = 100, mu = 2, sigma = 1.2){
  data_vector <- rnorm(realisations, mean = mu, sd = sigma)
  above_lower_bound <- data_vector > threshold_low
  below_upper_bound <- data_vector < threshold_high
  values_in_interval <- data_vector[above_lower_bound & below_upper_bound]
  proportion_in_interval <- length(values_in_interval) / length(data_vector)
  return(proportion_in_interval)
}

calculate_proportion_in_interval_from_normal(0, 2)

# section 6 "Try this:"
remove_low_values <- function(x, threshold = 0) x[-which(x < threshold)]
print(remove_low_values(c(-2, 3, 5)))

# section 8 "Try this:"
x <- c(1, -6, 9, 224, 67, 3, 89)
threshold = 50

remove_low_values_through_extraction <- function(x, threshold) {
  low_values_indices = which(x < threshold)
  x[-low_values_indices]
}

answer <- remove_low_values_through_extraction(x, threshold)

# section 10 "Try this:"
x <- seq(2, 10, by = 0.5)
x[1] <- NA
x %>% remove_low_values(threshold = 5) %>% mean(na.rm = TRUE)

# exercise b1
highest_value_to_a_power <- function(x, gamma){
  max <- max(x) ^ gamma
  median <- median(x) ^ gamma
  min <- min(x) ^ gamma
  return(list(max, median, min))
}

x_norm <- rnorm(100)
x_norm_values <- highest_value_to_a_power(x_norm, 1)

# exercise b2
nth_smallest <- function(x, n = 3){
  sorted <- sort(x)
  ns <- sorted[n]
  return(ns)
}

print(nth_smallest(c(9, 5, 6.7, 3, 5.4, 12)))

# exercise b3
quadratic_form <- function(n = 2, A = diag(1, 2, 2), x){
  q_form <- t(x) %*% A %*% x
  return(q_form)
}

print(quadratic_form(x = c(5, 10)))

# exercise b4
is_pos_def <- function(A){
  x_coords <- runif(10 ^ 5, -10 ^ -12, 10 ^ 12)
  y_coords <- runif(10 ^ 5, -10 ^ -12, 10 ^ 12)
  for (i in length(x_coords)){
    vect <- c(x_coords[i], y_coords[i])
    qf <- quadratic_form(A = A, x = vect)
    if (qf < 0){
      print("Matrix is not positive definite.")
      break
    }
  }
  print("Matrix may be positive definite. No negative quadratic forms found.")
}

A <- matrix(data = c(4, 3, 5, 4), nrow = 2, ncol = 2)
is_pos_def(A)
  