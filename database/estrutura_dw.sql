-- Cria o schema caso nao exista
CREATE SCHEMA IF NOT EXISTS dw;

-- Dimensao Localidade
-- Armazena Municipio e Bairro
DROP TABLE IF EXISTS dw.dim_localidade CASCADE;
CREATE TABLE dw.dim_localidade (
    id_local SERIAL PRIMARY KEY,
    municipio VARCHAR(100),
    bairro VARCHAR(100)
);

-- Dimensao Ocorrencia
-- Armazena Origem do Chamado, Tipo e Subtipo
DROP TABLE IF EXISTS dw.dim_ocorrencia CASCADE;
CREATE TABLE dw.dim_ocorrencia (
    id_ocorrencia SERIAL PRIMARY KEY,
    origem_chamado VARCHAR(100),
    tipo VARCHAR(100),
    subtipo VARCHAR(100)
);

-- Dimensao Situacao
-- Armazena Motivo da Finalizacao e Desfecho
DROP TABLE IF EXISTS dw.dim_situacao CASCADE;
CREATE TABLE dw.dim_situacao (
    id_situacao SERIAL PRIMARY KEY,
    motivo_finalizacao VARCHAR(255),
    motivo_desfecho VARCHAR(255)
);

-- Dimensao Paciente
-- Armazena Sexo e a Faixa Etaria calculada
DROP TABLE IF EXISTS dw.dim_paciente CASCADE;
CREATE TABLE dw.dim_paciente (
    id_paciente SERIAL PRIMARY KEY,
    sexo VARCHAR(20),
    faixa_etaria VARCHAR(50)
);

-- Dimensao Tempo
-- Armazena datas expandidas
DROP TABLE IF EXISTS dw.dim_tempo CASCADE;
CREATE TABLE dw.dim_tempo (
    id_tempo SERIAL PRIMARY KEY,
    data_completa DATE,
    ano INTEGER,
    mes INTEGER,
    dia INTEGER,
    dia_semana VARCHAR(20),
    trimestre INTEGER,
    semestre INTEGER
);

-- Tabela Fato Atendimentos
-- Conecta todas as dimensoes e guarda as metricas
DROP TABLE IF EXISTS dw.fato_atendimentos CASCADE;
CREATE TABLE dw.fato_atendimentos (
    id_fato SERIAL PRIMARY KEY,
    
    -- Chaves Estrangeiras
    fk_local INTEGER REFERENCES dw.dim_localidade(id_local),
    fk_ocorrencia INTEGER REFERENCES dw.dim_ocorrencia(id_ocorrencia),
    fk_situacao INTEGER REFERENCES dw.dim_situacao(id_situacao),
    fk_paciente INTEGER REFERENCES dw.dim_paciente(id_paciente),
    fk_tempo INTEGER REFERENCES dw.dim_tempo(id_tempo),
    
    -- Metricas e Dados Degenerados
    hora_exata TIME,
    idade_paciente INTEGER,
    qtd_atendimentos INTEGER DEFAULT 1
);