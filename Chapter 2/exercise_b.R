# create normal distribution plot
x <- seq(-3, 3, by = 0.01)
y <- dnorm(x)
plot(x,y, type="l", ylab="Probability Density")

# gives P(X=7) for X~Po(3)
dpois(7, 3, log = FALSE)

# manual calculation of P(X=7)
result <- ( (3 ^ 7) * exp(-3) ) / factorial(7)

# create probability mass function plot for Po(3) rand. variable
x <- seq(0, 10, by = 1)
y <- dpois(x, 3, log = FALSE)
plot(x,y, type="h", ylab="Probability")

# improved syntax task
normal_quantile <- qnorm(0.4, mean = 0, sd = 1)
squared_value = normal_quantile ^ 2
