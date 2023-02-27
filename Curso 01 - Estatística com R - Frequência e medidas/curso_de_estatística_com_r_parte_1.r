
***
# <font color=green size=10>CURSO DE ESTATÍSTICA - PARTE 1</font>
***

# <font color=green>1 CONHECENDO OS DADOS</font>
***

## <font color=green>1.1 Dataset do projeto</font>
***

### Pesquisa Nacional por Amostra de Domicílios - 2015

A <b>Pesquisa Nacional por Amostra de Domicílios - PNAD</b> investiga anualmente, de forma permanente, características gerais da população, de educação, trabalho, rendimento e habitação e outras, com periodicidade variável, de acordo com as necessidades de informação para o país, como as características sobre migração, fecundidade, nupcialidade, saúde, segurança alimentar, entre outros temas. O levantamento dessas estatísticas constitui, ao longo dos 49 anos de realização da pesquisa, um importante instrumento para formulação, validação e avaliação de políticas orientadas para o desenvolvimento socioeconômico e a melhoria das condições de vida no Brasil.

### Fonte dos Dados

https://ww2.ibge.gov.br/home/estatistica/populacao/trabalhoerendimento/pnad2015/microdados.shtm

### Variáveis utilizadas

> ### Renda
> ***

Rendimento mensal do trabalho principal para pessoas de 10 anos ou mais de idade.

> ### Idade
> ***

Idade do morador na data de referência em anos.

> ### Altura (elaboração própria)
> ***

Altura do morador em metros.

> ### UF
> ***

|Código|Descrição|
|---|---|
|11|Rondônia|
|12|Acre|
|13|Amazonas|
|14|Roraima|
|15|Pará|
|16|Amapá|
|17|Tocantins|
|21|Maranhão|
|22|Piauí|
|23|Ceará|
|24|Rio Grande do Norte|
|25|Paraíba|
|26|Pernambuco|
|27|Alagoas|
|28|Sergipe|
|29|Bahia|
|31|Minas Gerais|
|32|Espírito Santo|
|33|Rio de Janeiro|
|35|São Paulo|
|41|Paraná|
|42|Santa Catarina|
|43|Rio Grande do Sul|
|50|Mato Grosso do Sul|
|51|Mato Grosso|
|52|Goiás|
|53|Distrito Federal|

> ### Sexo	
> ***

|Código|Descrição|
|---|---|
|0|Masculino|
|1|Feminino|

> ### Anos de Estudo
> ***

|Código|Descrição|
|---|---|
|1|Sem instrução e menos de 1 ano|
|2|1 ano|
|3|2 anos|
|4|3 anos|
|5|4 anos|
|6|5 anos|
|7|6 anos|
|8|7 anos|
|9|8 anos|
|10|9 anos|
|11|10 anos|
|12|11 anos|
|13|12 anos|
|14|13 anos|
|15|14 anos|
|16|15 anos ou mais|
|17|Não determinados| 
||Não aplicável|

> ### Cor
> ***

|Código|Descrição|
|---|---|
|0|Indígena|
|2|Branca|
|4|Preta|
|6|Amarela|
|8|Parda|
|9|Sem declaração|

#### <font color='red'>Observação</font>
***
> Os seguintes tratamentos foram realizados nos dados originais:
> 1. Foram eliminados os registros onde a <b>Renda</b> era inválida (999 999 999 999);
> 2. Foram eliminados os registros onde a <b>Renda</b> era missing;
> 3. Foram considerados somente os registros das <b>Pessoas de Referência</b> de cada domicílio (responsável pelo domicílio).

### R (informações básicas)
"""

# Com o comando sessionInfo() acessamos informações sobre a máquina com a versão da linguagem R, e em attached base packages as bibliotecas já préviamente instaladas

sessionInfo()

"""### Importando bibliotecas 
#### A bilioteca dplyr
https://www.rdocumentation.org/packages/dplyr
"""

# Com o comando library() importamos novas bibliotecas

library(dplyr)

# As novas bibliotecas após instaladas ficam disponíveis em other attached packages

sessionInfo()

"""### <font color=red>Documentações:

