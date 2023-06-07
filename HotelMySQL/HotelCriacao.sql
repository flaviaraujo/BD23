USE `Hotel`;

DELIMITER //

-- Primeira função a correr, que verifica se existem quartos disponíveis
CREATE PROCEDURE quartos_livres()
BEGIN
    DECLARE quartos VARCHAR(500) DEFAULT '';
    
    SELECT GROUP_CONCAT(nr_quarto SEPARATOR ', ') INTO quartos
    FROM `Hotel`.`quarto`
    WHERE disponibilidade = 1;
    
    IF quartos IS NULL THEN
        SET quartos = 'Não há quartos disponíveis.';
    END IF;
    
    SELECT quartos AS quartos_disponiveis;
END //
-- call quartos_livres();

-- Procedure que acrescenta um novo hóspede.
CREATE PROCEDURE CriarHospede(
    IN nome VARCHAR(100),
    IN email VARCHAR(100),
    IN NIF VARCHAR(45),
    IN NIB VARCHAR(45),
    IN contacto_telefonico VARCHAR(45),
    IN data_nascimento DATETIME
)
BEGIN
	IF NOT EXISTS (
		SELECT *
		FROM hospede
		where hospede.NIF = NIF
    )
    THEN
    INSERT INTO hospede (nome, email, NIF, NIB, contacto_telefonico, data_nascimento)
		VALUES (nome, email, NIF, NIB, contacto_telefonico, data_nascimento);
	END IF;
END//


-- Procedure que acrescenta uma nova reserva.
CREATE PROCEDURE CriarReserva(
    IN nr_pessoas INT,
    IN nr_quartos INT,
    IN check_in DATETIME,
    IN check_out DATETIME,
    IN metodo_pagamento VARCHAR(45),
    IN preco_quarto INT,
    IN preco_total INT
)
BEGIN

	INSERT INTO reserva (nr_pessoas, nr_quartos, check_in, check_out, metodo_pagamento, preco_quarto, preco_total)
	VALUES (nr_pessoas, nr_quartos, check_in, check_out, metodo_pagamento, preco_quarto, preco_total);

END//


-- Procedure que acrescenta um novo funcionário.
CREATE PROCEDURE CriarFuncionario(
    IN nr_funcionario INT,
    IN email VARCHAR(45),
    IN nome VARCHAR(100),
    IN contacto_telefonico VARCHAR(45),
    IN NIB VARCHAR(45),
    IN NIF VARCHAR(45),
    IN salario DOUBLE,
    IN nr_cartao_cidadao VARCHAR(45),
    IN rua VARCHAR(100),
    IN localidade VARCHAR(45),
    IN codigo_postal VARCHAR(45)
)
BEGIN
	IF NOT EXISTS (
		SELECT *
		FROM funcionario
		where funcionario.nr_funcionario = nr_funcionario
    )
    THEN
		INSERT INTO funcionario (nr_funcionario, email, nome, contacto_telefonico, NIB, NIF, salario, nr_cartao_cidadao, rua, localidade, codigo_postal)
		VALUES (nr_funcionario, email, nome, contacto_telefonico, NIB, NIF, salario, nr_cartao_cidadao, rua, localidade, codigo_postal);
	END IF;
END //

-- Procedures que depois de criar o cliente e a sua reserva adiciona os elementos as tabelas de ligação.

CREATE PROCEDURE criarHospedeQuarto(
	IN n_hospede INT,
    IN n_quarto INT
)
BEGIN
	INSERT INTO quarto_hospede (nr_quarto, id_hospede)
    VALUES (n_quarto, n_hospede);

    UPDATE quarto SET disponibilidade = 0 WHERE nr_quarto = n_quarto;
END//


Create PROCEDURE criarQuartoReserva(
	IN n_quarto int,
    IN n_reserva int
)
BEGIN
	INSERT INTO quarto_reserva (nr_quarto, nr_reserva)
    VALUES (n_quarto, n_reserva);
END //

Create PROCEDURE criarHospedeReserva(
	IN n_reserva int,
    IN n_hospede int
)
BEGIN
	INSERT INTO hospede_reserva (nr_hospede, nr_reserva)
    VALUES (n_hospede, n_reserva);
END //

DELIMITER ;



