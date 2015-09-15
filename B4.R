#B.4 Functions
help(mean)
mean(1:4)
mean(1:4,trim=0)
mean(1:4,trim=0.5)
mean(1:4,trim=4)
#No R, os mesmos comandos podem realizar tarefas diferentes dependento da classe do seu objeto:
class(1:10) #comando pra classificar o tipo de dado
class(warpbreaks)
print(warpbreaks)
summary(1:10) #comando pra obter infos gerais do seu conjunto de dados
summary(warpbreaks) #Nesse caso, ele da o resumo dos dados numericos, e apenas o 'n' de cada nivel
#das variaveis nao numericas
summary(lm(breaks~wool,data=warpbreaks))
?lm #lm is used to fit linear models. It can be used to carry out regression, 
#single stratum analysis of variance and analysis of covariance (although aov may provide a more convenient interface for these).

#B.4.1 Writing your own funtions
MyBogusMean<-function(x,cheat=0.05){
  SumOfX<-sum(x)
  n<-length(x)
  trueMean<-SumOfX/n
  (1+cheat)*trueMean
  }
RealSales<-c(100,200,300)
MyBogusMean(RealSales) #Sempre prestar atencao na grafia das palavras
#e se estao em Caps ou não!
MyBogusMean(RealSales,cheat=0.1)
MyBogusMean(RealSales,cheat=0)
