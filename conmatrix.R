#requirement maximum difference
crit=10^(-4)
#Random initial value
err=999
#start from P^1
j=1
#intialize the matrix P
Pnew=P
while (err > crit){
    #P=P*P
    j=j+1
    Pold=Pnew
    Pnew=Pold%*%P
    cat("This is the", j, "th-step transition matrix", "\n")
    print(Pnew)
    err=max(abs(Pnew-Pold))
}