
#Variáveis do Dataset (conjunto de Dados):

unimed <- c("Unimed Vitoria", "Unimed Recife", "Unimed Sul Cap", "Unimed Rio", "Unimed Campinas", "Unimed Cruzeiro")
codigo <- c("900080", "900034", "900176", "900037", "900002", "900010")


#Banco de Dados:
BC_Dados <- data.frame(Receita_JAN=(rnorm(6,50)), 
                       Receita_FEV=(rnorm(6,40)), 
                       Receita_MAR=(rnorm(6,48)),
                       Receita_ABR=(rnorm(6,51)))

rownames(BC_Dados) <- c(unimed)

#Variáveis do Dataset2 (conjunto de Dados)
Total_QUad <-rowSums(BC_Dados[,1:4])

Media_QUad <-rowMeans(BC_Dados[,1:4])

BC_Dados2 <- data.frame(BC_Dados, Total_QUad, Media_QUad)


#Grafico de PIZZA com o total de receita no Quadrimestre:
y <- colSums(BC_Dados[,4:1])
pie(y, col = c(4,2,3,7), main = "REPRESENTATIVIDADE DO GRUPO DE UNIMEDS")


#Grafico de BARRA com o total de receita no Quadrimestre:
barplot(Total_QUad, col = c(4,2,3,7,8,5), main = "RECEITA TOTAL POR UNIMED - QUADRIMETRE", 
        xlab = "UNIMEDS DO GRUPO", ylab = "VALOR RECEITA")

legend("center", legend=(codigo), fill = c(4,2,3,7,8,5))
       

#função lapply - Total da receita no período
f <- lapply(BC_Dados2[5], sum)

#SPLIT - Separar os itens e informar os 3 maiores valores
g <- gl(3,2)
media <- lapply(split(Total_QUad,g), max)


#Histograma

hist(Total_QUad,  main = "Histograma de Total Receita Quadrimetre", 
     xlab = "UNIMEDS DO GRUPO", ylab = "VALOR RECEITA", col = 5)
