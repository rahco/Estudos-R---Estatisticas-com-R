***
# <font color=green size=10>CURSO DE ESTATÍSTICA - PARTE 2</font>
***

# <font color=green>1 CONHECENDO OS DADOS</font>
***

## <font color=green>1.1 Dataset do projeto</font>
***

### Pesquisa Nacional por Amostra de Domicílios - 2015

A **Pesquisa Nacional por Amostra de Domicílios - PNAD** investiga anualmente, de forma permanente, características gerais da população, de educação, trabalho, rendimento e habitação e outras, com periodicidade variável, de acordo com as necessidades de informação para o país, como as características sobre migração, fecundidade, nupcialidade, saúde, segurança alimentar, entre outros temas. O levantamento dessas estatísticas constitui, ao longo dos 49 anos de realização da pesquisa, um importante instrumento para formulação, validação e avaliação de políticas orientadas para o desenvolvimento socioeconômico e a melhoria das condições de vida no Brasil.

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
> 1. Foram eliminados os registros onde a **Renda** era inválida (999 999 999 999);
> 2. Foram eliminados os registros onde a **Renda** era missing;
> 3. Foram considerados somente os registros das **Pessoas de Referência** de cada domicílio (responsável pelo domicílio).

### Configurações
"""

library(ggplot2)

options(repr.plot.width = 7, repr.plot.height = 4)

"""### Importando dataset do projeto"""

dados <- read.csv('dados.csv')

head(dados, 5)

"""---

# <font color=green>2 DISTRIBUIÇÕES DE PROBABILIDADE</font>
***

## <font color=red>Problema</font>
***

Em um concurso para preencher uma vaga de cientista de dados temos um total de **10 questões** de múltipla escolha com **3 alternativas possíveis** em cada questão. **Cada questão tem o mesmo valor.** Suponha que um candidato resolva se aventurar sem ter estudado absolutamente nada. Ele resolve fazer a prova de olhos vendados e chutar todas as resposta. Assumindo que a prova **vale 10 pontos e a nota de corte seja 5**, obtenha a probabilidade deste candidato **acertar 5 questões** e também a probabilidade deste candidato **passar para a próxima etapa do processo seletivo**.

## <font color=green>2.1 Distribuição Binomial</font>
***

Um evento **binomial** é caracterizado pela possibilidade de ocorrência de apenas duas categorias. Estas categorias somadas representam todo o espaço amostral, sendo também mutuamente excludentes, ou seja, a ocorrência de uma implica na não ocorrência da outra.

Em análises estatísticas o uso mais comum da distribuição binomial é na solução de problemas que envolvem situações de **sucesso** e **fracasso**.

# $$P(k)=\binom{n}{k} p^k q^{n-k}$$

Onde:

$p$ = probabilidade de sucesso

$q = (1 - p)$ = probabilidade de fracasso

$n$ = número de eventos estudados

$k$ = número de eventos desejados que tenham sucesso

### Experimento Binomial

1. Realização de $n$ ensaios idênticos.

2. Os ensaios são independentes.

3. Somente dois resultados são possíveis, exemplo: Verdadeiro ou falso; Cara ou coroa; Sucesso ou fracasso.

4. A probabilidade de sucesso é representada por $p$ e a de fracasso por $1-p=q$. Estas probabilidades não se modificam de ensaio para ensaio.

### Média da distribuição binomial

O valor esperado ou a média da distribuição binomial é igual ao número de experimentos realizados multiplicado pela chance de ocorrência do evento.

# $$\mu = n \times p$$

### Desvio padrão da distribuição binomial

O desvio padrão é o produto entre o número de experimentos, a probabilidade de sucesso e a probabilidade de fracasso.

# $$\sigma = \sqrt{n \times p \times q}$$

### Combinações

Número de combinações de $n$ objetos, tomados $k$ a cada vez, é:

# $$C_{k}^{n} = \binom{n}{k} = \frac{n!}{k!(n - k)!}$$

Onde

## $$n! = n\times(n-1)\times(n-2)\times...\times(2)\times(1)$$
## $$k! = k\times(k-1)\times(k-2)\times...\times(2)\times(1)$$

Por definição

## $$0! = 1$$

#### <font color=red>Documentações:

- [**choose**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/Special)

## <font color='blue'>Exemplo: Mega Sena</font>

Em um volante de loteria da Mega Sena temos um total de **60 números** para escolher onde a aposta mínima é de **seis números**. Você que é curiosa(o) resolve calcular a probabilidade de se acertar na Mega Sena com apenas **um jogo**. Para isso precisamos saber quantas **combinações de seis números podem ser formadas com os 60 números disponíveis**.

### $$C_{6}^{60} = \binom{60}{6} = \frac{60!}{6!(60 - 6)!}$$
"""

# Com a função choose obtemos o número de combinações possíveis de serem formadas nos jogos

combinacoes <- choose(60, 6)
combinacoes

# Dividindo um jogo pela total de combinações chegamos ao percentual de probabilidade de se acertar um jogo

probabilidade <- 1 / combinacoes
probabilidade

"""## Exercídio - 01"""

combinacoes_e01 <- choose(25, 20)
combinacoes_e01

probabilidade_e01 <- 1 / combinacoes_e01
probabilidade_e01

"""## <font color='blue'>Exemplo: Concurso para cientista de dados</font>

Em um concurso para preencher uma vaga de cientista de dados temos um total de **10 questões** de múltipla escolha com **3 alternativas possíveis** em cada questão. **Cada questão tem o mesmo valor.** Suponha que um candidato resolva se aventurar sem ter estudado absolutamente nada. Ele resolve fazer a prova de olhos vendados e chutar todas as resposta. Assumindo que a prova **vale 10 pontos e a nota de corte seja 5**, obtenha a probabilidade deste candidato **acertar 5 questões** e também a probabilidade deste candidato **passar para a próxima etapa do processo seletivo**.

### Qual o número de ensaios ($n$)?
"""

n <- 10
n

"""### Os ensaios são independentes?

Sim. A opção escolhida em uma questão não influencia em nada a opção escolhida em outra questão.

### Somente dois resultados são possíveis em cada ensaio?

Sim. O candidato tem duas possibilidades, ACERTA ou ERRAR uma questão.

### Qual a probabilidade de sucesso ($p$)?
"""

