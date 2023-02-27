
# <font color=green size=10>CURSO DE ESTATÍSTICA - PARTE 4</font>
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

library(ggplot2)
library(dplyr)

options(repr.plot.width = 7, repr.plot.height = 4)

"""### Lendo o dataset do projeto"""

dados <- read.csv('dados.csv')

head(dados)

"""---

# <font color=green>2 RODANDO UMA REGRESSÃO LINEAR</font>
***

## Dataset de exemplo
> ### $Y$ = Gasto das famílias
> ### $X$ = Renda das Famílias
"""

dataset = data.frame(
    Y = c(3011, 1305, 1879, 2654, 2849, 1068, 2892, 2543, 3074, 849, 2184, 2943, 1357, 2755, 2163, 3099, 1600, 353, 1778, 740, 2129, 3302, 2412, 2683, 2515, 2395, 2292, 1000, 600, 1864, 3027, 1978, 2791, 1982, 900, 1964, 1247, 3067, 700, 1500, 3110, 2644, 1378, 2601, 501, 1292, 2125, 1431, 2260, 1770),
    X = c(9714, 3728, 6062, 8845, 8378, 3338, 8507, 7947, 9915, 1632, 6825, 8918, 4100, 9184, 6180, 9997, 4500, 1069, 5925, 2466, 6083, 9712, 7780, 8383, 7185, 7483, 7640, 2100, 2000, 6012, 8902, 5345, 8210, 5662, 2700, 6546, 2900, 9894, 1500, 5000, 8885, 8813, 3446, 7881, 1164, 3401, 6641, 3329, 6648, 4800)
)

head(dataset)

nrow(dataset)

"""### Estatísticas descritivas"""

summary(dataset)

apply(dataset, 2, sd)

"""### Análise gráfica

#### <font color=red>Documentações:

- [***package* ggplot2**](https://www.rdocumentation.org/packages/ggplot2)
- [**stack**](https://www.rdocumentation.org/packages/utils/versions/3.6.1/topics/stack)
"""

# Com a função stack empilhamos os dados de um df criando uma coluna de index

stack(dataset)

ggplot(stack(dataset), aes(x = ind, y = values)) + 
    stat_boxplot(geom ='errorbar', width = 0.4) + 
    geom_boxplot(fill = c('#3274A1', "orange")) + 
    coord_flip() +
    xlab("Variáveis") + 
    ylab("Reais (R$)") + 
    ggtitle('Box-plot') +
    theme(
        plot.title=element_text(size = 14, hjust = 0.5),
        axis.title.y=element_text(size = 12, vjust = +0.2),
        axis.title.x=element_text(size = 12, vjust = -0.2),
        axis.text.y=element_text(size = 10),
        axis.text.x=element_text(size = 10),
    )

ggplot(data = dataset, aes(x = X, y = Y)) + 
    geom_point(size = 1.5, stroke = 0) + 
    geom_smooth(method = lm) +
    xlab("Renda das Famílias") + 
    ylab("Gasto das Famílias") + 
    ggtitle('Reta de Regressão - Gasto X Renda') +
    theme(
        plot.title=element_text(size = 12, hjust = 0.5),
        axis.title.y=element_text(size = 10, vjust = +0.2),
        axis.title.x=element_text(size = 10, vjust = -0.2),
        axis.text.y=element_text(size = 10),
        axis.text.x=element_text(size = 10),
    )

"""### Análise da correlação

#### <font color=red>Documentações:

- [**cor**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/cor)
"""

cor(dataset)

"""### Modelo de regressão linear simples

#### <font color=red>Documentações:

- [**lm**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/lm)

### Estimando o modelo
"""

resultado_regressao <- lm(formula = Y ~ X, data = dataset)
resultado_regressao

summary(resultado_regressao)

"""### Obtendo as previsões dentro da amostra"""

dataset['Y_previsto'] <- resultado_regressao$fitted.values
dataset

"""---

# <font color=green>3 CORRELAÇÃO</font>
***

## <font color=green>3.1 Covariância</font>
***

A covariância, ou variância conjunta, é a medida do grau de interdependência (ou inter-relação) numérica entre duas variáveis. É definida da seguinte maneira:

### Covariância populacional

# $$\sigma_{xy} = \frac 1n\sum_{i=1}^{n}(X_i-\mu_x)(Y_i-\mu_y)$$

### Covariância amostral

# $$S_{xy} = \frac 1{n-1}\sum_{i=1}^{n}(X_i-\bar{X})(Y_i-\bar{Y})$$

#### <font color=red>Documentações:

- [**sample**](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/sample)
- [**cov**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/cor)

### Gerando uma amostra aleatória para facilitar o entendimento
"""

amostra <- data.frame(
    Idade = c(39, 29, 21, 49, 29, 34, 32, 32, 24, 53, 28, 28, 46, 58, 41, 43, 31, 55, 52, 54),
    Renda = c(1500, 1000, 3500, 1570, 600, 1200, 2000, 500, 1300, 600, 1500, 3000, 0, 550, 1500, 1600, 746, 1000, 0, 1400),
    Anos.de.Estudo = c(6, 7, 12, 13, 9, 12, 12, 6, 7, 5, 7, 16, 12, 3, 12, 9, 1, 6, 1, 6),
    Altura = c(1.6162, 1.7525, 1.6940, 1.8041, 1.7854, 1.7468, 1.6633, 1.6937, 1.6569, 1.6671, 1.6786, 1.6730, 1.7853, 1.6090, 1.7833, 1.6709, 1.6392, 1.6861, 1.7107, 1.7288)
)

"""### Obtendo a matriz de covariância"""

# Com a função cov geramos uma matriz de covariância entre as variáveis de um df que indica a interdependência entre as variáveis.

# matriz_cov <- cov(amostra[c('Idade', 'Renda')])
matriz_cov <- cov(amostra)
matriz_cov

"""### Identificando as variâncias na diagonal principal da matriz"""

var(amostra$Idade)

