USE `hotel`;

-- Chamar a stored procedure para criar um novo hóspede
CALL CriarHospede('John Doe', 'johndoe@example.com', '123456789', '987654321', '987654321', '1990-01-01');

-- Chamar a stored procedure para criar uma nova reserva
CALL CriarReserva(4, 1, '2023-06-01', '2023-06-03', 'Multibanco', 100, 300);

-- Chamar as stored procedures para adicionar os elementos às tabelas de ligação
CALL criarHospedeQuarto(7, 6);
CALL criarQuartoReserva(6, 4);
CALL criarHospedeReserva(4, 7);
