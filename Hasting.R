# b)
a=2.5; b=5;  
Nsim=10000
burnin = 5000
X=rep(runif(1),Nsim)
for (i in 2:Nsim){
  Y=runif(1)
  rho=dbeta(Y,a,b)/dbeta(X[i-1],a,b)
  #print(rho)
  X[i]=X[i-1] + (Y-X[i-1])*(runif(1)<rho)
}
par(mfrow=c(1,2))
hist(X,nclass=150,col="grey",
     main="Metropolis-Hastings",fre=FALSE)
curve(dbeta(x,2.5,5),col="sienna",lwd=2,add=TRUE)
hist(rbeta(10000,2.5,5),nclass=150,col="grey",
     main="Direct Generation",fre=FALSE)
curve(dbeta(x,2.5,5),col="sienna",lwd=2,add=TRUE)
#For part c
ks.test(jitter(X),rbeta(10000,2.5,5))