"""## <font color=green>3.2 Interpretação da Covariância</font>
***

Valor de $S_{xy}$ positivo indica uma associação linear positiva entre x e y, ou seja, à medida que o valor de x aumenta, o valor de y também aumenta. Neste caso, podemos ver na figura abaixo que os pontos que têm a maior influência sobre $S_{xy}$ devem estar nos quadrantes I e III.

Se o valor de $S_{xy}$ for negativo temos um indicativo de associação linear negativa entre x e y, ou seja, à medida que x aumenta, o valor de y diminui. Neste caso, podemos ver na figura abaixo que os pontos que têm a maior influência sobre $S_{xy}$ devem estar nos quadrantes II e IV.

Finalmente, se os pontos estiverem uniformemente distribuídos pelos quadrantes, o valor de $S_{xy}$ se aproximará de zero, indicando que não existe nenhuma associação linear entre x e y.

<img src="https://caelum-online-public.s3.amazonaws.com/1273-estatistica-parte4/01/img026.png" width=50%>

### Verificando a existência de uma associação linear negativa
"""

grafico <- amostra[, c('Renda', 'Idade')]

ggplot(data = grafico, aes(x = Renda, y = Idade)) + 
    geom_point(size = 1.5, stroke = 0) + 
    geom_hline(yintercept = mean(amostra$Idade), color = 'black') + 
    geom_vline(xintercept = mean(amostra$Renda), color = 'black')

"""### Verificando a existência de uma associação linear positiva"""

grafico <- amostra[, c('Renda', 'Anos.de.Estudo')]

ggplot(data = grafico, aes(x = Renda, y = Anos.de.Estudo)) + 
    geom_point(size = 1.5, stroke = 0) + 
    geom_hline(yintercept = mean(amostra$'Anos.de.Estudo'), color = 'black') + 
    geom_vline(xintercept = mean(amostra$Renda), color = 'black')

"""### Verificando a inexistência de uma associação linear entre as variáveis"""

grafico <- amostra[, c('Idade', 'Altura')]

ggplot(data = grafico, aes(x = Idade, y = Altura)) + 
    geom_point(size = 1.5, stroke = 0) + 
    geom_hline(yintercept = mean(amostra$Altura), color = 'black') + 
    geom_vline(xintercept = mean(amostra$Idade), color = 'black')

"""### <font color='red'>Observação Importante:</font>
> Pelo que foi apresentado pode parecer que valores elevados, tanto positivos quanto negativos, para a covariância indicam relações lineares fortes entre as variáveis envolvidas. No entanto, um problema quando se usa a covariância como uma medida da intensidade da relação linear é que o valor da covariância depende das unidades de medida para x e y.
> 
> Uma medida da relação entre duas variáveis que não é afetada pelas unidades de medida para x e y é o coeficiente de correlação que veremos no próximo tópico.

## <font color=green>3.3 Coeficiente de correlação de Pearson</font>
***

É obtido dividindo-se a covariância da população ou amostra pelo produto do desvio padrão populacional ou amostral de x pelo desvio padrão populacional ou amostral de y.

O coeficiente de correlação varia de -1 a +1. Valores que se aproximam de -1 ou +1 indicam uma relação linear forte. Quanto mais próxima a correlação estiver de zero, mais fraca será a relação.

Um ponto importante é que o coeficiente de correlação é uma medida de associação linear e não necessariamente de causação. Uma correlação alta entre duas variáveis não significa, necessariamente, que variações em uma delas provocará alterações na outra.

### Coeficiente de correlação de Pearson - dados populacionais

# $$\rho_{xy} = \frac{\sigma_{xy}}{\sigma_{x}\sigma_{y}}$$

### Coeficiente de correlação de Pearson - dados amostrais

# $$r_{xy} = \frac{s_{xy}}{s_{x}s_{y}}$$

Onde

$\sigma_{xy}$ = covariância populacional entre x e y

$s_{xy}$ = covariância amostral entre x e y

$\sigma_{x}$ e $\sigma_{y}$ = desvios padrão populacionais de x e y, respectivamente

$s_{x}$ e $s_{y}$ = desvios padrão amostrais de x e y, respectivamente

### Obtendo $s_{xy}$
"""

s_xy <- cov(amostra[c('Altura', 'Renda')])
s_xy

s_xy <- s_xy['Altura', 'Renda']
s_xy

"""### Obtendo $s_x$ e $s_y$"""

s_x <- sd(amostra$Altura) 
s_y <- sd(amostra$Renda)

"""### Obtendo o coeficiente de correlação $r_{xy}$"""

# Com a função da correlação de Pearson chegamos ao nível de intensidade de correção entre as duas variáveis.
# Sendo um valor muito próximo de zero indica uma correlação fraca entre as mesmas.

r_xy <- s_xy / (s_x * s_y)
r_xy

"""### Obtendo uma matriz de correlação"""

# O mesmo valor pode ser obtido utilizando a função cor que gera a matriz de correlação entre as duas variáveis.

cor(amostra[c('Altura', 'Renda')])

# Utilizando a função cor observamos uma forte correlação entre as variáveis Y = Gastos das familias com X = Renda

cor(dataset[c('Y', 'X')])

# Plotando o gráfico da correlação observamos uma leve correlação entre Renda e Altura.

grafico <- amostra[, c('Renda', 'Altura')]

ggplot(data = grafico, aes(x = Renda, y = Altura)) + 
    geom_point(size = 1.5, stroke = 0) + 
    geom_hline(yintercept = mean(amostra$Altura), color = 'black') + 
    geom_vline(xintercept = mean(amostra$Renda), color = 'black')

# No gráfico de Gastos x Renda temos bem marcada a correlação forte entre as duas variáveis.

ggplot(data = dataset, aes(x = X, y = Y)) + 
    geom_point(size = 1.5, stroke = 0) + 
    geom_hline(yintercept = mean(dataset$Y), color = 'black') + 
    geom_vline(xintercept = mean(dataset$X), color = 'black')

