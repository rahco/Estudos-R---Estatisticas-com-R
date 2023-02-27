
***
# <font color=green size=10>CURSO DE ESTATÍSTICA - PARTE 1</font>
***

## Trabalho de Análise Descritiva de um Conjunto de Dados

Utilizando os conhecimentos adquiridos em nosso treinamento realize uma análise descritiva básica de um conjunto de dados retirados da Pesquisa Nacional por Amostra de Domicílios - 2015 do IBGE. 

Vamos construir histogramas, calcular e avaliar medidas de tendência central, medidas separatrizes e de dispersão dos dados.

Siga o roteiro proposto e vá completando as células vazias. Procure pensar em mais informações interessantes que podem ser exploradas em nosso dataset.

# <font color=green>DATASET DO PROJETO</font>
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

***
***

### Utilize as células abaixo para importar as bibliotecas que precisar e para configurações gerais
#### <font color='red'>Sugestões: dplyr, ggplot2 etc.</font>
"""

library(dplyr)
library(ggplot2)

options(repr.plot.width = 9, repr.plot.height = 6)
formatos <- theme(
        plot.title=element_text(size = 14, hjust = 0.5),
        axis.title.y=element_text(size = 12, vjust = +0.2),
        axis.title.x=element_text(size = 12, vjust = -0.2),
        axis.text.y=element_text(size = 10),
        axis.text.x=element_text(size = 10)
)

"""### Importe o dataset e armazene o conteúdo em uma DataFrame"""

dados <- read.csv("dados.csv")

"""### Visualize o conteúdo do DataFrame"""

head(dados)

"""### Para avaliar o comportamento da variável RENDA vamos construir uma tabela de frequências considerando as seguintes classes em salários mínimos (SM)
#### <font color='blue'>Descreva os pontos mais relevantes que você observa na tabela e no gráfico.</font>

Classes de renda:

<b>A</b> ► Acima de 25 SM

<b>B</b> ► De 15 a 25 SM

<b>C</b> ► De 5 a 15 SM

<b>D</b> ► De 2 a 5 SM

<b>E</b> ► Até 2 SM

Para construir as classes de renda considere que o salário mínimo na época da pesquisa era de <b>R$ 788,00</b>.

#### Siga os passos abaixo:

### 1º Definir os intevalos das classes em reais (R$)
"""

classes <- c(
  min(dados$Renda),
  2 * 788,
  5 * 788,
  15 * 788,
  25 * 788,
  max(dados$Renda)
)
classes

"""### 2º Definir os labels das classes"""

labels <- c('E','D','C','B','A')
labels

"""### 3º Construir a coluna de frequências"""

frequencia <- table(
  cut(
    x = dados$Renda,
    breaks = classes,
    labels = labels,
    include.lowest = TRUE
  )
)
frequencia

"""### 4º Construir a coluna de percentuais"""

percentual <- prop.table(frequencia) * 100
percentual

"""### 5º Juntar as colunas de frequência e percentuais e ordenar as linhas de acordo com os labels das classes"""

dist_freq_renda <- cbind('Frequência' = frequencia, 'Porcentagem (%)' = percentual)
dist_freq_renda

dist_freq_renda[
  order(row.names(dist_freq_renda)),
]

"""### Construa um gráfico de barras para visualizar as informações da tabela de frequências acima

#### <font color='red'>Lembre-se de transformar a matriz de resultados em um data frame.</font>
"""

bar_chart <- data.frame(dist_freq_renda)
bar_chart

ggplot(bar_chart, aes(x = row.names(bar_chart), y = bar_chart$`Frequência`)) +
  geom_bar(stat = "identity") + 
  ylab("Frequência") + 
  xlab("Classes de Renda") +
  ggtitle('Gráfico Classes de Renda') +
  formatos

