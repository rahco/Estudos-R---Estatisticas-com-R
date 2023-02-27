
# <font color=green size=10>CURSO DE ESTATÍSTICA - PARTE 3</font>

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

### Configurações
"""

library(dplyr)
library(ggplot2)

options(repr.plot.width = 7, repr.plot.height = 4)

"""### Importando dataset do projeto"""

dados <- read.csv('dados.csv')

head(dados)

nrow(dados)

"""# <font color=green>2 TESTES DE HIPÓTESES</font>
***

Testes estatísticos são regras de decisão que permitem avaliar a razoabilidade das hipóteses feitas sobre os parâmetros populacionais e aceitá-las ou rejeitá-las como provavelmente verdadeiras ou falsas tendo como base uma amostra.

## <font color=green>2.1 Teste de normalidade</font>
***

A função *shapiro.test* testa a hipótese nula $H_0$ de que a amostra é proveniente de uma distribuição normal, ou seja, os dados são normalmente distribuídos.

#### <font color=red>Documentações:

- [**shapiro.test**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/shapiro.test)

### Definindo a significância do teste ($\alpha$)
"""

significancia <- 0.05

"""### Testando a variável Renda"""

ggplot(dados, aes(x = Renda)) + 
    geom_histogram() + 
    ylab("Frequência") + 
    xlab("Renda") + 
    ggtitle('Histograma Renda') +
    theme(plot.title=element_text(hjust = 0.5))

"""### <font color='red'>Critério do valor $p$</font>

> ### Rejeitar $H_0$ se o valor $p\leq \alpha$
"""

set.seed(2911)
amostra <- sample_n(dados, 5000)

# Com a função shapiro.test obtemos o p-value de uma coluna do DF de amostra.

resultado <- shapiro.test(amostra$Renda)
resultado

resultado$p.value

p_valor <- resultado$p.value
p_valor

resultado$statistic

# Sendo o p-value <= a significancia, rejeitamos H0, ou seja, rejeitamos a hipótese de que essa variável possua uma distribuição normal.

p_valor <= significancia

"""### Testando a variável Altura"""

ggplot(dados, aes(x = Altura)) + 
    geom_histogram() + 
    ylab("Frequência") + 
    xlab("Altura") + 
    ggtitle('Histograma Altura') +
    theme(plot.title=element_text(hjust = 0.5))

"""### <font color='red'>Critério do valor $p$</font>

> ### Rejeitar $H_0$ se o valor $p\leq \alpha$
"""

resultado <- shapiro.test(amostra$Altura)
resultado

p_valor <- resultado$p.value
p_valor

resultado$statistic

# Sendo o p-value > que a significancia, aceitamos H0, ou seja, aceitamos a hipótese de que essa variável possua uma distribuição normal.

p_valor <= significancia

"""## <font color=green>2.2 Etapas Básicas de um Teste</font>
***

### **Passo 1** - formulação das hipóteses $H_0$ e $H_1$;

> ### <font color='red'>Pontos importantes</font>
> - De maneira geral, o alvo do estudo deve ser formulado como a hipótese alternativa $H_1$.
> - A hipótese nula sempre afirma uma igualdade ou propriedade populacional, e $H_1$ a desigualdade que nega $H_0$.
> - No caso da hipótese nula $H_0$ a igualdade pode ser representada por uma igualdade simples "$=$" ou por "$\geq$" e "$\leq$". Sempre complementar ao estabelecido pela hipótese alternativa.
> - A hipótese alternativa $H_1$ deve definir uma desigualdade que pode ser uma diferença simples "$\neq$" ou dos tipos "$>$" e "$<$".


### **Passo 2** - escolha da distribuição amostral adequada;

> ### <font color='red'>Pontos importantes</font>
> - Quando o tamanho da amostra tiver 30 elementos ou mais, deve-se utilizar a distribuição normal, como estabelecido pelo **teorema do limite central**.
> - Para um tamanho de amostra menor que 30 elementos, e se pudermos afirmar que a população se distribui aproximadamente como uma normal e o desvio padrão populacional for conhecido, deve-se utilizar a distribuição normal.
> - Para um tamanho de amostra menor que 30 elementos, e se pudermos afirmar que a população se distribui aproximadamente como uma normal e o desvio padrão populacional for desconhecido, deve-se utilizar a distribuição t de Student.

<img src='https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img003.png' width=70%>

### **Passo 3** - fixação da significância do teste ($\alpha$), que define as regiões de aceitação e rejeição das hipóteses (os valores mais freqüentes são 10%, 5% e 1%);

> ### <font color='red'>Pontos importantes</font>
> - O **nível de confiança** ($1 - \alpha$) representa a probabilidade de acerto da estimativa. De forma complementar o **nível de significância** ($\alpha$) expressa a probabilidade de erro da estimativa.
>
> ![Níveis de Confiança e significância](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img001.png)
>
> - O **nível de confiança** representa o grau de confiabilidade do resultado da estimativa estar dentro de determinado intervalo. Quando fixamos em uma pesquisa um **nível de confiança** de 95%, por exemplo, estamos assumindo que existe uma probabilidade de 95% dos resultados da pesquisa representarem bem a realidade, ou seja, estarem corretos.
>
> ![Áreas de Aceitação e Rejeição](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img002.png)

### **Passo 4** - cálculo da estatística-teste e verificação desse valor com as áreas de aceitação e rejeição do teste;

> ### <font color='red'>Pontos importantes</font>
> - Nos testes paramétricos, distância relativa entre a estatística amostral e o valor alegado como provável.
> - Neste passo são obtidas as estatísticas amostrais necessárias à execução do teste (média, desvio-padrão, graus de liberdade etc.)


### **Passo 5** - Aceitação ou rejeição da hipótese nula.

> ### <font color='red'>Pontos importantes</font>
> - No caso de o intervalo de aceitação conter a estatística-teste, aceita-se $H_0$ como estatisticamente válido e rejeita-se $H_1$ como tal.
> - No caso de o intervalo de aceitação não conter a estatística-teste, rejeita-se $H_0$ e aceita-se $H_1$ como provavelmente verdadeira. 
> - A aceitação também se verifica com a probabilidade de cauda (p-valor): se maior que $\alpha$, aceita-se $H_0$.

---

# <font color=green>3 TESTES PARAMÉTRICOS</font>
***

Quando um teste assume determinadas premissas sobre como os parâmetros de uma população se distribuem, estamos trabalhando com **Testes Paramétricos**.

## <font color=green>3.1 Teste Bicaudal</font>
***

## <font color='red'>Problema</font>

A empresa **Suco Bom** produz **sucos de frutas em embalagens de 500 ml**. Seu processo de produção é quase todo automatizado e as embalagens de sucos são preenchidas por uma máquina que às vezes apresenta um certo desajuste, levando a erros no preenchimento das embalagens para mais ou menos conteúdo. Quando o volume médio cai abaixo de 500 ml, a empresa se preocupa em perder vendas e ter problemas com os orgãos fiscalizadores. Quando o volume passa de 500 ml, a empresa começa a se preocupar com prejuízos no processo de produção.

O setor de controle de qualidade da empresa **Suco Bom** extrai, periodicamente, **amostras de 50 embalagens** para monitorar o processo de produção. Para cada amostra, é realizado um **teste de hipóteses** para avaliar se o maquinário se desajustou. A equipe de controle de qualidade assume um **nível de significância de 5%**.

Suponha agora que uma **amostra de 50 embalagens** foi selecionada e que a **média amostral observada foi de 503,24 ml**. **Esse valor de média amostral é suficientemente maior que 500 ml para nos fazer rejeitar a hipótese de que a média do processo é de 500 ml ao nível de significância de 5%?**

---

O **teste bicaudal** é muito utilizado em **testes de qualidade**, como o apresentado em nosso problema acima. Outro exemplo é a avaliação de peças que devem ter um encaixe perfeito (porcas e parafusos, chaves e fechaduras etc.).

![Teste Bicaudal](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img005.png)

---

### Dados do problema
"""

