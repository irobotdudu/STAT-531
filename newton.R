options(digits=10)
newton.raphson <- function(f, a, tol = 10^-9) {
  require(numDeriv) # Package for computing f'(x)
  
  x0 <- a # Set start value to supplied lower bound
  k <- 1 # Initialize for iteration results
  i <- 1
 repeat{
    dx <- genD(func = f, x = x0)$D[1] # First-order derivative f'(x0)
    x1 <- x0 - (f(x0) / dx) # Calculate next value x1
    k[i] <- x1 # Store x1
    # Once the difference between x0 and x1 becomes sufficiently small, output the results.
    if (abs(x1 - x0) < tol) {
      print(x1)
      break;
    }
    # If Newton-Raphson has not yet reached convergence set x1 as x0 and continue
    x0 <- x1
    i <- i + 1
    #cat("\n")
  }
}
func2<- function(x){
    x^3 -x -1
}
newton.raphson(func2, 1.5)