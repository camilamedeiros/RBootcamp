setwd("C:/Users/Camila Medeiros/Documents/GitHub/R-Bootcamp")

#3.3 Logistic growthin discrete time
N0 <- 8
rr <- 0.8
KK<-100
ttMax <- 15 #number of timesteps!

NN <- matrix(NA, nrow=1, ncol=ttMax+1) #this will create a 1x11 matrix with rep NA's.

NN[1]<-N0
for(tt in 1:ttMax){NN[tt+1]<-NN[tt]*(1+(rr*(1-((NN[tt])/KK))))}
plot(1:(ttMax+1), NN, xlab="time", ylab="N", type="b", col="darkgreen")


####################

#3.3.1 *Mini-exercise

discreteLogisticFun <- function (N0,rr,KK) {
  NN <- matrix(NA, nrow=1, ncol=ttMax+1)
  NN[1]<-N0
  for(tt in 1:ttMax){NN[tt+1]<-NN[tt]*(1+(rr*(1-((NN[tt])/KK))))}
  plot(1:(ttMax+1), NN, xlab="time", ylab="N", type="b", col="darkgreen")
}
discreteLogisticFun (N0=10, rr=0.5, KK=100)

#####################

#3.3.2 *Mini-exercise 



