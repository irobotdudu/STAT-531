f<-function(x) 2*exp(-2*x)
M<-2
y<-runif(10^6)
u<-runif(10^6)
#If u < f(y)/Mg(y), then y = x
x<-y[u<f(y)/M]
x
#M<-optimize(f,interval=c(0,1), maximum=TRUE)$objective
#M
