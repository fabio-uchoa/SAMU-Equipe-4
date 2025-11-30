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

## 🚀 Tutorial: Como Rodar o Projeto (Modo Local)

Para garantir que o código funcione na sua máquina exatamente como foi desenvolvido, siga este roteiro de configuração.

### 1. Instalação do Banco de Dados
Todos os membros devem ter o **PostgreSQL** instalado.
* **Windows/Mac:** [Download Oficial](https://www.postgresql.org/download/)
* **Linux (Ubuntu/WSL):**
  ```bash
  sudo apt update
  sudo apt install postgresql postgresql-contrib
  sudo service postgresql start
2. Configuração da Senha (IMPORTANTE)
Para o código conectar automaticamente, o projeto foi configurado com a senha padrão admin123.

Abra o terminal e rode:

Bash

# Entra no console do Postgres
sudo -u postgres psql  # (No Windows use o 'SQL Shell psql')
Dentro do console SQL, digite:

SQL

ALTER USER postgres PASSWORD 'admin123';
\q
3. Configuração do VS Code
Instale a extensão SQLTools e o PostgreSQL Driver no VS Code. Crie uma conexão com estes dados:

Name: Samu Local

Server: localhost

Database: postgres

User: postgres

Password: admin123

4. Criando a Estrutura (Gavetas Vazias)
Antes de rodar o Python, é necessário criar as tabelas no banco:

Abra a pasta sql/ no VS Code.

Abra o arquivo estrutura_dw.sql e clique em Run (Play) no topo.

Isso cria o schema dw (para o ELT).

Abra o arquivo estrutura_dw_etl.sql e clique em Run (Play) no topo.

Isso cria o schema dw_etl (para o ETL).

5. Configuração do Python
No terminal do projeto, instale as dependências:

Bash

# Criar ambiente virtual (Opcional)
python -m venv venv

# Instalar bibliotecas
pip install -r requirements.txt
6. Executando a Carga de Dados
Agora que o ambiente está pronto, rode os notebooks na ordem para popular o banco:

▶️ Abra notebooks/ELT.ipynb e clique em Run All.

Processa os dados via SQL e popula o dw.

▶️ Abra notebooks/ETL.ipynb e clique em Run All.

Processa os dados via Pandas e popula o dw_etl.

7. Validação Final
Abra notebooks/analises_insights.ipynb e rode todas as células.

Se os gráficos aparecerem e o relatório comparativo mostrar "SUCESSO", seu ambiente está configurado corretamente! ✅