amostra <- c(509, 505, 495, 510, 496, 509, 497, 502, 503, 505, 
           501, 505, 510, 505, 504, 497, 506, 506, 508, 505, 
           497, 504, 500, 498, 506, 496, 508, 497, 503, 501, 
           503, 506, 499, 498, 509, 507, 503, 499, 509, 495, 
           502, 505, 504, 509, 508, 501, 505, 497, 508, 507)

amostra <- data.frame(Amostra = amostra)
head(amostra)

media_amostra <- mean(amostra$Amostra)
media_amostra

desvio_padrao_amostra <- sd(amostra$Amostra)
desvio_padrao_amostra

media <- 500
significancia <- 0.05
confianca <- 1 - significancia
n <- 50

"""### **Passo 1** - formulação das hipóteses $H_0$ e $H_1$

#### <font color='red'>Lembre-se, a hipótese nula sempre contém a alegação de igualdade</font>

### $H_0: \mu = 500$

### $H_1: \mu \neq 500$

---

### **Passo 2** - escolha da distribuição amostral adequada
<img src='https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img003.png' width=70%>

### O tamanho da amostra é maior que 30?
#### Resp.: Sim

### O desvio padrão populacional é conhecido?
#### Resp.: Não

---

### **Passo 3** - fixação da significância do teste ($\alpha$)

#### <font color=red>Documentações:

- [**Normal**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/Normal)
"""

probabilidade <- (0.5 + (confianca / 2))
probabilidade

"""### Obtendo $z_{\alpha/2}$"""

z_alpha_2 <- qnorm(probabilidade)
z_alpha_2

"""![Região de Aceitação](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img006.png)

---

### **Passo 4** - cálculo da estatística-teste e verificação desse valor com as áreas de aceitação e rejeição do teste

# $$z = \frac{\bar{x} - \mu_0}{\frac{s}{\sqrt{n}}}$$
"""

z <- (media_amostra - media) / (desvio_padrao_amostra / sqrt(n))
z

"""![Estatística-Teste](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img007.png)

---

### **Passo 5** - Aceitação ou rejeição da hipótese nula

<img src='https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img013.png' width=90%>

### <font color='red'>Critério do valor crítico</font>

> ### Teste Bicaudal
> ### Rejeitar $H_0$ se $z \leq -z_{\alpha / 2}$ ou se $z \geq z_{\alpha / 2}$
"""

z <= -z_alpha_2

z >= z_alpha_2

# Rejeitamos a hipótese de uma distribuição normal dados os limites.

if(z <= -z_alpha_2 || z >= z_alpha_2){
    'Rejeitar H0'
}else{
    'Aceitar H0'
}

"""## Exercício - 01

Uma indústria de cimento afirma que a quantidade média de cimento nas embalagens de seu produto é de 25 kg. Um teste de pesagem em uma amostra de 45 embalagens apresentou um peso médio igual a 25,2 kg. Medições anteriores afirmam que a distribuição dos pesos segue uma normal e que o desvio padrão populacional é igual a 400 g. Considerando um nível de significância igual a 5%, responda as seguintes questões:

1) Qual a hipótese nula a ser testada?

2) Qual o valor da estatística de teste?

3) Qual a conclusão do teste?
"""

media_ex01 <- 25
n_ex01 <- 45
media_amostra_ex01 <- 25.2
desvio_padrao_ex01 <- 0.4
significancia_ex01 <- 0.05
confianca_ex01 <- 1 - significancia_ex01

# 1) Qual a hipótese nula a ser testada?
hipotese_ex01 <- 'H0: μ = 25'
hipotese_ex01

probabilidade_ex01 <- (0.5 + (confianca_ex01 / 2))
z_alpha_2_ex01 <- qnorm(probabilidade_ex01)

# 2) Qual o valor da estatística de teste?
z_ex01 <- (media_amostra_ex01 - media_ex01) / (desvio_padrao_ex01 / sqrt(n_ex01))
z_ex01

# 3) Qual a conclusão do teste?
if (z_ex01 <= -z_alpha_2_ex01 || z_ex01 >= z_alpha_2_ex01) {
    'Rejeitar H0'
} else {
    'Aceitar H0'
}

"""### <font color='green'>Conclusão: Como a média amostral $\bar{x}$ é significativamente maior que 500 ml, rejeitamos $H_0$. Neste caso, devem ser tomadas providências para ajustar o maquinário que preenche as embalagens.</font>

### <font color='red'>Critério do $p-valor$</font>

> ### Teste Bicaudal
> ### Rejeitar $H_0$ se o valor $p\leq\alpha$
"""

p_valor <- 2 * (1 - pnorm(z))
p_valor

# Sendo o p_valor <= a significancia também rejeitamos H0.

p_valor <= significancia

"""#### <font color=red>Documentações:

- [**Normal**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/Normal)
- [**ZTest**](https://www.rdocumentation.org/packages/DescTools/versions/0.99.19/topics/ZTest)
"""

# install.packages('DescTools')

# OU

# packageurl <- "https://cran.r-project.org/src/contrib/Archive/DescTools/DescTools_0.99.30.tar.gz"
# install.packages(packageurl, repos=NULL, type="source")

install.packages('DescTools')

library(DescTools)

# Utilizando a função ZTest do DescTools obtemos de forma simplificada os valores de z e do p_valor.

ZTest(amostra$Amostra, mu = media, sd_pop = desvio_padrao_amostra)

resultado <- ZTest(amostra$Amostra, mu = media, sd_pop = desvio_padrao_amostra)

# Com o parâmetro $statistic retiramos somente o valor de z do ZTest.

resultado$statistic

z

# Com o parâmetro $p.value retiramos somente o p_valor do ZTest.

p_valor <- resultado$p.value
p_valor

# Podemos novamente confirmar a rejeição de H0.

p_valor <= significancia

"""## Exercício - 02

Considere novamente os dados do problema anterior. Uma indústria de cimento afirma que a quantidade média de cimento nas embalagens de seu produto é de 25 kg. Um teste de pesagem em uma amostra de 45 embalagens apresentou um peso médio igual a 25,2 kg. Medições anteriores afirmam que a distribuição dos pesos segue uma normal e que o desvio padrão populacional é igual a 400 g.

Com um nível de significância igual a 5%, teste a hipótese nula de que a média do processo é igual a 25 kg e selecione a alternativa que indica o p-valor do teste aplicado (considere somente 5 casas decimais).
"""

media_ex02 <- 25
n_ex02 <- 45
media_amostra_ex02 <- 25.2
desvio_padrao_ex02 <- 0.4

# Estatística de teste
z_ex02 <- (media_amostra_ex02 - media_ex02) / (desvio_padrao_ex02 / sqrt(n_ex02))

# p-valor
p_valor_ex02 <- 2 * (1 - pnorm(z_ex02))
p_valor_ex02

"""---

## <font color=green>3.2 Teste Unicaudal</font>
***

## <font color='red'>Problema</font>

Um famoso fabricante de refrigerantes alega que uma lata de 350 ml de seu principal produto contém, **no máximo**, **37 gramas de açúcar**. Esta alegação nos leva a entender que a quantidade média de açúcar em uma lata de refrigerante deve ser **igual ou menor que 37 g**.

Um consumidor desconfiado e com conhecimentos em inferência estatística resolve testar a alegação do fabricante e seleciona, aleatóriamente, em um conjunto de estabelecimentos distintos, **uma amostra de 25 latas** do refrigerante em questão. Utilizando o equipamento correto o consumidor obteve as quantidades de açúcar em todas as 25 latas de sua amostra. 

**Assumindo que essa população se distribua aproximadamente como uma normal e considerando um nível de significância de 5%, é possível aceitar como válida a alegação do fabricante?**

### Construindo tabela $t$ de Student

#### <font color=red>Documentações:

- [**TDist**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/TDist)
"""

q <- seq(0.05, 0.005, by = -0.005)
df <- seq(1, 30, by = 1)
probabilidade <- c()
for(i in df){
    for(j in q){
        probabilidade <- c(probabilidade, qt(j, i, lower.tail = F))
    }
}
tabela_t_student <- matrix(probabilidade, ncol=10, byrow=TRUE)
colnames(tabela_t_student) <- format(q)
rownames(tabela_t_student) <- format(df)
tabela_t_student