numero_de_alternativas_por_questao <- 3
p <- 1 / numero_de_alternativas_por_questao
p

"""### Qual a probabilidade de fracasso ($q$)?"""

q <- 1 - p
q

"""### Qual o total de eventos que se deseja obter sucesso ($k$)?"""

# O elemento k representa o número de sucessos que se deseja obter um resultado, devendo sempre ser um valor menor que o espaço amostral n

k <- 5
k

"""### Solução 1"""

probabilidade <- choose(n, k) * (p ** k) * (q ** (n - k))
probabilidade

"""### Solução 2

#### <font color=red>Documentações:

- [**dbinom**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/Binomial)
"""

# A função dbinom gera de forma simplificada a probabilidade de sucesso de um evento baseado no espaço amostral e na probabilidade eventual do mesmo.

dbinom(x = k, size = n, prob = p)

"""### Obter a probabilidade do candidato passar

### $$P(acertar > 4) = P(5) + P(6) + P(7) + P(8) + P(9) + P(10)$$
"""

# Somando as probabilidades temos a probabilidade final que é a soma das chances do candidato acerta um valor >= a 5 questões.

dbinom(x = 5, size = n, prob = p) +
dbinom(x = 6, size = n, prob = p) +
dbinom(x = 7, size = n, prob = p) +
dbinom(x = 8, size = n, prob = p) +
dbinom(x = 9, size = n, prob = p) + 
dbinom(x = 10, size = n, prob = p)

# A função dbinom pode ter no parâmetro x (chances de sucesso) uma series, gerando assim uma series com todas as probabilidades.

dbinom(x = 5:10, size = n, prob = p)

# Fazendo a sum dessas probabilidades temos de forma mais simples a probabilidade da soma das probabilidades de acertos.

sum(dbinom(x = 5:10, size = n, prob = p))

# Uma outra alternativa de se obter a probabilidade somada, é utiliza a função pbinom que substitui o valor x por q que representa a limite inferior de início das chances de sucesso (>=5  = > 4).
# O parâmetro lower.tail como FALSE indica para função considerar a parte superior da calda de amostra, ou seja, [5,6,7,8,9,10].

pbinom(q = 4, size = n, prob = p, lower.tail = FALSE)

"""## Exercício - 02"""

# Um dado de seis faces, não viciado, é lançado para o alto quatro vezes. Utilizando a distribuição binomial, 
# obtenha a probabilidade de o dado cair com um número par voltado para cima duas vezes.

p_ex2 = 1 / 2   # Probabilidade de sair um número PAR
n_ex2 = 4       # Total de lançamentos
k_ex2 = 2       # Total de sucessos (número PAR voltado para cima)

dbinom(x = k_ex2, size = n_ex2, prob = p_ex2)

# Um dado de seis faces, perfeitamente equilibrado, é lançado para o alto dez vezes. Utilizando a distribuição binomial, 
# obtenha a probabilidade de o dado cair com o número 5 voltado para cima pelo menos três vezes.

p_ex2 = 1 / 6    # Probabilidade de sair o número CINCO
n_ex2 = 10       # Total de lançamentos

pbinom(q = 2, size = n_ex2, prob = p_ex2, lower.tail = F)

"""## <font color='blue'>Exemplo: Gincana</font>

Uma cidade do interior realiza todos os anos uma gincana para arrecadar fundos para o hospital da cidade. Na última gincana se sabe que a **proporção de participantes do sexo feminino foi de 60%**. **O total de equipes, com 12 integrantes, inscritas na gincana deste ano é de 30**. Com as informações acima responda: Quantas equipes deverão ser formadas por **8 mulheres**?

### Solução
"""

p <- 0.6
p

n <- 12
n

k <- 8 
k

probabilidade <- dbinom(x = k, size = n, prob = p)
probabilidade

# Multiplicando a probabilidade pelo número de equipes temos que o resultado.

equipes <- 30 * probabilidade
equipes

"""## Exercício - 03"""

# Suponha que a probabilidade de se contrair o novo Coronavírus seja de 70%. Em um grupo de 
# 1500 famílias, com 5 pessoas cada, quantas podemos esperar que tenham apenas dois contaminados?

p_ex3 = 0.7
n_ex3 = 5
k_ex3 = 2
probabilidade_ex3 = dbinom(x = k_ex3, size = n_ex3, prob = p_ex3)
familias_ex3 = 1500 * probabilidade_ex3
familias_ex3

"""---

## <font color=red>Problema</font>
***

Um restaurante recebe em média **20 pedidos por hora**. Qual a chance de que, em determinada hora escolhida ao acaso, o restaurante receba **15 pedidos**?

## <font color=green>2.2 Distribuição Poisson</font>
***

É empregada para descrever o número de ocorrências em um intervalo de tempo ou espaço específico. Os eventos são caracterizados pela possibilidade de contagem dos sucessos, mas a não possibilidade de contagem dos fracassos.

Como exemplos de processos onde podemos aplicar a distribuição de Poisson temos a determinação do número de clientes que entram em uma loja em determinada hora, o número de carros que chegam em um drive-thru de uma lanchonete na hora do almoço, a determinação do número de acidentes registrados em um trecho de estrada etc.

# $$P(k) = \frac{e^{-\mu}(\mu)^k}{k!}$$

Onde:

$e$ = constante cujo valor aproximado é 2,718281828459045

$\mu$ = representa o número médio de ocorrências em um determinado intervalo de tempo ou espaço

$k$ = número de sucessos no intervalo desejado

### Experimento Poisson

1. A probabilidade de uma ocorrência é a mesma em todo o intervalo observado.

2. O número de ocorrências em determinado intervalo é independente do número de ocorrências em outros intervalos.

3. A probabilidade de uma ocorrência é a mesma em intervalos de igual comprimento.

### Média da distribuição Poisson

# $$\mu$$

### Desvio padrão da distribuição Poisson

# $$\sigma = \sqrt{\mu}$$

#### <font color=red>Documentações:

- [**exp**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/log)
- [**factorial**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/Special)
"""

# Utilizando a função exp com o número 1 temos o número de Euler.

exp(1)

