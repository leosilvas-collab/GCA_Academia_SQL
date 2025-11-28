-- SCRIPT 3: RELATÓRIOS E CONSULTAS (SELECT)

-- --------------------------------------------------------
-- RELATÓRIO 1: Alunos com mensalidade pendente ou atrasada
-- Objetivo: Identificar inadimplência para cobrança.
-- Recursos: JOIN, WHERE com lista (IN), ORDER BY
-- --------------------------------------------------------
SELECT 
    A.Nome_Aluno, 
    P.Data_Vencimento, 
    P.Valor_Mensalidade, 
    P.Status_Pagamento
FROM ALUNOS A
JOIN PAGAMENTO_ALUNOS P ON A.Matricula_Aluno = P.Matricula_Aluno
WHERE P.Status_Pagamento IN ('Pendente', 'Atrasado')
ORDER BY P.Data_Vencimento ASC;

-- --------------------------------------------------------
-- RELATÓRIO 2: Ficha de Treino Completa
-- Objetivo: Mostrar qual aluno faz qual treino e com qual professor.
-- Recursos: Múltiplos JOINs (tabela associativa)
-- --------------------------------------------------------
SELECT 
    A.Nome_Aluno, 
    T.Nome_Treino, 
    T.Descricao_Treino,
    P.Nome_Professor AS Responsavel,
    AT.Data_Inicio
FROM ALUNOS A
JOIN ALUNO_TREINO AT ON A.Matricula_Aluno = AT.Matricula_Aluno
JOIN TREINO T ON AT.ID_Treino = T.ID_Treino
JOIN PROFESSORES P ON T.ID_Professor = P.Matricula_Professor;

-- --------------------------------------------------------
-- RELATÓRIO 3: Lista de Contatos
-- Objetivo: Listagem simples para comunicação.
-- Recursos: JOIN simples, ORDER BY alfabético
-- --------------------------------------------------------
SELECT 
    A.Nome_Aluno, 
    T.Numero_Telefone, 
    T.Tipo_Telefone
FROM ALUNOS A
JOIN TELEFONE_ALUNO T ON A.Matricula_Aluno = T.Matricula_Aluno
ORDER BY A.Nome_Aluno;