"""<img src='https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img004.png' width='250px'>

As células da tabela acima são valores de $t$ para uma área ou probabilidade na cauda superior da distribuição $t$.

---

Os **testes unicaudais** verificam as variáveis em relação a um piso ou a um teto e avaliam os valores máximos ou mínimos esperados para os parâmetros em estudo e a chance de as estatísticas amostrais serem inferiores ou superiores a dado limite.

<img src='https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img008.png' width='700px'>

### Dados do problema
"""

amostra <- c(37.27, 36.42, 34.84, 34.60, 37.49, 
           36.53, 35.49, 36.90, 34.52, 37.30, 
           34.99, 36.55, 36.29, 36.06, 37.42, 
           34.47, 36.70, 35.86, 36.80, 36.92, 
           37.04, 36.39, 37.32, 36.64, 35.45)

amostra <- data.frame(Amostra = amostra)
amostra

media_amostra <- mean(amostra$Amostra)
media_amostra

desvio_padrao_amostra <- sd(amostra$Amostra)
desvio_padrao_amostra

media <- 37
significancia <- 0.05 
confianca <- 1 - significancia
n <- 25
graus_de_liberdade <- 24

"""### **Passo 1** - formulação das hipóteses $H_0$ e $H_1$

#### <font color='red'>Lembre-se, a hipótese nula sempre contém a alegação de igualdade</font>

### $H_0: \mu \leq 37$

### $H_1: \mu > 37$

---

### **Passo 2** - escolha da distribuição amostral adequada
<img src='https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img003.png' width=70%>

### O tamanho da amostra é maior que 30?
#### Resp.: Não

### Podemos afirmar que a população se distribui aproximadamente como uma normal?
#### Resp.: Sim

### O desvio padrão populacional é conhecido?
#### Resp.: Não

---

### **Passo 3** - fixação da significância do teste ($\alpha$)

#### <font color=red>Documentações:

- [**TDist**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/TDist)
"""

tabela_t_student[23:25, ]

"""### Obtendo $t_{\alpha}$"""

t_alpha <- qt(confianca, graus_de_liberdade)
t_alpha

"""![Região de Aceitação](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img009.png)

---

### **Passo 4** - cálculo da estatística-teste e verificação desse valor com as áreas de aceitação e rejeição do teste

# $$t = \frac{\bar{x} - \mu_0}{\frac{s}{\sqrt{n}}}$$
"""

t <- (media_amostra- media) / (desvio_padrao_amostra / sqrt(n))
t

"""![Estatística-Teste](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img010.png)

---

### **Passo 5** - Aceitação ou rejeição da hipótese nula

<img src='https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img013.png' width=90%>

### <font color='red'>Critério do valor crítico</font>

> ### Teste Unicaudal Superior
> ### Rejeitar $H_0$ se $t \geq t_{\alpha}$
"""

t >= t_alpha

"""### <font color='green'>Conclusão: Com um nível de confiança de 95% não podemos rejeitar $H_0$, ou seja, a alegação do fabricante é verdadeira.</font>

## Exercício - 03

A empresa Limpa Esgoto garante ser capaz de realizar o tratamento de esgoto e obter, no máximo, 150g de impurezas para cada mil litros de esgoto tratado. Vinte amostras de mil litros de esgoto apresentaram, em média, 230g de impurezas e desvio padrão amostral igual a 90 g. Assumindo alfa igual a 5% e população normalmente distribuída, seria possível discordar da empresa Limpa Esgoto?

Selecione a alternativa que apresenta a estatística de teste e a decisão correta do teste.
"""

media_ex03 <- 150
n_ex03 <- 20
graus_de_liberdade_ex03 <- n_ex03 - 1
media_amostra_ex03 <- 230
desvio_padrao_ex03 <- 90
significancia_ex03 <- 0.05
confianca_ex03 <- 1 - significancia_ex03

t_alpha_ex03 <- qt(confianca_ex03, graus_de_liberdade_ex03)
t_ex03 <- (media_amostra_ex03 - media_ex03) / (desvio_padrao_ex03 / sqrt(n_ex03))
t_ex03

if (t_ex03 >= t_alpha_ex03) {
    'Rejeitar H0'
} else {
    'Aceitar H0'
}

"""## Exercício - 04

A pizzaria Muito Queijo alega que a quantidade de queijo em suas pizzas tamanho família é de, no mínimo, 350g. Uma amostra de 35 pizzas tamanho família revelou uma média de 330 g de queijo por pizza. O desvio padrão amostral foi de 80g. Assumindo alfa igual a 5% e população normalmente distribuída, seria possível discordar da alegação da pizzaria?

Selecione a alternativa que apresenta a estatística de teste e a decisão correta do teste.
"""

media_ex04 <- 350
n_ex04 <- 35
media_amostra_ex04 <- 330
desvio_padrao_ex04 <- 80
significancia_ex04 <- 0.05
confianca_ex04 <- 1 - significancia_ex04

z_alpha_ex04 <- qnorm(confianca_ex04)
z_ex04 <- (media_amostra_ex04 - media_ex04) / (desvio_padrao_ex04 / sqrt(n_ex04))
z_ex04

if (z_ex04 <= -z_alpha_ex04) {
    'Rejeitar H0'
} else {
    'Aceitar H0'
}

"""### <font color='red'>Critério do valor $p$</font>

> ### Teste Unicaudal Superior
> ### Rejeitar $H_0$ se o valor $p\leq\alpha$
"""

t

p_valor <- pt(t, graus_de_liberdade, lower.tail = F)
p_valor

p_valor <= significancia

"""#### <font color=red>Documentações:

- [**t.test**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/t.test)
"""

resultado <- t.test(amostra$Amostra, alternative = "greater", mu = media)
resultado

resultado$statistic

p_valor <- resultado$p.value 
p_valor

p_valor <= significancia

"""## Exercício - 05

Considere o seguinte teste de hipóteses:



Uma amostra aleatória de tamanho 23 foi selecionada e se sabe que o desvio padrão da amostra é 12. Obtenha o p-valor e a sua conclusão para os dados amostrais abaixo:

1) Média amostral igual a 82

2) Média amostral igual a 70

Considere um nível de confiança de 95%.
"""

media_ex05 <- 75
n_ex05 <- 23
graus_de_liberdade_ex05 <- n_ex05 - 1
desvio_padrao_ex05 <- 12
significancia_ex05 <- 0.05

# 1) Média amostral = 82
t_ex05 <- (82 - media_ex05) / (desvio_padrao_ex05 / sqrt(n_ex05))

p_valor_ex05 <- pt(t_ex05, graus_de_liberdade_ex05, lower.tail = T)
p_valor_ex05

if (p_valor_ex05 <= significancia_ex05) {
    'Rejeitar H0'
} else {
    'Aceitar H0'
}

# 2) Média amostral = 70
t_ex05 <- (70 - media_ex05) / (desvio_padrao_ex05 / sqrt(n_ex05))

p_valor_ex05 <- pt(t_ex05, graus_de_liberdade_ex05, lower.tail = T)
p_valor_ex05

if (p_valor_ex05 <= significancia_ex05) {
    'Rejeitar H0'
} else {
    'Aceitar H0'
}

"""## Exercício - 06

Uma lanchonete afirma que suas vendas médias são de exatamente R$ 32,00. Uma amostra aleatória de 20 vendas foi selecionada e os valores são apresentados no dataset abaixo:

vendas <- c(32.45, 26.8, 27.81, 30.22, 30.88, 24.9, 31.94, 16.02, 
    24.39, 26.01, 21.83, 25.35, 22.46, 38.2, 29.86, 22.79, 28.83, 27.34, 32.22, 33.26)
dataset <- data.frame(Amostra = vendas)COPIAR CÓDIGO
Sabe-se que as vendas são normalmente distribuídas. Obtenha o valor da estatística de teste, o p-valor e a decisão para o teste. Assuma um nível de significância de 5%.
"""

vendas_ex06 <- c(32.45, 26.8, 27.81, 30.22, 30.88, 24.9, 31.94, 16.02, 
    24.39, 26.01, 21.83, 25.35, 22.46, 38.2, 29.86, 22.79, 28.83, 27.34, 32.22, 33.26)
