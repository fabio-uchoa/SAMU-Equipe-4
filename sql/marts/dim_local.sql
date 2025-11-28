-- Dimensão Local: Normalização Geográfica
-- Objetivo: Criar uma lista única de locais para o Star Schema.

CREATE TABLE dim_local AS
SELECT DISTINCT 
    -- Aplicamos TRIM() e UPPER() para garantir que a tabela seja única, 
    -- TRIM remove espaços iniciais/finais.
    TRIM(UPPER(municipio)) as municipio, 
    TRIM(UPPER(bairro)) as bairro
FROM stg_samu_raw
WHERE municipio IS NOT NULL;