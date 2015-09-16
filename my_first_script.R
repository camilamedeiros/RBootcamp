#This is my scratch script for practicing R

setwd("C:/Users/Camila Medeiros/Documents/GitHub/R-Bootcamp")
library(ape)
library(geiger)
library(ggplot2)


#Trying in class exercises
tips<-c("avoid excel","use a reference manager","learn programming language")
tips
ls() #lists all the variables in the name space
?rm #the rm() alone will delete specified varibles
# if you use the command:'rm(list=ls())' it will delete all varibles saved from your workspace

source("source.example.R") #here we are calling a function from the R-Bootcamp file
source
all.I.know.about.life.I.learned.in.grad.school
all.I.know.about.life.I.learned.in.grad.school()

tt<-read.tree("tree.tre")
tt
head(tt$tip.label)
dd<-read.table("data.txt", header=T, as.is=T,sep='\t')
#here we are calling the data.txt file, saying that the headers from the data file are correct
#to leave the data as they are and not add or change anything and to separate
#colums according to tabs
dd
head(dd)
dim(dd) #total dim= linxcol
dim(dd)[1] #only the line number
dflength<-dim(dd)[1]
dflength
?runif
size<-runif(dflength) #here we created a new column of data
size
head(dd)
cbind(dd,size) #and here we binded it with the original data frame- only possible because their n=

new<-cbind(dd,size) 
new
dd<-new
dd #now dd is the new data frame with the size column

which(dd$mode=='MPF') #this command tells R to look for every componen that
#had MPF on the mode column from the dd dataset. In this case, it returns you the 
#line numbers.

head(dd)
xx==100
xx=100
xx
xx==100

1a=1 #you can't use numbers as variables. never.
dd$mode=='MPF'

dd[which(dd$mode=='MPF'),] #here, it will give you all columns 
#of dd with MPF
just_mpfs<-dd[which(dd$mode=='MPF'),]
just_mpfs
head(just_mpfs)
#always try to use recognizable names for stuff, but maintain an 
#equilibrium so you don't have 329382 word dataframes
dim (dd)
length(tt$tip.label)

#common control statements
for(ii in 1:5){cat('\nthe number is', ii)}

notfish<-c('bat','dolphin','toad','soldier')
for(animal in notfish){cat(animal,"fish\n",sep="")}
#ele vai add fish no final (o \n veio depois da palavra que vc quer add)
#e add o sep="" ele vai juntar a palavra no vetor 'notfish' com fish
for(animal in notfish){cat(animal,"fish", " are tasty\n",sep="")}

#WHILE
#While(some condition is true){do something}

xx <- 1
while(xx < 10){
  cat("value of xx", xx, "\n")
  xx <- xx+1; 
  if (xx == 7){
  cat(" lucky number", xx, "\n")}
  else
  {cat(" not excited about the number", xx, "\n")}
  }
print(xx)

while(xx < 10){
  #cat("value of xx", xx, "\n")
  xx <- xx+1; 
  if (xx == 7){
    cat(" lucky number", xx, "\n")}
  else
  {cat(" not excited about the number", xx, "\n")}
}
print(xx)

