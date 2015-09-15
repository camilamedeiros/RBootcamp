#B.6 Iterated actions: the apply family and loops
#B.6.1 Iterations of independent actions

#pra aplicar o mesmo comando a linhas e/ou colunas diferentes de uma mesma matriz
#ou dataframe pode usar o comando 'apply'. Por exemplo, pra calcular a media
#de diferentes colunas (atributos) dentro de uma tabela.

m<-matrix(1:10, nrow=2)
m
#pra aplicar as acoes na matriz, voce precisa especificar os dados. Pra isso, precisa indicar
#o objeto, a margem (1 pra linhas, 2 pra colunas) e a 'ação' ou 'comando'. Assim:
apply(m,MARGIN=1,mean)
apply(m,MARGIN=2,mean)
apply(m,MARGIN=2,sum)
?rowMeans
colSums(m,1,2,na.rm=FALSE) #Acho que nao entendi direito aqui...
colSums(m,2,5,na.rm=FALSE)
lapply(m,MARGIN=2,mean)
lapply(m,MARGIN=1,mean)
sapply(1:10,function(i)mean(rnorm(5))) #aqui ele tá fazendo aplicando a mesma funcao 10 vezes

#B.6.2 Dependent iterations
#Esse e o tipo de comando usado pra dados que tem dependencia temporal.
#Ou seja: o resultado de um dos calculos vai interferir no resultado dos calculos posteriores. Assim:

gens<-10 #o numero de vezes que ele deve gerar os resultados--output
output<-numeric(gens+1) #o resultado deve ser um dado numerico equiv ao resultado da geracao anterior +1 (momento no tempo, nao +1 unidade)
output[1]<-25 #aqui ele determina o valor do seu objeto no momento inicial=gener 1
for (t in 1:gens)output[t+1]<-output[t]+round(rnorm(n=1,mean=0,sd=2),0) #aqui éa funcao propriamente dita, determinando que os dados da geracoes seguintes devem ser dependentes da anterior
#e que devem ser calculados assumindo uma distribuicao normal dos valores, com media de 0, ja que ela vai ser o resultado de desvio padrao de 2
output
