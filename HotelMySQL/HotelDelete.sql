-- Desabilitar verificação de chaves estrangeiras temporariamente
use `hotel`;

SET FOREIGN_KEY_CHECKS = 0;

-- Deletar todos os elementos das tabelas
TRUNCATE TABLE quarto_hospede;
TRUNCATE TABLE quarto_reserva;
TRUNCATE TABLE hospede_reserva;
TRUNCATE TABLE reserva;
TRUNCATE TABLE quarto;
TRUNCATE TABLE hospede;
TRUNCATE TABLE servico_funcionario;
TRUNCATE TABLE servico_rececao;
TRUNCATE TABLE funcionario;

-- Reabilitar verificação de chaves estrangeiras
SET FOREIGN_KEY_CHECKS = 1;