"""---

# <font color=green>4 REGRESSÃO LINEAR</font>
***

A análise de regressão diz respeito ao estudo da dependência de uma variável (a variável dependente) em relação a uma ou mais variáveis, as variáveis explicativas ou independentes, visando estimar e/ou prever o valor médio da primeira em termos dos valores conhecidos ou fixados das segundas.

#### Terminologia

> A variável que é prevista é conhecida como variável dependente (*Y*).

> A variável utilizada para prever o valor da variável dependente é conhecida como variável independente (*X*).

Em nosso treinamento vamos abordar o tipo mais simples de análise de regressão que considera uma variável dependente e apenas uma variável independente onde a relação entre as variáveis se aproxima de uma linha reta.

## <font color=green>4.1 Regressão linear simples</font>
***

### Função consumo

Um economista famoso do passado concluiu em um de seus estudos que os indivíduos tendem a aumentar o seu consumo conforme sua renda aumenta. Logicamente esta teoria ganhou um pouco mais de complexidade, mas vamos utilizar sua forma mais simples para entender o procedimento de análise de regressão com a seguninte formulação:

# $$Y_i = \beta_1 + \beta_2X_i$$

Onde

- $Y_i$ é o gasto das famílias ou consumo das famílias

- $X_i$ é a renda disponível

- $\beta_1$ é conhecido como intercepto (no modelo teórico acima é conhecido como consumo autônomo, ou seja, o consumo quando o rendimento é zero)

- $\beta_2$ é o coefiente angular (no modelo teórico é a propensão marginal a consumir)

Em uma análise de regressão linear simples, o interesse está em estimar a função de regressão populacional como a apresentada acima, ou seja, estimar os valores dos parâmetros $\beta_1$ e $\beta_2$ com base nas observações de $Y$ e $X$.

### Carregando o dataset
"""

dataset <- data.frame(
    Y = c(3011, 1305, 1879, 2654, 2849, 1068, 2892, 2543, 3074, 849, 2184, 2943, 1357, 2755, 2163, 3099, 1600, 353, 1778, 740, 2129, 3302, 2412, 2683, 2515, 2395, 2292, 1000, 600, 1864, 3027, 1978, 2791, 1982, 900, 1964, 1247, 3067, 700, 1500, 3110, 2644, 1378, 2601, 501, 1292, 2125, 1431, 2260, 1770),
    X = c(9714, 3728, 6062, 8845, 8378, 3338, 8507, 7947, 9915, 1632, 6825, 8918, 4100, 9184, 6180, 9997, 4500, 1069, 5925, 2466, 6083, 9712, 7780, 8383, 7185, 7483, 7640, 2100, 2000, 6012, 8902, 5345, 8210, 5662, 2700, 6546, 2900, 9894, 1500, 5000, 8885, 8813, 3446, 7881, 1164, 3401, 6641, 3329, 6648, 4800)
)

head(dataset)

"""### Identificando a relação entre as variáveis

Plota a reta de regressão entre duas variáveis juntamente com a dispersão entre elas.
"""

ggplot(data = dataset, aes(x = X, y = Y)) + 
    geom_point(size = 1.5, stroke = 0) + 
    geom_smooth(method = lm) +
    xlab("Renda das Famílias") + 
    ylab("Gasto das Famílias") + 
    ggtitle('Reta de Regressão - Gasto X Renda') +
    theme(
        plot.title=element_text(size = 12, hjust = 0.5),
        axis.title.y=element_text(size = 10, vjust = +0.2),
        axis.title.x=element_text(size = 10, vjust = -0.2),
        axis.text.y=element_text(size = 10),
        axis.text.x=element_text(size = 10),
    )

"""### Matriz de correlação"""

cor(dataset)

"""### Função de regressão populacional

A equação formulada acima é conhecida como **função de regressão populacional (FRP)** e em alguns livros é também representada da seguinte forma:

# $$E(Y|X_i) = \beta_1 + \beta_2X_i$$

Ela afirma que o valor esperado da distribuição de $Y$, dado $X_i$, tem uma relação funcional com $X_i$, isto é, a resposta média de $Y$ varia com $X$. Os coeficientes $\beta_1$ e $\beta_2$ são conhecidos como coeficientes de regressão e também como intercepto e coeficiente angular, respectivamente.

<img src="https://caelum-online-public.s3.amazonaws.com/1273-estatistica-parte4/01/img027.png" width=50%>

O gráfico de dispersão mais abaixo deixa claro que com o aumento da renda familiar, em média, as despesas de consumo das famílias aumentam, mas não no mesmo nível. O que podemos dizer é que para um nível de renda $X_i$ as despesas médias de consumo de uma
família agrupam-se em torno do consumo médio de todas as famílias deste nível $X_i$, isto é, em torno de sua esperança condicional $E(Y|X_i)$. Portanto, podemos expressar o desvio individual de $Y_i$ em torno de seu valor esperado da seguinte forma:

# $$u_i = Y_i - E(Y|X_i)$$

ou

# $$Y_i = E(Y|X_i) + u_i$$

onde o desvio $u_i$ é uma variável aleatória não-observável que assume valores positivos ou negativos. Esta variável é também conhecida como termo de erro estocástico.

Observe que a partir da elaboração acima podemos representar a FRP em sua forma estocástica da seguinte maneira:

# $$Y_i = \beta_1 + \beta_2X_i + u_i$$

## <font color=green>4.2 O método de mínimos quadrados</font>
***

Considere a seguinte **função de regressão da população (FRP)** para duas variáveis:

# $$Y_i = \beta_1 + \beta_2X_i + u_i$$

Como a **FRP** não pode ser obtida de forma direta, precisamos estimá-la através da **função de regressão amostral (FRA)**.

# $$Y_i = \hat{\beta}_1 + \hat{\beta}_2X_i + \hat{u}_i$$
# $$Y_i = \hat{Y}_i + \hat{u}_i$$

onde $\hat{Y}_i$ é o valor estimado de $Y_i$.

A partir da equação acima podemos expressar o erro da seguinte maneira:

# $$\hat{u}_i = Y_i - \hat{Y}_i$$
# $$\hat{u}_i = Y_i - \hat{\beta}_1 - \hat{\beta}_2X_i$$

A ideia é determinar **FRA** de forma que fique o mais próximo possível do valor observado de $Y$. Intuitivamente uma forma interessante de fazer isso seria determinar **FRA** de maneira que a soma dos resíduos seja a menor possível.

# $$\sum\hat{u}_i = \sum{(Y_i - \hat{Y}_i)}$$

Avaliando a figura abaixo se pode verificar que talvez o critério de minimizar a soma dos resíduos não seja a melhor abordagem para solucionar o problema.

<img src="https://caelum-online-public.s3.amazonaws.com/1273-estatistica-parte4/01/img015.png" width=50%>

O critério de minimização da soma dos resíduos assume que todos os resíduos têm o mesmo peso no somatório, o que nem sempre se comprova. Em nosso exemplo os resíduos $\hat{u}_1$ e $\hat{u}_4$ encontram-se bem mais afastados da **FRA** que $\hat{u}_2$ e $\hat{u}_3$. Isso acarreta na possibilidade de que a soma dos $\hat{u}_i$'s seja bastante pequena e até mesmo nula, mesmo que os resíduos estejam muito dispersos em relação a reta de regressão.

Para evitar tal problema adotou-se o critério de minimização da soma dos quadrados dos resíduos que é conhecido como **Método de Mínimos Quadrados**.

# $$\sum\hat{u}_i^2 = \sum{(Y_i - \hat{Y}_i)^2}$$
# $$\sum\hat{u}_i^2 = \sum{(Y_i - \hat{\beta}_1 - \hat{\beta}_2X_i)^2}$$

Após um procedimento de diferenciação, algumas simplificações e manipulações algébricas obtemos os **estimadores de mínimos quadrados**.

# $$
\begin{equation}
\boxed{\hat{\beta}_2 = \frac{n\sum{X_iY_i} - \sum{X_i}\sum{Y_i}}{n\sum{X_i^2} - (\sum{X_i})^2}}
\end{equation}
$$

# $$
\begin{equation}
\boxed{
\begin{eqnarray}
\hat{\beta}_1 &=& \frac{\sum{X_i^2}\sum{Y_i} - \sum{X_i}\sum{X_iY_i}}{n\sum{X_i^2} - (\sum{X_i})^2}\\
&=& \bar{Y} - \hat{\beta}_2\bar{X}
\end{eqnarray}
}
\end{equation}
$$

## <font color=green>4.3 Estimadores de mínimos quadrados ordinários</font>
***

### Obter $n$
"""

