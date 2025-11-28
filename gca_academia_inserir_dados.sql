-- SCRIPT 2: POVOAMENTO DE DADOS (INSERT)

-- 1. Inserindo PROFESSORES
INSERT INTO PROFESSORES (Nome_Professor, Especialidade) VALUES 
('Carlos Silva', 'Musculação'),
('Ana Souza', 'Crossfit'),
('Roberto Dias', 'Natação'),
('Bruno Silva Mendes', 'Muay Thai'),
('Carla Marcia Ruiz', 'Dança'),
('Diego de Alencar', 'Funcional'),
('Eliana Braga Torres', 'Pilates'),
('Fabio Junior Junior', 'Musculação'),
('Gabriela Dias', 'Spinning'),
('Helio Gracie', 'Jiu-Jitsu'),
('Igor Souza Viana', 'Natação'),
('Julia Roberts', 'Yoga'),
('Kleber Bambam', 'Bodybuilding');

-- 2. Inserindo ALUNOS
INSERT INTO ALUNOS (Nome_Aluno, CPF, Data_Nascimento) VALUES 
('João Pereira', '111.111.111-11', '1990-05-15'),
('Maria Oliveira', '222.222.222-22', '1995-10-20'),
('Pedro Santos', '333.333.333-33', '1988-01-10'),
('Alice Maravilha', '101.101.101-01', '1999-01-01'),
('Bob Esponja', '102.102.102-02', '1986-07-14'),
('Charlie Brown', '103.103.103-03', '1990-10-02'),
('Diana Joana', '104.104.104-04', '1985-03-23'),
('Bruce Wayne', '105.105.105-05', '1980-05-25'),
('Clark Kent', '106.106.106-06', '1988-02-27'),
('Tony Stark', '107.107.107-07', '1970-05-29'),
('Natasha Romanoff', '108.108.108-08', '1984-11-14'),
('Steve Rogers', '109.109.109-09', '1918-07-04'),
('Peter Parker', '110.110.110-10', '2001-08-11');

-- 3. Inserindo TELEFONES (Busca o ID do aluno pelo CPF para garantir integridade)
INSERT INTO TELEFONE_ALUNO (Matricula_Aluno, Numero_Telefone, Tipo_Telefone) VALUES 
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='111.111.111-11'), '(11) 99999-1111', 'Celular'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='222.222.222-22'), '(21) 98888-2222', 'Celular'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='101.101.101-01'), '(11) 91111-1111', 'Celular'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='102.102.102-02'), '(11) 92222-2222', 'Residencial'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='103.103.103-03'), '(21) 93333-3333', 'Celular'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='104.104.104-04'), '(31) 94444-4444', 'Comercial'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='105.105.105-05'), '(11) 95555-5555', 'Celular'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='106.106.106-06'), '(41) 96666-6666', 'Celular'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='107.107.107-07'), '(11) 97777-7777', 'Celular'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='108.108.108-08'), '(21) 98888-8888', 'Comercial'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='109.109.109-09'), '(11) 99999-9999', 'Celular'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='110.110.110-10'), '(11) 90000-0000', 'Residencial');

-- 4. Inserindo TREINOS (Busca o ID do professor pelo Nome)
INSERT INTO TREINO (Nome_Treino, Descricao_Treino, ID_Professor) VALUES 
('Hipertrofia A', 'Treino focado em membros superiores', (SELECT Matricula_Professor FROM PROFESSORES WHERE Nome_Professor='Carlos Silva')),
('Cardio Intenso', 'Treino de resistência', (SELECT Matricula_Professor FROM PROFESSORES WHERE Nome_Professor='Ana Souza')),
('Muay Thai Pro', 'Treino avançado de luta', (SELECT Matricula_Professor FROM PROFESSORES WHERE Nome_Professor='Bruno Silva Mendes')),
('Zumba Fest', 'Aula de dança aeróbica', (SELECT Matricula_Professor FROM PROFESSORES WHERE Nome_Professor='Carla Marcia Ruiz')),
('Circuito Funcional', 'Circuito de alta intensidade', (SELECT Matricula_Professor FROM PROFESSORES WHERE Nome_Professor='Diego de Alencar')),
('Pilates Solo', 'Fortalecimento do core', (SELECT Matricula_Professor FROM PROFESSORES WHERE Nome_Professor='Eliana Braga Torres')),
('Hipertrofia B', 'Foco em pernas e glúteos', (SELECT Matricula_Professor FROM PROFESSORES WHERE Nome_Professor='Fabio Junior Junior')),
('Spinning Hill', 'Simulação de subida', (SELECT Matricula_Professor FROM PROFESSORES WHERE Nome_Professor='Gabriela Dias')),
('Defesa Pessoal', 'Técnicas de Jiu-Jitsu', (SELECT Matricula_Professor FROM PROFESSORES WHERE Nome_Professor='Helio Gracie')),
('Natação Master', 'Treino de longas distâncias', (SELECT Matricula_Professor FROM PROFESSORES WHERE Nome_Professor='Igor Souza Viana')),
('Hatha Yoga', 'Relaxamento e postura', (SELECT Matricula_Professor FROM PROFESSORES WHERE Nome_Professor='Julia Roberts')),
('Mr Olympia', 'Treino extremo', (SELECT Matricula_Professor FROM PROFESSORES WHERE Nome_Professor='Kleber Bambam'));

