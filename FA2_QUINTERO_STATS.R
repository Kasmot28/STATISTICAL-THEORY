#3.49
# Define the vector X
y <- c(4, 2, 1, 9, 15)  # You can replace this with any numeric vector

# Calculate the number of elements in X
N <- length(y)

# Compute the left-hand side of the identity
left_hand_side <- sum((y - 1)^2)

# Compute the right-hand side of the identity
right_hand_side <- sum(y^2) - 2 * sum(y) + N

# Print the results
print(paste("Left-hand side:", left_hand_side))
print(paste("Right-hand side:", right_hand_side))

# Check if the two sides are equal
if (identical(left_hand_side, right_hand_side)) {
  print("The identity holds.")
} else {
  print("The identity does not hold.")
}

#3.51
U <- c(3,-2,5)
V <- c(-4,-1,6)

#(a) calculate the sum of the product of U and V
sum_a <- sum(U*V)

#(b) Sum of (U + 3)(V - 4)
sum_b<- sum((U+3)*(V-4))

#(c) sum v squared
sum_c <- sum(V**2)

#(d) sum U times sum v squared

sum_d <- sum(U)*sum(V)**2

#(e)  Calculate sum of UV^2
sum_e<- sum(U * V^2)

#(f) Calculate sum of (U^2 - 2V^2 + 2)
sum_f <- sum(U**2 - 2*V**2 + 2)

#(g) Calculate sum of U/V
sum_g <- sum(U/V)

#results
print(paste("Sum of UV:",sum_a))
print(paste("Sum of (U + 3)(V - 4):",sum_b))
print(paste("Sum of V^2:",sum_c))
print(paste("(Sum U) * (Sum V)^2:",sum_d))
print(paste("Sum of UV^2:",sum_e))
print(paste("Sum of (U^2 - 2V^2 + 2):",sum_f))
print(paste("Sum of U/V:",sum_g ))

#3.90 Find the geometric mean of the sets (a) 3, 5, 8, 3, 7, 2 and (b) 28.5, 73.6, 47.2, 31.5, 64.8.
set_a <- c(3,5,8,3,7,2)
set_b <- c(28.5, 73.6, 47.2, 31.5, 64.8)

# Function to calculate geometric mean
geometric_mean <- function(x) {
  prod(x)^(1/length(x))
}

# calculate the geometric mean for set a and b
geomean_a <- geometric_mean(set_a)
geomean_b <- geometric_mean(set_b)

#results for geometric mean for set a and set b
print(paste("Geometric mean for set a:", geomean_a))
print(paste("Geometric mean for set b:", geomean_b))