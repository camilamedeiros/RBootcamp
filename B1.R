setwd("C:/Users/Camila Medeiros/Documents/GitHub/RBootcamp")

#B.1- Help
#Para buscar info na web sobre qualquer fun��o/comando:
?(mean)
#ou
help("mean")
#Para que ele p�re de abrir o browser com esse comando:
options(htmlhelp=FALSE)
help("mean")
#Para buscar ajuda sobre uma fun��o que voc� n�o sabe exatamente o nome:
help.search("mean")
#E caso queira a info direto no R, usa:
apropos("mean")
#Caso voc� estea em busca de info sobre algum pacote do R, usa esse comando:
RSiteSearch("violin")
#E pra refinar a buscar por algum subitem espec�fico, usa o argumento 'restrict=c(x)', assim:
RSiteSearch("violin",restrict=c("functions"))
#Para pesquisar mais sobre o RSiteSearch, usa:
help(RSiteSearch)