dataset_ex06 <- data.frame(Amostra = vendas_ex06)

media_ex06 <- 32
significancia_ex06 <- 0.05

resultado_ex06 <- t.test(dataset_ex06$Amostra, alternative = "two.sided", mu = media_ex06)
t_ex06 <- resultado_ex06$statistic
t_ex06

p_valor_ex06 <- resultado_ex06$p.value
p_valor_ex06

if (p_valor_ex06 <= significancia_ex06) {
    'Rejeitar H0'
} else {
    'Aceitar H0'
}

"""---

## <font color=green>3.4 Testes para Duas Amostras</font>
***

## <font color='red'>Problema</font>

Em nosso dataset temos os rendimento dos chefes de domicílio obtidos da Pesquisa Nacional por Amostra de Domicílios - PNAD no ano de 2015. Um problema bastante conhecido em nosso país diz respeito a desigualdade de renda, principalmente entre homens e mulheres.

Duas amostras aleatórias, uma de **500 homens** e outra com **500 mulheres**, foram selecionadas em nosso dataset. Com o objetivo de comprovar tal desigualdade, **teste a igualdade das médias** entre estas duas amostras com um nível de **significância de 1%**.

---

É possível também utilizar testes de hipóteses para comparar duas diferentes amostras. Neste tipo de teste se deseja decidir se uma amostra é diferente da outra.

### Seleção das amostras
"""

homens <- matrix(c(300, 1000, 4000, 5000, 300, 350, 1200, 1200, 1100, 1800, 700, 5000, 250, 1560, 400, 5500, 3000, 0, 1100, 1500, 500, 500, 788, 500, 3000, 788, 2400, 788, 3300, 1350, 2500, 2000, 1300, 2430, 9000, 10120, 1380, 2000, 1400, 1000, 500, 1500, 2200, 2100, 4000, 1000, 1200, 2900, 1800, 2000, 788, 1576, 800, 2400, 788, 788, 788, 0, 12000, 7880, 850, 1000, 1000, 1600, 3800, 788, 1200, 300, 350, 700, 6000, 1500, 5000, 2000, 1200, 800, 250, 800, 1600, 400, 3000, 2304, 800, 1400, 450, 788, 2200, 6000, 1200, 4000, 6000, 1100, 1200, 1300, 3000, 3000, 1500, 1280, 788, 1400, 788, 4000, 0, 1000, 2500, 1300, 3000, 500, 1600, 2000, 1280, 150, 0, 0, 7000, 1061, 700, 788, 2000, 788, 10500, 788, 1600, 1050, 1100, 3000, 800, 1400, 1200, 2500, 1000, 1500, 1500, 900, 2000, 300, 3000, 788, 1400, 2000, 2000, 3000, 2600, 15000, 1500, 950, 1200, 1500, 7500, 1400, 350, 750, 1200, 788, 0, 2500, 1700, 788, 700, 1600, 1200, 320, 6000, 2000, 2000, 3000, 900, 2100, 0, 788, 1800, 1600, 4000, 1300, 1300, 1500, 8900, 1400, 788, 600, 1000, 950, 2000, 4000, 2300, 2000, 800, 2500, 1500, 1400, 800, 6000, 788, 900, 200, 1300, 788, 2600, 1500, 8000, 900, 2000, 2000, 350, 3000, 9580, 0, 400, 800, 1700, 1800, 1200, 18000, 9000, 3000, 1200, 700, 1200, 400, 987, 6000, 2000, 0, 0, 480, 500, 800, 1680, 10000, 1200, 1700, 788, 2200, 10000, 10000, 100, 1200, 1600, 2500, 1300, 1200, 1300, 2200, 200, 60, 1100, 1200, 6000, 4500, 100, 788, 2900, 2500, 900, 788, 2500, 4000, 788, 1400, 1000, 300, 788, 1000, 4000, 2200, 788, 1000, 1000, 600, 1600, 6000, 2500, 2500, 1000, 3000, 2200, 4500, 1500, 4300, 1500, 8500, 3200, 1200, 1200, 1500, 4000, 2000, 1350, 1500, 890, 5000, 2400, 13000, 800, 1500, 1500, 2000, 580, 500, 920, 1200, 2000, 788, 500, 20000, 1350, 1576, 500, 8000, 1800, 600, 1000, 3000, 4000, 1500, 788, 600, 2300, 1500, 500, 500, 800, 900, 8000, 1600, 3000, 788, 1500, 5200, 900, 3565, 650, 1700, 1600, 788, 1200, 788, 788, 100, 900, 1700, 10000, 1600, 200, 788, 1400, 1500, 400, 4200, 1400, 4000, 5516, 3500, 700, 1400, 1200, 0, 7000, 2000, 5000, 2000, 750, 3000, 2000, 1500, 200, 3000, 1700, 1500, 7000, 1500, 788, 2400, 2500, 1500, 2000, 1500, 2000, 1100, 800, 1800, 480, 3500, 700, 3400, 5000, 5000, 1300, 3000, 2000, 900, 2000, 1000, 1800, 0, 1500, 788, 3500, 875, 5000, 2000, 1300, 1600, 0, 750, 1200, 120, 1800, 1200, 788, 1000, 0, 1400, 2300, 7000, 4000, 5000, 788, 20000, 4000, 0, 1200, 1800, 500, 1000, 788, 1300, 5000, 50, 1700, 2000, 1600, 2000, 1350, 1500, 600, 1700, 780, 2446, 2100, 5000, 1700, 1200, 1000, 788, 4500, 1500, 788, 0, 1580, 1000, 4500, 2400, 788, 1100, 2000, 788, 100, 1200, 1200, 1200, 1000, 2000, 788, 2000, 15000, 600, 0, 1500, 3000, 4000, 900, 810, 600, 1500, 4000, 1200, 5000, 5300, 2500, 800, 0, 1400, 1500, 4000, 1200, 400, 1000, 820, 1000, 1000, 788, 1500, 2500, 1500, 220, 600, 788, 1750, 7000))
mulheres <- matrix(c(788, 1200, 6000, 1000, 788, 1100, 1900, 1577, 900, 950, 1200, 788, 788, 1100, 30, 620, 900, 1000, 1200, 2000, 0, 500, 1200, 1500, 1200, 1120, 788, 788, 2300, 2400, 3000, 788, 4000, 1000, 500, 500, 1700, 200, 6000, 400, 950, 1100, 50, 930, 850, 1100, 3500, 1500, 1200, 900, 1100, 1500, 788, 1000, 788, 4500, 4000, 8000, 3500, 788, 1050, 1000, 1400, 3500, 600, 3000, 500, 930, 2660, 788, 360, 2364, 788, 160, 1100, 1085, 1050, 1500, 100, 0, 788, 250, 1700, 1300, 800, 0, 2000, 820, 910, 300, 2000, 200, 788, 788, 800, 1500, 1300, 1200, 0, 600, 1036, 400, 1100, 788, 400, 1500, 1200, 1800, 1000, 788, 850, 60, 1800, 3500, 600, 200, 500, 200, 1100, 1540, 1100, 900, 800, 500, 200, 1200, 1250, 788, 500, 200, 788, 200, 0, 1800, 2000, 1000, 900, 3000, 700, 1200, 788, 2800, 3300, 400, 0, 850, 1022, 6000, 750, 1000, 3500, 400, 1500, 1000, 800, 0, 980, 2400, 850, 1100, 788, 1100, 788, 1200, 788, 864, 1000, 500, 400, 3000, 1200, 100, 80, 900, 2000, 1250, 1000, 300, 400, 1500, 60, 8000, 1000, 600, 800, 350, 788, 0, 600, 788, 2500, 1300, 800, 8000, 1100, 800, 900, 2000, 0, 800, 1400, 1000, 1200, 788, 3840, 788, 3940, 788, 560, 800, 2000, 600, 2900, 0, 400, 800, 7000, 788, 788, 788, 788, 1250, 1500, 1386, 100, 300, 788, 788, 600, 600, 900, 2800, 788, 350, 900, 0, 150, 788, 788, 1000, 30, 788, 780, 900, 0, 0, 3000, 1800, 2000, 1100, 788, 0, 7500, 1800, 788, 788, 2000, 3000, 180, 2500, 800, 0, 1250, 200, 1100, 0, 1100, 400, 1300, 300, 0, 1312, 600, 200, 4000, 2400, 12000, 2150, 500, 400, 0, 600, 400, 788, 1200, 500, 2000, 1500, 70, 500, 2000, 1000, 100, 500, 2000, 100, 2115, 800, 5800, 2300, 750, 788, 0, 900, 1000, 600, 3000, 5500, 1600, 788, 4000, 0, 1100, 120, 320, 1100, 2500, 200, 800, 3000, 550, 4200, 7000, 720, 0, 2000, 5000, 2000, 788, 500, 788, 7000, 500, 788, 1760, 1200, 3500, 1500, 150, 800, 788, 3000, 400, 788, 1000, 2000, 2500, 0, 788, 5200, 788, 0, 600, 1300, 120, 850, 1576, 788, 2000, 1300, 788, 800, 1800, 655, 1580, 789, 788, 850, 788, 7000, 788, 430, 800, 788, 900, 10000, 1200, 300, 400, 788, 788, 3000, 900, 1300, 1300, 788, 800, 1000, 1890, 0, 788, 900, 4000, 788, 1010, 150, 450, 1700, 890, 1200, 2800, 1000, 788, 788, 700, 600, 800, 880, 6000, 800, 800, 820, 788, 1030, 560, 2100, 6500, 2500, 788, 400, 300, 788, 2300, 1000, 3500, 984, 1576, 420, 1700, 450, 1800, 400, 1500, 1500, 4256, 1200, 890, 1200, 300, 400, 850, 1500, 3800, 1800, 996, 2000, 1000, 788, 1500, 300, 600, 950, 1200, 788, 1200, 1500, 250, 788, 1200, 6000, 300, 789, 1500, 788, 3800, 780, 1200, 1200, 220, 788, 500, 200, 480, 1576, 1576, 1035, 900, 800, 1000, 805, 200, 1200, 2220, 1500, 880, 220, 2000, 788, 150, 0, 13000, 40, 5500, 788, 788, 1000, 400, 2000, 200, 1600))

