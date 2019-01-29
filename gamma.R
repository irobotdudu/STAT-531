set.seed(2016)
Nsim=1000
X=rep(0,Nsim)
y1=1
y2=4
a=2
n=2
alpha=n*a #shape
beta=a*(y1+y2) #rate
for (i in 1:Nsim){
  X[i]=rgamma(1, shape=alpha, rate=beta)
}
X.mean=mean(X)
cat("The sample mean of 1000 simulated values from the posterior distribution Gamma(alpha,beta)", "\n")
print(X.mean)
cat("The theoretical mean is", alpha/beta, "\n")