n <- nrow(dataset)
n

"""### Obter $\sum{Y}$"""

SOMA_Y <- sum(dataset$Y)
SOMA_Y

"""### Obter $\sum{X}$"""

SOMA_X <- sum(dataset$X)
SOMA_X

"""### Obter $\sum{X^2}$"""

dataset$X2 <- dataset$X ** 2

# Obtendo a soma de x^2 com a adição de uma coluna no df.

SOMA_X2 <- sum(dataset$X2) 
SOMA_X2

# Obtendo a soma de x^2 sem a adição de uma coluna no df.

SOMA_X2 <- sum(apply(dataset, 1, function(x) x['X'] ** 2)) 
SOMA_X2

# Removendo a coluna criada para se obter o x^2.

dataset$X2 <- NULL
dataset

"""### Obter $\sum{Y^2}$"""

# Obtendo soma de y^2 através de uma função inserida dentro de um apply e do sum.

SOMA_Y2 <- sum(apply(dataset, 1, function(x) x['Y'] ** 2)) 
SOMA_Y2

"""### Obter $\sum{XY}$"""

# Obtendo soma de x^2 através de uma função inserida dentro de um apply e do sum.

SOMA_XY <- sum(apply(dataset, 1, function(x) x['Y'] * x['X'])) 
SOMA_XY

"""### Obter $\hat{\beta}_2$

# $$\hat{\beta}_2 = \frac{n\sum{X_iY_i} - \sum{X_i}\sum{Y_i}}{n\sum{X_i^2} - (\sum{X_i})^2}$$
"""

# Calculando o valor de beta_2.

numerador <- n * SOMA_XY - SOMA_X * SOMA_Y
denominador <- n * SOMA_X2 - (SOMA_X) ** 2

beta_2 <- numerador / denominador
beta_2

"""### Obter $\hat{\beta}_1$

# $$
\begin{eqnarray}
\hat{\beta}_1 &=& \frac{\sum{X_i^2}\sum{Y_i} - \sum{X_i}\sum{X_iY_i}}{n\sum{X_i^2} - (\sum{X_i})^2}\\
&=& \bar{Y} - \hat{\beta}_2\bar{X}
\end{eqnarray}
$$ 
"""

# Calculando o valor de beta_1.

beta_1 <- mean(dataset$Y) - beta_2 * mean(dataset$X)
beta_1

"""### Exercício - 01

Com base nas informações abaixo:

<img src="https://caelum-online-public.s3.amazonaws.com/1567-estatistica-r-parte-4/03/image16.png" width=7%>
<p/>
<img src="https://caelum-online-public.s3.amazonaws.com/1567-estatistica-r-parte-4/03/image17.png" width=15%>
<p/>
<img src="https://caelum-online-public.s3.amazonaws.com/1567-estatistica-r-parte-4/03/image18.png" width=10%>
<p/>
<img src="https://caelum-online-public.s3.amazonaws.com/1567-estatistica-r-parte-4/03/image19.png" width=10%>
<p/>
<img src="https://caelum-online-public.s3.amazonaws.com/1567-estatistica-r-parte-4/03/image20.png" width=10%>

Obtenha uma estimativa para o parâmetro β2 de um modelo de regressão linear simples.
"""

n_ex01 = 200
SOMA_XY_ex01 = 5372394
SOMA_X_ex01 = 13422
SOMA_Y_ex01 = 80831
SOMA_X2_ex01 = 1109828

numerador_ex01 <- n_ex01 * SOMA_XY_ex01 - SOMA_X_ex01 * SOMA_Y_ex01
denominador_ex01 <- n_ex01 * SOMA_X2_ex01 - (SOMA_X_ex01) ** 2

beta_2_ex01 <- numerador_ex01 / denominador_ex01
beta_2_ex01

"""### Obtendo a estimativa dos parâmetros

#### <font color=red>Documentações:

- [**lm**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/lm)
"""

# Através da função lm obtemos de forma simplificada e rápida os valores de beta_1 = intercept e do beta_2 = x.

resultado_regressao <- lm(formula = Y ~ X, data = dataset)
resultado_regressao

"""### Visualizando os parâmetros estimados"""

beta_1

beta_2

# Com a função coefficients separamos os valores de beta obtidos na função lm.

coefficients(resultado_regressao)

# A função summary pode ser utilizada junto a lm para se obter os dados gerais da comparação.

resumo <- summary(resultado_regressao)
resumo

# Com o comando $coefficients obtemos um df com os valores gerais de comparação obtidos através do summary + lm.

resumo$coefficients

"""### Exercício - 02

Considere o seguinte conjunto de dados:

![ex_02_imagem.png](data:image/png;base64,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)

Temos o número de domicílios que possuem computador (Y) e a renda total recebida por pessoas de 10 anos ou mais (X) em cada um dos estados brasileiros.

Acredita-se que a posse de computadores tenha uma relação linear com a renda das famílias e, para comprovar isso, podemos estimar uma regressão linear com os dados acima e avaliar os resultados obtidos.

Neste problema, precisamos, inicialmente, obter as estimativas dos parâmetros de regressão.

**Informações extras:**

O valor da renda está dividido por 1.000.000, isto é, se um estado tem uma renda total de R$ 4,2, significa que ele tem uma renda total de R$ 4.200.000.

Utilize a função lm(), do R, para obter os parâmetros.

Segue o dataset, em formato de data frame, para facilitar a solução do problema:
"""