"""### Dados do problema"""

media_amostra_M <- mean(mulheres)
media_amostra_M

desvio_padrao_amostra_M <- sd(mulheres) 
desvio_padrao_amostra_M

media_amostra_H <- mean(homens) 
media_amostra_H

desvio_padrao_amostra_H <- sd(homens) 
desvio_padrao_amostra_H

significancia <- 0.01
confianca <- 1 - significancia
n_M <- 500
n_H <- 500
D_0 <- 0

"""---

### **Passo 1** - formulação das hipóteses $H_0$ e $H_1$

#### <font color='red'>Lembre-se, a hipótese nula sempre contém a alegação de igualdade</font>

### $\mu_1 \Rightarrow$ Média das rendas dos chefes de domicílios do sexo masculino
### $\mu_2 \Rightarrow$ Média das rendas dos chefes de domicílios do sexo feminino

### $
\begin{cases}
H_0: \mu_1 \leq \mu_2\\
H_1: \mu_1 > \mu_2
\end{cases}
$

### ou

### $
\begin{cases}
H_0: \mu_1 -\mu_2 \leq 0\\
H_1: \mu_1 -\mu_2 > 0
\end{cases}
$

---

### **Passo 2** - escolha da distribuição amostral adequada
<img src='https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img003.png' width=70%>

### <font color='red'>Observação importante</font>
> Em testes que envolvam duas amostras com o emprego da tabela $t$ de Student, o número de graus de liberdade será sempre igual a $n_1 + n_2 - 2$

### O tamanho da amostra é maior que 30?
#### Resp.: Sim

### O desvio padrão populacional é conhecido?
#### Resp.: Não

---

### **Passo 3** - fixação da significância do teste ($\alpha$)
"""

probabilidade <- confianca
probabilidade

z_alpha <- qnorm(probabilidade) 
z_alpha

"""![Região de Aceitação](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img011.png)

---

### **Passo 4** - cálculo da estatística-teste e verificação desse valor com as áreas de aceitação e rejeição do teste

# $$z = \frac{(\bar{x_1} - \bar{x_2})-D_0}{\sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2}}}$$
"""

numerador <- (media_amostra_H - media_amostra_M) - D_0

denominador <- sqrt((desvio_padrao_amostra_H ** 2 / n_H) + (desvio_padrao_amostra_M ** 2 / n_M))

z <- numerador / denominador

z

"""![Estatística-Teste](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img012.png)

---

### **Passo 5** - Aceitação ou rejeição da hipótese nula

<img src='https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img014.png' width=90%>

### <font color='red'>Critério do valor crítico</font>

> ### Teste Unicaudal
> ### Rejeitar $H_0$ se $z \geq z_{\alpha}$
"""

z >= z_alpha

"""### <font color='green'>Conclusão: Com um nível de confiança de 99% rejeitamos $H_0$, isto é, concluímos que a média das rendas dos chefes de domicílios do sexo masculino é maior que a média das rendas das chefes de domicílios do sexo feminino. Confirmando a alegação de desigualdade de renda entre os sexos.</font>

## Exercício - 07

Uma prova de estatística foi aplicada em duas salas de aula diferentes. Na sala A, tínhamos 50 alunos e a nota média foi de 5,3, com desvio padrão de 2,1. Na sala B eram 55 alunos, que alcançaram nota média de 7,6 pontos, com desvio padrão de 2,8. Considerando um nível de significância de 5% e que a distribuição das notas segue uma normal, é possível afirmar que as notas médias dessas duas salas foram diferentes?

Indique a alternativa que apresenta a estatística de teste e a conclusão do teste.
"""

media_sala_A_ex07 <- 5.3
desvio_padrao_sala_A_ex07 <- 2.1
media_sala_B_ex07 <- 7.6
desvio_padrao_sala_B_ex07 <- 2.8

significancia_ex07 <- 0.05
confianca_ex07 <- 1 - significancia_ex07
n_sala_A_ex07 <- 50
n_sala_B_ex07 <- 55
D_0_ex07 <- 0

probabilidade_ex07 <- 0.5 + (confianca_ex07 / 2)
z_alpha_2_ex07 <- qnorm(probabilidade_ex07)

numerador_ex07 <- (media_sala_A_ex07 - media_sala_B_ex07) - D_0_ex07
denominador_ex07 <- sqrt((desvio_padrao_sala_A_ex07 ** 2 / n_sala_A_ex07) + (desvio_padrao_sala_B_ex07 ** 2 / n_sala_B_ex07))
z_ex07 <- numerador_ex07 / denominador_ex07
z_ex07

if (z_ex07 <= -z_alpha_2_ex07 || z >= z_alpha_2_ex07) {
    'Rejeitar H0'
} else {
    'Aceitar H0'
}

"""## Exercício - 08

Uma imobiliária da cidade do Rio de Janeiro alega que o valor do m² no bairro do Leblon está avaliado em, no máximo, R$ 1000,00 a mais, quando comparado ao bairro de Ipanema. Uma pesquisa realizada com uma amostra de 13 imóveis de cada bairro revelou os seguintes parâmetros:

Bairro	Média (R$ por m²)	Desvio padrão (R$ por m²)
Leblon	21800	450
Ipanema	20300	320

É possível concordar com a afirmação da imobiliária? Assuma um nível de significância de 5% e populações normalmente distribuídas. Indique a alternativa que apresenta a estatística de teste e a conclusão do teste.

Um pouco mais de teoria: Como se trata de um problema um pouco diferente do apresentado no último vídeo, vamos esclarecer alguns pontos para ajudar na solução:

Em testes entre duas amostras, quando realizamos a escolha da distribuição amostral adequada (passo 2) e perguntamos se n ≥ 30, temos que considerar que n = n1 + n2, onde n1 é o tamanho da primeira amostra e n2 o tamanho da segunda
Quando n1 + n2 ≥ 30, utilizamos z (normal) e quando n1 + n2 < 30, σ não for conhecido e as populações forem normalmente distribuídas, utilizamos t (t-Student)
Quando utilizamos a tabela t de Student, em testes de duas amostras, os graus de liberdade são obtidos da seguinte forma: n1 + n2 – 2
"""

