
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'SILVER_ANALYTICS_DB')
BEGIN
    CREATE DATABASE SILVER_ANALYTICS_DB;
END
GO


USE SILVER_ANALYTICS_DB;
GO

CREATE OR ALTER VIEW vw_clientes AS
SELECT *
FROM OPENROWSET(
    BULK 'https://dlsecommerce.blob.core.windows.net/silver/clientes/*.parquet',
    FORMAT = 'PARQUET'
) AS [result];
GO

CREATE OR ALTER VIEW vw_pedidos AS
SELECT *
FROM OPENROWSET(
    BULK 'https://dlsecommerce.blob.core.windows.net/silver/pedidos/*.parquet',
    FORMAT = 'PARQUET'
) AS [result];
GO

CREATE OR ALTER VIEW vw_pagamentos AS
SELECT *
FROM OPENROWSET(
    BULK 'https://dlsecommerce.blob.core.windows.net/silver/pagamentos/*.parquet',
    FORMAT = 'PARQUET'
) AS [result];
GO

CREATE OR ALTER VIEW vw_entregas AS
SELECT *
FROM OPENROWSET(
    BULK 'https://dlsecommerce.blob.core.windows.net/silver/entregas/*.parquet',
    FORMAT = 'PARQUET'
) AS [result];
GO

PRINT 'Script executado com sucesso! Views da camada Silver criadas/alteradas no banco de dados SILVER_ANALYTICS_DB.';
GO
