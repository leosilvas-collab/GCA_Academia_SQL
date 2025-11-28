# 🏋️ GCA Software - Sistema de Gestão de Academia

Este repositório contém a implementação prática de um banco de dados relacional desenvolvido para o **GCA Software**, como parte da disciplina de **Modelagem de Banco de Dados**.
O objetivo principal foi transpor o modelo lógico para a implementação física utilizando a linguagem SQL, focando na integridade dos dados, normalização (até a 3FN) e manipulação de informações através de comandos DDL e DML.

---

## 🎯 Objetivos do Projeto

-   Aplicar comandos de **DDL** (Data Definition Language) para criação de estruturas de tabelas, chaves primárias e estrangeiras;
-   Executar comandos de **DML** (Data Manipulation Language) para inserção, consulta, atualização e exclusão de dados reais;
-   Garantir a **Integridade Referencial** e a consistência entre as entidades (ex: relação entre Alunos, Treinos e Professores);
-   Demonstrar a aplicação prática das regras de normalização para evitar redundâncias no banco de dados.

---

## 📖 Conteúdo do Repositório

-   **`gca_academia_criar_tabela.sql`**: Script DDL contendo a estrutura completa do banco de dados, com a definição de todas as tabelas e relacionamentos;
-   **`gca_academia_inserir_dados.sql`**: Script contendo os comandos de inserção para povoar o banco com dados de teste (Professores, Alunos, Treinos, Pagamentos e Matrículas);
-   **`gca_academia_consulta_dados.sql`**: Script com consultas analíticas (relatórios) utilizando junções (`JOIN`), filtros (`WHERE`) e ordenação (`ORDER BY`);
-   **`gca_academia_dados_update_delete.sql`**: Script demonstrando a manutenção dos dados através de atualizações (`UPDATE`) e exclusões (`DELETE`) com critérios de segurança.

---

## 💻 Como Usar

Para executar este projeto em seu ambiente local (recomendado: **PostgreSQL** com **pgAdmin 4**), siga a ordem abaixo para garantir a integridade das referências:

1.  Crie um banco de dados vazio chamado `gca_academia`;
2.  Abra a *Query Tool* e execute o arquivo **`gca_academia_criar_tabela.sql`** para montar a estrutura;
3.  Execute o arquivo **`gca_academia_inserir_dados.sql`** para popular as tabelas;
4.  Utilize o arquivo **`gca_academia_consulta_dados.sql`** para visualizar os relatórios gerados;
5.  (Opcional) Execute o arquivo **`gca_academia_dados_update_delete.sql`** para testar as modificações e exclusões de registros.

---

## 👥 Autores

Este projeto foi desenvolvido com o objetivo de aprofundar os conhecimentos em SQL e Modelagem de Dados:

- [Leo](https://github.com/leosilvas-collab) 

---

## 📌 Observação

Este repositório tem caráter **acadêmico** e foi desenvolvido como parte das atividades avaliativas da disciplina. Os dados utilizados nos scripts de inserção são fictícios e servem apenas para fins de simulação e testes de funcionalidade do banco de dados.