dataset_ex02 <- data.frame(
    Y = c(670, 220, 1202, 188, 1869, 248, 477, 1294, 816, 2671, 
            1403, 1586, 3468, 973, 701, 5310, 10950, 2008, 9574, 
            28863, 6466, 4274, 6432, 1326, 1423, 3211, 2140),
    X = c(1.59, 0.56, 2.68, 0.47, 5.2, 0.58, 1.32, 3.88, 2.11, 
            5.53, 2.6, 2.94, 6.62, 1.91, 1.48, 10.64, 22.39, 4.2, 
            21.9, 59.66, 14.22, 9.57, 14.67, 3.28, 3.49, 6.94, 6.25)
)

"""Assinale a alternativa que apresenta as estimativas dos parâmetros de regressão."""

resultado_regressao_ex02 <- lm(formula = Y ~ X, data = dataset_ex02)
coefficients(resultado_regressao_ex02)

resultado_regressao_ex02 <- lm(formula = Y ~ X, data = dataset_ex02)
resumo_ex02 <- summary(resultado_regressao_ex02)
resumo_ex02$coefficients

resultado_regressao_ex02 <- lm(formula = Y ~ X, data = dataset_ex02)
resumo_ex02 <- summary(resultado_regressao_ex02)
coefficients(resumo_ex02)

"""## <font color=green>4.4 Obtendo previsões</font>
***

# $$\hat{Y}_i = 207,9033 + 0,2973X_i$$

### Previsões dentro da amostra
"""

# Obtendo os valores previstos de Y com beta_1, beta_2 e X.

dataset['Y_previsto'] <- beta_1 + beta_2 * dataset$X
head(dataset, 10)

"""### Utilizando a função do R"""

# Utilizando o comando $fitted.values no resultado da regressão, obtemos de forma direta os valores previstos para Y.

dataset['Y_previsto_R'] <- resultado_regressao$fitted.values
head(dataset, 10)

# Removendo uma das colunas previstas de Y.

dataset$Y_previsto_R <- NULL
head(dataset, 10)

"""### Estimando o 'Gasto das Famílias' fora da amostra"""

# Função criada para previsões de Y.

prever <- function(x){
  return(beta_1 + beta_2 * x)
}

prever(7510)

"""### Estimando o 'Gasto das Famílias' fora da amostra com a função do R"""

# Passando a função predict os valores do resultado da regressão e um df com os valores X temos os valores previstos para Y.

predict(resultado_regressao, data.frame(X = 7510))

predict(resultado_regressao, data.frame(X = c(7510, 7550)))

"""### Exercício - 03

Considerando os dados dos problemas anteriores, onde se acredita que a posse de computadores tenha uma relação linear com a renda das famílias, após estimarmos o modelo, suponha que seja criado um estado e que este apresente uma renda total de R$ 4.350.000. Agora, queremos a previsão (valor arredondado) para o número de domicílios que possuem computador neste novo estado da federação.

**Informações extras:**

O valor da renda está dividido por 1.000.000, isto é, se um estado tem uma renda total de R$ 4,2, significa que ele tem uma renda total de R$ 4.200.000.

Segue o dataset, em formato de data frame, para facilitar a solução do problema:
"""

dataset_ex03 <- data.frame(
    Y = c(670, 220, 1202, 188, 1869, 248, 477, 1294, 816, 
        2671, 1403, 1586, 3468, 973, 701, 5310, 10950, 2008, 
        9574, 28863, 6466, 4274, 6432, 1326, 1423, 3211, 2140),
    X = c(1.59, 0.56, 2.68, 0.47, 5.2, 0.58, 1.32, 3.88, 2.11, 
        5.53, 2.6, 2.94, 6.62, 1.91, 1.48, 10.64, 22.39, 4.2, 
        21.9, 59.66, 14.22, 9.57, 14.67, 3.28, 3.49, 6.94, 6.25)
)

"""*  Y é o número de domicílios que possuem computador
*  X é a renda total recebida por pessoas de 10 anos ou mais, em cada um dos estados brasileiros

Assinale a alternativa que apresenta a previsão (valor arredondado) para o número de domicílios que possuem computador no novo estado da federação.
"""

resultado_regressao_ex03 <- lm(formula = Y ~ X, data = dataset_ex03)
predict(resultado_regressao_ex03, data.frame(X = 4.35))

"""## <font color=green>4.5 Resíduos</font>
***

Como vimos anteriormente, o resíduo da i-ésima observação é a diferença entre o valor observado de nossa variável dependente ($Y_i$) e o valor estimado da variável dependente ($\hat{Y}_i$).

# $$\hat{u}_i = Y_i - \hat{Y}_i$$

Em outras palavras, $\hat{u}_i$ é o erro obtido ao se utilizar a equação de regressão estimada para prever o valor da variável dependente.
"""

# Obtendo os valores de u para o dataset.

dataset['u'] <- dataset$Y - dataset$Y_previsto
head(dataset)

# Obtendo os valores de u para o dataset, utilizando o resultado da regressão mais o comando $residuals.

dataset['Residuos'] <- resultado_regressao$residuals
head(dataset)

# Removendo uma das colunas de u.

dataset$u <- NULL
head(dataset)

# Validando se a média da variável u é próxima ou igual a 0.

mean(dataset$Residuos)

"""## <font color=green>4.6 Suposições sobre o termo de erro $u$</font>
***

### 1. O termo de erro $u$ é uma variável aleatória com média igual a zero: $E(u) = 0$
### 2. A variância de $u$ é a mesma para todos os valores de $X$
### 3. Os valores de $u$ são independentes
### 4. O termo de erro $u$ é uma variável aleatória normalmente distribuída.

### Plotando os resíduos do modelo

#### <font color=red>Documentações:

- [**scatterplot**](https://seaborn.pydata.org/generated/seaborn.scatterplot.html)
"""

# No gráfico podemos observar que não existe uma tência de comportamento na distribuição dos erros u, o que é esperado.

