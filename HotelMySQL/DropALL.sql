USE `Hotel`;

DELETE FROM quarto_hospede;
DELETE FROM hospede_reserva;
DELETE FROM quarto_reserva;
DELETE FROM reserva;
DELETE FROM quarto;
DELETE FROM servico_funcionario;
DELETE FROM servico_rececao;
DELETE FROM hospede;
DELETE FROM funcionario;


-- Excluir tabelas que possuem chaves estrangeiras
DROP TABLE IF EXISTS `Hotel`.`hospede_reserva`;
DROP TABLE IF EXISTS `Hotel`.`quarto_reserva`;
DROP TABLE IF EXISTS `Hotel`.`quarto_hospede`;
DROP TABLE IF EXISTS `Hotel`.`servico_funcionario`;
DROP TABLE IF EXISTS `Hotel`.`hospede`;
DROP TABLE IF EXISTS `Hotel`.`reserva`;

-- Excluir tabelas que não possuem chaves estrangeiras
DROP TABLE IF EXISTS `Hotel`.`servico_rececao`;
DROP TABLE IF EXISTS `Hotel`.`funcionario`;