"""## <font color='blue'>Exemplo: Delivery</font>

Um restaurante recebe em média **20 pedidos por hora**. Qual a chance de que, em determinada hora escolhida ao acaso, o restaurante receba **15 pedidos**?

### Qual o número médio de ocorrências por hora ($\mu$)?
"""

media <- 20
media

"""### Qual o número de ocorrências que queremos obter no período ($k$)?"""

k <- 15
k

"""### Solução 1"""

probabilidade <- ((exp(1) ** (-media)) * (media ** k)) / (factorial(k))
probabilidade

"""### Solução 2

#### <font color=red>Documentações:

- [**Poisson**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/Poisson)
"""

# Com a função dpois obtemos de forma simplificada a probabilidade de uma questão envolvendo a distribuição de Poisson.
# Na função entramos com os parâmetros x = números de sucessos e lambda = média dos eventos.

probabilidade <- dpois(x = k, lambda = media)
probabilidade

"""## Exercício - 04"""

probabilidade_ex4 <- dpois(x = 25, lambda = 20)
sprintf("%0.2f%%", probabilidade_ex4 * 100)

"""---

## <font color=red>Problema</font>
***

Em um estudo sobre as alturas dos moradores de uma cidade verificou-se que o conjunto de dados segue uma **distribuição aproximadamente normal**, com **média 1,70** e **desvio padrão de 0,1**. Com estas informações obtenha o seguinte conjunto de probabilidades:

> **A.** probabilidade de uma pessoa, selecionada ao acaso, ter menos de 1,80 metros.
>
> **B.** probabilidade de uma pessoa, selecionada ao acaso, ter entre 1,60 metros e 1,80 metros.    
>
> **C.** probabilidade de uma pessoa, selecionada ao acaso, ter mais de 1,90 metros.

## <font color=green>2.3 Distribuição Normal</font>
***

A distribuição normal é uma das mais utilizadas em estatística. É uma distribuição contínua, onde a distribuição de frequências de uma variável quantitativa apresenta a forma de sino e é simétrica em relação a sua média.

![Normal](https://caelum-online-public.s3.amazonaws.com/1178-estatistica-parte2/01/img001.png)

### Características importantes

1. É simétrica em torno da média;

2. A área sob a curva corresponde à proporção 1 ou 100%;

3. As medidas de tendência central (média, mediana e moda) apresentam o mesmo valor;

4. Os extremos da curva tendem ao infinito em ambas as direções e, teoricamente, jamais tocam o eixo $x$;

5. O desvio padrão define o achatamento e largura da distribuição. Curvas mais largas e mais achatadas apresentam valores maiores de desvio padrão;

6. A distribuição é definida por sua média e desvio padrão;

7. A probabilidade sempre será igual à área sob a curva, delimitada pelos limites inferior e superior.

# $$f(x) = \frac{1}{\sqrt{2\pi\sigma}}e^{-\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2}$$

Onde:

$x$ = variável normal

$\sigma$ = desvio padrão

$\mu$ = média

A probabilidade é obtida a partir da área sob a curva, delimitada pelos limites inferior e superior especificados. Um exemplo pode ser visto na figura abaixo.

![alt text](https://caelum-online-public.s3.amazonaws.com/1178-estatistica-parte2/01/img002.png)

Para obter a área acima basta calcular a integral da função para os intervalos determinados. Conforme equação abaixo:

# $$P(L_i<x<L_s) = \int_{L_i}^{L_s}\frac{1}{\sqrt{2\pi\sigma}}e^{-\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2}$$

Onde:

$x$ = variável normal

$\sigma$ = desvio padrão

$\mu$ = média

$L_i$ = limite inferior

$L_s$ = limite superior

### Tabelas padronizadas

As tabelas padronizadas foram criadas para facilitar a obtenção dos valores das áreas sob a curva normal e eliminar a necessidade de solucionar integrais definidas.

Para consultarmos os valores em uma tabela padronizada basta transformarmos nossa variável em uma variável padronizada $Z$.

Esta variável $Z$ representa o afastamento em desvios padrões de um valor da variável original em relação à média.

# $$Z = \frac{x-\mu}{\sigma}$$

Onde:

$x$ = variável normal com média $\mu$ e desvio padrão $\sigma$

$\sigma$ = desvio padrão

$\mu$ = média

#### <font color=red>Documentações:

- [**Normal**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/Normal)

### Construindo tabela normal padronizada
"""

# Gerando a tabela normal padronizada

Z <- seq(0, 3.99, by=0.01)
probabilidade <- pnorm(Z)
tabela_normal_padronizada <- matrix(probabilidade, ncol=10, byrow=TRUE)
colnames(tabela_normal_padronizada) <- format(seq(0.00, 0.09, by=0.01))
rownames(tabela_normal_padronizada) <- format(seq(0.00, 3.90, by=0.10), digits = 2, nsmall = 2)
tabela_normal_padronizada

"""<img src='https://caelum-online-public.s3.amazonaws.com/1178-estatistica-parte2/01/img003.png' width='250px'>

A tabela acima fornece a área sob a curva entre $-\infty$ e $Z$ desvios padrão acima da média. Lembrando que por se tratar de valores padronizados temos $\mu = 0$.

## <font color='blue'>Exemplo: Qual sua altura?</font>

Em um estudo sobre as alturas dos moradores de uma cidade verificou-se que o conjunto de dados segue uma **distribuição aproximadamente normal**, com **média 1,70** e **desvio padrão de 0,1**. Com estas informações obtenha o seguinte conjunto de probabilidades:

> **A.** probabilidade de uma pessoa, selecionada ao acaso, ter menos de 1,80 metros.
>
> **B.** probabilidade de uma pessoa, selecionada ao acaso, ter entre 1,60 metros e 1,80 metros.    
>
> **C.** probabilidade de uma pessoa, selecionada ao acaso, ter mais de 1,90 metros.

### Problema A - Identificação da área sob a curva

<img style='float: left' src='https://caelum-online-public.s3.amazonaws.com/1178-estatistica-parte2/01/img004.png' width='350px'>

### Obter a variável padronizada $Z$
"""

media <- 1.7
media

desvio_padrao <- 0.1
desvio_padrao

# Obtendo a variável normalizada utilizando a média e o desvio padrão.

