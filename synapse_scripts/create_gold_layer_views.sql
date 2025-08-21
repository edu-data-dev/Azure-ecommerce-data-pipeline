-- =================================================================
-- Script para Criação das Views da Camada Gold no Synapse
-- Autor: [Seu Nome]
-- =================================================================

-- Passo 1: Criar o banco de dados se ele não existir.
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'GOLD_ANALYTICS_DB')
BEGIN
    CREATE DATABASE GOLD_ANALYTICS_DB;
END
GO

-- Passo 2: Mudar o contexto para o banco de dados recém-criado.
USE GOLD_ANALYTICS_DB;
GO

-- Passo 3: Criar as VIEWS que apontam para a camada Gold do Data Lake.

CREATE OR ALTER VIEW vw_receita_mensal AS
SELECT *
FROM OPENROWSET(
    BULK 'https://dlsecommerce.blob.core.windows.net/gold/receita_mensal/*.parquet',
    FORMAT = 'PARQUET'
) AS [result];
GO

CREATE OR ALTER VIEW vw_produtos_mais_vendidos AS
SELECT *
FROM OPENROWSET(
    BULK 'https://dlsecommerce.blob.core.windows.net/gold/produtos_mais_vendidos/*.parquet',
    FORMAT = 'PARQUET'
) AS [result];
GO

CREATE OR ALTER VIEW vw_sla_por_regiao AS
SELECT *
FROM OPENROWSET(
    BULK 'https://dlsecommerce.blob.core.windows.net/gold/sla_por_regiao/*.parquet',
    FORMAT = 'PARQUET'
) AS [result];
GO

CREATE OR ALTER VIEW vw_meios_pagamento_usados AS
SELECT *
FROM OPENROWSET(
    BULK 'https://dlsecommerce.blob.core.windows.net/gold/meios_pagamento_usados/*.parquet',
    FORMAT = 'PARQUET'
) AS [result];
GO

PRINT 'Script executado com sucesso! Views criadas/alteradas no banco de dados GOLD_ANALYTICS_DB.';
GO