- [**select**](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/select)
- [**arrange**](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/arrange)
- [**read.csv**](https://www.rdocumentation.org/packages/utils/versions/3.6.1/topics/read.table)
- [**head**](https://www.rdocumentation.org/packages/utils/versions/3.6.1/topics/head)

### Acessando a ajuda
"""

# Adicionar ? antes de comandos abre a a guia de ajuda

?select

?arrange

"""---
### Importando o dataset do projeto
"""

# Com o comando read.csv() lemos e podemos atribuir um BD a um DF
# Na linguagem R tando o simbolo <- quanto = podem ser utilizados para atribuir valores a uma variável

dados <- read.csv("dados.csv")

dados

# Comando head() controla o número de linhas a ser exibido do DF criado

head(dados, 5)

"""## <font color=green>1.2 Tipos de dados</font>
***

### Variáveis qualitativas ordinais

► Variáveis que podem ser ordenadas ou hierarquizardas

### <font color=red>Documentações:

- [**select**](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/select)
- [**unique**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/unique)
- [**arrange**](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/arrange)
- [**c**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/c)
- [**sprintf**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/sprintf)
- [**glue**](https://www.rdocumentation.org/packages/glue/versions/1.3.1/topics/glue)
- [**min e max**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/Extremes)
"""

head(dados, 5)

# Com o comando select, podemos selecionar parte do DF em um novo DF

select(dados, Anos.de.Estudo)

# Com o comando unique, criamos um DF partindo de um DF com os valores únicos encontrados

unique(select(dados, Anos.de.Estudo))

# Com o comando arrange, ordemamos os dados do DF

arrange(unique(select(dados, Anos.de.Estudo)), Anos.de.Estudo)

# O comando c cria uma array com dados

c(1, 2, 3, 4)

# Essa array pode ser composta por dados de um DF

c(arrange(unique(select(dados, Anos.de.Estudo)), Anos.de.Estudo))

"""### Variáveis qualitativas nominais

► Variáveis que não podem ser ordenadas ou hierarquizardas
"""

c(arrange(unique(select(dados, UF)), UF))

c(arrange(unique(select(dados, Sexo)), Sexo))

c(arrange(unique(select(dados, Cor)), Cor))

"""### Variáveis quantitativas discretas

► Variáveis que representam uma contagem onde os valores possíveis formam um conjunto finito ou enumerável.
"""

# Com o comando sprintf, fazemos o print da quantidade min e max de um campo do DF
# Outra forma de selecionar uma coluna do DF é utilizando a sequência nome_do_DF$Coluna

sprintf('De %s até %s anos', min(dados$Idade), max(dados$Idade))

# Importando a biblioteca glue para o projeto

library(glue)

# Com o comando glue, podemos fazer também o print com um pequeno ajuste na sintaxe

glue('De {min(dados$Idade)} até {max(dados$Idade)} anos')

"""#### <font color='red'>Observação</font>
***
> A variável idade pode ser classificada de três formas distintas:
> 1. <b>QUANTITATIVA DISCRETA</b> - quando representa anos completos (números inteiros);
> 2. <b>QUANTITATIVA CONTÍNUA</b> - quando representa a idade exata, sendo representado por frações de anos; e
> 3. <b>QUALITATIVA ORDINAL</b> - quando representa faixas de idade.

### Variáveis quantitativas contínuas

► Variáveis que representam uma contagem ou mensuração que assumem valores em uma escala contínua (números reais).
"""

glue('De {min(dados$Altura)} até {max(dados$Altura)} metros')

"""### Classificação de uma variável
<img src='https://caelum-online-public.s3.amazonaws.com/1177-estatistica-parte1/01/img001.png' width='70%'>

# <font color=green>2 DISTRIBUIÇÃO DE FREQUÊNCIAS</font>
***

O primeiro passo em um trabalho de análise é o conhecimento do comportamento das variáveis envolvidas no estudo. Utilizando técnicas estatísticas como as análises das <b>DISTRIBUIÇÕES DE FREQUÊNCIAS</b> e <b>HISTOGRAMAS</b> podemos avaliar melhor a forma como os fenômenos em estudo se distribuem.

## <font color=green>2.1 Distribuição de frequências para variáveis qualitativas</font>
***

### Método 1

### <font color=red>Documentações:

- [**table**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/table)
- [**prop.table**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/prop.table)
- [**cbind**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/cbind)
- [**row+colnames**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/row%2Bcolnames)
"""

# O comando table cria um DF com a contagem de registros do BD, que pode ser agrupado por uma coluna

table(dados$Sexo)

# Com o comando prop.table podemos ter a representação percentual dos valores de um DF

prop.table(table(dados$Sexo)) * 100

# O comando cbind, cria uma matrix a partir de um DF

dist_freq_qualitativas <- cbind(freq = table(dados$Sexo), percent = prop.table(table(dados$Sexo)) * 100)
dist_freq_qualitativas

# Com os comandos colnames e rownames, podemos respectivamente alterar os títulos de colunas e linhas de um DF

colnames(dist_freq_qualitativas) <- c('Frequência', 'Porcentagem (%)')
dist_freq_qualitativas

rownames(dist_freq_qualitativas) <- c('Masculino', 'Feminino')
dist_freq_qualitativas

"""## Exercício 01"""

dados_e01 <- c(1, 2, 3, 1, 2, 2, 2, 3, 3, 2, 1, 3)

table(dados_e01)

prop.table(table(dados_e01)) * 100

dist_freq_e01 <- cbind("Frequência" = table(dados_e01), "Porcentagem (%)" = prop.table(table(dados_e01)) * 100)
rownames(dist_freq_e01) <- c("Estatístico", "Cientista de Dados", "Programador R")
dist_freq_e01

"""## Método 2

### <font color=red>Documentações:

- [**tapply**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/tapply)
"""

frequencia <- table(dados$Sexo, dados$Cor)
frequencia

rownames(frequencia) <- c('Masculino', 'Feminino')
colnames(frequencia) <- c('Indígena', 'Branca', 'Preta', 'Amarela', 'Parda')
frequencia <- cbind(frequencia)
frequencia

percentual <- prop.table(frequencia) * 100
percentual

# Com o comando list podemos criar uma visão de DF a partir de listas que podem ter como argumentos partes de um DF já existente

list(c(1, 2, 3, 4), c(5, 6, 7))

# Utilizando o comando tapply, passamos a medida mean para calcular a Renda média por Sexo e Cor

medias <- tapply(dados$Renda, list(dados$Sexo, dados$Cor), mean)
rownames(medias) <- c('Masculino', 'Feminino')
colnames(medias) <- c('Indígena', 'Branca', 'Preta', 'Amarela', 'Parda')
medias

"""## <font color=green>2.2 Distribuição de frequências para variáveis quantitativas (classes personalizadas)</font>
***

### <font color=red>Documentações:

- [**cut**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/cut)
- [**order**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/order)
- [**row.names**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/row.names)

### Passo 1 - Especificar os limites de cada classe

Utilizar a seguinte classificação:

<b>A</b> ► Acima de 20 SM

<b>B</b> ► De 10 a 20 SM

<b>C</b> ► De 4 a 10 SM

<b>D</b> ► De 2 a 4 SM

<b>E</b> ► Até 2 SM

onde <b>SM</b> é o valor do salário mínimo na época. Em nosso caso <b>R$ 788,00</b> (2015):

<b>A</b> ► Acima de 15.760

<b>B</b> ► De 7.880 a 15.760

<b>C</b> ► De 3.152 a 7.880

<b>D</b> ► De 1.576 a 3.152

<b>E</b> ► Até 1.576
"""

min(dados$Renda)

max(dados$Renda)

classes <- c(0, 1576, 3152, 7880, 15760, 200000)

labels <- c('E', 'D', 'C', 'B', 'A')

"""### Passo 2 - Criar a tabela de frequências"""

# O comando cut é utilizado para criar tabelas de frequências agrupando os dados em classes personalizadas.

# Para utilizar o comando precisamos passar o parâmetro breaks que será os pontos de cortes da variável analisada,
# o parâmetro labels que será o nome atribuido a cada elemento em uma classe e para que o comando conte também os valores 0,
# é necessário adicionar o parâmetro include.lowest = TRUE.

cut(
  x = dados$Renda,
  breaks = classes,
  labels = labels,
  include.lowest = TRUE
)

frequencia <- table(
  cut(
    x = dados$Renda,
    breaks = classes,
    labels = labels,
    include.lowest = TRUE
  )
)

frequencia

percentual <- prop.table(frequencia) * 100
percentual

# Combinando os comandos podemos criar uma nova matrix com os resultados obtidos através do cut

dist_freq_quantitativas_personalizadas <- cbind('Frequência' = frequencia, 'Porcentagem (%)' = percentual)
dist_freq_quantitativas_personalizadas

# O comando order, pode ser utilizado para classificar os index de uma matrix

dist_freq_quantitativas_personalizadas[
  order(row.names(dist_freq_quantitativas_personalizadas)),
]

"""## Exercício 02"""

classes <- c(min(dados$Altura), 1.65, 1.75, max(dados$Altura))

labels <- c('1 - Baixa', '2 - Média', '3 - Alta')

frequencia <- table(
    cut(
        x = dados$Altura,
        breaks = classes,
        labels = labels,
        include.lowest = TRUE
    )
)

percentual <- prop.table(frequencia) * 100

dist_freq_altura <- cbind('Frequência' = frequencia, 'Porcentagem (%)' = percentual)

dist_freq_altura[
    order(row.names(dist_freq_altura)),
]

"""## <font color=green>2.3 Distribuição de frequências para variáveis quantitativas (classes de amplitude fixa)</font>
***

### <font color=red>Documentações:

- [**nrow**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/nrow)
- [**log**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/log)
- [**round**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/Round)

### Passo 1 - Definindo o número de classes

#### Regra de Sturges

# $$k = 1 + \frac {10}{3}\log_{10}n$$
"""

# Com o comando nrow obtemos a quantidade de registros no BD

n <- nrow(dados)
n

# Função k para determinar a quantidade de classes devidas em nosso BD para criação do gráfico de distribuição de frequências

k <- 1 + (10 / 3) * log10(n)
k

# Arredondados o valor de k com o comando round

k <- round(k)
k

"""### Passo 2 - Criar a tabela de frequências"""

# Sabando o número de classes (17) e que ambas terão a mesma amplitude conseguimos montar os labels que serão utilizados no comando cut

labels <- c(
    '      0.00 |—|  11,764.70', 
    ' 11,764.70  —|  23,529.40', 
    ' 23,529.40  —|  35,294.10', 
    ' 35,294.10  —|  47,058.80', 
    ' 47,058.80  —|  58,823.50', 
    ' 58,823.50  —|  70,588.20', 
    ' 70,588.20  —|  82,352.90', 
    ' 82,352.90  —|  94,117.60', 
    ' 94,117.60  —| 105,882.00', 
    '105,882.00  —| 117,647.00', 
    '117,647.00  —| 129,412.00', 
    '129,412.00  —| 141,176.00', 
    '141,176.00  —| 152,941.00', 
    '152,941.00  —| 164,706.00', 
    '164,706.00  —| 176,471.00', 
    '176,471.00  —| 188,235.00', 
    '188,235.00  —| 200,000.00'
)

# Na função cut, as classes são agora substituidas pelo valor de k. Neste caso todas as classes terão a mesma amplitude.

frequencia <- table(
  cut(
    x = dados$Renda,
    breaks = k,
    labels = labels,
    include.lowest = TRUE
  )
)

frequencia

percentual <- prop.table(frequencia) * 100
percentual

dist_freq_quantitativas_amplitude_fixa <- cbind('Frequência' = frequencia, 'Porcentagem (%)' = percentual)
dist_freq_quantitativas_amplitude_fixa

"""## <font color=green>2.4 Histograma</font>
***

O <b>HISTOGRAMA</b> é a representação gráfica de uma distribuição de frequências. É um gráfico formado por um conjunto de retângulos colocados lado a lado, onde a área de cada retângulo é proporcional à frequência da classe que ele representa.

### <font color=red>Documentações:

- [***package* graphics**](https://www.rdocumentation.org/packages/graphics)
- [**hist**](https://www.rdocumentation.org/packages/graphics/versions/3.6.1/topics/hist)
- [***package* ggplot2**](https://www.rdocumentation.org/packages/ggplot2)
- [**data.frame**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/data.frame)
"""

# Configuração dos parâmetros de exibição dos gráficos

options(repr.plot.width = 14, repr.plot.height = 6)

# O comando hist cria de forma simples o histograma de distribuição de frequências de uma coluna do BD 

hist(dados$Altura)

# O comando hist pode ser otimizado adicionando configurações adicionais aos seus parâmetros

hist(
    x = dados$Altura,
    breaks = 'Sturges',
    col = 'lightblue',
    main = 'Histograma das Alturas',
    xlab = 'Altura',
    ylab = 'Frequências',
    prob = TRUE,
    las = 1
)

# Importando a biblioteca ggplot2 para plotagem de gráficos

library(ggplot2)

# O comando ggplot é outro recurso para criação de histograma de frequências

ggplot(dados, aes(x = Altura)) + 
    geom_histogram(binwidth = 0.02, color = "black", alpha = 0.9) + 
    ylab("Frequência") + 
    xlab("Alturas") + 
    ggtitle('Histograma das Alturas') +
    theme(
        plot.title = element_text(size = 14, hjust = 0.5),
        axis.title.y = element_text(size = 12, vjust = +0.2),
        axis.title.x = element_text(size = 12, vjust = -0.2),
        axis.text.y = element_text(size = 10),
        axis.text.x = element_text(size = 10)
    )

# Para otimizar o processo de criação de gráficos, pode-se adicionar parâmetros básico de configuração a uma variável

formatos <- theme(
              plot.title = element_text(size = 14, hjust = 0.5),
              axis.title.y = element_text(size = 12, vjust = +0.2),
              axis.title.x = element_text(size = 12, vjust = -0.2),
              axis.text.y = element_text(size = 10),
              axis.text.x = element_text(size = 10)
            )

# Adicionando o parâmetro ..density.. ao ggplot criamos uma linha nas frequências

ggplot(dados, aes(x = Altura, y = ..density..)) + 
    geom_histogram(binwidth = 0.02, color = "black", alpha = 0.9) + 
    geom_density(color = 'green') +
    ylab("Frequência") + 
    xlab("Alturas") + 
    ggtitle('Histograma das Alturas') +
    formatos

# Com o comando data.frame criamos um novo DF a partir de um elemento Matrix.
# Esse processo á feito para otimizar o uso do ggplot

bar_chart <- data.frame(dist_freq_quantitativas_personalizadas)
bar_chart

# Alterando seus parâmetros utilizamos o ggplot para criar um gráfico de barras

ggplot(bar_chart, aes(x = row.names(bar_chart), y = bar_chart$Frequência)) + 
    geom_bar(stat = "identity") + 
    ylab("Frequência") + 
    xlab("Classes de Renda") + 
    ggtitle('Gráfico Classes de Renda') +
    formatos

"""## Exercício 03"""

ggplot(dados, aes(x = Idade, y = ..density..)) +  
    geom_histogram(binwidth = 10, color = "black", alpha = 0.9) +  
    geom_density(color = 'green') + 
    ylab("Frequência") +  
    xlab("Anos") +  
    ggtitle('Histograma das Idades') + 
    theme( 
        plot.title = element_text(size = 14, hjust = 0.5), 
        axis.title.y = element_text(size = 12, vjust = +0.2), 
        axis.title.x = element_text(size = 12, vjust = -0.2), 
        axis.text.y = element_text(size = 10), 
        axis.text.x = element_text(size = 10) 
    )

"""# <font color=green>3 MEDIDAS DE TENDÊNCIA CENTRAL</font>
***

## DataFrame de exemplo
"""

materias <- c('Matemática', 'Português', 'Inglês', 'Geografia', 'História', 'Física', 'Química')
Fulano <- c(8, 10, 4, 8, 6, 10, 8)
Beltrano <- c(10, 2, 0.5, 1, 3, 9.5, 10)
Sicrano <- c(7.5, 8, 7, 8, 8, 8.5, 7)

df <- data.frame(Fulano, Beltrano, Sicrano, row.names = materias)
df

"""## <font color=green>3.1 Média aritmética</font>
***

É representada por $\mu$ quando se refere à população e por $\bar{X}$ quando se refere à amostra

# $$\mu = \frac 1n\sum_{i=1}^{n}X_i$$

onde 

$n$ = número de observações (registros)

$X_i$ = valor da i-ésima observação (registro)

### <font color=red>Documentações:

- [**mean**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/mean)
- [**aggregate**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/aggregate)
- [**list**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/list)
"""

(8 + 10 + 4 + 8 + 6 + 10 + 8) / 7

# O comando mean é utilizado para se obter o valor de média de um vetor do BD

mean(df$Fulano)

mean(dados$Renda)

# Com o comando aggregate podemos obter a média de um vetor agregado por um outro vetor/variável dentro do BD

aggregate(list(Renda = dados$Renda), list(Sexo = dados$Sexo), mean)

"""## <font color=green>3.2 Mediana</font>
***

Para obtermos a mediana de uma conjunto de dados devemos proceder da seguinte maneira:
1. Ordenar o conjunto de dados;
2. Identificar o número de observações (registros) do conjunto de dados ($n$);
3. Identicar o elemento mediano:

> Quando $n$ for ímpar, a posição do elemento mediano será obtida da seguinte forma:


# $$Elemento_{Md} = \frac{n+1}2$$

> Quando $n$ for par, a posição do elemento mediano será obtida da seguinte forma:


# $$Elemento_{Md} = \frac{n}2$$

4. Obter a mediana:

> Quando $n$ for ímpar:


# $$Md = X_{Elemento_{Md}}$$

> Quando $n$ for par:


# $$Md = \frac{X_{Elemento_{Md}} + X_{Elemento_{Md}+1}}2$$
***

### <font color=red>Documentações:

- [**median**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/median)
- [**set.seed**](https://www.rdocumentation.org/packages/simEd/versions/1.0.3/topics/set.seed)
- [**sample**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/sample)

### Exemplo 1 - n ímpar

<img src='https://caelum-online-public.s3.amazonaws.com/1177-estatistica-parte1/01/img002.png' width='40%' style="float:left">
"""

# Utilizando o comando order para ordenar a coluna a ser determinada a mediana

df_fulano <- df[order(df$Fulano), ]
df_fulano

# Coletando o número de linhas com nrow

n = nrow(df_fulano)
n

# Calculando a posição do elemento mediana

elemento_md <- (n + 1) / 2
elemento_md

# Visualizando o elemento mediana

df_fulano[elemento_md, ]

# Utilizando o comando median para obter de forma simplificada a mediana

median(df$Fulano)

"""### Exemplo 2 - n par

<img src='https://caelum-online-public.s3.amazonaws.com/1177-estatistica-parte1/01/img003.png' width='50%' style="float:left">

### Obtendo uma amostra aleatória dos dados
"""

df

set.seed(101)
sample(nrow(df), 6)

# Selecionando um número par de elementos no DF

set.seed(101)
df_beltrano <- df[sample(nrow(df), 6), ]
df_beltrano

n <- nrow(df_beltrano)
n

df_beltrano <- df_beltrano[order(df_beltrano$Beltrano), ]
df_beltrano

elemento_md = n / 2
elemento_md

# Obtendo a mediana com os valores dos elementos

mean(df_beltrano[c(elemento_md, elemento_md + 1), ]$Beltrano)

# Obtendo a media de forma direta com median

median(df_beltrano$Beltrano)

"""### Obtendo a mediana em nosso dataset"""

median(dados$Renda)

"""## Exercício 04"""

dataset_ex04 <- data.frame( 
    Sexo = c('H', 'M', 'M', 'M', 'M', 'H', 'H', 'H', 'M', 'M'), 
    Idade = c(53, 72, 54, 27, 30, 40, 58, 32, 44, 51) 
)

dataset_ex04

aggregate(list(Idade = dataset_ex04$Idade), list(Sexo = dataset_ex04$Sexo), median)

"""## <font color=green>3.3 Moda</font>
***

Pode-se definir a moda como sendo o valor mais frequente de um conjunto de dados. A moda é bastante utilizada para dados qualitativos.

### <font color=red>Documentações:

- [**function**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/function)
"""

df

exemplo_moda <- c(1,2,2,3,4,4,5,6,7,7)
exemplo_moda

# Utilizando o comando table para contar o número de frequências de cadas linha no DF

freq <- table(exemplo_moda)
freq

# Selecionando no DF as linhas com a maior frequência

freq[freq == max(freq)]

# Selecionando a moda

names(freq)[freq == max(freq)]

# Criando uma função para determinais a moda em um DF

Moda <- function(x) {
  freq <- table(x)
  return(names(freq)[freq == max(freq)])
}

# Validando a função moda criada

Moda(exemplo_moda)

Moda(df$Fulano)

Moda(df$Beltrano)

Moda(df$Sicrano)

"""### Obtendo a moda em nosso dataset"""

Moda(dados$Renda)

Moda(dados$Altura)

"""## <font color=green>3.4 Relação entre média, mediana e moda</font>
***

<img src='https://caelum-online-public.s3.amazonaws.com/1177-estatistica-parte1/01/img004.png' width='80%'>

### <font color=red>Documentações:
    
- [**as.numeric**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/numeric)

### Avaliando a variável RENDA
"""

ggplot(dados[dados$Renda < 20000, ], aes(x = Renda, y = ..density..)) + 
    geom_histogram(binwidth = 500) + 
    geom_density(color = 'green')

moda <- as.numeric(Moda(dados$Renda))
moda

mediana <- median(dados$Renda)
mediana

media <- mean(dados$Renda)
media

"""***

### Avaliando a variável ALTURA
"""

ggplot(dados, aes(x = Altura, y = ..density..)) + 
    geom_histogram() + 
    geom_density(color = 'green')

moda <- as.numeric(Moda(dados$Altura))
moda

mediana <- median(dados$Altura)
mediana

media <- mean(dados$Altura)
media

"""***

### Avaliando a variável ANOS DE ESTUDO
"""

ggplot(dados, aes(x = Anos.de.Estudo, y = ..density..)) + 
    geom_histogram() + 
    geom_density(color = 'green')

moda <- as.numeric(Moda(dados$Anos.de.Estudo))
moda

mediana <- median(dados$Anos.de.Estudo)
mediana

media = mean(dados$Anos.de.Estudo)
media

moda > mediana
mediana > media

"""# <font color=green>4 MEDIDAS SEPARATRIZES</font>
***

## <font color=green>4.1 Quartis, decis e percentis</font>
***

Há uma série de medidas de posição semelhantes na sua concepção à mediana, embora não sejam medidas de tendência central. Como se sabe, a mediana divide a distribuição em duas partes iguais quanto ao número de elementos de cada parte. Já os quartis permitem dividir a distribuição em quatro partes iguais quanto ao número de elementos de cada uma; os decis em dez partes e os centis em cem partes iguais.

### <font color=red>Documentações:

- [**quantile**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/quantile)
- [**for**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/Control)
- [**length**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/length)
"""

# Com a função quantile passando um campo do DF e um vetor de limites, obtemos os valores de corte do DF em seus quartis

quantile(dados$Renda, c(0.25, 0.5, 0.75))

# Utilizando for obtemos um vetor com os percentuais que cortam o DF nos pontos de decis

decis <- c()
for(i in 1:9){
  decis <- c(decis, i / 10)
}
decis

# Com a função quantile passando um campo do DF e o vetor de limites decis, obtemos os valores de corte do DF em seus decis

quantile(dados$Renda, decis)

# Com a função quantile passando um campo do DF e o vetor de limites centis, obtemos os valores de corte do DF em seus centis

centis <- c()
for(i in 1:99){
  centis <- c(centis, i / 100)
}
quantile(dados$Renda, centis)

# Utilizando a função cumsum temos o gráfico da soma acumulada das frequências no gráfico de distribuição do DF

ggplot(data = dados, aes(x = Idade)) + 
    geom_histogram(
        aes(y = cumsum(..count..)/sum(..count..)), 
        bins = 10
    ) + 
    geom_freqpoly(
        aes(y = cumsum(..count..)/sum(..count..)), 
        color = 'green'
    )

decis <- c()
for(i in 1:9){
  decis <- c(decis, i / 10)
}
quantile(dados$Idade, decis)

"""### Classificação percentual"""

length(dados$Idade[dados$Idade <= 40]) / length(dados$Idade) * 100

length(dados$Renda[dados$Renda <= (788/2)]) / length(dados$Renda) * 100

"""## <font color=green>4.2 Box-plot</font>
***

O box plot dá uma idéia da posição, dispersão, assimetria, caudas e dados discrepantes (outliers). A posição central é dada pela mediana e a dispersão por $IIQ$. As posições relativas de $Q1$, $Mediana$ e $Q3$ dão uma noção da simetria da distribuição. Os comprimentos das cauda são dados pelas linhas que vão do retângulo aos valores remotos e pelos valores atípicos.

#### <font color=red>Documentações:

- [**geom_boxplot**](https://www.rdocumentation.org/packages/ggplot2/versions/3.2.1/topics/geom_boxplot)
- [**factor**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/factor)

<img src='https://caelum-online-public.s3.amazonaws.com/1177-estatistica-parte1/01/img005.png' width='65%'>
"""

# Vetores criados para adicionar colunas ao DF com a categorização dos dados

sexo = c(
    'Masculino', 
    'Feminino'
)
cor = c(
    'Indígena', 
    'Branca', 
    'Preta', 
    'Amarela', 
    'Parda'
)
anos_de_estudo = c(
    'Sem instrução e menos de 1 ano', 
    '1 ano', 
    '2 anos', 
    '3 anos', 
    '4 anos', 
    '5 anos', 
    '6 anos', 
    '7 anos', 
    '8 anos', 
    '9 anos', 
    '10 anos', 
    '11 anos', 
    '12 anos', 
    '13 anos', 
    '14 anos', 
    '15 anos ou mais', 
    'Não determinados'
)

# Plotando gráfico box-plot dos dados de Altura do DF

ggplot(data = dados, aes(x = "", y = Altura)) + 
    stat_boxplot(geom ='errorbar', width = 0.4) + 
    geom_boxplot(fill = '#3274A1') + 
    coord_flip() +
    ylab("Metros") + 
    xlab("") + 
    ggtitle('Box-plot Alturas') +
    formatos

# Comparando o box-plot Altura com a variável Sexo

ggplot(data = dados, aes(x = Sexo, y = Altura, group = Sexo)) + 
    stat_boxplot(geom ='errorbar', width = 0.4) + 
    geom_boxplot(fill = c('#3274A1', "orange")) + 
    coord_flip() +
    ylab("Metros") + 
    xlab("Sexo") + 
    ggtitle('Box-plot Alturas X Sexo') +
    formatos

# Adicionando a coluna de categoria Sexo no DF utilizando as funções factor e levels

dados$Cat.Sexo <- factor(dados$Sexo)
levels(dados$Cat.Sexo) <- sexo

head(dados)

ggplot(data = dados, aes(x = Cat.Sexo, y = Altura)) + 
    stat_boxplot(geom ='errorbar', width = 0.4) + 
    geom_boxplot(fill = c('#3274A1', "orange")) + 
    coord_flip() +
    ylab("Metros") + 
    xlab("Sexo") + 
    ggtitle('Box-plot Alturas X Sexo') +
    formatos

ggplot(data = dados[dados$Renda < 10000, ], aes(x = "", y = Renda)) + 
    stat_boxplot(geom ='errorbar', width = 0.4) + 
    geom_boxplot(fill = '#3274A1') + 
    coord_flip() +
    ylab("R$") + 
    xlab("") + 
    ggtitle('Box-plot Renda') +
    formatos

ggplot(data = dados[dados$Renda < 10000, ], aes(x = Cat.Sexo, y = Renda)) + 
    stat_boxplot(geom ='errorbar', width = 0.4) + 
    geom_boxplot(fill = c('#3274A1', "orange")) + 
    coord_flip() +
    ylab("R$") + 
    xlab("Sexo") + 
    ggtitle('Box-plot Renda X Sexo') +
    formatos

# Adicionando a coluna de categoria Anos de estudo no DF utilizando as funções factor e levels

dados$Cat.Anos.de.Estudo <- factor(dados$Anos.de.Estudo, order = TRUE)
levels(dados$Cat.Anos.de.Estudo) <- anos_de_estudo

head(dados)

ggplot(data = dados, aes(x = "", y = Anos.de.Estudo)) + 
    stat_boxplot(geom ='errorbar', width = 0.4) + 
    geom_boxplot(fill = '#3274A1') + 
    coord_flip() +
    ylab("Anos") + 
    xlab("") + 
    ggtitle('Box-plot Anos de Estudo') +
    formatos

ggplot(data = dados, aes(x = Cat.Sexo, y = Anos.de.Estudo)) + 
    stat_boxplot(geom ='errorbar', width = 0.4) + 
    geom_boxplot(fill = c('#3274A1', "orange")) + 
    coord_flip() +
    ylab("Anos") + 
    xlab("Sexo") + 
    ggtitle('Box-plot Anos de Estudo X Sexo') +
    formatos

"""<img src='https://caelum-online-public.s3.amazonaws.com/1177-estatistica-parte1/01/img006.png' width='80%'>

# <font color=green>5 MEDIDAS DE DISPERSÃO</font>
***

Embora as medidas de posição forneçam uma sumarização bastante importante dos dados, elas podem não ser suficientes para caracterizar conjuntos distintos, especialmente quando as observações de determinada distribuição apresentarem dados muito dispersos.

## <font color=green>5.1 Desvio médio absoluto</font>
***


# $$DM = \frac 1n\sum_{i=1}^{n}|X_i-\bar{X}|$$

### <font color=red>Documentações:

- [**sum**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/sum)
- [**abs**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/MathFun)
- [**DescTools**](https://www.rdocumentation.org/packages/DescTools/versions/0.99.30)
- [**MeanAD**](https://www.rdocumentation.org/packages/DescTools/versions/0.99.30/topics/MeanAD)
"""

df

summary(df)

notas_fulano <- data.frame(Fulano = df$Fulano, row.names = row.names(df))
notas_fulano

# Obtendo a media das notas

nota_media_fulano <- mean(notas_fulano$Fulano)
nota_media_fulano

# Criando uma nova coluna no DF com o desvio de cada nota da media

notas_fulano$Desvio <- notas_fulano$Fulano - nota_media_fulano
notas_fulano

# Tendo valores negativos, a soma direta dos desvios, geralmente resulta em um valor pequeno e muito próximo a zero.

sum(notas_fulano$Desvio)

# Portanto para calcularmos o desvio absoluto, inicialmente criamos uma nova coluna no DF com os valores absolutos do desvio

notas_fulano$Desvio.Absoluto <- abs(notas_fulano$Desvio)
notas_fulano

ggplot(data = notas_fulano, aes(x = row.names(notas_fulano), y = Fulano)) + 
    geom_point() + 
    geom_hline(yintercept = mean(notas_fulano$Fulano), color = 'red') + 
    geom_segment(aes(x = 1, y = 10, xend = 1, yend = mean(notas_fulano$Fulano))) + 
    geom_segment(aes(x = 2, y = 8, xend = 2, yend = mean(notas_fulano$Fulano))) + 
    geom_segment(aes(x = 3, y = 6, xend = 3, yend = mean(notas_fulano$Fulano))) + 
    geom_segment(aes(x = 4, y = 4, xend = 4, yend = mean(notas_fulano$Fulano))) + 
    geom_segment(aes(x = 5, y = 8, xend = 5, yend = mean(notas_fulano$Fulano))) + 
    geom_segment(aes(x = 6, y = 10, xend = 6, yend = mean(notas_fulano$Fulano))) + 
    geom_segment(aes(x = 7, y = 8, xend = 7, yend = mean(notas_fulano$Fulano)))

# Obtemos o valor do desvio absoluto com a media da nova coluna criada no DF

mean(notas_fulano$Desvio.Absoluto)

"""### Instalando o pacote DescTools"""

# Instalando o pacote DescTools que permite obter o desvio absoluto de uma variável de forma simplificada

packageurl <- "https://cran.r-project.org/src/contrib/Archive/DescTools/DescTools_0.99.6.tar.gz"
install.packages(packageurl, repos=NULL, type="source")

library(DescTools)

# Com o pacote instalado, utilizando a função MeanAD temos de forma simplificada o desvio absoluto de uma variável

MeanAD(df$Fulano)

"""## Exercício 05"""

materias_ex05 <- c('Matemática', 'Português', 'Inglês', 'Geografia', 'História', 'Física', 'Química') 
Fulano_ex05 <- c(8, 10, 4, 8, 6, 10, 8) 
Sicrano_ex05 <- c(7.5, 8, 7, 8, 8, 8.5, 7) 

df_ex05 <- data.frame(Fulano_ex05, Sicrano_ex05, row.names = materias_ex05) 

df_ex05

MeanAD(df_ex05$Fulano_ex05)

MeanAD(df_ex05$Sicrano_ex05)

"""## <font color=green>5.2 Variância</font>
***

### Variância

A variância é construída a partir das diferenças entre cada observação e a média dos dados, ou seja, o desvio em torno da média. No cálculo da variância, os desvios em torno da média são elevados ao quadrado.

### Variância populacional

# $$\sigma^2 = \frac 1n\sum_{i=1}^{n}(X_i-\mu)^2$$

### Variância amostral

# $$S^2 = \frac 1{n-1}\sum_{i=1}^{n}(X_i-\bar{X})^2$$

### <font color=red>Documentações:

- [**var**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/cor)
"""

notas_fulano

# Criano no DF uma nova coluna com o quadrado dos valores de desvio da media

notas_fulano$Desvio2 <- notas_fulano$Desvio ^ 2
notas_fulano

# Calculando a variancia

sum(notas_fulano$Desvio2) / (nrow(notas_fulano) - 1)

# Utilizando a função var obtemos o mesmo resultado de calculo da variancia

variancia <- var(notas_fulano$Fulano)
variancia

"""## <font color=green>5.3 Desvio padrão</font>
***

Uma das restrições da variância é o fato de fornecer medidas em quadrados das unidades originais - a variância de medidas de comprimento, por exemplo, é em unidades de área. Logo, o fato de as unidades serem diferentes dificulta a comparação da dispersão com as variáveis que a definem. Um modo de eliminar essa dificuldade é considerar sua raiz quadrada.

### Desvio padrão populacional

# $$\sigma = \sqrt{\frac 1n\sum_{i=1}^{n}(X_i-\mu)^2} \Longrightarrow \sigma = \sqrt{\sigma^2}$$

### Desvio padrão amostral

# $$S = \sqrt{\frac 1{n-1}\sum_{i=1}^{n}(X_i-\bar{X})^2} \Longrightarrow S = \sqrt{S^2}$$

### <font color=red>Documentações:

- [**sd**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/sd)
- [**summary**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/summary)
"""

# Calculando o desvio padrão com a função sqrt da variancia

sqrt(variancia)

# Utilizando a função sd da linguagem obtemos de forma direta e simples o valor do desvio padrão de uma variável

desvio_padrao <- sd(notas.fulano$Fulano)
desvio_padrao

df

summary(df)

# Como podemos observar se compararmos as notas de Fulano e Sicrano vemos que existe uma diferença nas variação das notas, porém
# os valores de media, mediana e moda são os mesmos, o que poderia nos enganar acreditando que os valores possuem uma variação parecida.

Moda(df$Fulano)
Moda(df$Sicrano)

# No entando, quando observamos o desvio padrão das duas variáveis, fica nitido que as notas não possuem uma distribuição similar, apontando que
# as notas de Fulano possui uma variação muito maior que as notas de Sicrano.

sd(df$Fulano)
sd(df$Sicrano)

"""## Exercício 06"""

dataset_ex6 <- data.frame( 
    Sexo = c('H', 'M', 'M', 'M', 'M', 'H', 'H', 'H', 'M', 'M'), 
    Idade = c(53, 72, 54, 27, 30, 40, 58, 32, 44, 51) 
)

sd(dataset_ex6$Idade)

sd(dataset_ex6$Idade[dataset_ex6$Sexo == 'M'])