Z <- (1.8 - media) / desvio_padrao
Z

"""### Solução 1 - Utilizando tabela"""

# Consultando na tabela obtemos o valor.

probabilidade <- 0.8413447
probabilidade

"""### Solução 2 - Utilizando função"""

# Com a função pnorm da linguagem R e passando como parâmetro a variável normalizada Z temos a probabilidade de forma simplificada.

pnorm(Z)

"""## Exercício - 05"""

# A aplicação de uma prova de estatística em um concurso apresentou um conjunto de notas normalmente distribuídas. Verificou-se que o conjunto de notas 
# tinha média 70 e desvio padrão de 5 pontos. Qual a probabilidade de um aluno, selecionado ao acaso, ter nota menor que 85?

Z_ex5 = (85 - 70) / 5
probabilidade_ex5 = pnorm(Z_ex5)
probabilidade_ex5

"""### Problema B - Identificação da área sob a curva

<img style='float: left' src='https://caelum-online-public.s3.amazonaws.com/1178-estatistica-parte2/01/img005.png' width='350px'>

### Obter a variável padronizada $Z$
"""

Z_inferior <- (1.6 - media) / desvio_padrao
round(Z_inferior, 2)

Z_superior <- (1.8 - media) / desvio_padrao
round(Z_superior, 2)

"""### Solução 1 - Utilizando tabela"""

probabilidade <- (0.8413447 - 0.5) * 2
probabilidade

probabilidade <- 0.8413447 - (1 - 0.8413447)
probabilidade

"""### Solução 2 - Utilizando função"""

probabilidade <- pnorm(Z_superior) - (1 - pnorm(Z_superior))
probabilidade

probabilidade <- pnorm(Z_superior) - pnorm(Z_inferior)
probabilidade

"""## Exercício - 06"""

# O faturamento diário de um motorista de aplicativo segue uma distribuição aproximadamente normal, com média R$ 300,00 
# e desvio padrão igual a R$ 50,00. Obtenha as probabilidades de que, em um dia aleatório, o motorista ganhe:

# 1. Entre R$ 250,00 e R$ 350,00
# 2. Entre R$ 400,00 e R$ 500,00

Z_inferior_ex6 = (250 - 300) / 50
Z_superior_ex6 = (350 - 300) / 50
probabilidade_ex6 = pnorm(Z_superior_ex6) - pnorm(Z_inferior_ex6)
probabilidade_ex6

Z_inferior_ex6 = (400 - 300) / 50
Z_superior_ex6 = (500 - 300) / 50
probabilidade_ex6 = pnorm(Z_superior_ex6) - pnorm(Z_inferior_ex6)
probabilidade_ex6

"""## Exercício - 07"""

# Os pesos dos lutadores de uma academia de MMA, com 500 atletas, são normalmente distribuídos, com média igual a 80,5 kg e desvio padrão igual a 12,2 kg. Encontre o número 
# de atletas dessa academia que se enquadram na categoria peso leve, que vai de 65,7 kg até 70,3 kg.

Z_inferior_ex7 = (65.7 - 80.5) / 12.2
Z_superior_ex7 = (70.3 - 80.5) / 12.2
probabilidade_ex7 = pnorm(Z_superior_ex7) - pnorm(Z_inferior_ex7)
atletas_peso_leve = 500 * probabilidade_ex7
round(atletas_peso_leve)

"""### Problema C - Identificação da área sob a curva

<img style='float: left' src='https://caelum-online-public.s3.amazonaws.com/1178-estatistica-parte2/01/img006.png' width='350px'>

### Obter a variável padronizada $Z$
"""

Z <- (1.9 - media) / desvio_padrao
Z

"""### Solução 1 - Utilizando tabela"""

# Como desejamos saber o valor acima de 1,9, subtraímos a probabilide de 1 (valor do gráfico completo).

probabilidade <- 1 - 0.9772499
probabilidade

"""### Solução 2 - Utilizando função"""

# O mesmo processo pode ser obtido utilizando a função pnorm.

probabilidade <- 1 - pnorm(Z)
probabilidade

# Passando o valor de Z com um sinal de negativo, a função subtrai de forma automatica o valor de 1 do resultado.

probabilidade <- pnorm(-Z)
probabilidade

"""## Exercício - 08"""

# O Inmetro verificou que as lâmpadas incandescentes da fabricante XPTO apresentam uma vida útil normalmente distribuída, com média 
# igual a 720 dias e desvio padrão igual a 30 dias. Calcule a probabilidade de uma lâmpada escolhida ao acaso durar:

# 1. Entre 650 e 750 dias
# 2. Mais que 800 dias
# 3. Menos que 700 dias

media_ex8 <- 720
desvio_padrao_ex8 <- 30

# 1. entre 650 e 750 dias

Z_inferior_ex8 = (650 - media_ex8) / desvio_padrao_ex8
Z_superior_ex8 = (750 - media_ex8) / desvio_padrao_ex8

probabilidade_ex8 <- pnorm(Z_superior_ex8) - pnorm(Z_inferior_ex8)
round(probabilidade_ex8, 4)

# 2. mais que 800 dias

Z_ex8 = (800 - media_ex8) / desvio_padrao_ex8

probabilidade_ex8 <- pnorm(-Z_ex8)
round(probabilidade_ex8, 4)

# 3. menos que 700 dias

Z_ex8 = (700 - media_ex8) / desvio_padrao_ex8

probabilidade_ex8 <- pnorm(Z_ex8)
round(probabilidade_ex8, 4)

"""## Exercício - 09"""

# Utilizando a tabela padronizada ou o ferramental disponibilizado pelo R, encontre a área sob a curva normal para os valores de Z abaixo:

# 1. 0 < Z < 1,23
# 2. Z > 2,14
# 3. -1,56 < Z < 1,48
# 4. Z < -0,78

# 1. 0 < Z < 1,23
round(pnorm(1.23), 4) - round(pnorm(0), 4)

# 2. Z > 2,14
1 - round(pnorm(2.14), 4)

# 3. -1,56 < Z < 1,48
round(pnorm(1.48), 4) - round(pnorm(-1.56), 4)

# 4. Z < -0,78
round(pnorm(-0.78), 4)

