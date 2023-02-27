
# Definindo o projeto do curso

Pergunta: O que afeta a qualidade do ar? Como?
"""

install.packages("Ecdat")

library(Ecdat)

# Carregando o bd
data(Airq)

names(Airq)

"""## Descrição das variáveis:

airq <- índice de qualidade do ar (quanto menor, melhor)

vala <- valor das empresas nas cidades (milhares de dólares)

rain <- quantidade de chuva (em polegadas)

coas <- posição costeira da cidade (sim ou não)

dens <- densidade populacional (milha quadrada)

medi <- renda média per capita (dólares)
"""

head(Airq)

"""# Sumário das variáveis"""

# No bd temos variáveis contínuas e categóricas (coas)

summary(Airq)

# Plotando um primeiro gráfico de relação y em função x com as variáveis airq em função de vala

plot(airq~vala, data=Airq)

"""# Criando um modelo estatístico - M1

y (resposta) ~ x(explicativa)

ex: y(crescimento de uma planta) ~ x(quantidade de adubo) + x(quantidade de luz)

y ~ x1 + x2 + x3

airq ~ vala + coas + rain + ...
"""

# Criando a função de regressão linear de airq em função de vala.

m1 <- lm(airq~vala, data=Airq)
m1

# Obtendo os dados estatísticos do modelo criado.

summary(m1)

"""P-valor = Pr(>|t|) do summary, indica a significância do modelo ou da variável.

Sendo p-valor <= 0.05 podemos concluir que a variável explicativa é significativa a determinação de Y.

Sendo p-valor > 0.05 podemos concluir que a variável explicativa não é significativa a determinação de Y.

**Sendo p-valor = 0.0794 > 0.05** entendemos que a fórmula de airq em função de vala não é significante a explicar sua variação.
"""

# Plot do gráfico de regressão linear

plot(airq~vala, data=Airq)

"""# Criando um modelo estatístico - M2"""

# Criando a função de regressão linear de airq em função de vala.

m2 <- lm(airq~coas, data=Airq)
m2

# Obtendo os dados estatísticos do modelo criado.

summary(m2)

"""**Sendo p-valor = 0.00596 <= 0.05** entendemos que a fórmula de airq em função de coas é significante a explicar sua variação.

No gráfico da regressão linear abaixo podemos confirmar que a posição costeira da cidade influência a qualidade do ar.
"""

# Plot do gráfico de regressão linear.
# Ao postar o gráfico de regressão linear de uma variável categórica, a linguagem automáticamente cria um gráfico do tipo box-plot.

plot(airq~coas, data=Airq)

"""# Criando um modelo estatístico - M3"""

# Criando a função de regressão linear de airq em função de medi.

m3 <- lm(airq~medi, data=Airq)
m3

# Obtendo os dados estatísticos do modelo criado.

summary(m3)

"""**Sendo p-valor = 0.18 > 0.05** entendemos que a fórmula de airq em função de medi não é significante a explicar sua variação. 

"""

# Plot do gráfico de regressão linear

plot(airq~medi, data=Airq)

"""# Criando um modelo estatístico - M4"""

# Criando a função de regressão linear de airq em função de rain.

m4 <- lm(airq~rain, data=Airq)
m4

# Obtendo os dados estatísticos do modelo criado.

summary(m4)

"""**Sendo p-valor = 0.891 > 0.05** entendemos que a fórmula de airq em função de rain não é significante a explicar sua variação. 

"""

# Plot do gráfico de regressão linear

plot(airq~rain, data=Airq)

"""# Criando um modelo estatístico - M5"""

# Criando a função de regressão linear de airq em função de dens.

m5 <- lm(airq~dens, data=Airq)
m5

# Obtendo os dados estatísticos do modelo criado.

summary(m5)

"""**Sendo p-valor = 0.838 > 0.05** entendemos que a fórmula de airq em função de dens não é significante a explicar sua variação. 

"""

# Plot do gráfico de regressão linear

plot(airq~dens, data=Airq)

"""# Inserindo a reta e melhorando os gráficos"""

# Gerando o gráfico de airq~medi

plot(airq~medi, data=Airq)

# Sendo a função de ln = y = a+b*x
# Onde:
# a = intercepto (onde a reta vai tocar o eixo y)
# b = é a inclinação da reta

