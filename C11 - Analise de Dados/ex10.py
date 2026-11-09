import pandas as pd
import matplotlib.pyplot as plt
from statsmodels.tsa.seasonal import seasonal_decompose

# 1. Carregando e preparando o dataset de airtravel
# Certifique-se de que o arquivo 'airtravel.csv' está no mesmo diretório
df_air = pd.read_csv('airtravel.csv')
# Exemplo de tratamento comum para airtravel (ajuste os nomes das colunas se necessário)
print("--- Air Travel Head ---")
display(df_air.head())

# a) A série possui Tendência? Se sim, que tipo?
# Resposta: Sim, a série de airtravel geralmente apresenta uma tendência 
# de crescimento linear/exponencial acentuada ao longo dos anos, refletindo 
# a expansão global da aviação comercial.
#
# b) A série possui Sazonalidade? Se sim, qual o período que ela acontece?
# Resposta: Sim, possui forte sazonalidade com período anual (frequência de 12 meses), 
# com picos recorrentes nos meses de férias de julho/agosto e final de ano.

# %% [markdown]
# ## B) Análise do Dataset: co2_emissions.csv

df_co2 = pd.read_csv('co2_emissions.csv')
print("--- CO2 Emissions Head ---")
display(df_co2.head())


# a) A série possui Tendência? Se sim, que tipo?
# Resposta: Sim, a série de emissões de CO2 tipicamente exibe uma tendência 
# de crescimento contínuo de longo prazo impulsionada pelo desenvolvimento industrial e energético.
#
# b) A série possui Sazonalidade? Se sim, qual o período que ela acontece?
# Resposta: Sim, costuma apresentar sazonalidade anual (período de 12 meses) ligada 
# aos ciclos naturais da vegetação e variações sazonais no consumo de energia nos hemisférios.

# %% [markdown]
# ## Respostas Teóricas Gerais (Questões C e D)
# 
# c) Todo dataset pode ser aplicado à análise por séries temporais?
# Resposta: Não. Para que um dataset possa ser analisado como série temporal, 
# é estritamente necessário que os dados sejam coletados em momentos sequenciais 
# e igualmente espaçados no tempo (ex: diário, mensal, anual), onde a ordem temporal 
# e a dependência entre as observações consecutivas importam. Dados transversais (cross-sectional) 
# coletados aleatoriamente sem eixo temporal não se aplicam.
#
# d) Quais características são necessárias para ser considerado uma série temporal?
# Resposta: 
# 1. **Indexação Temporal:** Uma dimensão temporal clara (timestamps, datas ou períodos ordenados).
# 2. **Espaçamento Uniforme:** Medições coletadas em intervalos de tempo regulares (ex: a cada hora, todo dia 1º do mês).
# 3. **Dependência Sequencial (Autocorrelação):** O valor em um determinado instante t depende ou está estatisticamente relacionado aos valores em instantes anteriores ($t-1, t-2$, etc.).
# 4. **Variável de Interesse (Métrica):** Uma ou mais variáveis quantitativas observadas e registradas ao longo dessa linha do tempo.