-- 5. Inserindo MATRÍCULAS (ALUNO_TREINO)
INSERT INTO ALUNO_TREINO (Matricula_Aluno, ID_Treino, Data_Inicio) VALUES 
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='111.111.111-11'), (SELECT ID_Treino FROM TREINO WHERE Nome_Treino='Hipertrofia A'), '2023-01-10'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='222.222.222-22'), (SELECT ID_Treino FROM TREINO WHERE Nome_Treino='Cardio Intenso'), '2023-02-15'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='101.101.101-01'), (SELECT ID_Treino FROM TREINO WHERE Nome_Treino='Muay Thai Pro'), '2023-01-15'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='102.102.102-02'), (SELECT ID_Treino FROM TREINO WHERE Nome_Treino='Zumba Fest'), '2023-02-20'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='103.103.103-03'), (SELECT ID_Treino FROM TREINO WHERE Nome_Treino='Circuito Funcional'), '2023-03-10'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='104.104.104-04'), (SELECT ID_Treino FROM TREINO WHERE Nome_Treino='Pilates Solo'), '2023-04-05'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='105.105.105-05'), (SELECT ID_Treino FROM TREINO WHERE Nome_Treino='Hipertrofia B'), '2023-05-12'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='106.106.106-06'), (SELECT ID_Treino FROM TREINO WHERE Nome_Treino='Spinning Hill'), '2023-06-18'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='107.107.107-07'), (SELECT ID_Treino FROM TREINO WHERE Nome_Treino='Defesa Pessoal'), '2023-07-22'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='108.108.108-08'), (SELECT ID_Treino FROM TREINO WHERE Nome_Treino='Natação Master'), '2023-08-30'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='109.109.109-09'), (SELECT ID_Treino FROM TREINO WHERE Nome_Treino='Hatha Yoga'), '2023-09-14'),
((SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='110.110.110-10'), (SELECT ID_Treino FROM TREINO WHERE Nome_Treino='Mr Olympia'), '2023-10-01');

-- 6. Inserindo PAGAMENTOS
INSERT INTO PAGAMENTO_ALUNOS (Data_Vencimento, Valor_Mensalidade, Status_Pagamento, Matricula_Aluno) VALUES 
('2023-10-10', 120.00, 'Pago', (SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='111.111.111-11')),
('2023-11-10', 120.00, 'Pendente', (SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='111.111.111-11')),
('2023-12-05', 100.00, 'Pago', (SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='101.101.101-01')),
('2023-12-05', 100.00, 'Atrasado', (SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='102.102.102-02')),
('2023-12-10', 120.00, 'Pago', (SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='103.103.103-03')),
('2023-12-10', 150.00, 'Pendente', (SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='104.104.104-04')),
('2023-12-15', 500.00, 'Pago', (SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='105.105.105-05')),
('2023-12-15', 90.00, 'Pendente', (SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='106.106.106-06')),
('2023-12-20', 200.00, 'Pago', (SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='107.107.107-07')),
('2023-12-20', 110.00, 'Atrasado', (SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='108.108.108-08')),
('2023-12-25', 80.00, 'Pago', (SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='109.109.109-09')),
('2023-12-25', 95.00, 'Pendente', (SELECT Matricula_Aluno FROM ALUNOS WHERE CPF='110.110.110-10'));