
# <font color=green size=10>CURSO DE ESTATÍSTICA - PARTE 4</font>
***

## Trabalho sobre correlação e regressão

Utilizando os conhecimentos adquiridos em nosso treinamento realize a análise de regressão proposta abaixo.

Siga o roteiro proposto e vá completando as células vazias.

# <font color=green>DATASET DO PROJETO</font>
***

### Fonte: https://www.kaggle.com/dongeorge/beer-consumption-sao-paulo

### Descrição:
A cerveja é uma das bebidas mais democráticas e consumidas no mundo. Não sem razão, é perfeito para quase todas as situações, desde o happy hour até grandes festas de casamento.

Os dados (amostra) foram coletados em São Paulo - Brasil, em uma área universitária, onde existem algumas festas com grupos de alunos de 18 a 28 anos de idade (média).

### Dados:
- **X** - Temperatura Média (°C)
- **Y** - Consumo de Cerveja (litros)

---

### Utilize a célula abaixo para carregar os pacotes e/ou fazer configurações para o projeto
"""

library(ggplot2)
options(repr.plot.width = 7, repr.plot.height = 4)

"""### Importe o dataset

#### <font color=red>Utilize o parâmetro **sep = ';'** da função **read.csv** para importar corretamente o conjunto de dados. O dataset do projeto utiliza como separador de colunas o caractere ';'.
"""

dataset <- read.csv('dados_projeto.csv', sep = ';')

"""### Visualize o conteúdo do Data Frame"""

nrow(dataset)

head(dataset)

"""### Obtenha e avalie as estatísticas descritivas dos dados"""

summary(dataset)

apply(dataset, 2, sd)

"""### Análise gráfica
### Construa um box plot para cada variável do dataset
"""

ggplot(dataset, aes(y = Y)) +
  stat_boxplot(geom = 'errorbar', width = 0.4) +
  geom_boxplot(fill = c('#3274A1')) +
  coord_flip() +
  ylab("Consumo de cerveja (litros)") +
  ggtitle('Box-plot') +
  theme(
    plot.title=element_text(size = 14, hjust = 0.5),
    axis.title.x=element_text(size = 12, vjust = -0.2),
    axis.text.y=element_text(size = 10),
    axis.text.x=element_text(size = 10)
  )

ggplot(dataset, aes(y = X)) +
  stat_boxplot(geom = 'errorbar', width = 0.4) +
  geom_boxplot(fill = c('#3274A1')) +
  coord_flip() +
  ylab("Consumo de cerveja (litros)") +
  ggtitle('Box-plot') +
  theme(
    plot.title=element_text(size = 14, hjust = 0.5),
    axis.title.x=element_text(size = 12, vjust = -0.2),
    axis.text.y=element_text(size = 10),
    axis.text.x=element_text(size = 10)
  )

"""### Identifique se existe uma relação linear entre as variáveis $Y$ e $X$
### <font color='red'>Utilizando o método gráfico</font>
"""

ggplot(data = dataset, aes(x = X, y = Y)) +
  geom_point(size = 1.5, stroke = 0) +
  geom_smooth(method = lm) +
  xlab("Temperatura média") +
  ylab("Consumo de cerveja (litros)") +
  ggtitle('Reta de Regrassão - Consumo x Temperatura') +
  theme(
    plot.title=element_text(size = 12, hjust = 0.5),
    axis.title.y=element_text(size = 10, vjust = +0.2),
    axis.title.x=element_text(size = 10, vjust = -0.2),
    axis.text.y=element_text(size = 10),
    axis.text.x=element_text(size = 10)
  )

"""### <font color='red'>Utilizando a matriz de correlação</font>"""

cor(dataset)

"""### Avalie os resultados acima:

É possível afirmar que existe uma relação linear entre as variáveis?

Resp.: 

É possível quantificar a intensidade dessa relação?

Resp.: 

É possível afirmar que existe uma relação de causalidade entre $Y$ e $X$ a partir dos resultados da matriz de correlação?

Resp.:

### Estime o modelo de regressão linear simples
"""

resultado_regressao <- lm(formula = Y ~ X, data = dataset)

"""### Visualize o resultado da regressão"""

summary(resultado_regressao)

"""### Obtenha o $Y$ previsto"""

dataset['Y_previsto'] <- resultado_regressao$fitted.values
head(dataset)

"""### Utilizando nosso modelo estimado para fazer previsões.
### Qual seria o consumo de cerveja para um dia com temperatura média de 42° C?
"""

predict(resultado_regressao, data.frame(X = 42))

"""### Obtenha os resíduos da regressão"""

dataset['Residuos'] <- resultado_regressao$residuals
head(dataset)

"""### Plote um gráfico de dispersão dos resíduos da regressão contra o $Y$ previsto"""

ggplot(data = dataset, aes(x = Y_previsto, y = Residuos)) +
  geom_hline(yintercept = 0, color = 'black') +
  geom_point(size = 1.5, stroke = 0) +
  xlab("Y_previsto") +
  ylab("Resíduos") +
  ggtitle('Resíduos vs Y_previsto') +
  theme(
    plot.title=element_text(size = 12, hjust = 0.5),
    axis.title.y=element_text(size = 10, vjust = +0.2),
    axis.title.x=element_text(size = 10, vjust = -0.2),
    axis.text.y=element_text(size = 10),
    axis.text.x=element_text(size = 10)
  )

"""### Obtenha o R² da regressão pelo método da soma dos quadrados

# $$R^2 = \frac{SQR}{SQT}$$

"""

SQE <- sum(apply(dataset, 1, function(x) x['Residuos'] ** 2))
# Ou 
# SQE <- anova(resultado_regressao)$'Sum Sq'[2]
SQE

SQR <- sum(apply(dataset, 1, function(x) (x['Y_previsto'] - mean(dataset$Y_previsto)) ** 2))
# Ou
# SQR <- anova(resultado_regressao)$'Sum Sq'[1]
SQR

SQT = SQR + SQE
SQT

R2 = SQR / SQT
R2

summary(resultado_regressao)$r.squared