"""> ### Conclusões

Escreva suas conclusões aqui...

### Crie um histograma para as variáveis QUANTITATIVAS de nosso dataset
#### <font color='blue'>Descreva os pontos mais relevantes que você observa nos gráficos (assimetrias e seus tipos, possíveis causas para determinados comportamentos etc.)</font>
"""

# Idade

ggplot(dados, aes(x = Idade)) +
  geom_histogram(bins = 50) + 
  ylab("Frequência") + 
  xlab("Idades") +
  ggtitle('Histograma das Idades') +
  formatos

# Altura

ggplot(dados, aes(x = Altura)) +
  geom_histogram() + 
  ylab("Frequência") + 
  xlab("Altura") +
  ggtitle('Histograma das Alturas') +
  formatos

# Renda

ggplot(dados, aes(x = Renda)) +
  geom_histogram(bins = 100) + 
  ylab("Frequência") + 
  xlab("R$") +
  ggtitle('Histograma das Rendas') +
  formatos

"""> ### Conclusões

Escreva suas conclusões aqui...

### Para a variável RENDA, construa um histograma somente com as informações das pessoas com rendimento até R$ 20.000,00
"""

# Renda - Pessoas com renda até R$ 20.000,00

ggplot(dados[dados$Renda < 20000, ], aes(x = Renda)) +
  geom_histogram() + 
  ylab("Frequência") + 
  xlab("R$") +
  ggtitle('Histograma das Rendas - Pessoas com renda até R$ 20.000,00') +
  formatos

"""### Construa uma tabela de frequências e uma com os percentuais cruzando das variáveis SEXO e COR
#### <font color='blue'>Avalie o resultado da tabela e escreva suas principais conclusões</font>
#### <font color='red'>Utilize os vetores abaixo para renomear as linha e colunas das tabelas de frequências e dos gráficos em nosso projeto</font>
"""

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

# Sexo
dados$Cat.Sexo <- factor(dados$Sexo)
levels(dados$Cat.Sexo) <- sexo

# Cor
dados$Cat.Cor <- factor(dados$Cor)
levels(dados$Cat.Cor) <- cor

# Anos de Estudo
dados$Cat.Anos.de.Estudo <- factor(dados$Anos.de.Estudo, order = TRUE)
levels(dados$Cat.Anos.de.Estudo) <- anos_de_estudo

head(dados)

frequencia <- table(dados$Cat.Sexo, dados$Cat.Cor)
frequencia <- cbind(frequencia)
frequencia

percentual <- cbind(prop.table(frequencia)) * 100
percentual

"""> ### Conclusões

Escreva suas conclusões aqui...

## Realize, para a variável RENDA, uma análise descritiva com as ferramentas que aprendemos em nosso treinamento

### Obtenha a média aritimética
"""

mean(dados$Renda)

"""### Obtenha a mediana"""

median(dados$Renda)

"""### Obtenha a moda"""

Moda <- function(x) {
  frequencias <- table(x)
  return(names(frequencias)[frequencias == max(frequencias)])
}

as.numeric(Moda(dados$Renda))

"""### Obtenha a variância"""

var(dados$Renda)

"""### Obtenha o desvio-padrão"""

sd(dados$Renda)

"""### Obtenha a média, mediana e valor máximo da variável RENDA segundo SEXO e COR
#### <font color='blue'>Destaque os pontos mais importante que você observa nas tabulações</font>
#### <font color='red'>Utilize *tapply* com as funções *mean*, *median* e *max*</font>
"""

medias <- tapply(dados$Renda, list(dados$Cat.Sexo, dados$Cat.Cor), mean)
medias

medianas <- tapply(dados$Renda, list(dados$Cat.Sexo, dados$Cat.Cor), median)
medianas

maximos <- tapply(dados$Renda, list(dados$Cat.Sexo, dados$Cat.Cor), max)
maximos

