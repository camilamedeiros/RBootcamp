###Exercise 1-- Control and Flow###


##1)

for(ii in 1:10){cat("\n "); if(ii==10){cat("*\n")}}


##2)

for(ii in 1:10){cat("*&"); if(ii==10){cat("*")}}


##3)

##4)

years <- c(2015, 2016, 2018, 2020, 2021)
for(ii in 1:length(years)){
  if(years[ii] %% 4 == 0){
    cat(years[ii], 'Hooray, congressional and presidential elections!', sep = '\t', fill = T)
  }
}


## 5)

bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);
interestRate <- 0.0125;
compounded <- rep(NA,6)

for (i in 1:length(bankAccounts)) {
  compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i]; }
print(compounded)

## 6)

bankAccounts <- c(10, 9.2, 5.6); 
interestRate <- 0.0525;   
house <- c(4.8, 3.8, 5.7);
food<- c(3.5, 4.3, 5.0);    
fun <- c(7.8, 2.1, 10.5);  
income <- c(21, 21, 21);

bankAccountsLiq <- bankAccounts - house - food - fun + income
bankAccountsLiq

compounded<- rep(NA, 3)

for (j in 1:5) {
  for (i in 1:length(bankAccountsLiq)) {compounded[i] <- interestRate*bankAccountsLiq[i] + bankAccountsLiq[i]; }
}
compounded


## 7)

