# Extração e Processamento de Dados Airbnb para a cidade do Rio de Janeiro

Este repositório documenta o processo de extração, replicação, processamento e visualização de dados do Airbnb para a cidade do Rio de Janeiro, usando um pipeline de dados integrado com várias ferramentas. Este guia explica as ferramentas e etapas envolvidas e fornece um glossário rápido de termos de engenharia de dados analítica para facilitar a compreensão do projeto.

## Visão Geral do Projeto

1. **Fonte de Dados**: Dados extraídos do site [Inside Airbnb](http://insideairbnb.com/), um portal que disponibiliza dados públicos de aluguel de curta duração do Airbnb.
   
2. **Ferramentas Utilizadas**:
   - **Airbyte** para extração de dados.
   - **Snowflake** como data warehouse para armazenamento e organização dos dados.
   - **dbt Cloud** para transformação e estruturação dos dados em múltiplas camadas (Medallion Architecture: bronze, silver e gold).
   - **Great Expectations** para testes de qualidade e validação dos dados.
   - **Domo** para visualização dos dados e criação de relatórios interativos.

3. **Modelo de Dados**: Medallion Architecture com tabelas e views materializadas em Snowflake:
   - **Bronze (Raw)**: Dados brutos.
   - **Silver (Filtragem e Transformação)**: Dados limpos e estruturados.
   - **Gold (Agregação)**: Dados preparados para análises finais.

4. **Visualização**: Relatório criado no Domo com foco em:
   - Receita mensal dos anfitriões.
   - Média de avaliações por bairro.
   - Preço mensal pago por lugares ocupados entre junho de 2024 e junho de 2025.
  
<img width="1205" alt="image" src="https://github.com/user-attachments/assets/961871e8-30fe-4d0b-9028-dda16e42ef60">


## Ferramentas Utilizadas e Como Criar Contas de Avaliação

### 1. **Airbyte**
   - **Função**: Ferramenta de integração de dados para extração de dados de diversas fontes e carregamento em data warehouses.
   - **Conta de Avaliação**:
     1. Acesse [Airbyte](https://airbyte.com/).
     2. Clique em "Get Started for Free" para usar a versão open-source ou escolher uma opção de trial no Airbyte Cloud.
   - **Configuração**: Airbyte foi usado para extrair os dados de [Inside Airbnb](http://insideairbnb.com/) e replicá-los manualmente no Snowflake. Importante: os dados foram replicados sem uso de triggers e sempre sobrescrevendo o dataset anterior.

### 2. **Snowflake**
   - **Função**: Data warehouse em nuvem que permite armazenamento e processamento de dados escaláveis e seguros.
   - **Conta de Avaliação**:
     1. Acesse [Snowflake](https://signup.snowflake.com/) e clique em “Start for Free”.
     2. Crie uma conta de trial com 30 dias gratuitos e um crédito inicial.
   - **Configuração**: Os dados extraídos foram carregados no Snowflake, onde todas as tabelas e views foram materializadas nas camadas bronze, silver e gold, de acordo com a Medallion Architecture.

### 3. **dbt Cloud**
   - **Função**: Ferramenta de transformação de dados que permite executar modelos SQL de forma modular e organizada.
   - **Conta de Avaliação**:
     1. Acesse [dbt Cloud](https://www.getdbt.com/signup/) e selecione “Try dbt Cloud for free”.
     2. Siga as etapas para configurar uma conta gratuita.
   - **Configuração**: Usamos o dbt para processar os dados nas três camadas:
     - **Bronze**: dados brutos.
     - **Silver**: dados filtrados e transformados.
     - **Gold**: dados agregados para análises finais.

### 4. **Great Expectations**
   - **Função**: Framework de validação e monitoramento da qualidade dos dados.
   - **Configuração**: Usamos o mesmo dentro do dbt por meio da instalação dentro do arquivo `packages.yml`

```
  - package: calogica/dbt_expectations
    version: [">=0.6.0", "<0.7.0"]
```
     

### 5. **Domo**
   - **Função**: Plataforma de BI e visualização de dados que permite criar dashboards interativos.
   - **Conta de Avaliação**:
     1. Acesse [Domo](https://www.domo.com/start-free) e clique em “Start Free Trial”.
     2. Siga as instruções para criar uma conta de avaliação gratuita.
   - **Configuração**: Utilizamos o Domo para criar um relatório que exibe as principais métricas do projeto, como receita mensal dos anfitriões, média de avaliações por bairro e preço mensal para lugares ocupados.

## Dicionário Rápido de Engenharia Analítica

### Medallion Architecture
Arquitetura em camadas (bronze, silver e gold) para organização de dados:
- **Bronze**: Dados brutos extraídos.
- **Silver**: Dados limpos e transformados.
- **Gold**: Dados prontos para análise agregada e visualização.

### Materialização
Processo de armazenar os resultados das transformações em tabelas ou views persistentes no data warehouse, otimizando o acesso e o desempenho das consultas.

### Pipeline de Dados
Fluxo de trabalho automatizado para extração, transformação e carregamento de dados entre diversas ferramentas e camadas de processamento.

### Data Warehouse
Armazém centralizado para dados estruturados, usado para suportar relatórios e análises.

### Validação de Dados
Processo de assegurar a qualidade e a precisão dos dados, geralmente utilizando frameworks como o Great Expectations para identificar erros e inconsistências.

### Dashboard
Interface de visualização de dados que exibe métricas e KPIs de forma interativa e visual, facilitando a análise e tomada de decisão.
