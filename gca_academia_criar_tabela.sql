-- Criação das tabelas para o sistema de gerenciamento de academia
CREATE TABLE ALUNOS (
    Matricula_Aluno SERIAL PRIMARY KEY,
    Nome_Aluno VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    Data_Nascimento DATE
);

CREATE TABLE TELEFONE_ALUNO (
    ID_Telefone SERIAL PRIMARY KEY,
    Matricula_Aluno INT NOT NULL,
    Numero_Telefone VARCHAR(15) NOT NULL,
    Tipo_Telefone VARCHAR(20),
    FOREIGN KEY (Matricula_Aluno) REFERENCES ALUNOS(Matricula_Aluno)
);

CREATE TABLE PROFESSORES (
    Matricula_Professor SERIAL PRIMARY KEY,
    Nome_Professor VARCHAR(100) NOT NULL,
    Especialidade VARCHAR(50)
);

CREATE TABLE TREINO (
    ID_Treino SERIAL PRIMARY KEY,
    Nome_Treino VARCHAR(100) NOT NULL,
    Descricao_Treino TEXT,
    ID_Professor INT NOT NULL,
    FOREIGN KEY (ID_Professor) REFERENCES PROFESSORES(Matricula_Professor)
);

CREATE TABLE PAGAMENTO_ALUNOS (
    ID_Pagamento SERIAL PRIMARY KEY,
    Data_Vencimento DATE NOT NULL,
    Valor_Mensalidade DECIMAL(10,2) NOT NULL,
    Status_Pagamento VARCHAR(20) NOT NULL CHECK (Status_Pagamento IN ('Pago', 'Pendente', 'Atrasado')),
    Matricula_Aluno INT NOT NULL,
    FOREIGN KEY (Matricula_Aluno) REFERENCES ALUNOS(Matricula_Aluno)
);

CREATE TABLE ALUNO_TREINO (
    Matricula_Aluno INT NOT NULL,
    ID_Treino INT NOT NULL,
    Data_Inicio DATE NOT NULL,
    PRIMARY KEY (Matricula_Aluno, ID_Treino),
    FOREIGN KEY (Matricula_Aluno) REFERENCES ALUNOS(Matricula_Aluno),
    FOREIGN KEY (ID_Treino) REFERENCES TREINO(ID_Treino)
);