"""## Exercício - 10"""

# O tempo para concluir uma prova de concurso público se distribui normalmente, com uma média de 80 minutos e desvio padrão de 10 minutos. 
# Suponha que uma das salas de prova tenha 60 candidatos e que a duração da prova seja de 90 minutos. Quantos candidatos você acha que não conseguirão 
# concluir a prova no tempo determinado?

# Observação: Utilize a função round() para arredondar o resultado obtido.

media <- 80
desvio_padrao <- 10
N <- 60

Z = (90 - media) / desvio_padrao

n <- pnorm(-Z) * N
round(n)

"""# <font color=green>3 AMOSTRAGEM</font>
***

## <font color=green>3.1 População e Amostra</font>
***

### População
Conjunto de todos os elementos de interesse em um estudo. Diversos elementos podem compor uma população, por exemplo: pessoas, idades, alturas, carros etc.

Com relação ao tamanho, as populações podem ser limitadas (populações finitas) ou ilimitadas (populações infinitas).

### Populações finitas

Permitem a contagem de seus elementos. Como exemplos temos o número de funcionário de uma empresa, a quantidade de alunos em uma escola etc.

### Populações infinitas

Não é possível contar seus elementos. Como exemplos temos a quantidade de porções que se pode extrair da água do mar para uma análise, temperatura medida em cada ponto de um território etc.

<font color=red>Quando os elementos de uma população puderem ser contados, porém apresentando uma quantidade muito grande, assume-se a população como infinita.</font>.

### Amostra
Subconjunto representativo da população.

Os atributos numéricos de uma população como sua média, variância e desvio padrão, são conhecidos como **parâmetros**. O principal foco da inferência estatística é justamente gerar estimativas e testar hipóteses sobre os parâmetros populacionais utilizando as informações de amostras.

## <font color=green>3.2 Quando utilizar uma amostra?</font>
***

### Populações infinitas

O estudo não chegaria nunca ao fim. Não é possível investigar todos os elementos da população.

### Testes destrutivos

Estudos onde os elementos avaliados são totalmente consumidos ou destruídos. Exemplo: testes de vida útil, testes de segurança contra colisões em automóveis.

### Resultados rápidos

Pesquisas que precisam de mais agilidade na divulgação. Exemplo: pesquisas de opinião, pesquisas que envolvam problemas de saúde pública.

### Custos elevados

Quando a população é finita mas muito numerosa, o custo de um censo pode tornar o processo inviável.

## <font color=green>3.3 Amostragem Aleatória Simples</font>
***

É uma das principais maneiras de se extrair uma amostra de uma população. A exigência fundamental deste tipo de abordagem é que cada elemeto da população tenha as mesmas chances de ser selecionado para fazer parte da amostra.

#### <font color=red>Documentações:

- [**sample**](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/sample)
"""

library(dplyr)

nrow(dados)

mean(dados$Renda)

# Com a função sample_n, podemos separar o BD em um amostral que é separado de forma aleatória.
# Essa aleatoriedade pode ser fixa selecionando e fixando um número para a função set.seed.

set.seed(2811)
amostra <- sample_n(dados, 1000)

nrow(amostra)

# Abaixo observamos que os valores de média e percentual de frequência por sexo ficaram diferentes do BD original,
# o que destaca a importância da seleção da amostra com cautela para que a mesma represente a população como um todo.

mean(amostra$Renda)

prop.table(table(dados$Sexo))

prop.table(table(amostra$Sexo))

"""## <font color=green>3.4 Amostragem Estratificada</font>
***

É uma melhoria do processo de amostragem aleatória simples. Neste método é proposta a divisão da população em subgrupos de elementos com características similares, ou seja, grupos mais homogêneos. Com estes subgrupos separados, aplica-se a técnica de amostragem aleatória simples dentro de cada subgrupo individualmente.

## <font color=green>3.5 Amostragem por Conglomerados</font>
***

Também visa melhorar o critério de amostragem aleatória simples. Na amostragem por conglomerados são também criados subgrupos, porém não serão homogêneas como na amostragem estratificada. Na amostragem por conglomerados os subgrupos serão heterogêneos, onde, em seguida, serão aplicadas a amostragem aleatória simples ou estratificada.

Um exemplo bastante comum de aplicação deste tipo de técnica é na divisão da população em grupos territoriais, onde os elementos investigados terão características bastante variadas.

# <font color=green>4 ESTIMAÇÃO</font>
***

## <font color='red'>Problema </font>

Suponha que os pesos dos sacos de arroz de uma indústria alimentícia se distribuem aproximadamente como uma normal de **desvio padrão populacional igual a 150 g**. Selecionada uma **amostra aleatório de 20 sacos** de um lote específico, obteve-se um **peso médio de 5.050 g**. Construa um **intervalo de confiança para a média populacional** assumindo um **nível de significância de 5%**.

---

É a forma de se fazer suposições generalizadas sobre os parâmetros de uma população tendo como base as informações de uma amostra.

- **Parâmetros** são os atributos numéricos de uma população, tal como a média, desvio padrão etc.

- **Estimativa** é o valor obtido para determinado parâmetro a partir dos dados de uma amostra da população.

## <font color=green>4.1 Teorema do limite central</font>
***

> O **Teorema do Limite Central** afirma que, com o aumento do tamanho da amostra, a distribuição das médias amostrais se aproxima de uma distribuição normal com média igual à média da população e desvio padrão igual ao desvio padrão da variável original dividido pela raiz quadrada do tamanho da amostra. Este fato é assegurado para $n$ maior ou igual a 30.

# $$\sigma_\bar{x} = \frac{\sigma}{\sqrt{n}}$$

O desvio padrão das médias amostrais é conhecido como **erro padrão da média**

#### <font color=red>Documentações:

- [**colMeans**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/colSums)

### Entendendo o Teorema do Limite Central
"""

n <- 2000
total_de_amostras <- 1500

# Gerando um DF com 1500 amostras de 2000 registros.

for (i in 1:total_de_amostras){
    if(i==1){
        amostras <- data.frame('Amostra_1' = sample(dados$Idade, n))
    }else{
        amostras[paste('Amostra_', i)] <- sample(dados$Idade, n)
    }
}
amostras

# Medias das amostras.

