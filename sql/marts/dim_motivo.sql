-- Dimensão Motivo: Limpeza de Strings
-- Objetivo: Padronizar e limpar o campo de desfecho que estava inconsistente.

CREATE TABLE dim_motivo AS
SELECT DISTINCT
    TRIM(UPPER(COALESCE(tipo, 'NÃO INFORMADO'))) as tipo,
    TRIM(UPPER(COALESCE(subtipo, 'NÃO INFORMADO'))) as subtipo,
    
    -- Lógica de limpeza para remover prefixos '1. ', '2. ', etc.
    -- Justificativa: No ETL original, isso era feito com REGEX. Aqui usamos CASE WHEN e SUBSTR, que são mais eficientes e nativos no SQL.
    
    CASE 
        WHEN motivo_desfecho LIKE '%1. %' THEN SUBSTR(motivo_desfecho, 4)
        WHEN motivo_desfecho LIKE '%2. %' THEN SUBSTR(motivo_desfecho, 4)
        WHEN motivo_desfecho LIKE '%3. %' THEN SUBSTR(motivo_desfecho, 4)
        ELSE UPPER(COALESCE(motivo_desfecho, 'NÃO INFORMADO'))
    END as motivo_desfecho_limpo

FROM stg_samu_raw;