ggplot(data = dataset, aes(x = X, y = Residuos)) + 
    geom_hline(yintercept = 0, color = 'black') +
    geom_point(size = 1.5, stroke = 0) + 
    xlab("X") + 
    ylab("Resíduos") + 
    ggtitle('Resíduos vs Variável Independente') +
    theme(
        plot.title=element_text(size = 12, hjust = 0.5),
        axis.title.y=element_text(size = 10, vjust = +0.2),
        axis.title.x=element_text(size = 10, vjust = -0.2),
        axis.text.y=element_text(size = 10),
        axis.text.x=element_text(size = 10),
    )

# O mesmo comportamento de dispersão ocorre no confronto dos residuos u com o y_previsto.

ggplot(data = dataset, aes(x = Y_previsto, y = Residuos)) + 
    geom_hline(yintercept = 0, color = 'black') +
    geom_point(size = 1.5, stroke = 0) + 
    xlab("Y_Previsto") + 
    ylab("Resíduos") + 
    ggtitle('Resíduos vs Y_Previsto') +
    theme(
        plot.title=element_text(size = 12, hjust = 0.5),
        axis.title.y=element_text(size = 10, vjust = +0.2),
        axis.title.x=element_text(size = 10, vjust = -0.2),
        axis.text.y=element_text(size = 10),
        axis.text.x=element_text(size = 10),
    )

"""### Hipótese de variância constante

<img src="https://caelum-online-public.s3.amazonaws.com/1273-estatistica-parte4/01/img028.jpg" width=80%>
Fonte: Econometria Básica - 5ª edição - Gujarati e Porter
"""

# Na distribuição dos residuos^2 é esperado um gráfico que haja heterocedasticidade, que é o que visualmente ocorre com u encontrado.

ggplot(data = dataset, aes(x = Y_previsto, y = Residuos^2)) + 
    geom_point(size = 1.5, stroke = 0) + 
    xlab("Y_Previsto") + 
    ylab("Resíduos²") + 
    ggtitle('Resíduos² vs Y_Previsto') +
    theme(
        plot.title=element_text(size = 12, hjust = 0.5),
        axis.title.y=element_text(size = 10, vjust = +0.2),
        axis.title.x=element_text(size = 10, vjust = -0.2),
        axis.text.y=element_text(size = 10),
        axis.text.x=element_text(size = 10),
    )

"""## <font color=green>4.7 O coeficiente de determinação $R^2$</font>
***

O **coeficiente de determinação R²** é uma medida resumida que diz quanto a linha de regressão amostral se ajusta aos dados. Pode ser obtido a partir da seguinte fórmula:

# $$R^2 = \frac{\big[\sum{(Y_i - \bar{Y})(\hat{Y}_i - \bar{Y})}\big]^2}{\sum{(Y_i - \bar{Y}})^2 \sum{(\hat{Y}_i - \bar{Y}})^2}$$

Sabemos que o i-ésimo resíduo representa o erro de usarmos $\hat{Y}_i$ para estimar $Y_i$. A soma dos quadrados desses resíduos é o valor que é minimizado pelo método dos mínimos quadrados. Esse valor pode ser representado da seguinte forma:

# $$SQE = \sum{(Y_i - \hat{Y}_i)^2}$$

O valor da SQE é uma medida do erro de se usar a equação de regressão estimada para estimar os valores da variável dependente na amostra.

Outro componente que podemos medir é a soma dos quadrados total (SQT) que representa a medida do erro envolvido no uso da média ($\bar{Y}$) para fazer as estimativas. A SQT pode ser representada da forma abaixo:

# $$SQT = \sum{(Y_i - \bar{Y})^2}$$

Para quantificar o quanto os valores estimados ($\hat{Y}_i$) se afastam da média ($\bar{Y}$) podemos obter mais uma soma de quadrados. Essa soma é chamada de soma dos quadrados da regressão (SQR) e é representada pela seguinte fórmula:

# $$SQR = \sum{(\hat{Y}_i - \bar{Y})^2}$$

### Soma do quadrados do erros (SQE)
"""

head(dataset)

# Obtendo o resultado da soma dos residuos^2.

SQE <- sum(apply(dataset, 1, function(x) x['Residuos'] ** 2))
SQE

"""### Soma do quadrados total (SQT)"""

# Obtendo a soma de (Y_observado - Média_de_Y)^2.

SQT <- sum(apply(dataset, 1, function(x) (x['Y'] - mean(dataset$Y)) ** 2))
SQT

"""### Soma do quadrados da regressão (SQR)"""

# Obtendo a soma de (Y_previsto - Média_de_Y)^2.

SQR <- sum(apply(dataset, 1, function(x) (x['Y_previsto'] - mean(dataset$Y)) ** 2))
SQR

"""### ANOVA

#### <font color=red>Documentações:

- [**anova**](https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/anova)
"""

# Com a função anova obtemos de forma direta os valores de SQR=sum_sq_X e SQE=sum_sq_residuals.

anova <- anova(resultado_regressao)
anova

# Selecionando SQR.

anova[1, 2]

# Selecionando SQE.

anova[2, 2]

# Obtendo SQT.

anova[1, 2] + anova[2, 2]

"""### Relação entre as somas de quadrados

# $$SQT = SQR + SQE$$

Onde,


### $SQE = \sum{(Y_i - \hat{Y}_i)^2}$

### $SQT = \sum{(Y_i - \bar{Y})^2}$

### $SQR = \sum{(\hat{Y}_i - \bar{Y})^2}$


<img src="https://caelum-online-public.s3.amazonaws.com/1273-estatistica-parte4/01/img029.png" width=50%>

### Coeficiente de determinação (R²)

A regressão estimada teria um ajuste perfeito se todos os valores da variável dependente ($Y_i$) estiverem sobre a reta de regressão estimada. Quando isso ocorre temos $Y_i - \hat{Y}_i = 0$ para todas as observações, o que resulta em uma $SQE = 0$. Como $SQT=SQR+SQE$, é possível deduzir que para termos um ajuste perfeito $SQT$ deve ser igual a $SQR$ e a razão entre estas medidas ($\frac{SQR}{SQT}$) deve ser igual a 1.

Quando o ajuste não é tão perfeito nota-se que a $SQE$ apresenta valores maiores o que faz a razão $\frac{SQR}{SQT}$ diminuir, e em uma situação de total imperfeição do ajuste teríamos uma $SQR=0$ e $SQE=SQT$ levando a $\frac{SQR}{SQT}=0$.

A razão $\frac{SQR}{SQT}$, que assume valores entre 0 e 1, é utilizada como medida de eficiência do ajuste da equação de regressão estimada. Essa medida é conhecida como coeficiente de determinação (R²).

# $$R^2 = \frac{SQR}{SQT}$$

## <font color='red'>Observação</font>
> Somente com a utilização do R² não é possível tirar conclusões sobre a relação entre $Y$ e $X$ ser ou não ser estatisticamente
significativa. Este tipo de afirmação deve basear-se em considerações que envolvem o tamanho da amostra e as propriedades da distribuição amostral dos estimadores mínimos quadrados.
"""