media_Leblon_ex08 <- 21800
desvio_padrao_Leblon_ex08 <- 450
media_Ipanema_ex08 <- 20300
desvio_padrao_Ipanema_ex08 <- 320

significancia_ex08 <- 0.05
confianca_ex08 <- 1 - significancia_ex08
n_Leblon_ex08 <- 13
n_Ipanema_ex08 <- 13
D_0_ex08 <- 1000

t_alpha_ex08 <- qt(confianca_ex08, n_Leblon_ex08 + n_Ipanema_ex08 - 2)

numerador_ex08 <- (media_Leblon_ex08 - media_Ipanema_ex08) - D_0_ex08
denominador_ex08 <- sqrt((desvio_padrao_Leblon_ex08 ** 2 / n_Leblon_ex08) + (desvio_padrao_Ipanema_ex08 ** 2 / n_Ipanema_ex08))
t_ex08 <- numerador_ex08 / denominador_ex08
t_ex08

if (t_ex08 >= t_alpha_ex08) {
    'Rejeitar H0'
} else {
    'Aceitar H0'
}

"""### <font color='red'>Critério do valor $p$</font>

> ### Teste Unicaudal
> ### Rejeitar $H_0$ se o valor $p\leq\alpha$
"""

z

p_valor <- pnorm(z, lower.tail = F)
p_valor

p_valor <= significancia

"""#### <font color=red>Documentações:

- [**BSDA**](https://www.rdocumentation.org/packages/BSDA/versions/1.01)
- [**z.test**](https://www.rdocumentation.org/packages/BSDA/versions/1.01/topics/z.test)
"""

# install.packages("BSDA")

# OU

# packageurl <- "https://cran.r-project.org/src/contrib/Archive/BSDA/BSDA_1.01.tar.gz"
# install.packages(packageurl, repos=NULL, type="source")

"""### z.test()"""

install.packages("BSDA")

library(BSDA)

# Obtendo o p.value com o z.test.

resultado <- z.test(x = homens,
                    y = mulheres,
                    alternative = 'greater',
                    mu = 0,
                    sigma.x = sd(homens),
                    sigma.y = sd(mulheres),
                    conf.level = 0.99)
resultado

p_valor <- resultado$p.value
p_valor

p_valor <= significancia

"""### <font color=red>Somente como observação</font>
### t.test()
"""

resultado <- t.test(x = homens,
                    y = mulheres,
                    alternative = 'greater',
                    paired = F,
                    var.equal = T)
resultado

p_valor <- resultado$p.value
p_valor

p_valor <= significancia

"""---

# <font color=green>4 TESTES NÃO PARAMÉTRICOS</font>
***

O trabalho com pequenas amostras pode levar a não aceitação da validade do teorema central do limite e também na impossibilidade de fazer suposições sobre a distribuição da variável avaliada. Quando isso ocorre torna-se necessária a aplicação de testes não paramétricos. Nos testes não paramétricos, não fazemos hipóteses sobre a distribuição (de probabilidade) das quais as observações são extraídas.

## <font color='red'>Problema</font>

Antes de cada partida do campeonato nacional de futebol, as moedas utilizadas pelos árbitros devem ser verificadas para se ter certeza de que não são viciadas, ou seja, que não tendam para determinado resultado. Para isso um teste simples deve ser realizado antes de cada partida. Este teste consiste em lançar a moeda do jogo **50 vezes** e contar as frequências de **CARAS** e **COROAS** obtidas. A tabela abaixo mostra o resultado obtido no experimento:

||CARA|COROA|
|-|-|-|
|Observado|17|33|
|Esperado|25|25|

A um **nível de significância de 5%**, é possível afirmar que a moeda não é honesta, isto é, que a moeda apresenta uma probabilidade maior de cair com a face **CARA** voltada para cima?

## <font color=green>4.1 Teste do Qui-Quadrado ( $\chi^2$)</font>
***

Também conhecido como teste de adequação ao ajustamento, seu nome se deve ao fato de utilizar uma variável estatística padronizada, representada pela letra grega qui ( $\chi$) elevada ao quadrado. A tabela com os valores padronizados e como obtê-la podem ser vistos logo abaixo.

O teste do $\chi^2$ testa a hipótese nula de não haver diferença entre as frequências observadas de um determinado evento e as frequências que são realmente esperadas para este evento.

Os passos de aplicação do teste são bem parecidos aos vistos para os testes paramétricos.

![Região de Aceitação](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img017.png)

### Construindo tabela $\chi^2$

#### <font color=red>Documentações:

- [**Chisquare**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/Chisquare)
"""

p <- c(0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 0.75, 0.9, 0.975, 0.95, 0.99, 0.995)
df <- seq(1, 30, by = 1)
probabilidade <- c()
for(i in df){
    for(j in p){
        probabilidade <- c(probabilidade, round(qchisq(j, i, lower.tail = T), 4))
    }
}
tabela_chi_2 <- matrix(probabilidade, ncol=13, byrow=TRUE)
colnames(tabela_chi_2) <- format(p)
rownames(tabela_chi_2) <- format(df)
tabela_chi_2

"""<img src='https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img016.png' width='250px'>

Tabela com os valores de $\chi_p^2$ em função dos graus de liberdade $(n - 1)$ e de $p = P(\chi^2 \leq \chi_p^2)$

## <font color='red'>Problema</font>

Antes de cada partida do campeonato nacional de futebol, as moedas utilizadas pelos árbitros devem ser verificadas para se ter certeza de que não são viciadas, ou seja, que não tendam para determinado resultado. Para isso um teste simples deve ser realizado antes de cada partida. Este teste consiste em lançar a moeda do jogo **50 vezes** e contar as frequências de **CARAS** e **COROAS** obtidas. A tabela abaixo mostra o resultado obtido no experimento:

||CARA|COROA|
|-|-|-|
|Observado|17|33|
|Esperado|25|25|

A um **nível de significância de 5%**, é possível afirmar que a moeda não é honesta, isto é, que a moeda apresenta uma probabilidade maior de cair com a face **CARA** voltada para cima?

---

### Dados do problema
"""

F_Observada <- c(17, 33)
F_Esperada <- c(25, 25)
significancia <- 0.05
confianca <- 1 - significancia
k <- 2 # Número de eventos possíveis (cara ou coroa)
graus_de_liberdade <- k - 1

"""### **Passo 1** - formulação das hipóteses $H_0$ e $H_1$

#### <font color='red'>Lembre-se, a hipótese nula sempre contém a alegação de igualdade</font>

### $H_0: F_{CARA} = F_{COROA}$

### $H_1: F_{CARA} \neq F_{COROA}$

---

### **Passo 2** - fixação da significância do teste ($\alpha$)

https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.chi.html
"""

tabela_chi_2[1:3, ]

"""### Obtendo $\chi_{\alpha}^2$"""

# Com a função qchisq temos o valor chi_2 de forma simplificada sem a necessidade de consulta a tabela

chi_2_alpha <- qchisq(confianca, graus_de_liberdade)
chi_2_alpha

"""![Região de Aceitação](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img018.png)

---

### **Passo 3** - cálculo da estatística-teste e verificação desse valor com as áreas de aceitação e rejeição do teste

# $$\chi^2 = \sum_{i=1}^{k}{\frac{(F_{i}^{Obs} - F_{i}^{Esp})^2}{F_{i}^{Esp}}}$$

Onde

$F_{i}^{Obs}$ = frequência observada para o evento $i$

$F_{i}^{Esp}$ = frequência esperada para o evento $i$

$k$ = total de eventos possíveis
"""

chi_2 <- ( (F_Observada[1] - F_Esperada[1]) ** 2 / F_Esperada[1] ) + ( (F_Observada[2] - F_Esperada[2]) ** 2 / F_Esperada[2] )
chi_2

# Com o laço for podemos fazer o sum de n valores para k de forma mais simplificada

chi_2 = 0
for(i in 1:k){
  chi_2 <- chi_2 + (F_Observada[i] - F_Esperada[i]) ** 2 / F_Esperada[i] 
}
chi_2

