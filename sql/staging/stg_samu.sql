
DROP TABLE IF EXISTS stg_samu;
CREATE TABLE stg_samu AS
SELECT
    _id as id_atendimento,
    ano_origem,
    data as data_ocorrencia,
    hora_minuto,
    UPPER(municipio) as municipio, -- Normalizacao: 'Recife' vira 'RECIFE'
    UPPER(bairro) as bairro,
    UPPER(tipo) as tipo_ocorrencia,

    -- Tratamento de Nulos via COALESCE para replicar o fillna do ETL
    UPPER(COALESCE(motivo_finalizacao, 'NÃO INFORMADO')) AS motivo_finalizacao,
    UPPER(COALESCE(endereco, 'NÃO INFORMADO')) AS endereco,
    UPPER(COALESCE(origem_chamado, 'NÃO INFORMADO')) AS origem_chamado,
    UPPER(COALESCE(sexo, 'NÃO INFORMADO')) AS sexo,
    UPPER(COALESCE(subtipo, 'NÃO INFORMADO')) AS subtipo,
    
    motivo_desfecho,
    idade,
    sexo
FROM stg_samu_raw;