# Obtendo o valor de R2.
# Sendo um valor muito próximo a 1, entendemos que os resíduos são suficientes para uma boa previsão do valor Y em função de X.

R2 <- SQR / SQT
R2

# Passando a função summary o valor de resultado da regressao podemos ter acesso ao valor de R2 de forma direta.

resumo <- summary(resultado_regressao)
resumo

# Selecionando o valor de R2 dentro do summary.

resumo$r.squared

"""### Exercício - 04

Considere os dados do problema proposto em exercícios anteriores, onde se acredita que a posse de computadores tenha uma relação linear com a renda das famílias.

**Informações extras:**

O valor da renda está dividido por 1.000.000, isto é, se um estado tem uma renda total de R$ 4,2, significa que ele tem uma renda total de R$ 4.200.000.

Segue o dataset, em formato de data frame, para facilitar a solução do problema:
"""

dataset_ex04 <- data.frame(
    Y = c(670, 220, 1202, 188, 1869, 248, 477, 1294, 816, 
        2671, 1403, 1586, 3468, 973, 701, 5310, 10950, 2008, 
        9574, 28863, 6466, 4274, 6432, 1326, 1423, 3211, 2140),
    X = c(1.59, 0.56, 2.68, 0.47, 5.2, 0.58, 1.32, 3.88, 2.11, 
        5.53, 2.6, 2.94, 6.62, 1.91, 1.48, 10.64, 22.39, 4.2, 
        21.9, 59.66, 14.22, 9.57, 14.67, 3.28, 3.49, 6.94, 6.25)
)

"""*   Y é o número de domicílios que possuem computador
*   X é a renda total recebida por pessoas de 10 anos ou mais, em cada um dos estados brasileiros

Assinale a alternativa que apresenta o valor do R² obtido da nossa regressão linear.
"""

resultado_regressao_ex04 <- lm(formula = Y ~ X, data = dataset_ex04)
resultado_regressao_ex04

resumo_ex04 <- summary(resultado_regressao_ex04)
resumo_ex04$r.squared

"""### Exercício - 05

Considere as duas informações abaixo:

<img src="https://caelum-online-public.s3.amazonaws.com/1567-estatistica-r-parte-4/04/image26.png" width=20%>

Assinale a alternativa que mostra o valor da soma dos quadrados dos erros (SQE).
"""

R2_ex05 <- 0.96
SQR_ex05 <- 1325485

SQE_ex05 <- (SQR_ex05 / R2_ex05) - SQR_ex05
SQE_ex05

"""## <font color=green>4.8 Testes aplicados a modelos de regressão</font>
***

Como vimos, em uma regressão linear simples, a média da variável dependente ($Y$) é uma função linear da variável independente ($X$):

# $$Y_i = \beta_1 + \beta_2X_i$$

Se o valor de $\beta_2$ for zero podemos verificar que o valor médio de $Y$ não depende do valor de $X$ e, portanto, concluímos que $X$ e $Y$ não estão linearmente relacionados. De forma alternativa, se o valor de $\beta_2$ não for igual a zero, concluímos que as duas variáveis estão relacionadas.

Para testar se a relação de regressão é significativa, é preciso realizar um **teste de hipóteses** para determinar se o valor de $\beta_2$ é zero. Antes de realizar este tipo de teste precisamos obter uma estimativa para $\sigma^2$ (variância do erro).

### Output do modelo de regressão estimado
"""

resumo

anova

"""### Erro quadrático médio - estimativa de $\sigma^2$

Lembre-se que a **soma dos quadrados do erros (SQE)** é uma medida numérica da variabilidade dos dados observados em torno da reta de regressão estimada. Todas as somas de quadrados, estudadas anteriormente, estão associadas a um determinado número de graus de liberdade. No caso da SQE, como devem ser estimados dois parâmetros, temos $n-2$ graus de liberdade.

O **erro quadrático médio**, representado pela equação abaixo, pode ser obtido dividindo-se a SQE por $n-2$ graus de liberdade.

# $$EQM = \frac{SQE}{n-2}$$
"""

SQE

n

# Obtendo o EQM através de sua função.

EQM <- SQE / (n - 2)
EQM

# Obtendo o EQM através de uma consulta ao df gerado através da função anova.

EQM <- anova$'Mean Sq'[2]
EQM

# Obtendo o EQM através de uma consulta ao df gerado através da função anova.

EQM <- anova['Residuals', 'Mean Sq']
EQM

"""### Exercício - 06

Ainda sobre os dados do problema proposto em exercícios anteriores, onde se acredita que a posse de computadores tenha uma relação linear com a renda das famílias.

**Informações extras:**

O valor da renda está dividido por 1.000.000, isto é, se um estado tem uma renda total de R$ 4,2, significa que ele tem uma renda total de R$ 4.200.000.

Segue o dataset, em formato de data frame, para facilitar a solução do problema:
"""

dataset_ex06 <- data.frame(
    Y = c(670, 220, 1202, 188, 1869, 248, 477, 1294, 816, 
        2671, 1403, 1586, 3468, 973, 701, 5310, 10950, 2008, 
        9574, 28863, 6466, 4274, 6432, 1326, 1423, 3211, 2140),
    X = c(1.59, 0.56, 2.68, 0.47, 5.2, 0.58, 1.32, 3.88, 2.11, 
        5.53, 2.6, 2.94, 6.62, 1.91, 1.48, 10.64, 22.39, 4.2, 
        21.9, 59.66, 14.22, 9.57, 14.67, 3.28, 3.49, 6.94, 6.25)
)

"""*   Y é o número de domicílios que possuem computador
*   X é a renda total recebida por pessoas de 10 anos ou mais, em cada um dos estados brasileiros

Assinale a alternativa que apresenta o valor do erro quadrático médio (EQM) obtido da nossa regressão linear.
"""