"""![Estatística-Teste](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img019.png)

---

### **Passo 4** - Aceitação ou rejeição da hipótese nula

<img src='https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img020.png' width=80%>

### <font color='red'>Critério do valor crítico</font>

> ### Rejeitar $H_0$ se $\chi_{teste}^2 > \chi_{\alpha}^2$
"""

chi_2 > chi_2_alpha

"""### <font color='green'>Conclusão: Com um nível de confiança de 95% rejeitamos a hipótese nula ($H_0$) e concluímos que as frequências observadas e esperadas são discrepantes, ou seja, a moeda não é honesta e precisa ser substituída.</font>

### <font color='red'>Critério do valor $p$</font>

> ### Rejeitar $H_0$ se o valor $p\leq\alpha$
"""

chi_2

# Utilizando a função pchisq obtemos o p-value

p_valor <- pchisq(chi_2, df = graus_de_liberdade, lower.tail = F)
p_valor

"""#### <font color=red>Documentações:

- [**chisq.test**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/chisq.test)
"""

chisq.test(x = F_Observada)

# Utilizando a função chisq.test com os parâmetros da frequência observada e das probabilidades de cada evento, obtemos de forma simplificada
# os valores de X-squared e do p-value.

resultado <- chisq.test(x = F_Observada, p = c(0.5, 0.5))
resultado

# Com $statistic isolamos o valor de X-squared

resultado$statistic

# Com $parameter isolamos o valor dos graus de liberdade

resultado$parameter

# Com $p.value isolamos o valor do p.value

p_valor <- resultado$p.value 
p_valor

# Com $observed isolamos o valor das frequências observadas

resultado$observed

# Com $expected isolamos o valor das frequências esperadas

resultado$expected

# Na avaliação observamos que p-value é <= a significancia

p_valor
significancia
p_valor <= significancia

"""## Exercício - 09

Na realização de um teste não paramétrico Qui-quadrado, com apenas 5 graus de liberdade, obteve-se a estatística de teste no valor de 7,45. Qual seria o p-valor para este teste?
"""

graus_de_liberdade_ex09 <- 5
chi_2_ex09 <- 7.45

p_valor_ex09 <- pchisq(chi_2_ex09, df = graus_de_liberdade_ex09, lower.tail = F)
p_valor_ex09

"""## Exercício - 10

Considerando o problema que resolvemos anteriormente, onde o resultado de 60 lançamentos de duas moedas apresentou a seguinte frequência de resultados:

Resultados	Frequências Observadas

2 CARAS	12

1 CARA e 1 COROA	34

2 COROAS	14

Total	60

Considerando um nível de significância de 5%, seria possível dizer que as moedas estão bem equilibradas, ou seja, que apresentam probabilidades iguais de se obter CARA ou COROA?

Selecione a alternativa que apresenta a forma correta de se resolver este problema utilizando a função chisq.test() do R.
"""

chisq.test(x = c(12, 34, 14), p = c(0.25, 0.5, 0.25))

"""---

## <font color='red'>Problema</font>

Um novo tratamento para acabar com o hábito de fumar está sendo empregado em um grupo de **35 pacientes** voluntários. De cada paciente testado foram obtidas as informações de quantidades de cigarros consumidos por dia antes e depois do término do tratamento. Assumindo um **nível de confiança de 95%** é possível concluir que, depois da aplicação do novo tratamento, houve uma mudança no hábito de fumar do grupo de pacientes testado?

## <font color=green>4.2 Teste Wilcoxon</font>
### Comparação de duas populações - amostras dependentes
***

Empregado quando se deseja comparar duas amostras relacionadas, amostras emparelhadas. Pode ser aplicado quando se deseja testar a diferença de duas condições, isto é, quando um mesmo elemento é submetido a duas medidas.

#### <font color=red>Documentações:

- [**aggregate**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/aggregate)
- [**merge**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/merge)
- [**apply**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/apply)
- [**Extremes**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/Extremes)
- [**sum**](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/sum)

### Dados do problema
"""

fumo <- data.frame(
    Antes = c(39, 25, 24, 50, 13, 52, 21, 29, 10, 22, 50, 15, 36, 39, 52, 48, 24, 15, 40, 41, 17, 12, 21, 49, 14, 55, 46, 22, 28, 23, 37, 17, 31, 49, 49),
    Depois = c(16, 8, 12, 0, 14, 16, 13, 12, 19, 17, 17, 2, 15, 10, 20, 13, 0, 4, 16, 18, 16, 16, 9, 9, 18, 4, 17, 0, 11, 14, 0, 19, 2, 9, 6)
)
significancia <- 0.05
confianca <- 1 - significancia
n <- 35

head(fumo)

media_antes <- mean(fumo$Antes)
media_antes

media_depois <- mean(fumo$Depois)
media_depois

"""### **Passo 1** - formulação das hipóteses $H_0$ e $H_1$

#### <font color='red'>Lembre-se, a hipótese nula sempre contém a alegação de igualdade</font>

### $H_0: \mu_{antes} = \mu_{depois}$

### $H_1: \mu_{antes} > \mu_{depois}$

---

### **Passo 2** - escolha da distribuição amostral adequada

### O tamanho da amostra é maior que 30?
#### Resp.: Sim

---

### **Passo 3** - fixação da significância do teste ($\alpha$)

### Obtendo $z_{\alpha/2}$
"""

probabilidade <- (0.5 + (confianca / 2))
probabilidade

z_alpha_2 <- qnorm(probabilidade)
z_alpha_2

"""![Região de Aceitação](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img006.png)

---

### **Passo 4** - cálculo da estatística-teste e verificação desse valor com as áreas de aceitação e rejeição do teste

# $$Z = \frac{T - \mu_T}{\sigma_T}$$

Onde

## $T$ = menor das somas de postos de mesmo sinal

# $$\mu_T = \frac{n(n+1)}{4}$$
# $$\sigma_T = \sqrt{\frac{n(n + 1)(2n + 1)}{24}}$$

### Construindo a tabela com os postos
"""

fumo

# Adicionando uma coluna no df com a diferença entre as duas amostras

fumo['Dif'] <- fumo$Depois - fumo$Antes
fumo

# Criando uma nova coluna com o abs da coluna Dif

fumo['|Dif|'] = abs(fumo$Dif)
fumo

# Ordenando o df segundo a coluna |Dif|

fumo <- fumo[order(fumo$'|Dif|'),]
fumo

# Criando a coluna Posto no df com uma series de 1 até o tamanho da mostra

fumo['Posto'] <- seq(1, nrow(fumo))
fumo

# Criando um novo df com a coluna |Dif| e a coluna Posto que foi modificada para gerar a média de |Dif| em postos iguais
  
posto <- aggregate(x = fumo$'Posto', by = list(fumo$'|Dif|'), FUN = mean)
colnames(posto) <- c('|Dif|', 'Posto')
posto

# Removendo a coluna Posto do df fumo

fumo$Posto <- NULL
fumo

# Fazendo um merge dos df fumo e posto através da coluna |Dif| mantendo todos os valores do df fumo

fumo <- merge(x = fumo, y = posto, by = '|Dif|', all.x = TRUE)
fumo

# Criando a coluna Posto (+), mantendo somente os valores da coluna Posto cuja coluna Dif seja positivo

fumo['Posto (+)'] <- apply(fumo[, c('Dif', 'Posto')], 1, function(x) if(x[1] > 0) x[2] else 0)
fumo

# Criando a coluna Posto (-), mantendo somente os valores da coluna Posto cuja coluna Dif seja negativo

fumo['Posto (-)'] <- apply(fumo[, c('Dif', 'Posto')], 1, function(x) if(x[1] < 0) x[2] else 0)
fumo

# Removendo do df a coluna Posto

fumo$Posto <- NULL
fumo

"""### Obter $T$

## $T$ = menor das somas de postos de mesmo sinal
"""

T <- min( sum( fumo['Posto (+)'] ), sum( fumo['Posto (-)'] ) )
T

"""### Obter $\mu_T$

# $$\mu_T = \frac{n(n+1)}{4}$$

"""

mu_T <- ( n * ( n + 1 ) ) / 4
mu_T

"""### Obter $\sigma_T$

# $$\sigma_T = \sqrt{\frac{n(n + 1)(2n + 1)}{24}}$$
"""

