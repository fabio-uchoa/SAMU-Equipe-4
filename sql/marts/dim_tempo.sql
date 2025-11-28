
DROP TABLE IF EXISTS dim_tempo;
CREATE TABLE dim_tempo AS
SELECT DISTINCT
    data_ocorrencia as id_tempo,
    strftime('%Y', data_ocorrencia) as ano,
    strftime('%m', data_ocorrencia) as mes,
    strftime('%d', data_ocorrencia) as dia,
    strftime('%w', data_ocorrencia) as dia_semana
FROM stg_samu
WHERE data_ocorrencia IS NOT NULL;
