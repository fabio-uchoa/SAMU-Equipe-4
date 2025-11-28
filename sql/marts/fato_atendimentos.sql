-- Tabela Fato: Atendimentos
-- Objetivo: Consolidar métricas e chaves estrangeiras (IDs) no centro do DW.

-- DROP/CREATE: Padrão para garantir que a tabela seja recriada com a estrutura correta.
DROP TABLE IF EXISTS fato_atendimentos;
CREATE TABLE fato_atendimentos (
    id_atendimento TEXT,
    ano_origem INTEGER,
    id_tempo TEXT,
    id_local INTEGER,
    id_motivo INTEGER,
    idade INTEGER,
    sexo TEXT,
    hora_minuto TEXT
);

-- INSERT com CTEs (Organização e Performance)
INSERT INTO fato_atendimentos
WITH 
raw_data AS ( SELECT * FROM stg_samu_raw ), -- Fonte de dados
d_local  AS ( SELECT rowid as id_local, municipio, bairro FROM dim_local ), -- Chave Sustituta do Local
d_motivo AS ( SELECT rowid as id_motivo, tipo, subtipo, motivo_desfecho_limpo FROM dim_motivo ),
d_tempo  AS ( SELECT id_tempo FROM dim_tempo )

SELECT 
    base._id as id_atendimento,
    base.ano_origem,
    
    -- Chaves Estrangeiras (FKs)
    t.id_tempo,
    l.id_local, -- Pegando o ID numérico gerado pelo rowid
    m.id_motivo,
    
    base.idade,
    base.sexo,
    base.hora_minuto

FROM raw_data AS base

-- JOINs: O critério de junção deve refletir a mesma lógica de limpeza aplicada no ETL (TRIM e UPPER)
LEFT JOIN d_local l 
    ON TRIM(UPPER(base.municipio)) = l.municipio 
    AND TRIM(UPPER(base.bairro)) = l.bairro

LEFT JOIN d_motivo m
    ON TRIM(UPPER(base.tipo)) = m.tipo 
    AND TRIM(UPPER(base.subtipo)) = m.subtipo -- Join por texto limpo
    AND (
        (base.motivo_desfecho LIKE '%1. %' AND m.motivo_desfecho_limpo = SUBSTR(base.motivo_desfecho, 4)) OR
        (m.motivo_desfecho_limpo = UPPER(base.motivo_desfecho))
    );