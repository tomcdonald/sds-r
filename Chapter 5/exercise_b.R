# 1 - Calculate actual probability from Ex. A, Q2
# below gives probability of 5 or less events (i.e. between 1 and 5)

(ppois(5, 4) - ppois(0, 4))

# 2 - use 95% CI equation to verify the 2.5% and 97.5% quantiles
#     from Ex.A, Q2, with n=1000. These were [0.740, 0.792]

p <- ppois(5, 4) - ppois(0, 4)
n <- 1000
estimator = rnorm(1, mean=p, sd=((p * (1 - p)) / n))
low_ci <- p - (1.96 * sqrt(((p * (1 - p)) / n)))
high_ci <- p + (1.96 * sqrt(((p * (1 - p)) / n)))
(ci <- c(low_ci, high_ci))

# The equation Eq7.1 gives [0.7597, 0.8106], so not too different.

# 3 - Three 6 sided dice, Three 8 sided dice and Two 12 sided dice.
#     Can model these binomially. A person picks a random die
#     and rolls it, then replaces, continuing until they've
#     rolled 5 dice. Assuming rolls are independent, what is 
#     the probability the total score over 5 rolls > 36?

five_rolls <- function(){
  total <- 0
  for (i in 1:5){
    dice <- sample(c(6, 6, 6, 8, 8, 8, 12, 12), 1, replace=TRUE)
    roll <- sample(1:dice, size=1, replace=TRUE)
    total = total + roll
  }
  return(total)
}

trials <- replicate(5000, five_rolls())
trials_filtered <- trials[trials >= 36]
(prob_36 <- length(trials_filtered) / length(trials))

# The probability is around 0.03

# 4 - See question for explanation - lilies in pond
# create x, y coords of lillies
# create list of lilly radii, uniformly dist. between 25 & 100
# Pick a random lily
# Run check that it doesn't overlap with another lily (distance (sqrt(x^2 + y^2)) > sum of two lily radii)

lily_overlap <- function(n_lil=10){
  x_lil <- runif(n_lil, min = 0, max = 5)
  y_lil <- runif(n_lil, min = 0, max = 4)
  r_lil <- runif(n_lil, min = 0.25, max = 1)
  rand_lil <- sample(1:10, size = 1)
  x1 <- x_lil[rand_lil]
  y1 <- y_lil[rand_lil]
  r1 <- r_lil[rand_lil]
  for (i in 1:10){
    if (i != rand_lil){
      x2 = x_lil[i]
      y2 = y_lil[i]
      r2 = r_lil[i]
      d = sqrt((x2-x1)**2 + (y2-y1)**2)
      if (d < (r1 + r2)){
        return(TRUE)
      }
    }
  }
  return(FALSE)
}

n_trials <- replicate(10^5, lily_overlap())
prob <- length(n_trials[n_trials == FALSE]) / length(n_trials)
cat('Probability of random lily NOT overlapping with another =', prob)

# 5 - HR problem; complex, see exercises for info
# a) The assumption of the normal distribution is fairly reasonable as it gives a distribution with values
#    ranging from around zero, up to an hour, centred around 30 minutes. The exponential functions are a
#    reasonable selection in terms of shape, but the extreme values included are not particularly sensible;
#    it's highly improbable anybody is spending > 100 minutes on their morning coffee break.
# b) The assumption of independence is unrealistic, as some employees likely take their lunch/breaks together,
#    meaning that the time taken by those people will be dependent on one another.
# c) By using Monte Carlo simulation and using the manager's choice of probability distributions above, 
#    draw a histogram of the probability distribution of the total combined time taken over lunch and 
#    both coffee breaks by the employees in the company.

one_employee <- function(){
  lunch <- rnorm(1, mean = 30, sd = 10)
  morn <- rexp(1, rate = (1 / 20))
  aft <- rexp(1, rate = (1 / 10))
  total <- lunch + morn + aft
  return(total)
}

n_employees <- replicate(10^5, one_employee())
h <- hist(n_employees, breaks = 100, plot=FALSE)
h$counts=h$counts/sum(h$counts)
plot(h, main = paste("Distribution of Total Break Time per Day"), ylab = "Probability", xlab = "Break Length (Mins)")

# d) We could look at the 95% confidence interval and ensure that the upper and lower bounds give the same
#    number to a certain amount of d.p. If the bounds are identical to 2 or 3 d.p., we can be fairly confident
#    that our estimate is reliable and we've used enough realisations.

# e) 10% of the employees take >90 minutes, so the distribution should be centred around 10 people. A standard
#    deviation of 3 seems appropriate, as when tested with high N, this gives the normal distribution a tail
#    which ends around 0.

hist(rnorm(100, mean = 10, sd = 3))

# f) If p = 0.08 was observed as probability based on n = 100 observations, the 95% CI is as follows:

upper <- 0.08 + (1.96 * (0.08 * (1 - 0.08))) / 100
lower <- 0.08 - (1.96 * (0.08 * (1 - 0.08))) / 100
cat("2.5% interval =", lower * 100, "employees")
cat("97.5% interval =", upper * 100, "employees")

# g) 2 out of 25 employees still gives p = 0.08 and would give the following CI. This is inappropriate due
#    due to the small value of n, as the CLT only applies when n is large.

upper <- 0.08 + (1.96 * (0.08 * (1 - 0.08))) / 25
lower <- 0.08 - (1.96 * (0.08 * (1 - 0.08))) / 25
cat("2.5% interval =", lower * 100, "employees")
cat("97.5% interval =", upper * 100, "employees")
