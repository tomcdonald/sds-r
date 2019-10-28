# 1. example lines of code
1:5 * 2:6
#1:5 * 2:3
c(2, 5, 8, 3, 5, 9) > 3.5
c(2, 5, 8, 3, 5, 9) > c(3.5, 5.4)
c(2, 5, 8, 3, 5, 9)[c(2, 5, 8, 3, 5, 9) > 3.5]
c(2, 5, 8, 3, 5, 9)[c(2, 5) > 3.5]
seq(1, 10)[1:10 > 3.4]

# 2. rep(1:4, 1:4) will produce [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
rep(x = 1:4, times = 1:4)

# 3. output combinations of letters and LETTERS
(rep(letters[1:2], times = 4))
(rep(LETTERS[1:3], times = rep(2, 3)))
(rep(seq(2, 8, 2),2))

# 4. vector calculations
x <- c(17.8, 0.8, 1.2, 11, 7, 0.006, 6.9, 5.3)
(x_mean <- mean(x))
(x_minus_mean <- x - x_mean)
(x_sqrt <- sqrt(x))
(x[x > x_sqrt])
(x_sqrt_rnd <- round(x_sqrt, digits = 2))
(x_rnd_diff <- x_sqrt_rnd - x_sqrt)

# 5. more vector manipulation
(x <- seq(-1, 2, by = 0.1))
(y <- x^2)
(y[1])
(y[length(y)])
(y[y > median(y)])
(y[x < mean(x)])

# 6. vector function question
(integer_vector <- 1:10)
(to_replace <- sample(1:10, 5))
(some_missing <- integer_vector)
(some_missing[to_replace] <- NA)
(some_missing[! is.na(some_missing)])

# 7. more example lines
!c(2, 5, 8, 3, 5, 9) < 5.3
seq(1:6)[!c(2, 5, 8, 3, 5, 9) < 5.3]
seq(1:10)[!c(2, 5, 8, 3, 5, 9) < 5.3]
seq(1, 10)[1:10 > 3.4 | 1:10 < 1.1]
seq(1, 10)[!(1:10 > 3.4 | 1:10 < 1.1)]
seq(1, 10)[1:10 > 3.4 & 1:10 < 7.5]
seq(-5, 8)[!seq(12, 27, by = 3)[c(-4, -8)] >= 20]

# 8. missing values question
(x <- c(1, NA, 3, NA, 5, NA))
(any(is.na(x)))
(length(x[is.na(x)]))
