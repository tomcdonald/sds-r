# display pi
pi

# create vector
numbers <- seq(from = 0, to = 4, by = 1)
print(numbers + 5)

# create exp(j) where j = 0,...,4
j_exp = exp(numbers)

# calculate sample variance
x = c(1, 4, 7, 6.2, 5.1)
x_var = var(x)

# take 100 samples of normal dist.
y <- rnorm(n = 100)
hist(y)
hist(y, freq = FALSE)