setwd("C:/Users/Camila Medeiros/Documents/GitHub")

#3.2.1 Mini-exercise

N0 <- 10
RR <- 0.95
ttMax <- 100 #number of timesteps!

NN <- matrix(NA, nrow=1, ncol=ttMax+1) #this will create a 1x11 matrix with rep NA's.

NN[1] <- N0

for (tt in 1:ttMax) {NN[tt+1] <- RR*NN[tt]} # this will create loops
#over ttMax timesteps, and the model equation will then update NN.

plot(1:(ttMax+1), NN, xlab="time", ylab="N", type="b", col="darkred")

#################

##3.2.2 *Exercise

geometricGrowthFun<- function(N0, RR) {
  NN <- matrix(NA, nrow=1, ncol=ttMax+1) 
  NN[1] <- N0
  for (tt in 1:ttMax) {NN[tt+1] <- RR*NN[tt]}
  plot(1:(ttMax+1), NN, xlab="time", ylab="N", type="b", col="darkred")
}
geometricGrowthFun(N0=10,RR=0.95)


