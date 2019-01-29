theta0 <- rmultinom(1, size = 197, prob = c(0.25,0.125, 0.125, 0.5))
#theta0 <- rmultinom(1, size = 4, prob = c(0.4375,0.003125, 0.003125, 0.5))
#theta0 <- rmultinom(1, size = 4, prob = c(0.1,0.2,0.3,0.4))
iter <-20
EM = temp = theta0
for (i in 1: iter) {
theta2 = (125*(temp/(2+temp))+34)/(125*(temp/(2+temp))+72)
temp =theta2
EM =rbind(EM,theta2)
}
EM
#cat("bye\n")
