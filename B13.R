#B.13 Graphics
#B.13.1 plot
data(trees)
attach(trees)
plot(Girth,Height)

#B.13.2 Adding points, lines and text to a plot

par(mar=c(5,4,3,2))
plot(Girth,Volume,type="n",main= "My Trees") #aqui ele da os eixos, indica o tipo de variavel do grafico
#e o titulo dele
points(Girth, Volume, type="h",col="lightgrey",pch=19) #aqui ele adiciona o tipo de grafico q quer colocar 
#dentro do plot e a cor

#pra adicionar pontos dentro do gráfico
hts<-(Height-min(Height))/max(Height-min(Height))
my.colors<-hcl(h=30+270*hts,alpha=0.9) #hcl= é um tipo de coloracao que facilita a percepcao humana
#hts=heights;30+270 é o intervalo de variacao dos tons das cores, que vai variar em funcao das alturas;
#esse 'alpha=0.09' é determina que pontos sobrepostos fiquem até 10% transparentes
text(Girth, Volume, Height, col=my.colors,cex=0.5+hts)#aqui ele da o comando pra aplicar a configuracao das
#cores na figura e determina que o tamanho dos simbolos pode variar 0.5de acordo com a altura da arvore

trees.sort<-trees[order(trees$Girth,trees$Height),]
matplot(trees.sort$Girth,trees.sort[,2:3],type="b") #essa funcao permite plotar uma matriz de vaiaveis resposta
#contra uma variavel preditora
text(18,40,"Volume",col="darkred") #os dois primeiros itens especificam a posicao da legenda
#e aqui ele especifica a cor pq quer usar uma diferente do defalt, no caso:vermelho
text(10,58,"Height")

#Pra criar graficos com eixos adicionais vc pode fazer como no origin,
#montando um grafico em cima do outro e enganando o programa que esta fazendo
#duas figuras separadas. Assim:
windows(,4,4)
par(mar=c(5,4,2,4))
plot(Girth, Volume,main="My Trees") #Ate aqui eu so plotei um grafico de pontos normal
#Aqui vem o truque!
par(new=TRUE)
plot(Girth,Height,axes=FALSE,bty="n",xlab="",ylab="",pch=3)
axis(4)
mtext("Height",side=4,line=3)
par(mar=c(5,4,2,4))
plot(Girth, Volume,main="My Trees")
par(new=TRUE)
plot(Girth,Height,axes=FALSE,bty="n",xlab="",ylab="",pch=3)
axis(4)
mtext("Height",side=4,line=3)

#B13.4 Controlling graphics devices
windows(width = 5,height = 3)#essa funcao vai abrir um grafico com as dimensoes que vc especificou no R
windows(,5,5)
layout(matrix(c(1,2,3,3),nrow=2,byrow=TRUE))
plot(Girth, Height)
par(mar=c(3,3,1,1),mgp=c(1.6,0.2,0),tcl=0.2)
plot(Girth, Height,axes=FALSE,xlim=(c(8,22)))
axis(1,tcl=-0.3)
axis(2,tick=F)
rug(Height,side=2,col=2)
title("A Third,Very Wide,Plot")

#B.13.5 Creating a graphics file
#como salvar a figura:
getwd()
windows(,4,4)
plot(Height,Volume,main="Tree Data")
dev.print(pdf,"My Tree.pdf")