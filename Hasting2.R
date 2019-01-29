# d)
a=2.5; b=5;  
Nsim=10000
burnin = 5000
X = rep(runif(1),Nsim)
B = matrix(ncol = 1, nrow = Nsim - burnin)
j = 1
for (i in 2:Nsim){
  Y=runif(1)
  rho=dbeta(Y,a,b)/dbeta(X[i-1],a,b)
  X[i]=X[i-1] + (Y-X[i-1])*(runif(1)<rho)
  if(i > burnin){
    B[j] = X[i-1] + (Y-X[i-1])*(runif(1)<rho)
    j <- j + 1
  }
  
}
par(mfrow=c(2,2))
hist(X,nclass=150,col="grey",
     main="Metropolis-Hastings",fre=FALSE)
curve(dbeta(x,2.5,5),col="sienna",lwd=2,add=TRUE)
hist(rbeta(Nsim,2.5,5),nclass=150,col="grey",
     main="Direct Generation",fre=FALSE)
curve(dbeta(x,2.5,5),col="sienna",lwd=2,add=TRUE)
length(unique(X))/Nsim
mean(rbeta(Nsim,a,b))
mean(B)
hist(B,nclass=150,col="grey",
     main="5000 Burn-in",fre=FALSE)
#length(unique(B))/(Nsim-burnin)
ks.test(jitter(B),rbeta(10000,2.5,5))