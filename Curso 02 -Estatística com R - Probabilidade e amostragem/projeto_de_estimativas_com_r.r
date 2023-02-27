
***
# <font color=green size=10>CURSO DE ESTATÍSTICA - PARTE 2</font>
***

## Trabalho sobre Probabilidades, Amostragem e Estimações

Utilizando os conhecimentos adquiridos em nosso treinamento execute as tarefas abaixo. Siga o roteiro proposto e vá completando as células vazias.

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

### Utilize as células abaixo para importar as bibliotecas e configurações que precisar para executar as tarefas
"""

library(dplyr)
library(glue)

"""### Importe o dataset e armazene o conteúdo em uma DataFrame"""

dados <- read.csv('dados.csv')

"""### Visualize o conteúdo do DataFrame"""

head(dados)

"""# <font color='green'>Problema A</font>

Avaliando nosso dataset é possível verificar que a **proporção de homens** como chefes de domicílios é de quase **70%**. Precisamos **selecionar aleatoriamente grupos de 10 indivíduos** para verificar as diferenças entre os rendimentos em cada grupo. Qual a **probabilidade de selecionamos um grupo que apresente a mesma proporção da população**, ou seja, selecionarmos um grupo que seja **composto por 7 homens e 3 mulheres**?

#### <font color='blue'>Como tarefa extra, verifique a real proporção de homens e mulheres em nosso dataset (vimos como fazer isso em nosso primeiro curso de estatística).</font>

#### <font color='red'>Verifique que tipo de distribuição de probabilidade se encaixa neste experimento.</font>

### Solução
"""

k <- 7

n <- 10

p <- 0.70

probabilidade <- dbinom(k, n, p)
probabilidade

"""# <font color='green'>Problema B</font>

Ainda sobre a questão anterior, **quantos grupos de 10 indivíduos** nós precisaríamos selecionar, de forma aleatória, para conseguir **100 grupos compostos por 7 homens e 3 mulheres**?

#### <font color='red'>Lembre-se da forma de cálculo da média de uma distribuição binomial</font>

### Solução

### Média da distribuição binomial

# $$\mu=n \times p$$
"""

# media = n * p
# n = media / p

n <- 100 / probabilidade
n <- round(n)
n

"""# <font color='green'>Problema C</font>

Um cliente nos encomendou um estudo para avaliar o **rendimento dos chefes de domicílio no Brasil**. Para isso precisamos realizar uma nova coleta de dados, isto é, uma nova pesquisa de campo. Após reunião com o cliente foi possível elencar o seguinte conjunto de informações:

> A. O resultado da pesquisa precisa estar pronto em **2 meses**;

> B. Teremos somente **R$\$$ 150.000,00** de recursos para realização da pesquisa de campo; e
    
> C. Seria interessante uma **margem de erro não superior a 10% em relação a média estimada**.

Em nossa experiência com estudos deste tipo, sabemos que o **custo médio por indivíduo entrevistado fica em torno de R$\$$ 100,00**. Com este conjunto de fatos avalie e obtenha o seguinte conjunto de informações para passar ao cliente:


> 1. Para obter uma estimativa para os parâmetros da população (renda dos chefes de domicílio no Brasil), realize uma amostragem aleatória simples em nosso conjunto de dados. Essa amostra deve conter 200 elementos (utilize set.seed(100) para garantir que o mesmo experimento possa ser realizado novamente). Obtenha a média e o desvio-padrão dessa amostra.
    
> 2. Para a **margem de erro** especificada pelo cliente obtenha os **tamanhos de amostra** necessários para garantir os **níveis de confiança de 90%, 95% e 99%**.
    
> 3. Obtenha o **custo da pesquisa** para os três níveis de confiança.
    
> 4. Para o maior nível de confiança viável (dentro do orçamento disponível), obtenha um **intervalo de confiança para a média da população**.
    
> 5. Assumindo o **nível de confiança escolhido no item anterior**, qual **margem de erro** pode ser considerada utilizando todo o recurso disponibilizado pelo cliente?
    
> 6. Assumindo um **nível de confiança de 95%**, **quanto a pesquisa custaria ao cliente** caso fosse considerada uma **margem de erro de apenas 5%** em relação a média estimada?

# <font color='blue'>Solução do item 1</font>

### Seleção de uma amostra aleatório simples

#### <font color='red'>Lembre-se de utilizar *set.seed(100)*</font>
"""

set.seed(100)
dataset = sample_n(dados, 200)$Renda

