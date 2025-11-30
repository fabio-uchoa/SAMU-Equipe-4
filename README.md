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

📝 Tutorial: Como Rodar o Projeto SAMU (Modo Local)
Este guia garante que todos tenham o banco de dados e o código rodando exatamente igual

1. Instalação do Banco de Dados (PostgreSQL)
Todos devem ter o PostgreSQL instalado na própria máquina.

Windows/Mac: Baixem e instalem do site oficial: postgresql.org/download

Linux (Ubuntu/WSL):

Bash

sudo apt update
sudo apt install postgresql postgresql-contrib
sudo service postgresql start
2. Configuração da Senha (IMPORTANTE)
Para o código funcionar sem alteração, definam a senha do usuário postgres como admin123 (ou combinem outra senha, mas todos devem usar a mesma, ou criar o arquivo .env).

No Terminal/Prompt:

Bash

# Entra no console do Postgres
sudo -u postgres psql  # (No Windows procure por 'SQL Shell psql')

# Altera a senha
ALTER USER postgres PASSWORD 'admin123';

# Sai
\q
3. Configuração do VS Code
Instalem a extensão SQLTools no VS Code para visualizar o banco.

Extensões -> Busque "SQLTools" -> Instale.

Busque "SQLTools PostgreSQL Driver" -> Instale.

Crie uma nova conexão:

Name: Samu Local

Server: localhost

Database: postgres

User: postgres

Password: admin123

4. Criando a Estrutura do Banco (Gavetas Vazias)
Antes de rodar qualquer Python, o banco precisa das tabelas vazias.

Abram a pasta sql/ do projeto no VS Code.

Abram o arquivo estrutura_dw.sql.

Clique em "Run on Active Connection" (Play).

Isso cria o schema dw e as tabelas do ELT.

Abram o arquivo estrutura_dw_etl.sql.

Clique em "Run on Active Connection".

Isso cria o schema dw_etl e as tabelas do ETL.

5. Configuração do Python
Abram o terminal na pasta do projeto.

Criem e ativem o ambiente virtual (opcional, mas recomendado):

Bash

python -m venv venv
# Windows: venv\Scripts\activate
# Linux/Mac: source venv/bin/activate
Instalem as bibliotecas:

Bash

pip install -r requirements.txt
6. Rodando os Processos (Carga de Dados)
Agora que o banco existe (passo 4) e o Python está pronto (passo 5), é só rodar os notebooks para encher o banco.

Abram notebooks/ELT.ipynb -> Cliquem em "Run All".

Vai ler os CSVs e popular o schema dw (via SQL).

Abram notebooks/ETL.ipynb -> Cliquem em "Run All".

Vai ler os CSVs e popular o schema dw_etl (via Pandas).

7. Conferência Final
Abram o arquivo notebooks/analises_insights.ipynb e rodem tudo.

Se aparecerem os gráficos e a mensagem "SUCESSO ABSOLUTO", parabéns! O ambiente local está idêntico.
