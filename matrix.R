P<-matrix(c(0.1,0.2,0.6,0.2,0.2,0.1,0.7,0.6,0.3),3,3)
cat("One-step transition matrix:", "\n")
print(P)
Pn=P
n=3
#from 2 to 11
for (i in 2:n){
cat("\n \n")
Pn=Pn%*%P
cat("This is the", i, "th-step transition matrix", "\n")
print(Pn)
}