resultado_regressao_ex06 <- lm(formula = Y ~ X, data = dataset_ex06)
resultado_regressao_ex06

anova_ex06 <- anova(resultado_regressao_ex06)
anova_ex06

EQM_ex06 = anova_ex06$'Mean Sq'[2]
EQM_ex06

"""### Teste de hipótese para nulidade do coeficiente angular

Considere o seguinte modelo de regressão linear simples:

# $$Y_i = \beta_1 + \beta_2X_i + u_i$$

Se as variáveis $Y$ e $X$ são linearmente relacionadas, espera-se que $\beta_2$ seja diferente de zero. Para testar esta hipótese formulamos um teste de hipótese com a seguinte especificação de hipóteses nula e alternativa:

## $H_0: \beta_2 = 0$
## $H_1: \beta_2 \neq 0$

Caso $H_0$ seja rejeitada, concluiremos que existe uma relação linear estatisticamente significativa entre as duas variáveis.

Considere agora que $b_1$ e $b_2$ são nossos estimadores de mínimos quadrados. Considere que a distribuição amostral de $b_2$ segue uma normal e também as seguintes propriedades:

# $$E(b_2) = \beta_2$$
# $$\sigma_{b_2} = \frac{\sigma}{\sqrt{\sum{(X_i - \bar{X})^2}}}$$

Como não conhecemos o valor de $\sigma$, utilizamos $s$ como estimativa:

# $$s_{b_2} = \frac{s}{\sqrt{\sum{(X_i - \bar{X})^2}}}$$

Note que o valor esperado de $b_2$ é $\beta_2$, logo, $b_2$ é um estimador não viesado de $\beta_2$. Abaixo temos a estatística de teste (t) que segue uma distribuição t de Student com $n-2$ graus de liberdade.

# $$t = \frac{b_2 - \beta_2}{s_{b_2}}$$

### Calculando $s$
"""

# Calculando a estimativa do desvio padrão s

s <- sqrt(EQM)
s

"""### Calculando $\sum{(X_i - \bar{X})^2}$"""

SOMA_DESVIO2 <- sum(apply(dataset, 1, function(x) (x['X'] - mean(dataset$X)) ** 2))
SOMA_DESVIO2

"""### Calculando $s_{b_2}$"""

# Obtendo o Sb2

s_beta_2 <- s / sqrt(SOMA_DESVIO2)
s_beta_2

"""### Determinando as áreas de aceitação e rejeição de $H_0$

![Região de Aceitação](https://caelum-online-public.s3.amazonaws.com/1273-estatistica-parte4/01/img031.png)

### Níveis de confiança e significância
"""

confianca <- 0.95
significancia <- 1 - confianca

graus_de_liberdade <- resultado_regressao$df.residual
graus_de_liberdade

"""### Obtendo $t_{\alpha/2}$"""

probabilidade <- (0.5 + confianca / 2)
probabilidade

# Obtendo talpha2

t_alpha_2 <- qt(probabilidade, graus_de_liberdade)
t_alpha_2

"""![Região de Aceitação](https://caelum-online-public.s3.amazonaws.com/1273-estatistica-parte4/01/img032.png)

### Obtendo $t = \frac{b_2 - \beta_2}{s_{b_2}}$
"""

# Obtendo t atráves de sua função

t <- (beta_2 - 0) / s_beta_2
t

coeficientes <- resumo$coefficients
coeficientes

# Obtendo t através do df gerado através do df resumo$coefficients

coeficientes['X', 't value']

"""![Região de Aceitação](https://caelum-online-public.s3.amazonaws.com/1273-estatistica-parte4/01/img033.png)

### Etapas e regras de decisão do teste t de significância dos parâmetros

<img src="https://caelum-online-public.s3.amazonaws.com/1273-estatistica-parte4/01/img030.png" width=90%>

### <font color='red'>Critério do valor crítico</font>

> ### Teste Bicaudal
> ### Rejeitar $H_0$ se $t \leq -t_{\alpha / 2}$ ou se $t \geq t_{\alpha / 2}$
"""

t <= -t_alpha_2

t >= t_alpha_2

"""### <font color='red'>Critério do $p-valor$</font>

> ### Teste Bicaudal
> ### Rejeitar $H_0$ se o valor $p\leq\alpha$
"""

# Obtendo o p.value através de sua função.

p_valor <- 2 * (pt(t, graus_de_liberdade, lower.tail = FALSE))
p_valor

# Obtendo o p.value através da consulta ao df coeficientes

p_valor <- coeficientes['X', 'Pr(>|t|)']
p_valor

p_valor <= significancia

"""### <font color='green'>Conclusão: Rejeitamos $H_0$ e concluímos que existe uma relação significativa entre as duas variáveis.</font>"""

resumo

anova

"""---

### Teste F

O teste F também é uma ferramenta para testar a significância na regressão. Baseado na distribuição F de probabilidade, o teste F é utilizado para verificar a significância global na regressão, isto é, em uma regressão múltipla, onde existe mais de uma variável independente, o teste F verifica a nulidade de todos os parâmetros do modelo conjuntamente.

Em nosso caso (regressão linear simples) ele fornece a mesma conclusão obtida com o teste t.

**Hipóteses:**

## $H_0: \beta_2 = 0$
## $H_0: \beta_2 \neq 0$

**Estatística de teste:**

# $$F = \frac{\frac{SQR}{k}}{\frac{SQE}{n-k-1}}$$

Onde,

$SQR$ - soma dos quadrados da regressão

$SQE$ - soma dos quadrados dos erros

$k$ - total de variáveis independentes ($X$)

**Regras de rejeição de $H_0$:**

**Critério do valor crítico** $\rightarrow$ Rejeitar se $F \geq F_{\alpha}$

Onde,

$F_{\alpha}$ - baseia-se na distribuição F com $k$ graus de liberdade no numerador e $n-k-1$ no denominador.

**Critério do p-valor** $\rightarrow$ Rejeitar se $p-valor \leq \alpha$

### Calculando a estatística de teste ($F$)
"""

anova

F <- anova['X', 'Mean Sq'] / anova['Residuals', 'Mean Sq']
F

anova['X', 'F value']

"""### Obtendo o p-valor"""

p_valor <- anova['X', 'Pr(>F)']
p_valor

p_valor <= significancia