sigma_T <- sqrt( ( n * ( n + 1 ) * ( ( 2 * n ) + 1 ) ) / 24 )
sigma_T

"""### Obter $Z_{teste}$

# $$Z = \frac{T - \mu_T}{\sigma_T}$$
"""

Z <- ( T - mu_T ) / sigma_T
Z

"""![Estatística-Teste](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img021.png)

---

### **Passo 5** - Aceitação ou rejeição da hipótese nula

<img src='https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img022.png' width='80%'>

### <font color='red'>Critério do valor crítico</font>

> ### Rejeitar $H_0$ se $Z \leq -z_{\alpha / 2}$ ou se $Z \geq z_{\alpha / 2}$
"""

Z <= -z_alpha_2

Z >= z_alpha_2

"""### <font color='green'>Conclusão: Rejeitamos a hipótese de que não existe diferença entre os grupos, isto é, existe uma diferença entre as médias de cigarros fumados pelos pacientes antes e depois do tratamento. E como é possível verificar através das médias de cigarros fumados por dia antes (31.86) e depois (11.2) do tratamento, podemos concluir que o tratamento apresentou resultado satisfatório.</font>

## Exercício - 10

Desconfiado da eficiência dos cursos e materiais de estudo on-line da Alura, um professor resolveu realizar um teste com um grupo de 30 alunos de sua classe. Para isso, ele submeteu esses alunos a duas etapas distintas e logo depois de cada etapa, aplicou uma avaliação. Na etapa inicial, foram oferecidas aulas normais, sem a utilização do material de apoio da Alura. Na segunda etapa, também foram oferecidas aulas normais, mas com a utilização do material de apoio da Alura. As notas obtidas pelos alunos nas duas etapas estão no data frame abaixo:

alunos <- data.frame(
    Sem_Alura = c(4, 3, 5, 4, 8, 6, 5, 7, 6, 7, 8, 7, 3, 7, 4, 7, 5, 7, 5, 7, 6, 4, 3, 3, 6, 3, 7, 4, 6, 6),
    Com_Alura = c(8, 6, 10, 3, 9, 5, 8, 5, 4, 10, 5, 9, 8, 5, 10, 8, 7, 9, 9, 5, 5, 7, 8, 9, 8, 5, 5, 8, 5, 9)
)

Selecione a alternativa que apresenta o resultado do teste não paramétrico de Wilcoxon aplicado pelo professor (menor das somas de postos de mesmo sinal T, estatística de teste Z e decisão do teste). Considere um nível de significância de 10%.
"""

alunos_ex10 <- data.frame(
    Sem_Alura = c(4, 3, 5, 4, 8, 6, 5, 7, 6, 7, 8, 7, 3, 7, 4, 7, 5, 7, 5, 7, 6, 4, 3, 3, 6, 3, 7, 4, 6, 6),
    Com_Alura = c(8, 6, 10, 3, 9, 5, 8, 5, 4, 10, 5, 9, 8, 5, 10, 8, 7, 9, 9, 5, 5, 7, 8, 9, 8, 5, 5, 8, 5, 9)
)

head(alunos_ex10)

significancia_ex10 <- 0.1
confianca_ex10 <- 1 - significancia_ex10
n_ex10 <- 30

probabilidade_ex10 <- (0.5 + (confianca_ex10 / 2))
z_alpha_2_ex10 <- qnorm(probabilidade_ex10)

alunos_ex10['Dif'] <- alunos_ex10$Com_Alura - alunos_ex10$Sem_Alura

alunos_ex10['|Dif|'] <- abs(alunos_ex10['Dif'])

alunos_ex10 <- alunos_ex10[order(alunos_ex10$'|Dif|'),]

alunos_ex10['Posto'] <- seq(1, nrow(alunos_ex10))

posto_ex10 <- aggregate(x = alunos_ex10$'Posto', by = list('|Dif|' = alunos_ex10$'|Dif|'), FUN = mean)

colnames(posto_ex10) <- c('|Dif|', 'Posto')

alunos_ex10$Posto <- NULL

alunos_ex10 <- merge(x = alunos_ex10, y = posto_ex10, by = '|Dif|', all.x = TRUE)

alunos_ex10['Posto (+)'] <- apply(alunos_ex10[, c('Dif', 'Posto')], 1, function(x) if(x[1] > 0) x[2] else 0)

alunos_ex10['Posto (-)'] <- apply(alunos_ex10[, c('Dif', 'Posto')], 1, function(x) if(x[1] < 0) x[2] else 0)

alunos_ex10$Posto <- NULL

T_ex10 <- min(sum(alunos_ex10['Posto (+)']), sum(alunos_ex10['Posto (-)']))
T_ex10

sigma_T_ex10 <- sqrt((n_ex10 * (n_ex10 + 1) * ((2 * n_ex10) + 1)) / 24)

mu_T_ex10 <- (n_ex10 * (n_ex10 + 1)) / 4

Z_ex10 <- (T_ex10 - mu_T_ex10) / sigma_T_ex10
Z_ex10

if (Z_ex10 <= -z_alpha_2 || Z >= z_alpha_2) {
    'Rejeitar H0'
} else {
    'Aceitar H0'
}

"""### <font color='red'>Critério do valor $p$</font>

> ### Rejeitar $H_0$ se o valor $p\leq\alpha$

#### <font color=red>Documentações:

- [**wilcox.test**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/wilcox.test)
"""

resultado <- wilcox.test(fumo$Depois, fumo$Antes, paired = T, correct = F)
resultado

# Utilizando a função wilcox.test obtemos de forma direta o p-value para comparação com o valor de alpha=significancia

p_valor <- resultado$p.value
p_valor

p_valor <= significancia

"""## Exercício - 11

Uma fábrica de rações para porcos gostaria de verificar se a adição de um determinado composto químico em um de seus produtos teria um efeito significativo no ganho de peso dos animais. Para isso, selecionou uma amostra de 35 porcos e testou este mesmo grupo em duas situações distintas. No primeiro teste, alimentou os suínos exclusivamente com a ração sem o composto por uma semana e registrou a variação de peso de cada animal do grupo. No segundo teste, alimentou o mesmo grupo de animais com a ração com o novo composto, por mais uma semana, e registrou novamente a variação dos pesos.

Os dados de variação de peso de cada suíno testado estão no data frame abaixo (em gramas):

pesos <- data.frame(
    Sem_Composto = c(180, -39, 325, 303, 127, 149, 271, 163, 287, 255, 398, 324, 335, 421, 
        216, 274, 373, 116, 197, -37, 321, 431, 112, 304, 417, 362, 51, 187, 195, 304, 202, 158, 105, 90, 245),
    Com_Composto = c(484, 187, 442, 108, 488, 283, 286, 419, 240, 266, 198, 130, 484, 424, 
        145, 133, 282, 386, 408, 290, 429, 386, 318, 390, 347, 442, 440, 356, 517, 454, 401, 108, 228, 471, 495)
)

Selecione a alternativa que apresenta o p-valor e a decisão correta do teste de Wilcoxon sobre a diferença entre as médias sem e com o composto na ração. Utilize a função wilcox.test() do R e considere um nível de significância de 5%.
"""

pesos_ex11 <- data.frame(
    Sem_Composto = c(180, -39, 325, 303, 127, 149, 271, 163, 287, 255, 398, 324, 335, 421, 
        216, 274, 373, 116, 197, -37, 321, 431, 112, 304, 417, 362, 51, 187, 195, 304, 202, 158, 105, 90, 245),
    Com_Composto = c(484, 187, 442, 108, 488, 283, 286, 419, 240, 266, 198, 130, 484, 424, 
        145, 133, 282, 386, 408, 290, 429, 386, 318, 390, 347, 442, 440, 356, 517, 454, 401, 108, 228, 471, 495)
)

significancia_ex11 <- 0.05

resultado_ex11 <- wilcox.test(pesos_ex11$Sem_Composto, pesos_ex11$Com_Composto, paired = T, correct = F)
resultado_ex11

p_valor_ex11 <- resultado_ex11$p.value
p_valor_ex11

p_valor_ex11 <= significancia_ex11