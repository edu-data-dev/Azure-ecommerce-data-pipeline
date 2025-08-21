# Projeto de Pipeline de Dados de E-commerce no Azure

![Azure](https://img.shields.io/badge/Azure-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Databricks](https://img.shields.io/badge/Databricks-FF3621?style=for-the-badge&logo=databricks&logoColor=white)
![Synapse](https://img.shields.io/badge/Azure%20Synapse-62B5E5?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

**Status do Projeto: Concluído ✅**

## 🎯 Objetivo

Este projeto demonstra a construção de uma plataforma de dados completa e moderna na nuvem **Microsoft Azure**. O objetivo foi simular um ambiente de e-commerce, ingerindo, processando e transformando dados transacionais para, ao final, gerar insights estratégicos e apoiar a tomada de decisão através de um dashboard interativo.

O pipeline foi projetado para responder a perguntas de negócio cruciais, como:
-   Qual a receita total gerada mês a mês?
-   Quais são os produtos mais vendidos?
-   Qual a performance logística? O SLA de entrega está sendo cumprido por região?
-   Quais os meios de pagamento mais utilizados pelos clientes?

## 🏛️ Arquitetura da Solução

A solução foi construída utilizando a **Arquitetura Medallion**, um padrão de design que garante a qualidade, governança e organização dos dados em camadas (Bronze, Silver e Gold), aumentando progressivamente o valor da informação.

<br>

_**[INSERIR SEU DIAGRAMA DE ARQUITETURA AQUI]**_

*Dica: Crie um diagrama em uma ferramenta como [diagrams.net](http://diagrams.net) ou Lucidchart, salve como PNG, faça o upload para uma pasta `/img` no seu repositório e substitua este texto pelo link: `![Arquitetura](img/arquitetura.png)`*

<br>

## 🛠️ Tecnologias Utilizadas

-   **Nuvem:** Microsoft Azure
-   **Geração de Dados:** Python com a biblioteca Faker
-   **Armazenamento:** Azure Data Lake Storage Gen2
-   **Ingestão e Orquestração:** Azure Data Factory
-   **Transformação e Enriquecimento:** Azure Databricks (com PySpark)
-   **Camada de Serviço (Serving Layer):** Azure Synapse Analytics (Serverless SQL Pool)
-   **Visualização e BI:** Microsoft Power BI
-   **Versionamento de Código:** Git & GitHub

## 🔄 Fluxo do Pipeline

O pipeline de dados foi estruturado nas seguintes etapas:

#### 1. Geração de Dados Sintéticos
-   Um script **Python** com **Faker** foi desenvolvido para criar uma massa de dados realista, simulando transações de um e-commerce com tabelas de `clientes`, `pedidos`, `pagamentos` e `entregas`.

#### 2. Armazenamento e Estrutura (Data Lake)
-   O **Azure Data Lake Gen2** foi configurado como repositório central, com containers para cada camada da Arquitetura Medallion:
    -   **RAW:** Recebe os dados brutos gerados pelo script (arquivos `.csv`).
    -   **BRONZE:** Armazena os mesmos dados, mas convertidos para um formato colunar otimizado (**Parquet**), representando a primeira etapa de ingestão.
    -   **SILVER:** Contém os dados limpos, padronizados, enriquecidos e com regras de negócio aplicadas. As tabelas aqui são normalizadas e prontas para consumo analítico.
    -   **GOLD:** Armazena tabelas agregadas e modeladas, prontas para responder às perguntas de negócio e alimentar o dashboard de BI.

#### 3. Ingestão e Orquestração (Azure Data Factory)
-   O **ADF** foi utilizado para orquestrar o primeiro movimento de dados: pegar os arquivos `.csv` da camada `raw`, convertê-los para `.parquet` e depositá-los na camada `bronze`, automatizando a ingestão inicial.

#### 4. Transformação (Azure Databricks)
-   O coração do processamento. Notebooks em **PySpark** no **Databricks** foram utilizados para:
    -   Ler os dados da camada **Bronze**.
    -   Realizar a limpeza (tratamento de nulos, duplicados).
    -   Padronizar tipos de dados (especialmente datas).
    -   Enriquecer os dados, criando novas colunas com inteligência de negócio (ex: cálculo de atraso no SLA de entrega).
    -   Salvar as tabelas tratadas na camada **Silver**.

#### 5. Camada de Serviço (Azure Synapse Analytics)
-   Com os dados limpos na camada Silver, o **Databricks** foi novamente utilizado para criar as agregações da camada **Gold**.
-   Em seguida, o **Synapse Analytics Serverless SQL Pool** foi conectado ao Data Lake para criar `VIEWs` sobre os arquivos Parquet da camada Gold. Isso disponibiliza os dados através de um ponto de extremidade SQL padrão, de forma performática e segura, sem a necessidade de mover os dados.

#### 6. Visualização (Power BI)
-   O **Power BI** foi conectado ao **Synapse Analytics** em modo **DirectQuery** para consumir os dados da camada Gold e apresentar os KPIs de negócio de forma visual e interativa.

## 📁 Estrutura do Repositório
-   **/01_Mount_ADLS.ipynb**: Notebook Databricks responsável por montar o Data Lake no ambiente para facilitar o acesso aos dados.
-   **/02_Bronze_to_Silver.ipynb**: Notebook com o código PySpark que lê os dados da camada Bronze, aplica as transformações e salva na camada Silver.
-   **/03_Silver_to_Gold.ipynb**: Notebook com o código PySpark que lê os dados da camada Silver, cria as agregações e salva as tabelas analíticas na camada Gold.

## 📊 Resultado Final: Dashboard de Negócios

O dashboard final consolida os principais indicadores de performance do e-commerce, permitindo uma análise estratégica e visual dos resultados.

<br>

_**[INSERIR PRINT DO SEU DASHBOARD FINAL DO POWER BI AQUI]**_

*Dica: Tire um print bonito do seu dashboard, faça o upload para a pasta `/img` e substitua este texto pelo link: `![Dashboard](img/dashboard.png)`*

<br>

## 👨‍💻 Autor

**[Seu Nome Completo]**

-   **LinkedIn:** `[Link para o seu perfil do LinkedIn]`
-   **GitHub:** `[Link para o seu perfil do GitHub]`
