set.seed(2016)
Nsim<-10^4

lam<- 2

Mstar<-optimize(f=function(x){dexp(x,rate=lam)/(1/2)}, maximum=T,interval=c(0,2))$objective
cat("The value for M is, M = ", Mstar, "\n")