
# <font color=green size=10>CURSO DE ESTATÍSTICA - PARTE 3</font>

***

## Trabalho sobre testes de hipóteses

Utilizando os conhecimentos adquiridos em nosso treinamento realize o teste de hipóteses proposto abaixo.

Siga o roteiro proposto e vá completando as células vazias. Procure pensar em mais testes interessantes que podem ser realizados com o nosso dataset.

***

## <font color='red'>Problema</font>

Você é um pesquisador que estuda o mercado de trabalho brasileiro e resolve estudar as diferenças salariais dos trabalhadores dos estados do Rio de Janeiro e de São Paulo. Durante sua pesquisa você verifica que, aparentemente, os rendimentos dos trabalhadores no estado do Rio de Janeiro são mais baixos que os rendimentos dos trabalhadores no estado de São Paulo. Para confirmar esta conclusão realize um teste de hipótese de comparação de médias em cima de duas amostras de trabalhadores dos dois estados. Siga as seguintes etapas:

- Utilize o *dataset* 'dados_proj.csv' para rodar o teste. Este *dataset* tem uma amostra de **tamanho 500** dos rendimentos dos trabalhadores dos dois estados (RJ e SP).
- Considere o **nível de significância de 5%**.
- Teste a hipótese de que a **renda média dos trabalhadores do Rio de Janeiro é menor que a renda média dos trabalhadores de São Paulo**.

---

### Importando o *dataset* 'dados_proj.csv'

O *dataset* apresenta duas variáveis: **Renda_RJ** e **Renda_SP**.
"""

dados <- read.csv('dados_proj.csv')

head(dados)

"""### Dados do problema
Obter média e desvio-padrão para as duas amostras
"""

media_amostra_rj <- mean(dados$Renda_RJ)
media_amostra_rj

desvio_padrao_amostra_rj <-sd(dados$Renda_RJ)
desvio_padrao_amostra_rj

media_amostra_sp <- mean(dados$Renda_SP)
media_amostra_sp

desvio_padrao_amostra_sp <- sd(dados$Renda_SP)
desvio_padrao_amostra_sp

"""Variáveis com os dados do problema"""

significancia <- 0.05
confianca <- 1 - significancia
n_rj <- nrow(dados)
n_sp <- nrow(dados)
D_0 <- 0

"""## Lembre-se...

<img src='https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img014.png' width=90%>

---

### **Passo 1** - formulação das hipóteses $H_0$ e $H_1$

#### <font color='red'>Lembre-se, a hipótese nula sempre contém a alegação de igualdade</font>

### $\mu_1 \Rightarrow$ Rendimento médio no Rio de Janeiro
### $\mu_2 \Rightarrow$ Rendimento médio em São Paulo

### $
\begin{cases}
H_0: \mu_1 \geq \mu_2\\
H_1: \mu_1 < \mu_2
\end{cases}
$

### ou

### $
\begin{cases}
H_0: \mu_1 -\mu_2 \geq 0\\
H_1: \mu_1 -\mu_2 < 0
\end{cases}
$

---

### **Passo 2** - escolha da distribuição amostral adequada

<img src='https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img003.png' width=70%>

### O tamanho da amostra é maior que 30?
#### Resp.: Sim

### O desvio padrão populacional é conhecido?
#### Resp.: Não

---

### **Passo 3** - fixação da significância do teste ($\alpha$)
"""

probabilidade <- significancia
probabilidade

z_alpha <- qnorm(probabilidade)
round(z_alpha, 2)

"""![Estatística-Teste](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img028.png)

---

### **Passo 4** - cálculo da estatística-teste e verificação desse valor com as áreas de aceitação e rejeição do teste

# $$z = \frac{(\bar{x_1} - \bar{x_2})-D_0}{\sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2}}}$$
"""

numerador <- (media_amostra_rj - media_amostra_sp) - D_0

denominador <- sqrt((desvio_padrao_amostra_rj ** 2 / n_rj) + (desvio_padrao_amostra_sp ** 2 / n_sp))

z <- numerador / denominador

z

"""![Estatística-Teste](https://caelum-online-public.s3.amazonaws.com/1229-estatistica-parte3/01/img029.png)

---

### **Passo 5** - Aceitação ou rejeição da hipótese nula

### <font color='red'>Critério do valor crítico</font>
"""

z <= z_alpha

"""### <font color='red'>Critério do valor $p$</font>"""

z

pnorm(z, lower.tail = T)

p_valor <- pnorm(z, lower.tail = T)
p_valor

p_valor <= significancia

"""### <font color='green'>Conclusão: Com um nível de confiança de 95% rejeitamos $H_0$, isto é, concluímos que a renda média no estado do Rio de Janeiro é menor que a renda média no estado de São Paulo.</font>"""