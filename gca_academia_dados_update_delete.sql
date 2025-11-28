-- SCRIPT 4: MANIPULAÇÃO DE DADOS (UPDATE e DELETE)
-- Este script contém exemplos de alterações e exclusões com filtros de segurança (WHERE).

-- --------------------------------------------------------
-- COMANDOS DE UPDATE 
-- --------------------------------------------------------

-- 1. Reajuste inflacionário: Aumentar em 10% todas as mensalidades que estão 'Pendente'
-- Objetivo: Atualização em massa baseada em status.
UPDATE PAGAMENTO_ALUNOS
SET Valor_Mensalidade = Valor_Mensalidade * 1.10
WHERE Status_Pagamento = 'Pendente';

-- 2. Alterar o responsável de um treino específico
-- Cenário: O professor 'Helio Gracie' vai assumir o treino 'Boxe Iniciante'.
-- Utilizamos subconsulta para buscar os IDs corretos sem precisar saber o número.
UPDATE TREINO
SET ID_Professor = (SELECT Matricula_Professor FROM PROFESSORES WHERE Nome_Professor = 'Helio Gracie')
WHERE Nome_Treino = 'Boxe Iniciante';

-- 3. Corrigir o telefone da aluna 'Alice Maravilha'
-- Cenário: Atualização pontual de cadastro.
UPDATE TELEFONE_ALUNO
SET Numero_Telefone = '(11) 99999-8888'
WHERE Matricula_Aluno = (SELECT Matricula_Aluno FROM ALUNOS WHERE CPF = '101.101.101-01');


-- --------------------------------------------------------
-- COMANDOS DE DELETE
-- Nota: Deletamos dados "periféricos" para manter a integridade referencial.
-- --------------------------------------------------------

-- 1. Remover pagamentos antigos de valor baixo (Limpeza de histórico)
DELETE FROM PAGAMENTO_ALUNOS
WHERE Status_Pagamento = 'Pago' AND Valor_Mensalidade < 100.00;

-- 2. Cancelar a matrícula de um aluno em um treino específico
-- Cenário: O aluno 'Bob Esponja' desistiu do treino 'Zumba Fest'.
DELETE FROM ALUNO_TREINO
WHERE Matricula_Aluno = (SELECT Matricula_Aluno FROM ALUNOS WHERE Nome_Aluno = 'Bob Esponja')
  AND ID_Treino = (SELECT ID_Treino FROM TREINO WHERE Nome_Treino = 'Zumba Fest');

-- 3. Excluir um telefone específico
-- Cenário: Remoção de um contato desatualizado.
DELETE FROM TELEFONE_ALUNO
WHERE Numero_Telefone = '(11) 90000-0000';