import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

df_iris = sns.load_dataset("iris")

df_setosa = df_iris[df_iris["species"] == "setosa"]

corr_setosa = df_setosa.select_dtypes(include=[np.number]).corr()

print("Matriz de Correlação (Espécie Setosa):")
display(corr_setosa)

plt.figure(figsize=(8, 6))
sns.heatmap(corr_setosa, annot=True, cmap="coolwarm", fmt=".2f", vmin=-1, vmax=1)
plt.title("Correlação entre Variáveis Numéricas - Iris Setosa")
plt.show()

##Questão 2 

df_titanic = sns.load_dataset("titanic")

plt.figure(figsize=(10, 6))
sns.histplot(
    data=df_titanic,
    x="age",
    hue="sex",
    element="step",
    stat="density",
    common_norm=False,
    kde=True,
)

plt.title("Distribuição das Idades dos Passageiros por Sexo")
plt.xlabel("Idade")
plt.ylabel("Densidade")
plt.show()

###Questão 3

plt.figure(figsize=(10, 6))
sns.boxplot(
    data=df_titanic, x="class", y="age", hue="sex", palette="Set2"
)
plt.title("Distribuição de Idades por Classe e Sexo (Titanic)")
plt.xlabel("Classe")
plt.ylabel("Idade")
plt.legend(title="Sexo")
plt.show()

###Questão 4

df_mpg = sns.load_dataset("mpg")

plt.figure(figsize=(10, 6))
sns.regplot(
    data=df_mpg,
    x="horsepower",
    y="mpg",
    scatter_kws={"alpha": 0.6},
    line_kws={"color": "red"},
)

plt.title("Relação entre Potência (Horsepower) e Consumo (MPG)")
plt.xlabel("Potência (Horsepower)")
plt.ylabel("Consumo (MPG)")
plt.show()

# Carrega o dataset de países (certifique-se de que o ficheiro 'paises.csv' está na mesma pasta)
df_paises = pd.read_csv("paises.csv")

# Seleciona as colunas especificadas no enunciado
# Nota: Verifique se os nomes exatos das colunas no seu CSV coincidem com estes (ex: maiúsculas/minúsculas)
colunas_interesse = [
    "GDP per capita",
    "Literacy (%)",
    "Infant mortality (per 1000 births)",
    "Phones (per 1000)",
]


##Questão 5 


corr_paises = df_paises[colunas_interesse].corr()

print("Matriz de Correlação - Países:")
display(corr_paises)

plt.figure(figsize=(9, 7))
sns.heatmap(
    corr_paises, annot=True, cmap="vlag", fmt=".2f", vmin=-1, vmax=1, linewidths=0.5
)
plt.title("Correlação entre Indicadores Socioeconómicos")
plt.show()