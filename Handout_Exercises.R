setwd("C:/Users/Camila Medeiros/Documents/GitHub")

## Handout Exercises

#3.2.1 Mini-exercise

N0 <- 100
RR <- 0.75
ttMax <- 100 #number of timesteps!

NN <- matrix(NA, nrow=1, ncol=ttMax+1) #this will create a 1x11 matrix with rep NA's.

NN[1] <- N0

for (tt in 1:ttMax) {NN[tt+1] <- RR*NN[tt]} # this will create loops
#over ttMax timesteps, and the model equation will then update NN.

plot(1:(ttMax+1), NN, xlab="time", ylab="N", type="b", col="darkred")

##########################################################

##3.2.2 *Exercise

geometricGrowthFun<- function(N0, RR) {
  NN <- matrix(NA, nrow=1, ncol=ttMax+1) 
  NN[1] <- N0
  for (tt in 1:ttMax) {NN[tt+1] <- RR*NN[tt]}
  plot(1:(ttMax+1), NN, xlab="time", ylab="N", type="b", col="darkred")
}
geometricGrowthFun(N0=100,RR=0.95)

##########################################################

#3.3 Logistic growth in discrete time
N0 <- 8
rr <- 0.8
KK<-100
ttMax <- 15 #number of timesteps!

NN <- matrix(NA, nrow=1, ncol=ttMax+1) #this will create a 1x11 matrix with rep NA's.

NN[1]<-N0
for(tt in 1:ttMax){NN[tt+1]<-NN[tt]*(1+(rr*(1-((NN[tt])/KK))))}
plot(1:(ttMax+1), NN, xlab="time", ylab="N", type="b", col="darkred")


##########################################################

#3.3.1 *Mini-exercise

discreteLogisticFun <- function (N0,rr,KK) {
  NN <- matrix(NA, nrow=1, ncol=ttMax+1)
  NN[1]<-N0
  for(tt in 1:ttMax){NN[tt+1]<-NN[tt]*(1+(rr*(1-((NN[tt])/KK))))}
  plot(1:(ttMax+1), NN, xlab="time", ylab="N", type="b", col="darkred")
}
discreteLogisticFun (N0=10, rr=-0.25, KK=100)


##########################################################

#3.3.2 *Mini-exercise 


rdVec <- c(-0.3, 0.3, 1.3, 1.9, 2.2, 2.7)

  par(mfrow = c(2,3))
  
  for(rr in rdVec){
    discreteLogisticFun (N0=10, rr=rr, KK=100) }
  
##########################################################

# 4.1.1 *Mini-exercise

library(deSolve)
  
expGrowthODE <- function (tt, NN, pars) {
   derivs <- pars['rr']*NN
   return(list(derivs))
  }

init <- 1
tseq <- seq(0, 100, by=0.01)
pars <- c(rr = 0.1)

outputexpGrowthODE <- lsoda(init, tseq, expGrowthODE, pars)
head (outputexpGrowthODE)

plot(outputexpGrowthODE[, 1], outputexpGrowthODE[, 2], col = "darkred", type = "l", lwd = "2", xlab='Time', ylab='N', main='Exponential Growth')

##########################################################

# 4.2.1 *Mini-exercise

library(deSolve)

logGrowthODE <- function (tt, NN, pars) {
  derivs <- pars['rr']*NN
  return(list(derivs))
}

init <- 50
tseq <- seq(0, 100, by=0.01)
pars <- c(rr = -0.8, KK = 100)

logGrowthODE <- lsoda(init, tseq, logGrowthODE, pars)
head (logGrowthODE)

plot(logGrowthODE[, 1], logGrowthODE [, 2], col = "darkred", type = "l", lwd = "1.5", xlab='Time', ylab='N', main='Logistic Growth')

