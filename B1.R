setwd("C:/Users/Camila Medeiros/Documents/GitHub/RBootcamp")

#B.1- Help
#Para buscar info na web sobre qualquer função/comando:
?(mean)
#ou
help("mean")
#Para que ele páre de abrir o browser com esse comando:
options(htmlhelp=FALSE)
help("mean")
#Para buscar ajuda sobre uma função que você não sabe exatamente o nome:
help.search("mean")
#E caso queira a info direto no R, usa:
apropos("mean")
#Caso você estea em busca de info sobre algum pacote do R, usa esse comando:
RSiteSearch("violin")
#E pra refinar a buscar por algum subitem específico, usa o argumento 'restrict=c(x)', assim:
RSiteSearch("violin",restrict=c("functions"))
#Para pesquisar mais sobre o RSiteSearch, usa:
help(RSiteSearch)
