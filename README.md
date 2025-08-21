# 🚀 Projeto de Pipeline de Dados de E-commerce no Azure

![Azure](https://img.shields.io/badge/Azure-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Databricks](https://img.shields.io/badge/Databricks-FF3621?style=for-the-badge&logo=databricks&logoColor=white)
![Synapse](https://img.shields.io/badge/Azure%20Synapse-62B5E5?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

📌 **Status do Projeto:** Concluído ✅

---

## 🎯 Objetivo

Este projeto demonstra a construção de uma **plataforma de dados moderna** na nuvem **Microsoft Azure**, simulando um ambiente de e-commerce.  

O pipeline foi projetado para responder a perguntas de negócio cruciais, como:

- 📈 Qual a receita total gerada mês a mês?  
- 🛒 Quais são os produtos mais vendidos?  
- 🚚 Como está a performance logística? O SLA de entrega é cumprido por região?  
- 💳 Quais os meios de pagamento mais utilizados?  

---

## 🏛️ Arquitetura da Solução

A solução foi construída utilizando a **Arquitetura Medallion**, com camadas **Bronze, Silver e Gold**, garantindo qualidade, governança e valor progressivo dos dados.

<p align="center">
  <img src="/arquitetura.png" alt="Arquitetura da Solução" width="700"/>
</p>

Para ver o diagrama interativo diretamente, acesse:

**[Visualizar Diagrama da Arquitetura (Mermaidchart)](https://www.mermaidchart.com/app/projects/6fab53bf-d6e7-4692-a81b-6659381204ff/diagrams/23cf64a2-1536-4232-8b4c-35f81ab0e769/version/v0.1/edit)**

---

## 🛠️ Tecnologias Utilizadas

- ☁️ **Nuvem:** Microsoft Azure  
- 🐍 **Geração de Dados:** Python + Faker  
- 🗂️ **Armazenamento:** Azure Data Lake Storage Gen2  
- 🔄 **Ingestão & Orquestração:** Azure Data Factory  
- ⚡ **Transformação:** Azure Databricks (PySpark)  
- 🗃️ **Serviço de Consulta:** Azure Synapse Analytics (Serverless SQL Pool)  
- 📊 **Visualização:** Microsoft Power BI  
- 🖥️ **Versionamento:** Git & GitHub  

---

## 🔄 Fluxo do Pipeline

### 1️⃣ Geração de Dados Sintéticos
- Script em **Python + Faker** para criar dados realistas de clientes, pedidos, pagamentos e entregas.

### 2️⃣ Armazenamento no Data Lake
- **RAW:** Dados brutos em `.csv`  
- **BRONZE:** Dados convertidos para **Parquet**  
- **SILVER:** Dados tratados, limpos e enriquecidos  
- **GOLD:** Dados agregados e prontos para análise  

### 3️⃣ Ingestão e Orquestração (ADF)
- **ADF** move `.csv` → `.parquet` (Raw → Bronze) de forma automatizada.

### 4️⃣ Transformação (Databricks)
- Limpeza de dados (nulos, duplicados)  
- Padronização de tipos  
- Enriquecimento com regras de negócio (ex: SLA de entrega)  
- Salvamento na camada **Silver**  

### 5️⃣ Agregações e Serving (Synapse)
- Criação das tabelas da **Gold** no Databricks  
- **Synapse SQL Serverless** expõe as `VIEWs` em Parquet  

### 6️⃣ Visualização (Power BI)
- Dashboard interativo conectado ao **Synapse** via **DirectQuery**  

---

## 📁 Estrutura do Repositório

```bash
├── synapse_scripts/
│   ├── create_gold_layer_views.sql       # SQL da VIEW no synapse
├── 01_Mount_ADLS.ipynb                   # Monta o Data Lake no Databricks
├── 02_Bronze_to_Silver.ipynb             # Transforma dados Bronze → Silver
├── 03_Silver_to_Gold.ipynb               # Agregações Silver → Gold
├── img/ 
│   ├── arquitetura.png                   # Arquitetura da solução
│   └── dashboard.png                     # Dashboard final (substituir)
