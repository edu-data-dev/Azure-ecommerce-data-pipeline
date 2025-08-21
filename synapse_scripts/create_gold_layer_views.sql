-- Receita Mensal
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'GOLD_ANALYTICS_DB')
BEGIN
    CREATE DATABASE GOLD_ANALYTICS_DB
END
GO

CREATE OR ALTER VIEW vw_receita_mensal AS
SELECT *
FROM OPENROWSET(
    BULK 'https://dlsecommerce.blob.core.windows.net/gold/receita_mensal/*.parquet',
    FORMAT = 'PARQUET'
) AS [result];
GO

-- Produtos mais vendidos
CREATE OR ALTER VIEW vw_produtos_mais_vendidos AS
SELECT *
FROM OPENROWSET(
    BULK 'https://dlsecommerce.blob.core.windows.net/gold/produtos_mais_vendidos/*.parquet',
    FORMAT = 'PARQUET'
) AS [result];
GO

-- SLA Por Região (URL CORRIGIDA)
CREATE OR ALTER VIEW vw_sla_por_regiao AS
SELECT *
FROM OPENROWSET(
    BULK 'https://dlsecommerce.blob.core.windows.net/gold/sla_por_regiao/*.parquet',
    FORMAT = 'PARQUET'
) AS [result];
GO

-- Meios de pagamento usados (corrigido para pasta com arquivos)
CREATE OR ALTER VIEW vw_meios_pagamento_usados AS
SELECT *
FROM OPENROWSET(
    BULK 'https://dlsecommerce.blob.core.windows.net/gold/meios_pagamento_usados/*.parquet',
    FORMAT = 'PARQUET'
) AS [result];
GO

PRINT 'Views criadas/alteradas com sucesso!';
PRINT 'Consultando a view de receita mensal para teste...';

SELECT TOP 100 * FROM vw_receita_mensal;
GO
-- Lista views criadas
SELECT name 
FROM sys.views 
WHERE name LIKE 'vw_%';

PRINT 'Views criadas/alteradas com sucesso no banco de dados GOLD_ANALYTICS_DB!';
PRINT 'Consultando a view de receita mensal para teste...';

-- Tenta retornar 1 linha de cada
SELECT TOP 1 * FROM vw_receita_mensal;
SELECT TOP 1 * FROM vw_produtos_mais_vendidos;
SELECT TOP 1 * FROM vw_vw_sla_por_regiao;
SELECT TOP 1 * FROM vw_meios_pagamento_usados;
