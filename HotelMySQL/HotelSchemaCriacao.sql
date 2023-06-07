-- Schema Hotel
CREATE SCHEMA IF NOT EXISTS `Hotel`;
USE `Hotel`;

-- Table `Hotel`.`funcionario`
CREATE TABLE IF NOT EXISTS  `Hotel`.`funcionario` (
  nr_funcionario INT NOT NULL,
  email VARCHAR(45) NOT NULL UNIQUE,
  nome VARCHAR(100) NOT NULL,
  contacto_telefonico VARCHAR(45) NOT NULL UNIQUE,
  NIB VARCHAR(45) NOT NULL,
  NIF VARCHAR(45) NOT NULL UNIQUE,
  salario DOUBLE NOT NULL,
  nr_cartao_cidadao VARCHAR(45) NOT NULL,
  rua VARCHAR(100) NOT NULL,
  localidade VARCHAR(45) NOT NULL,
  codigo_postal VARCHAR(45) NOT NULL,
  PRIMARY KEY(nr_funcionario)
);

-- Table `Hotel`.`hospede`
CREATE TABLE IF NOT EXISTS  `Hotel`.`hospede`(
    id_hospede INT NOT NULL UNIQUE auto_increment,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    NIF VARCHAR(45) NOT NULL UNIQUE,
    NIB VARCHAR(45) NOT NULL, 
    contacto_telefonico VARCHAR(45) NOT NULL UNIQUE,
    data_nascimento DATETIME NOT NULL,
    PRIMARY KEY(id_hospede)
);

-- Table `Hotel`.`quarto`
CREATE TABLE IF NOT EXISTS  `Hotel`.`quarto`(
    nr_quarto INT NOT NULL UNIQUE,
    cama_extra TINYINT NOT NULL,
    disponibilidade TINYINT NOT NULL,
    tipo_quarto VARCHAR(45) NOT NULL,  
    PRIMARY KEY(nr_quarto)
);

-- Table `Hotel`.`servico_rececao`
CREATE TABLE IF NOT EXISTS `Hotel`.`servico_rececao` (
    nr_funcionario INT NOT NULL UNIQUE,
    email_geral VARCHAR(50) NOT NULL,
    contacto_telefonico VARCHAR(45) NOT NULL,
    inicio_turno TIME NOT NULL,
    fim_turno TIME NOT NULL,
    PRIMARY KEY (nr_funcionario),
    FOREIGN KEY (nr_funcionario) REFERENCES `Hotel`.`funcionario` (nr_funcionario)
);

-- Table `Hotel`.`reserva`
CREATE TABLE IF NOT EXISTS  `Hotel`.`reserva`(
    nr_reserva INT NOT NULL UNIQUE auto_increment,
    nr_pessoas INT NOT NULL,
    nr_quartos INT NOT NULL,
    check_in DATETIME NOT NULL,    
    check_out DATETIME NOT NULL,
    metodo_pagamento VARCHAR(45) NOT NULL,
    preco_quarto INT NOT NULL,
    preco_total INT NOT NULL,
    PRIMARY KEY(nr_reserva)
);

-- Table `Hotel`.`servico_funcionario`
CREATE TABLE IF NOT EXISTS  `Hotel`.`servico_funcionario`(
    nr_funcionario INT NOT NULL,
    FOREIGN KEY (nr_funcionario) REFERENCES `Hotel`.`servico_rececao` (nr_funcionario),
    FOREIGN KEY (nr_funcionario) REFERENCES `Hotel`.`funcionario` (nr_funcionario)
);

-- Table `Hotel`.`hospede_reserva`
CREATE TABLE IF NOT EXISTS  `Hotel`.`hospede_reserva`(
    nr_hospede INT NOT NULL,
    nr_reserva INT NOT NULL,
    FOREIGN KEY (nr_hospede) REFERENCES `Hotel`.`hospede` (id_hospede),
    FOREIGN KEY (nr_reserva) REFERENCES `Hotel`.`reserva` (nr_reserva)
);

-- Table `Hotel`.`quarto_reserva`
CREATE TABLE IF NOT EXISTS  `Hotel`.`quarto_reserva`(
    nr_quarto INT NOT NULL,
    nr_reserva INT NOT NULL,
    FOREIGN KEY (nr_quarto) REFERENCES `Hotel`.`quarto` (nr_quarto),
    FOREIGN KEY (nr_reserva) REFERENCES `Hotel`.`reserva` (nr_reserva)
);

-- Table `Hotel`.`quarto_hospede`
CREATE TABLE IF NOT EXISTS  `Hotel`.`quarto_hospede`(
    nr_quarto INT NOT NULL,
    id_hospede INT NOT NULL,
    FOREIGN KEY (id_hospede) REFERENCES `Hotel`.`hospede` (id_hospede),
    FOREIGN KEY (nr_quarto) REFERENCES `Hotel`.`quarto` (nr_quarto)
);