data.frame(colMeans(amostras))

"""> O Teorema do Limite Central afirma que, **com o aumento do tamanho da amostra, a distribuição das médias amostrais se aproxima de uma distribuição normal** com média igual à média da população e desvio padrão igual ao desvio padrão da variável original dividido pela raiz quadrada do tamanho da amostra. Este fato é assegurado para n maior ou igual a 30."""

hist(
    x = colMeans(amostras),
    main = 'Histograma das Idades Médias',
    xlab = 'Idades',
    ylab = 'Frequências'
)

"""> O Teorema do Limite Central afirma que, com o aumento do tamanho da amostra, a distribuição das médias amostrais se aproxima de uma distribuição normal **com média igual à média da população** e desvio padrão igual ao desvio padrão da variável original dividido pela raiz quadrada do tamanho da amostra. Este fato é assegurado para n maior ou igual a 30."""

# Temos que a média da população é parecida com a média da amostra.

mean(dados$Idade)

mean(colMeans(amostras))

"""> O Teorema do Limite Central afirma que, com o aumento do tamanho da amostra, a distribuição das médias amostrais se aproxima de uma distribuição normal com média igual à média da população e **desvio padrão igual ao desvio padrão da variável original dividido pela raiz quadrada do tamanho da amostra**. Este fato é assegurado para n maior ou igual a 30.

# $$\sigma_\bar{x} = \frac{\sigma}{\sqrt{n}}$$
"""

# Temos que o desvio padrão da amostra se parece ao da população.

sd(colMeans(amostras))

sd(dados$Idade) / sqrt(n)

"""## <font color=green>4.2 Níveis de confiança e significância</font>
***

O **nível de confiança** ($1 - \alpha$) representa a probabilidade de acerto da estimativa. De forma complementar o **nível de significância** ($\alpha$) expressa a probabilidade de erro da estimativa.

O **nível de confiança** representa o grau de confiabilidade do resultado da estimativa estar dentro de determinado intervalo. Quando fixamos em uma pesquisa um **nível de confiança** de 95%, por exemplo, estamos assumindo que existe uma probabilidade de 95% dos resultados da pesquisa representarem bem a realidade, ou seja, estarem corretos.

O **nível de confiança** de uma estimativa pode ser obtido a partir da área sob a curva normal como ilustrado na figura abaixo.

![alt text](https://caelum-online-public.s3.amazonaws.com/1178-estatistica-parte2/01/img007.png)

## <font color=green>4.3 Erro inferencial</font>
***

O **erro inferencial** é definido pelo **desvio padrão das médias amostrais** $\sigma_\bar{x}$ e pelo **nível de confiança** determinado para o processo.

# $$e = z \frac{\sigma}{\sqrt{n}}$$

## <font color=green>4.4 Intervalos de confiança</font>
***

### Intevalo de confiança para a média da população

#### Com desvio padrão populacional conhecido

## $$\mu = \bar{x} \pm z\frac{\sigma}{\sqrt{n}}$$

#### Com desvio padrão populacional desconhecido

## $$\mu = \bar{x} \pm z\frac{s}{\sqrt{n}}$$

## <font color='blue'>Exemplo: </font>

Suponha que os pesos dos sacos de arroz de uma indústria alimentícia se distribuem aproximadamente como uma normal de **desvio padrão populacional igual a 150 g**. Selecionada uma **amostra aleatório de 20 sacos** de um lote específico, obteve-se um **peso médio de 5.050 g**. Construa um intervalo de confiança para a **média populacional** assumindo um **nível de significância de 5%**.

### Média amostral
"""

media_amostral <- 5050
media_amostral

"""### Nível de significância ($\alpha$)"""

significancia <- 0.05
significancia

"""### Nível de confiança ($1 - \alpha$)"""

confianca <- 1 - significancia
confianca

"""### Obtendo $z$"""

tabela_normal_padronizada[17:26, ]

"""### Obtendo $z$

![alt text](https://caelum-online-public.s3.amazonaws.com/1178-estatistica-parte2/01/img008.png)
"""

0.95 / 2

0.5 + (0.95 / 2)

# Com o valor da área (0.975) localizamos os índices das colunas e linhas que somados representam o valor de z.

1.9 + 0.06

# Uma outra forma se de obter o valor de z é utilizando a fórmula qnorm.

z <- qnorm(0.975)
z

"""### Valores de $z$ para os níveis de confiança mais utilizados

|Nível de<br>confiança|Valor da área sob<br>a curva normal| $z$ |
|:----------------:|:---------------------------------:|:---:|
|90%               |0,95                               |1,645|
|95%               |0,975                              |1,96 |
|99%               |0,995                              |2,575|

### Obtendo $\sigma_\bar{x}$
"""

desvio_padrao <- 150
desvio_padrao

n <- 20
n

raiz_de_n <- sqrt(20)
raiz_de_n

sigma <- desvio_padrao / raiz_de_n
sigma

"""### Obtendo $e$"""

e <- z * sigma
e

"""### Solução 1 - Calculando o intervalo de confiança para a média"""

intervalo <- c(
  media_amostral - e,
  media_amostral + e
)
intervalo

"""### Solução 2 - Calculando o intervalo de confiança para a média

#### <font color=red>Documentações:

- [**MeanCI**](https://www.rdocumentation.org/packages/DescTools/versions/0.99.30/topics/MeanCI)

#### Instalação do pacote DescTools

https://cran.r-project.org
"""

# install.packages('DescTools')

# OU

# packageurl <- "https://cran.r-project.org/src/contrib/Archive/DescTools/DescTools_0.99.30.tar.gz"
# install.packages(packageurl, repos=NULL, type="source")

install.packages('DescTools')

library(DescTools)

# Utilizando a função MeanCI do DescTools obtemos os valores do intervalo de confiança para a média de forma mais simplificada.

data.frame(MeanCI(x = 5050, sd = sigma, type = 'norm', conf.level = 0.95, sides = 'two.sided'))

mean(dados$Idade) - (z * (sd(dados$Idade) / sqrt(nrow(dados))))
mean(dados$Idade) + (z * (sd(dados$Idade) / sqrt(nrow(dados))))

sigma <- sd(dados$Idade) / sqrt(nrow(dados))