# Comando para traçar a reta no gráfico
curve(9.936e+01+5.638e-04*x, add = TRUE)

# Melhorando o gráfico
plot(
  airq~medi, 
  data=Airq, 
  xlab = "Renda média per capita", 
  ylab = "Qualidade do ar",
  pch = 16,
  col = "blue",
  cex = 1.5,
  cex.lab = 1.3,
  main = "Renda média - 2010"
)
# Melhorando a linha
curve(
  9.936e+01+5.638e-04*x, 
  add = TRUE,
  col = "darkblue",
  lwd = 2,
  lty = 2
)

# Gerando o gráfico de airq~coas

plot(
  airq~coas, 
  data=Airq, 
  xlab = "Posição costeira", 
  ylab = "Qualidade do ar",
  col = "lightblue",
  ylim = c(50,170),
  cex.lab = 1.3,
  main = "Análise da qualidade do ar"
)

"""# Regressão múltipla

Modelo de regressão múltipla - M1
"""

mRM1 <- lm(airq~vala+coas, data=Airq)
mRM1

# Com o summary observamos que agora variáveis que isoladamente não eram significantes ao modelo,
# agora inseridas em um modelo de regressão múltipla passam a ter significância.

summary(mRM1)

"""# Gráfico de Regressão múltipla"""

# Gráfico base de airq~vala
plot(
  airq~vala,
  data=Airq,
  xlab = "Valor das empresas ($)",
  ylab = "Qualidade do ar"  
)

# Reta para as cidades não consteiras
curve(
  1.171e+02+1.999e-03*x,
  add = TRUE  
)

# Reta para as cidades consteiras
curve(
  1.171e+02+1.999e-03*x+-2.968e+01,
  lty = 2,
  add = TRUE  
)

# Inserindo legendas
legend(
  "bottomright",
  c("Não-costeiras","Costeiras"),
  pch = 1,
  lty = c(1,2),
  bty = "n"
)

"""A qualidade do ar das cidades é afetada tanto pelo valor das empresas quanto pela posição costeira das cidades.

Quanto maior o valor das empresas, pior a qualidade do ar das cidades.

Além disso, as cidades não-costeiras apresemtam qualidade do ar pior do que as cidades costeiras.

# Modelo de regressão múltipla - M2
"""

mRM2 <- lm(airq~vala+coas+dens, data=Airq)
mRM2

summary(mRM2)

"""# Contraste de modelos

Comparação de um modelo completo (todas as variáveis) e um modelo sem uma variável em questão.
"""

modelocompleto <- lm(airq~vala+coas+dens, data=Airq)
modeloincompleto <- lm(airq~vala+coas, data=Airq)

"""Para avaliar se existe uma relevância de uma variável no modelo, comparamos ambos os modelos utilizando a função Anova.

**Sendo o resultado de p > 0.05** consideramos que não existe diferença entre os modelos, portanto seguimos com o modelos incompleto por ser mais simples.

**Sendo o resultado de p < 0.05** os modelos são diferentes, portanto a variável não deve ser removida do modelo, ou seja, seguimos com o modelo completo.
"""

# Sendo p > 0.05, desconsideramos a relevância da variável dens ao modelo, e seguimos com o modelos incompleto sem ele.

anova(modelocompleto, modeloincompleto)

"""# Conclusão

Concluímos que as variáveis que afetaram o modelo foram: (a) o valor das empresas e (b) a posição costeira das cidades. 

Quanto maior o valor das empresas, pior a qualidade do ar. 

Cidades costeiras apresentam uma melhor qualidade do ar.
"""

# Gráfico base de airq~vala
plot(
  airq~vala,
  data=Airq,
  xlab = "Valor das empresas ($)",
  ylab = "Qualidade do ar"  
)

# Reta para as cidades não consteiras
curve(
  1.171e+02+1.999e-03*x,
  add = TRUE  
)

# Reta para as cidades consteiras
curve(
  1.171e+02+1.999e-03*x+-2.968e+01,
  lty = 2,
  add = TRUE  
)

# Inserindo legendas
legend(
  "bottomright",
  c("Não-costeiras","Costeiras"),
  pch = 1,
  lty = c(1,2),
  bty = "n"
)