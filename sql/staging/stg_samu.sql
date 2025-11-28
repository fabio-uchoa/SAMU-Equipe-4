/* Staging: Seleciona colunas e aplica a Limpeza de Nulos de Texto */
CREATE TABLE stg_samu AS
SELECT
    _id as id_atendimento,
    ano_origem,
    data as data_ocorrencia,
    hora_minuto,
    
    -- Limpeza/Padronização: Aplicando COALESCE e TRIM/UPPER em todas as colunas de texto
    TRIM(UPPER(COALESCE(municipio, 'NÃO INFORMADO'))) as municipio,
    TRIM(UPPER(COALESCE(bairro, 'NÃO INFORMADO'))) as bairro,
    TRIM(UPPER(COALESCE(endereco, 'NÃO INFORMADO'))) as endereco,
    TRIM(UPPER(COALESCE(origem_chamado, 'NÃO INFORMADO'))) as origem_chamado,
    TRIM(UPPER(COALESCE(tipo, 'NÃO INFORMADO'))) as tipo_ocorrencia,
    TRIM(UPPER(COALESCE(subtipo, 'NÃO INFORMADO'))) as subtipo,
    TRIM(UPPER(COALESCE(sexo, 'NÃO INFORMADO'))) as sexo,
    idade,
    TRIM(UPPER(COALESCE(motivo_finalizacao, 'NÃO INFORMADO'))) as motivo_finalizacao,
    motivo_desfecho
FROM stg_samu_raw;