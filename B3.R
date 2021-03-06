#B.3- Data Structures
#B.3.1 Vectors
Y<-c(8.3,8.6,10.7,10.8,11,11,11.1,11.2,11.3,11.4)
Y=c(8.3,8.6,10.7,10.8,11,11,11.1,11.2,11.3,11.4)
#Para montar sequ�ncias, usar um dos comandos:
1:4
4:1
-1:3
-(1:3)
#Para especificar os intervalos da sequencia:
seq(from=1, to=3, by=0.2)
seq(1,3, by=0.2)
seq(1,3,length=7)
seq(1,3,0.2)
#Para sequencias repetitivas se usa a fun��o:
rep(1,3)
rep(1:3,2)
rep(1:3,each=2)

#B.3.2 Getting information about vectors

#soma
sum(Y)

#m�dia
mean(Y)

#m�ximo
max(Y)

#tamanho amostral
length(Y)

#Vis�o geral
summary(Y)

#Obviamente, vetores tamb�m podem ser nomes,categorias,tratamentos etc:
Names<-c("Sarah","Yunluan")
Names
b<-c("TRUE","FALSE")
b
#O R pode ajudar a reconhecer a classe do seu vetor, caso voc� n�o consiga sozinho:
class(Y)
class(b)

#Para testar afirma��es:
Y>10
Y>mean(Y)
Y==11
Y!=11
#Igual ==, Diferente !=

#Algebra with vectors
a<-1:3
b<-4:6
a+b
a*b
a/b
#Tamb�m pode usar n�meros inteiros pra fazer opera��es com os vetores:
a+1
a*2
1/a
#Se voce fizer opera��es com vetores de tamanhos diferente, o R pode fazer a conta, mas vai devolvar uma mensagem de alerta junto
a*1:2
#Se os vetores forem m�ltiplos, entretanto, tudo certo.
a*1:6
1:2*1:4

#B.3.3 Extraction and missing values
#Pra extrair peda�os do vetor � s� chamar o seu nome e usar as coordenadas entre colchetes:
Y[1]
Y[1:3]
Y>mean(Y)
Y[Y>mean(Y)]

#O R vai sempre se recusar at� o fim a realizar calculos com planilhas/vetores com dados ausentes.
#Pra verificar se seu conunto de dados est� ok e n�o falta nenhum dado, usar a fun��o 'is.na':
a<-c(5,3,6,NA)
a
is.na(a)
!is.na(a) #a '!' significa uma negativa, ou seja: n�o � na!
#Pra obter a lista do que n�o � na:
a[!is.na(a)]
na.exclude(a) #comando que exclui os dados ausentes
#Para fazer contas com seus dados removendo os NA na mesma fun��o:
mean(a)
mean(a, na.rm=TRUE)
d<-na.exclude(a) #aqui vc criou um novo vetor sem o NA antes de calc a m�dia, o contrario do comando anterior
mean(d)

#B.3.4 Matrices

#Criando a matriz:
matrix(letters[1:4],ncol=2) #letters indica a categoria do dado e a sequencia que vc quer vem []; ncol= n de colunas
matrix(1:4,ncol=2) #ou
M<-matrix(1:4,nrow=2) #nrow= n de linhas, obviamente
M
#Pra que os dados do conjunto sejam inseridos no sentido das linhas e n�o das colunas, como � o default:
M2<-matrix(1:4,nrow=2,byrow=TRUE) #o comando aqui � byrow
M2
#Para construir uma matriz identidade:
I<-diag(1,nrow=2)
I #ela � basicamente o escalar 1 das matrizes, ou seja: bastante util.
#O resultado de uma M * M-1 (o seu inverso) � sempre uma matriz identidade de igual n de linhas e colunas
Minv<-solve(M) #Minv= matriz inversa
M %*% Minv

#Para extrair dados de uma matriz, se faz a mesma coisa dos vetores, s� que se especifica a posi��o do valor de acordo c a linha e a coluna
M[1,2] #[linha, col]
M[1,1:2]
M[,2] #se deixar alguma das coord em branco, o R recupera uma linha ou coluna completa
#B3.5 Data frames
dat<-data.frame (species=c("S. altissima","S. rugosa","E. graminifolia","A. pilosus"),treatment=factor(c("Control","Water","Control","Water")),height=c(1.1,0.8,0.9,1),width=c(1,1.7,0.6,0.2))
dat
#Para extrair dados da planilha se usa os mesmos comandos das matrizes
dat[,2]
dat[2,]
dat[3,4]
dat[,2]=="Water" #pode usar os mesmos testes de matrizes aqui tamb???m!
dat[dat[,2]=="Water",] #aqui ele montou uma nova planilha usando os dados da planilha original que Tinham o tratamento Water na coluna 2!
#a funcao 'subset' faz o mesmo papel:
subset(dat, treatment=="Water")

#Factors

c("Control", "Medium", "High") #criando o fator- nesse caso, com 3 n???veis
rep(c("Control", "Medium", "High"), each=3)
Treatment<-factor(rep(c("Control", "Medium", "High"), each=3))
Treatment #l??? nos scrip, o R areorganizou os dados em ordem alfab???tica... Pra corrigir:
levels(Treatment)
stripchart(1:9~Treatment)
Treatment<-factor(rep(c("Control", "Medium", "High"), each=3),levels=c("Control", "Medium", "High"))
levels(Treatment) #Esse comando reorganiza a ordem dos seus n???veis!!!
stripchart(1:9~Treatment)

#B.3.6 Lists
#As listas sao so conjuntos de dados organizados juntos em ordem, que podem ser de naturezas completamente diferentes
my.list<-list(My.Y=Y,b=b,Names,Weed.data=dat,My.matrix=M2,my.no=4)
my.list
my.list[["b"]] #or
my.list$b
my.list[[2]] #quando chamar item pelo numero, nao usa "", esse se usa quandofor chamar por nomes!
my.list[1:2] #quando voce usa so um [] voce pode chamar mais de um item e n???o usa ""
#Pra extrair apenas um item ou alguns items de um componente da lista:
my.list[["b"]][1] #or
my.list$b[1]
