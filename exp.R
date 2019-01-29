Nsim = 10^4
 U <-  runif (Nsim)
 print(U)
 X <-  - log(U)
 print(X)
 #simulate lamb from 0 to 1
 Z<- ((U^-1)*X)^2
 print(Z)
 Y <-   rweibull(Nsim, shape = 0.5, scale = 1)
 par(mfrow=c(1,3))
 hist(X, freq=F, main= "Exp")
 hist(Y, freq=F, main= "Weibull from R")
 hist(Z, freq=F,  main= "winn")