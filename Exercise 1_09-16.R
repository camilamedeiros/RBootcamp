###Exercise 1-- Control and Flow###


##1)

for(ii in 1:9){cat("\n "); if(ii==9){cat("*\n")}}


##2)

for(ii in 1:9){cat("*&"); if(ii==9){cat("*")}}


##3)

#
dogs <- 10

dogs1 <- dogs + 1 #initial:10; final: 11
dogs1
dogs2 <- dogs1 + 1 #initial:11; final: 12
dogs2
dogs3 <- dogs2 + 1 #initial:12; final: 13
dogs3
dogs4 <- dogs3 + 1 #initial:13; final: 14
dogs4
dogs5 <- dogs4 + 1 #initial:14; final: 15
dogs5

#
meatloaf1 <- 0 #initial:0; final: -4

meatloaf2 <- meatloaf1 -5 +1 #initial:-4; final: -8
meatloaf2
meatloaf3 <- meatloaf2 -6 +1 #initial:-8; final: -13
meatloaf3
meatloaf4 <- meatloaf3 -7 +1 #initial:-13; final: -15
meatloaf4
meatloaf5 <- meatloaf4 -8 +1 #initial:-15; final: -22
meatloaf5
meatloaf6 <- meatloaf5 -9 +1 #initial:-22; final: -30
meatloaf6

bubbles <- 12

bubbles1 <- -1 #initial:12; final: -1
bubbles2 <- -2 #initial:-1; final: -2
bubbles3 <- -3 #initial:-2; final: -3
bubbles4 <- -4 #initial:-3; final: -4

##4) 

years <- c(2015, 2016, 2018, 2020, 2021)
for(ii in 1:length(years)){
  if(years[ii] %% 4 == 0){
    cat(years[ii], 'Hooray, congressional and presidential elections!', sep = '\t', fill = T)
  }
  else
    if(years[ii] %% 2 == 0){
    cat(years[ii], "Hooray, congressional elections!", sep = '\t', fill = T) 
    }
  else
    if(years[ii] %% 1 == 0){
    cat(years[ii], " ", sep = '\t', fill = T) 
    }
}

## 5)

bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5)
interestRate <- 0.0125
compounded <- rep(NA,6)

for (i in 1:length(bankAccounts)) {
  compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i]; }
print(compounded)

## 6)

bankAccounts <- c(10, 9.2, 5.6)
interestRate <- 0.0525
house <- c(4.8, 3.8, 5.7)
food<- c(3.5, 4.3, 5.0)  
fun <- c(7.8, 2.1, 10.5)  
income <- c(21, 21, 21)

for (j in 1:5){
  for(i in 1:length(bankAccounts)) {
  bankAccounts[i] <- bankAccounts[i] - house[i] - food [i] -fun [i] + income [i]
  bankAccounts[i] <- bankAccounts[i] + interestRate*bankAccounts[i]
  }
}
bankAccounts


## 7)

bankAccounts <- c(10, 9.2, 5.6); 
interestRate <- 0.0525;   
house <- c(4.8, 3.8, 5.7);
food<- c(3.5, 4.3, 5.0);    
fun <- c(7.8, 2.1, 10.5);  
income <- c(21, 21, 21);
disbursement <- c(5.0,0,5.0)
years <- c(2015:2020)

for (years in 1:length(years)){
  for(i in 1:length(bankAccounts)) {
    bankAccounts[i] <- bankAccounts[i] - house[i] - food [i] -fun [i] + income [i]
    if(years %% 2 == 1){bankAccounts[i] <- bankAccounts[i] +disbursement[i]}
    bankAccounts[i] <- bankAccounts[i] + interestRate*bankAccounts[i]
  }
}
bankAccounts


## 8)

counter <- 0
total <- 0

while (counter <= 17){
  total <- total + counter
  counter <- counter +1
}

total == sum(1:17)


## 9)

size <- function(ii) {
  if(ii <= -1) {print("small")}
  else if (ii > -1 & ii < 1) {print("medium")}
  else if (ii >= 1){print("big")}
}

size(-2) #checking!
size(0.5)
size(2)