set.seed(2)
lamb<-4
Nsim <- 10^4
U<-runif(Nsim)
#print(U)
X<-(1/(lamb^2))*log(1-U)*log(1-U)
print(X)
Dmean<-mean(X)
print(Dmean)
Dvar<-var(X)
print(Dvar)
hist(X, freq=F, main= "Dis")