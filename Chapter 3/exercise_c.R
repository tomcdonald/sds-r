# 1. matrix algebra

(a <- matrix(c(1, -3, 2, 1), nrow = 2))
(b <- matrix(c(3, 4, 5, -2, 0, 3), nrow = 2))
(a %*% b)

# 2. matrix manipulation

(a[1, ])
(a[1, ] + 5)

(a[1, , drop = FALSE] + 5)
dim(a[1, , drop = FALSE] + 5)

# 3. %*% vs * with matrices

(a <- matrix(c(1, -3, 2, 1, 4, 2), byrow = TRUE, nrow = 2))
(a %*% a) # creates an error as it should
(a * a) # does not error

# 4. array filling

(f <- array(1:24, dim = c(3, 4, 2)))
f[1, 1, 2] # should give 13
f[14, 1, 2] # should error
f[1:2, 2:4, 1] # should give[[4, 7, 10], [5, 8, 11]]

# 5. list manipulations

(some_list <- list(1:4, matrix(1:4, nrow = 2), letters))

some_list[[1]] # should give 1:4 vector
some_list[[3]][5] # should give the letter "e"
some_list[[2]][2, 2] #should give number 4
dim(some_list[[2]][2, ]) # should give NULL
length(some_list[[2]][2,]) #should give number 2
dim(some_list[[2]][2, , drop = F]) # should give [1, 2]
some_list[1] # gives list object
some_list[1:2] # gives list and matrix objects