data.frame(MeanCI(x = mean(dados$Idade), sd = sigma, type = 'norm', conf.level = 0.95, sides = 'two.sided'))

"""## Exercício - 09"""

# Para estimar o valor médio gasto por cada cliente de uma grande rede de fast food, foi selecionada uma amostra de 50 clientes. 
# Assumindo que o valor do desvio padrão da população seja de R$ 6,00 e que essa população se distribui normalmente, obtenha a 
# margem de erro desta estimativa, para um nível de confiança de 95%.

n_ex9 <- 50
desvio_padrao_ex9 <- 6
nivel_confianca_ex9 <- 0.95
probabilidade_ex9 <- 0.5 + (nivel_confianca_ex9 / 2)
Z_ex9 <- qnorm(probabilidade_ex9)

e_ex9 <- Z_ex9 * (desvio_padrao_ex9 / sqrt(n_ex9))
round(e_ex9, 2)

"""## Exercício - 10"""

# Uma amostra aleatória simples de 1976 itens de uma população normalmente distribuída, com desvio padrão igual a 11, resultou em 
# uma média amostral de 28. Qual o intervalo de confiança de 90% para a média populacional?

n_ex10 <- 1976
desvio_padrao_ex10 <- 11
media_amostral_ex10 <- 28
nivel_confianca_ex10 <- 0.9
p_ex10 <- 0.5 + (nivel_confianca_ex10 / 2)
Z_ex10 <- qnorm(p_ex10)

round( media_amostral_ex10 - ( Z_ex10 * ( desvio_padrao_ex10 / sqrt(n_ex10) ) ), 2 )
round( media_amostral_ex10 + ( Z_ex10 * ( desvio_padrao_ex10 / sqrt(n_ex10) ) ), 2 )

"""## Exercício - 11"""

# Os voos de determinada ponte aérea apresentam duração normalmente distribuída, com média igual a 120 minutos e desvio padrão igual a 
# 20 minutos. Responda as seguintes perguntas:

# 1. Qual a probabilidade de um voo durar menos de 110 minutos?
# 2. Qual a probabilidade de um voo durar mais de 90 minutos?
# 3. Qual a duração mínima de 80% das viagens?

media <- 120
desvio_padrao <- 20

# 1. Qual a probabilidade de um voo durar menos de 110 min?
Z = (110 - media) / desvio_padrao

probabilidade <- pnorm(Z)
round(probabilidade, 4)

# 2. Qual a probabilidade de um voo durar mais de 90 min?
Z = (90 - media) / desvio_padrao

probabilidade <- pnorm(-Z)
round(probabilidade, 4)

# 3. Qual a duração mínima de 80% das viagens?
Z <- -qnorm(0.80)
x <- Z * desvio_padrao + media

round(x, 1)

"""# <font color=green>5 CÁLCULO DO TAMANHO DA AMOSTRA</font>
***

## <font color='red'>Problema </font>

Estamos estudando o rendimento mensal dos chefes de domicílios com renda até R$\$$ 5.000,00 no Brasil. Nosso supervisor determinou que o **erro máximo em relação a média seja de R$\$$ 10,00**. Sabemos que o **desvio padrão populacional** deste grupo de trabalhadores é de **R$\$$ 1.082,79**. Para um **nível de confiança de 95%**, qual deve ser o tamanho da amostra de nosso estudo?

## <font color=green>5.1 Variáveis quantitativas e população infinita</font>
***

# $$e = z \frac{\sigma}{\sqrt{n}}$$

#### Com desvio padrão conhecido

## $$n = \left(z\frac{\sigma}{e}\right)^2$$

#### Com desvio padrão desconhecido

## $$n = \left(z\frac{s}{e}\right)^2$$

Onde:

$z$ = variável normal padronizada

$\sigma$ = desvio padrão populacional

$s$ = desvio padrão amostral

$e$ = erro inferencial

### <font color='red'>Observações</font>

1. O desvio padrão ($\sigma$ ou $s$) e o erro ($e$) devem estar na mesma unidade de medida.

2. Quando o erro ($e$) for representado em termos percentuais, deve ser interpretado como um percentual relacionado à média.

## <font color='blue'>Exemplo: Rendimento médio</font>

Estamos estudando o rendimento mensal dos chefes de domicílios no Brasil. Nosso supervisor determinou que o **erro máximo em relação a média seja de R$\$$ 100,00**. Sabemos que o **desvio padrão populacional** deste grupo de trabalhadores é de **R$\$$ 3.323,39**. Para um **nível de confiança de 95%**, qual deve ser o tamanho da amostra de nosso estudo?
"""

0.95 / 2

0.5 + (0.95 / 2)

z <- qnorm(0.975)
z

"""### Obtendo $\sigma$"""

sigma <- 3323.39
sigma

"""### Obtendo $e$"""

e <- 100
e

"""### Obtendo $n$"""

# Isolando o valor de n na equação determinamos o tamanho que deve ter a amostra para atingir os parâmetros estabelecidos.
# Cálculos utilizados para determinar o tamanho de uma amostra em uma população infinita.

n <- (z * (sigma / e)) ** 2
round(n)

"""## Exercício - 11"""

# O valor do gasto médio dos clientes de uma loja de conveniência é de R$ 45,50. Assumindo que o
# desvio padrão dos gastos é igual a R$ 15,00, qual deve ser o tamanho da amostra para estimarmos 
# a média populacional, com um nível de significância de 10%? Considere que o erro máximo aceitável seja de 10%.

media_ex11 <- 45.5
desvio_padrao_ex11 <- 15
e_ex11 <- 0.1
significancia_ex11 <- 0.1
confianca_ex11 <- 1 - significancia_ex11

Z_ex11 <- qnorm(0.5 + (confianca_ex11 / 2))
e_ex11 <- e_ex11 * media_ex11

n_ex11 = ( Z_ex11 * ( desvio_padrao_ex11 / e_ex11 ) ) ** 2
round(n_ex11)

"""## Exercício - 12"""

# Uma amostra com 40 cupons fiscais, coletados aleatoriamente em um shopping center, apresentou um 
# desvio padrão do total pago igual a R$ 42,00. A associação de lojistas precisa estimar a média populacional 
# das vendas, com um erro máximo igual a R$ 6,00 e empregando um nível de confiança igual a 90%. Qual o tamanho da amostra a analisar?