"""> ### Conclusões

Escreva suas conclusões aqui...

### Obtenha as medidas de dispersão da variável RENDA segundo SEXO e COR
#### <font color='blue'>Destaque os pontos mais importante que você observa nas tabulações</font>
#### <font color='red'>Utilize *tapply* com as funções *var* e *sd*</font>
"""

variancia <- tapply(dados$Renda, list(dados$Cat.Sexo, dados$Cat.Cor), var)
variancia

desvio_padrao <- tapply(dados$Renda, list(dados$Cat.Sexo, dados$Cat.Cor), sd)
desvio_padrao

"""> ### Conclusões

Escreva suas conclusões aqui...

### Construa um box plot da variável RENDA segundo SEXO e COR
#### <font color='blue'>É possível verificar algum comportamento diferenciado no rendimento entre os grupos de pessoas analisados? Avalie o gráfico e destaque os pontos mais importantes;</font>
#### <font color='red'>1º - Utilize somente as informações de pessoas com renda abaixo de R$ 10.000</font>
#### <font color='red'>2º - Para incluir uma terceira variável na construção de um boxplot utilize o parâmetro *fill* da seguinte maneira: *aes(x = Cor, y = Renda, fill = Sexo)*.</font>
"""

ggplot(data = dados[dados$Renda < 10000, ], aes(x = Cat.Cor, y = Renda, fill = Cat.Sexo)) +
  geom_boxplot(size = 0.2) +
  coord_flip() +
  ylab("R$") +
  xlab("Cor") +
  guides(fill = guide_legend(title = 'Sexo')) +
  ggtitle('Box-plot da RENDA por SEXO e COR') +
  formatos

"""> ### Conclusões

Escreva suas conclusões aqui...

### Qual percentual de pessoas de nosso <i>dataset</i> ganham um salário mínimo (R$ 788,00) ou menos?
"""

length(dados$Renda[dados$Renda <= 788]) / length(dados$Renda) * 100

"""### Qual o valor máximo ganho por 99% das pessoas de nosso <i>dataset</i>?
#### <font color='red'>Utilize o método *quantile()* para realizar esta análise.</font>
"""

quantile(dados$Renda, .99)

"""### Obtenha a média, mediana, valor máximo e desvio-padrão da variável RENDA segundo ANOS DE ESTUDO e SEXO
#### <font color='blue'>Destaque os pontos mais importante que você observa nas tabulações</font>
"""

medias <- tapply(dados$Renda, list(dados$Cat.Anos.de.Estudo, dados$Cat.Sexo), mean)
medias

medianas <- tapply(dados$Renda, list(dados$Cat.Anos.de.Estudo, dados$Cat.Sexo), median)
medianas

maximos <- tapply(dados$Renda, list(dados$Cat.Anos.de.Estudo, dados$Cat.Sexo), max)
maximos

desvio_padrao <- tapply(dados$Renda, list(dados$Cat.Anos.de.Estudo, dados$Cat.Sexo), sd)
desvio_padrao

"""### Construa um box plot da variável RENDA segundo ANOS DE ESTUDO e SEXO
#### <font color='blue'>É possível verificar algum comportamento diferenciado no rendimento entre os grupos de pessoas analisados? Avalie o gráfico e destaque os pontos mais importantes.</font>
#### <font color='red'>1º - Utilize somente as informações de pessoas com renda abaixo de R$ 10.000</font>
#### <font color='red'>2º - Para incluir uma terceira variável na construção de um boxplot utilize o parâmetro *fill* da seguinte maneira: *aes(x = Anos.de.Estudo, y = Renda, fill = Sexo)*.</font>
"""

ggplot(data = dados[dados$Renda < 10000, ], aes(x = Cat.Anos.de.Estudo, y = Renda, fill = Cat.Sexo)) +
  geom_boxplot(size = 0.2) +
  coord_flip() +
  ylab("R$") +
  xlab("Cor") +
  guides(fill = guide_legend(title = 'Sexo')) +
  ggtitle('Box-plot da RENDA por SEXO e COR') +
  formatos