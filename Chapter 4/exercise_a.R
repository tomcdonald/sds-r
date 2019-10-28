# 2.3 example function 2; 'Try this:'
calculate_proportion_in_interval_from_normal <- function(threshold_low, threshold_high, realisations, mu, sigma){
  data_vector <- rnorm(realisations, mean = mu, sd = sigma)
  above_lower_bound <- data_vector > threshold_low
  below_upper_bound <- data_vector < threshold_high
  values_in_interval <- data_vector[above_lower_bound & below_upper_bound]
  proportion_in_interval <- length(values_in_interval) / length(data_vector)
  return(proportion_in_interval)
}

# checking proportion using pnorm, the cumulative distribution function
print(calculate_proportion_in_interval_from_normal(2, 4, 10 ^ 6, 0, 3))
print(pnorm(4, mean = 0, sd = 3) - pnorm(2, mean = 0, sd = 3))

# exercise a1
highest_value_to_a_power= function(x , gamma){
  y <- max(x) ^ gamma
  return(y)
}

x <- c(2, 6, -7)
print(highest_value_to_a_power(x, 2))

x_unif <- runif(100, 0, 10)
print(highest_value_to_a_power(x_unif, 1/2))

highest_abs_value_to_a_power <- function(x , gamma){
  y <- max(abs(x)) ^ gamma
  return(y)
}

print(highest_abs_value_to_a_power(c(2, 6, -7), 2))

# exercise a2
interval_func <- function(x){
  above_2 <- x > 2
  below_minus_3 <- x < -3
  values <- x[above_2 | below_minus_3]
  return(values)
}

answers = interval_func(c(1, 6, -7))

# exercise a3
second_smallest <- function(x){
  sorted <- sort(x)
  ss <- sorted[2]
  return(ss)
}

ss <- second_smallest(c(3.2, 1, 7.9, 7.5, 10.4))

# exercise a4
nth_smallest <- function(x, n){
  sorted <- sort(x)
  ns <- sorted[n]
  return(ns)
}

ns <- nth_smallest(c(3.2, 1, 7.9, 7.5, 10.4), 3)

# exercise a5
x_coords <- runif(50, min = 0, max = 1)
y_coords <- runif(50, min = 0, max = 1)
plot(x_coords, y_coords)

nearest_neighbour <- function(x, y){
  distance <- ((x_coords - x) ^ 2) + ((y_coords - y) ^ 2)
  nn_index <- which.min(distance)
  nn_x <- x_coords[nn_index]
  nn_y <- y_coords[nn_index]
  plot(x_coords, y_coords)
  points(x, y, col = "green")
  points(nn_x, nn_y, col = "red")
}

nearest_neighbour(0.5, 0.5)