desvio_padrao_ex12 <- 42
e_ex12 <- 6
confianca_ex12 <- 0.9

Z_ex12 <- qnorm(0.5 + (confianca_ex12 / 2))

n_ex12 = ( Z_ex12 * ( desvio_padrao_ex12 / e_ex12 ) ) ** 2
round(n_ex12)

"""---

## <font color='red'>Problema</font>

Em um lote de **10.000 latas** de refrigerante foi realizada uma amostra aleatória simples de **100 latas** e foi obtido o **desvio padrão amostral do conteúdo das latas igual a 12 ml**. O fabricante estipula um **erro máximo sobre a média populacional de apenas 5 ml**. Para garantir um **nível de confiança de 95%** qual o tamanho de amostra deve ser selecionado para este estudo?

## <font color=green>5.2 Variáveis quantitativas e população finita</font>
***

#### Com desvio padrão conhecido

## $$n = \frac{z^2 \sigma^2 N}{z^2 \sigma^2 + e^2(N-1)}$$

#### Com desvio padrão desconhecido

## $$n = \frac{z^2 s^2 N}{z^2 s^2 + e^2(N-1)}$$

Onde:

$N$ = tamanho da população

$z$ = variável normal padronizada

$\sigma$ = desvio padrão populacional

$s$ = desvio padrão amostral

$e$ = erro inferencial

## <font color='blue'>Exemplo: Indústria de refrigerantes</font>

Em um lote de **10.000 latas** de refrigerante foi realizada uma amostra aleatória simples de **100 latas** e foi obtido o **desvio padrão amostral do conteúdo das latas igual a 12 ml**. O fabricante estipula um **erro máximo sobre a média populacional de apenas 5 ml**. Para garantir um **nível de confiança de 95%** qual o tamanho de amostra deve ser selecionado para este estudo?

### Obtendo $N$
"""

N <- 10000
N

"""### Obtendo $z$"""

z <- qnorm((0.5 + (0.95 / 2)))
z

"""### Obtendo $s$"""

s <- 12
s

"""### Obtendo $e$"""

e <- 5
e

"""### Obtendo $n$

## $$n = \frac{z^2 s^2 N}{z^2 s^2 + e^2(N-1)}$$
"""

n <- ((z ** 2) * (s ** 2) * (N)) / (((z ** 2) * (s ** 2)) + ((e ** 2) * (N - 1)))
round(n)

"""## Exercício - 13"""

# Um fabricante de farinha verificou em uma amostra aleatória formada por 200 sacos de 25 kg de um lote 
# formado por 2.000 sacos apresentou um desvio padrão amostral do peso igual a 480 g. Considerando um erro 
# máximo associado à média populacional igual a 0,3 kg e um nível de confiança igual a 95%, qual o tamanho 
# de amostra deveria ser selecionado para obtermos uma estimativa confiável do parâmetro populacional?

N_ex13 <- 2000
Z_ex13 <- qnorm(0.5 + (0.95 / 2))
s_ex13 <- 480
e_ex13 <- 0.3 * 1000   # Convertendo kg para g
n_ex13 <- ((Z_ex13**2) * (s_ex13**2) * (N_ex13)) / (((Z_ex13**2) * (s_ex13**2)) + ((e_ex13**2) * (N_ex13 - 1)))

round(n_ex13)

"""# <font color=green>6 FIXANDO O CONTEÚDO</font>
***

## <font color='blue'>Exemplo: Rendimento médio</font>

Estamos estudando o **rendimento mensal dos chefes de domicílios com renda até R$\$$ 5.000,00 no Brasil**. Nosso supervisor determinou que o **erro máximo em relação a média seja de R$\$$ 10,00**. Sabemos que o **desvio padrão populacional** deste grupo de trabalhadores é de **R$\$$ 1.082,79** e que a **média populacional** é de **R$\$$ 1.426,54**. Para um **nível de confiança de 95%**, qual deve ser o tamanho da amostra de nosso estudo? Qual o intervalo de confiança para a média considerando o tamanho de amostra obtido?

### Construindo o dataset conforme especificado pelo problema
"""

renda_5000 <- dados[dados$Renda <= 5000, ]

head(renda_5000, 5)

sigma <- sd(renda_5000$Renda)
sigma

media <- mean(renda_5000$Renda)
media

"""### Calculando o tamanho da amostra"""

z <- qnorm(0.975)
e <- 10
n <- (z * (sigma / e)) ** 2
round(n)

"""### Calculando o intervalo de confiança para a média"""

limite_inferior <- mean(renda_5000$Renda) - (z * (sd(renda_5000$Renda) / sqrt(n)))
limite_superior <- mean(renda_5000$Renda) + (z * (sd(renda_5000$Renda) / sqrt(n)))

limite_inferior

media

limite_superior

"""### Realizando uma prova gráfica"""

# No gráfico podemos identificar que todos os pontos de médias das amostras selecionadas estão dentro do limite inferior e superior de 95%,
# ficando fora apenas alguns pontos que representam os 5% de limite de erro.

tamanho_simulacao = 1000
medias <- c()

for(i in 1:tamanho_simulacao){
    medias <- c(medias, mean(sample_n(renda_5000, n)$Renda))
}
medias <- data.frame(medias)

ggplot(data = medias, aes(x = c(1:tamanho_simulacao), y = medias)) + 
    geom_point(size = 1.5, stroke = 0) + 
    geom_hline(yintercept = media, color = 'green') + 
    geom_hline(yintercept = limite_inferior, color = 'red') + 
    geom_hline(yintercept = limite_superior, color = 'red')

"""## Exercício - 014"""

# Uma concessionária tem suas vendas distribuídas de acordo com uma distribuição de Poisson. Sabendo-se que a concessionária 
# vende em média 12 carros por mês (30 dias) e avaliando apenas uma quinzena de vendas (15 dias), qual a probabilidade de a empresa vender apenas 7 carros?

media_ex14 <- 12 / 2
k_ex14 <- 7

probabilidade_ex14 <- dpois(x = k_ex14, lambda = media_ex14)
round(probabilidade_ex14, 6)