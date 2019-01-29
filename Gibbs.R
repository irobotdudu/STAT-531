#Initializing
x=c(1.45,2.08,1.62,1.51,1.94,1.43,1.49,1.1,2.14,2.29)
Nsim=10000  #initial values
burnin = 5000
n=10
a=2
b=1
ss=0.2^2
m=1
mu0=0.6
theta0=0.4^2
########################################################

#gibbs <- function (x,mu0,theta0,k)
#{
  #mu=theta=rep(0,Nsim)
  #first entries
  #mu[1] <- mu0
  #theta[1] <- theta0
  #####
  result_theta = result_mu = matrix(ncol=1,nrow=Nsim)
  result_theta[1] = theta0
  result_mu[1] = mu0
  xbar = mean(x)
  j = 1
  burnin_mu = burnin_theta = matrix(ncol = 1, nrow = Nsim - burnin)
  for (i in 2:Nsim){
    
    #mu_temp  <- rnorm(1, (n*ss*xbar+(m*theta[i-1]))/(theta[i-1]+(n*ss)), sqrt((ss*theta[i-1])/(n*ss*theta[i-1])))
    #theta_temp <- 1/rgamma(1, 0.5*(a+(0.5*n)),0.5*sum((x-mu[i-1])^2)+b)
    mu_temp  <- rnorm(1, (n*ss*xbar+(m*result_theta[i-1]))/(result_theta[i-1]+(n*ss)), sqrt((ss*result_theta[i-1])/(n*ss*result_theta[i-1])))
    #theta^2 is a distribution of inverseGamma
    theta_temp <- 1/rgamma(1, 0.5*(a+(0.5*n)),0.5*sum((x-mu_temp)^2)+b)
    
    result_mu[i] <- mu_temp
    result_theta[i] <- theta_temp
   if (i > burnin) {
     burnin_mu[j] <- mu_temp
     burnin_theta[j] <- theta_temp
     j <- j+1
    }
  }
  result_theta
  par(mfrow=c(2,2))
  hist(result_mu,freq=FALSE,xlab="",ylab="mu",ylim=c(0,1.5),col="blue",breaks = 100, main="Histogram 1")
  hist(result_theta,freq=FALSE,xlab="",ylab="theta",ylim=c(0,1),col="green", breaks = 100, main="Histogram 2")
  hist(burnin_mu,freq=FALSE,xlab="",ylab="mu",ylim=c(0,1.5),col="blue",breaks = 100, main="Burn-in 1")
  mean(burnin_mu)
  hist(burnin_theta,freq=FALSE,xlab="",ylab="mu",ylim=c(0,1.5),col="green",breaks = 100, main="Burn-in 2")
  mean(burnin_theta)