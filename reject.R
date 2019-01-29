f<-function(x) 2*exp(-2*x)
M<-4
Y<-runif(10^4, max = 2)
U<-runif(10^4, max = 2)
X<- Y[U<f(Y)/M]
Dmean<-mean(X)
print(X)
hist(X, freq=F, main= "Rej")