#B.5 Sorting
e<-c(2,4,6,1,5,3)
e
sort(e)
sort(e,decreasing=TRUE)
e
order(e) #aqui o programa vai dar a posicao de cada um dos componentes do vetor.
e[order(e)] #quando vc coloca o objeto com o comando da sua 'ordenacao', o R vai colocar tudo na 
#ordem correta sem comprometer o vetor original, que vai continuar intacto.

dat
order.nos<-order(dat$height)
order.nos #nesse ponto ele ja informou a posicao que os itens da coluna deveriam ficar
#com esse comando, ele vai colocar tudo em ordem:
dat[order.nos,]
#Pra reverter:
dat[rev(order.nos),]
