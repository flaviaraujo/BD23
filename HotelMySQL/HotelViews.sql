-- Views

USE `Hotel`;

--
-- vista que mostra os detalhes de um hóspede e do seu quarto.
CREATE VIEW vw_quarto_hospede AS
SELECT q.nr_quarto, q.cama_extra, q.disponibilidade, q.tipo_quarto, h.id_hospede, h.nome,
 h.email, h.NIF, h.NIB, h.contacto_telefonico, h.data_nascimento
FROM quarto q
INNER JOIN quarto_hospede qh ON q.nr_quarto = qh.nr_quarto
INNER JOIN hospede h ON qh.id_hospede = h.id_hospede;

-- SELECT * FROM vw_quarto_hospede;


--
-- vista que mostra os detalhes dos funcionários que trabalham na receção.
CREATE VIEW vw_funcionario_servico AS
SELECT f.nr_funcionario, f.email, f.nome, f.contacto_telefonico, f.NIB, f.NIF, f.salario,
 f.nr_cartao_cidadao, f.rua, f.localidade, f.codigo_postal,
sr.email_geral, sr.inicio_turno, sr.fim_turno
FROM funcionario f
INNER JOIN servico_rececao sr ON f.nr_funcionario = sr.nr_funcionario;

-- SELECT * FROM vw_funcionario_servico;


--
-- vista que mostra os detalhes dos hóspedes e as suas respetivas reservas.
CREATE VIEW vw_hospede_reserva AS
SELECT h.id_hospede, h.nome, h.email, h.NIF, h.NIB, h.contacto_telefonico, h.data_nascimento,
       r.nr_reserva, r.nr_pessoas, r.nr_quartos, r.check_in, r.check_out, r.metodo_pagamento,
       r.preco_quarto, r.preco_total
FROM hospede h
INNER JOIN hospede_reserva hr ON h.id_hospede = hr.nr_hospede
INNER JOIN reserva r ON hr.nr_reserva = r.nr_reserva;

-- SELECT * FROM vw_hospede_reserva;


