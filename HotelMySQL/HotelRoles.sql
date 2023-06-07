create role administrador;
create role cliente;
create role funcionario;
create role recepcionista;

DROP USER IF EXISTS 'Admin'@'%';
CREATE USER 'Admin'@'%'
identified by 'passAdmin';
grant administrador to 'Admin'@'%';


DROP USER IF EXISTS 'Dinis'@'%';
CREATE USER 'Dinis'@'%'
identified by 'passDinis';

DROP USER IF EXISTS 'Antonio'@'%';
CREATE USER 'Antonio'@'%'
identified by 'passAntonio';

DROP USER IF EXISTS 'Margarida'@'%';
CREATE USER 'Margarida'@'%'
identified by 'passMargarida';

DROP USER IF EXISTS 'Tomas'@'%';
CREATE USER 'Tomas'@'%'
identified by 'passTomas';

DROP USER IF EXISTS 'Pedro'@'%';
CREATE USER 'Pedro'@'%'
identified by 'passPedro';

DROP USER IF EXISTS 'Flavia'@'%';
CREATE USER 'Flavia'@'%'
identified by 'passFlavia';


DROP USER IF EXISTS 'Daniel'@'%';
CREATE USER 'Daniel'@'%'
identified by 'passDaniel';

DROP USER IF EXISTS 'Joao'@'%';
CREATE USER 'Joao'@'%'
identified by 'passJoao';

DROP USER IF EXISTS 'Francisco'@'%';
CREATE USER 'Francisco'@'%'
identified by 'passFrancisco';

DROP USER IF EXISTS 'Rafa'@'%';
CREATE USER 'Rafa'@'%'
identified by 'passRafa';

DROP USER IF EXISTS 'Rui'@'%';
CREATE USER 'Rui'@'%'
identified by 'passRui';

DROP USER IF EXISTS 'Tuga'@'%';
CREATE USER 'Tuga'@'%'
identified by 'passTuga';


grant funcionario to 'Dinis'@'%';
grant funcionario to 'Antonio'@'%';
grant funcionario to 'Pedro'@'%';
grant funcionario to 'Tomas'@'%';
grant funcionario to 'Margarida'@'%';
grant funcionario to 'Flavia'@'%';

grant recepcionista to 'Margarida'@'%';
grant recepcionista to 'Pedro'@'%';
grant recepcionista to 'Tomas'@'%';

grant cliente to 'Daniel'@'%';
grant cliente to 'Joao'@'%';
grant cliente to 'Francisco'@'%';
grant cliente to 'Tuga'@'%';
grant cliente to 'Rafa'@'%';
grant cliente to 'Rui'@'%';

grant execute on PROCEDURE CriarHospede TO cliente, recepcionista, administrador;
grant execute on PROCEDURE CriarReserva TO cliente, recepcionista, administrador;
grant execute on PROCEDURE CriarFuncionario TO administrador;
grant execute on PROCEDURE AtualizarDatasCheckInCheckOut TO administrador, recepcionista, cliente;
grant execute on PROCEDURE AtualizarNumeroHospedes TO administrador, recepcionista, cliente;
grant execute on PROCEDURE AtualizarCamaExtra TO administrador, recepcionista, cliente;
grant execute on PROCEDURE AtualizarDadosPessoaisHospede TO administrador, recepcionista, cliente;
grant execute on PROCEDURE AtualizarMetodoPagamento TO administrador, recepcionista, cliente;
grant execute on PROCEDURE quartos_livres TO administrador, recepcionista;
grant execute on PROCEDURE criarHospedeReserva TO recepcionista, administrador;
grant execute on PROCEDURE criarQuartoReserva TO recepcionista, administrador;
grant execute on PROCEDURE criarHospedeQuarto TO recepcionista, administrador;
 


