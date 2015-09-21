###Plotting and genetic variation data analysis exercises
###EEB 201: R bootcamp
###September 17, 2015
###Kirk Lohmueller

setwd('C:/Users/Camila Medeiros/Documents/GitHub/R-Bootcamp')

## 1)

#a)

snpsDataFrame=read.table('hapmap_CEU_r23a_chr2_ld-1.txt',header=TRUE)

dim(snpsDataFrame)

head(snpsDataFrame)

#codes: AA= 0,  AB= 1, BB = 2

names(snpsDataFrame) #col names
row.names(snpsDataFrame) #rows names
snps=as.matrix(snpsDataFrame) #converting the dataframe to a matrix
head(snps)

testSNP=snps["rs218206_G",]
testSNP
table(testSNP) #this will return you how many ind are 0,1 or 2
#for a selected snip on your dataframe

#this calc the prop of heterozygotes in the locus-- 1, not taking in consideration
#the NA values
het=sum(testSNP==1,na.rm=TRUE)/sum(!is.na(testSNP))
het

#calculates the frequency of minor alleles
freq=sum(testSNP,na.rm=TRUE)/(2.0*sum(!is.na(testSNP)))
freq

#frequence of any set of SNPs data
calc_freq=function(x){
  return(sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x))))} 

#heterozygose of any set of SNPs data
calc_het=function(x){
  return(sum(x==1,na.rm=TRUE)/(sum(!is.na(x))))
}

freq=apply(snps,1,calc_freq) #the apply func will send the command to
#all snps in the dataframe-- uses the arg 1, which means rows=SNPs names
het=apply(snps,1,calc_het)

#X^2
compute_chisquare=function(x){
  freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
  cnt0=sum(x==0,na.rm=TRUE)
  cnt1=sum(x==1,na.rm=TRUE)
  cnt2=sum(x==2,na.rm=TRUE)
  obscnts=c(cnt0,cnt1,cnt2)
  n=sum(obscnts)
  expcnts=c((1-freq)^2,2*freq*(1-freq),freq^2)*n #esperado=HW
  #multiplica por n no final pra converter os dados de freq pra um numero de verdade, contavel 
  chisq=sum((obscnts-expcnts)^2/expcnts)
  return(chisq)
}

compute_chisquare_2=function(x){
  freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
  cnt0=sum(x==0,na.rm=TRUE)
  cnt1=sum(x==1,na.rm=TRUE)
  cnt2=sum(x==2,na.rm=TRUE)
  obscnts=c(cnt0,cnt1,cnt2)
  #print(obscnts)
  n=sum(obscnts)
  #here we use the built-in function for the chi-sq distribution:
  exp_probs=c((1-freq)^2,2*freq*(1-freq),freq^2) #note, here we don't multiply by n
  chisq<-chisq.test(obscnts,p=exp_probs, correct = FALSE)$statistic
  return(chisq)
}

chisqs=apply(snps,1,compute_chisquare)
chisqs2=apply(snps,1,compute_chisquare_2)

#here we will test if the x2 from our obs data is = to null 
#model-HW using a Pearson's correlation
cor.test(chisqs,chisqs2)

#computing p-values and soting them in a vector:
pvals=pchisq(chisqs,1,lower.tail=FALSE)
pvals


##########################################################

#b)

#<0.05
signifthres<-0.05
sum(pvals<signifthres) 
mean(pvals<signifthres) #= 181 SNPs or ~22%

#<0.01
signifthres<-0.01
sum(pvals<signifthres) 
mean(pvals<signifthres) #= 41 SNPs or ~1%

#<0.01
signifthres<-0.001
sum(pvals<signifthres) 
mean(pvals<signifthres) #Yes. 5 SNPs or ~0.1%

#########################################################

#c)

length(pvals) # 4,014 SNPs

num_pval <- length(pvals)

#########################################################

#d)

exp_pvals <- c(1:num_pval/num_pval)
exp_pvals


#########################################################

#e)

sort_pvals <- sort(pvals, decreasing = FALSE, na.last = NA) #decreasing=F, because I want them from the smallest to the largest
#na.last=NA will remove NA values

#########################################################

#f)

log_sort_pvals <- -log10(sort_pvals)
log_sort_pvals

log_exp_pvals <- -log10(exp_pvals)
log_exp_pvals

########################################################

#g)

pdf(file='C:/Users/Camila Medeiros/Documents/GitHub/R-Bootcamp/Exercise2_SNPsPlot.pdf', width=3.5,height=4)


plot(log_exp_pvals,log_sort_pvals,xlab="-log10(expected P-value)",ylab="-log10(observed P-value)",pch=16)


#########################################################

#h)

abline (a = 0, b = 1, lty = 2, col = 2, lwd = 4)

dev.off()

#########################################################

## 2)

#a)

setwd('C:/Users/Camila Medeiros/Documents/GitHub/R-Bootcamp')

zz <- read.table('C:/Users/Camila Medeiros/Documents/GitHub/R-Bootcamp/pheno.sim.2014.txt', header=TRUE)
head(zz)

#########################################################

#b)

summary(zz)
controls <- which(zz$glucose_mmolperL < 4.769)
controls

#########################################################

#c)

cases <- which(zz$glucose_mmolperL > 7.355)
cases

#########################################################

#d)

pdf(file='C:/Users/Camila Medeiros/Documents/GitHub/R-Bootcamp/Exercise2_glucose.pdf', width=3.5,height=4)

par(nfrow=c(1,1), mar=c(4,4,3,2))

plot(density(zz[,2]), col=2, lwd=4, xlab='Blood Glucose Levels',lim=c(3,11),main = 'Normal Distribuition')

abline(v=quantile(zz[,2], 0.25), lty=2, lwd=3, col=1)
abline(v=quantile(zz[,2], 0.75), lty=2, lwd=3, col=1)

dev.off()

##########################################################

#e)

snpsDataFrame=read.table('C:/Users/Camila Medeiros/Documents/GitHub/R-Bootcamp/hapmap_CEU_r23a_chr2_ld-1.txt',header=TRUE)
head(snpsDataFrame)


case_genotypes <- snpsDataFrame ["rs7584086_T", cases]; length(case_genotypes)

##########################################################

#f)

control_genotypes <- snpsDataFrame ["rs7584086_T", controls]; length(control_genotypes)


##########################################################

#g)

table(case_genotypes)
case_genotypes
#1= 12
#2= 3

##########################################################

#h)

table(control_genotypes)
control_genotypes
#0= 14
#NA= 1

##########################################################