mean(dataset)

sd(dataset)

"""### Dados do problema"""

media_amostra <- mean(dataset)
desvio_padrao_amostra <- sd(dataset)
recursos <- 150000
custo_entrevista <- 100

"""# <font color='blue'>Solução do item 2</font>

### Obtenha a margem de erro

#### <font color='red'>Lembre-se que a margem de erro deve estar na mesma unidade da variável que está sendo estudada (R$)</font>
"""

e <- 0.10 * media_amostra
glue('A margem de erro é de R$ {format(e, digits=2, decimal.mark=",", nsmall=2, big.mark=".", scientific=F)} para mais ou para menos')

"""### Tamanho da amostra ($1 - \alpha = 90\%$)"""

0.5 + (0.9 / 2)

z <- qnorm(.95)
n_confianca_90 <- (z * (desvio_padrao_amostra / e)) ** 2
n_confianca_90 <- round(n_confianca_90)
glue('Para um nível de confiança de 90% devemos selecionar uma amostra de {n_confianca_90} elementos.')

"""### Tamanho da amostra ($1 - \alpha = 95\%$)"""

0.5 + (0.95 / 2)

z <- qnorm(.975)
n_confianca_95 <- (z * (desvio_padrao_amostra / e)) ** 2
n_confianca_95 <- round(n_confianca_95)
glue('Para um nível de confiança de 95% devemos selecionar uma amostra de {n_confianca_95} elementos.')

"""### Tamanho da amostra ($1 - \alpha = 99\%$)"""

0.5 + (0.99 / 2)

z <- qnorm(.995)
n_confianca_99 <- (z * (desvio_padrao_amostra / e)) ** 2
n_confianca_99 <- round(n_confianca_99)
glue('Para um nível de confiança de 99% devemos selecionar uma amostra de {n_confianca_99} elementos.')

"""# <font color='blue'>Solução do item 3</font>

### Custo da pesquisa para o nível de confiança de 90%
"""

custo_confianca_90 <- n_confianca_90 * custo_entrevista
glue('Para um nível de confiança de 90% o custo da pesquisa seria de R$ {format(custo_confianca_90, digits=2, decimal.mark=",", nsmall=2, big.mark=".", scientific=F)}')

"""### Custo da pesquisa para o nível de confiança de 95%"""

custo_confianca_95 <- n_confianca_95 * custo_entrevista
glue('Para um nível de confiança de 95% o custo da pesquisa seria de R$ {format(custo_confianca_95, digits=2, decimal.mark=",", nsmall=2, big.mark=".", scientific=F)}')

"""### Custo da pesquisa para o nível de confiança de 99%"""

custo_confianca_99 <- n_confianca_99 * custo_entrevista
glue('Para um nível de confiança de 99% o custo da pesquisa seria de R$ {format(custo_confianca_99, digits=2, decimal.mark=",", nsmall=2, big.mark=".", scientific=F)}')

"""# <font color='blue'>Solução do item 4</font>"""

probabilidade <- 0.5 + (0.95 / 2)
z <- qnorm(probabilidade)
media_amostra - (z * ( desvio_padrao_amostra / sqrt(n_confianca_95) ))
media_amostra + (z * ( desvio_padrao_amostra / sqrt(n_confianca_95) ))

"""# <font color='blue'>Solução do item 5</font>"""

n_confianca_95 <- recursos / custo_entrevista
n_confianca_95

z <- qnorm(.975)
e <- z * (desvio_padrao_amostra / sqrt(n_confianca_95))
e

e_percentual <- (e / media_amostra) * 100
glue('A nova margem de erro é {format(e_percentual, digits = 2, nsmall = 2, decimal.mark = ",")}%.')

"""# <font color='blue'>Solução do item 6</font>"""

e <- 0.05 * media_amostra
glue('A margem de erro é de R$ {format(e, digits=2, decimal.mark=",", nsmall=2, big.mark=".", scientific=F)} para mais ou para menos')

z <- qnorm(.975)
n_confianca_95 <- (z * (desvio_padrao_amostra / e)) ** 2
n_confianca_95 <- round(n_confianca_95)
glue('Para um nível de confiança de 95% devemos selecionar uma amostra de {n_confianca_95} elementos.')

custo_confianca_95 <- n_confianca_95 * custo_entrevista
glue('Para um nível de confiança de 95% o custo da pesquisa seria de R$ {format(custo_confianca_95, digits=2, decimal.mark=",", nsmall=2, big.mark=".", scientific=F)}')