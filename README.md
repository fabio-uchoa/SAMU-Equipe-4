# Projeto de Dados: SAMU Analytics (ETL & ELT)

## 📌 Sobre o Projeto
Este repositório contém a estrutura de engenharia de dados voltada para o processamento e análise dos atendimentos do SAMU (Serviço de Atendimento Móvel de Urgência).

O objetivo principal é implementar pipelines de **ETL (Extract, Transform, Load)** e **ELT (Extract, Load, Transform)** para normalizar dados brutos, tratar inconsistências e preparar uma base sólida para execução de consultas analíticas (SQL) e geração de insights.

## 🚀 Objetivos
- **Extração:** Consolidação de arquivos brutos (CSV/Excel) provenientes dos sistemas de registro.
- **Tratamento (Cleaning):**
  - Padronização de tipagem (Datetime, Int, Varchar).
  - Tratamento de valores nulos (Missing Values) e outliers.
  - Normalização de textos (Snake Case, remoção de acentos).
- **Carga:** Estruturação dos dados tratados para inserção em Banco de Dados.
- **Análise:** Execução de queries para responder perguntas de negócio sobre tempo de resposta, distribuição geográfica e tipificação de ocorrências.

## 🛠 Tecnologias Utilizadas
- **Linguagem:** Python 3.10+
- **Manipulação de Dados:** Pandas, NumPy
- **Ambiente de Desenvolvimento:** VS Code (Jupyter Notebooks)
- **Versionamento:** Git