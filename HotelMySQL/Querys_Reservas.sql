USE `Hotel`;

DELIMITER //

-- Procedure para atualização/remoção da/das datas de check-in e/ou check-out.

CREATE PROCEDURE AtualizarDatasCheckInCheckOut(
    IN n_reserva INT,
    IN novo_check_in DATETIME,
    IN novo_check_out DATETIME
)
BEGIN
    UPDATE reserva
    SET check_in = novo_check_in, check_out = novo_check_out
    WHERE nr_reserva = n_reserva;
END//


-- Procedure para atualização/remoção de número de hóspedes associados a uma reserva.
CREATE PROCEDURE AtualizarNumeroHospedes(
    IN n_reserva INT,
    IN novo_nr_hospedes INT
)
BEGIN
    UPDATE reserva
    SET nr_pessoas = novo_nr_hospedes
    WHERE nr_reserva = n_reserva;
END//


-- Procedure para atualização/remoção do pedido de uma cama extra.
CREATE PROCEDURE AtualizarCamaExtra(
    IN n_quarto INT,
    IN cam_extra TINYINT
)
BEGIN
    UPDATE quarto
    SET cama_extra = cam_extra
    WHERE nr_quarto = n_quarto;
END//


-- atualizar os dados de um hóspede.
CREATE PROCEDURE AtualizarDadosPessoaisHospede(
    IN id_hospede INT,
    IN novo_nome VARCHAR(100),
    IN novo_email VARCHAR(100),
    IN novo_NIF VARCHAR(45),
    IN novo_NIB varchar(45),
    IN novo_contacto varchar(45)
)
BEGIN
    UPDATE hospede
    SET nome = novo_nome, email = novo_email, NIF = novo_NIF, NIB = novo_NIB, contacto_telefonico = novo_contacto
    WHERE id_hospede = id_hospede;
END //

-- atualizar o método de pagamento de uma reserva.
CREATE PROCEDURE AtualizarMetodoPagamento(
    IN nr_reserva INT,
    IN novo_metodo_pagamento VARCHAR(45)
)
BEGIN
    UPDATE reserva
    SET metodo_pagamento = novo_metodo_pagamento
    WHERE nr_reserva = nr_reserva;
END //


DELIMITER ;



