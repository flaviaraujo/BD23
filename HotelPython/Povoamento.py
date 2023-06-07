import mysql.connector
import subprocess

# Conectar ao banco de dados
cnx = mysql.connector.connect(
    host="localhost",
    user="root",
    password="PMDlj2003",
    database="Hotel"
)

# Criar o cursor
cursor = cnx.cursor()

# Desativar as verificações seguras de SQL
cursor.execute("SET GLOBAL SQL_SAFE_UPDATES = 0")

# Povoamento da tabela "funcionarios"
funcionario = [
    (1, 'dinis@gmail.com', 'Dinis_Primenta', '912233445', '12345678901234567890123', '123456781', 1000, '123', 'rua_da_paz', 'braga', '1000-001'),
    (2, 'antonio@gmail.com', 'Antonio_Pedro', '912345678', '12345678901234567890567', '123456777', 750, '234', 'rua_do_sol', 'braga', '1000-001'),
    (3, 'margarida@gmail.com', 'Margarida_Pimenta', '937283445', '12345678901234567890123', '123456785', 870, '345', 'rua_dos_pinheiros', 'braga', '1000-001'),
    (4, 'tomas@gmail.com', 'Tomas_Pinto', '936739573', '12345678901234567890123', '123456782', 780, '456', 'rua_dos_jardins', 'braga', '1000-001'),
    (5, 'pedro@gmail.com', 'Pedro_Azevedo', '962056397', '12345678901234567890123', '123456783', 750, '567', 'rua_dos_lirios', 'braga', '1000-001'),
    (6, 'flavia@gmail.com', 'Flavia_Araujo', '9163890375', '12345678901234567890123', '123456784', 950, '678', 'rua_das_flores', 'braga', '1000-001')
]

insert_funcionario = "INSERT INTO funcionario (nr_funcionario, email, nome, contacto_telefonico, NIB, NIF, salario, nr_cartao_cidadao, rua, localidade, codigo_postal) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"

cursor.executemany(insert_funcionario, funcionario)

# Povoamento da tabela "servico_rececao"
servico_rececao = [
    (3, 'Edenhotel@gmail.com', '252987123', '00:00:00', '08:00:00'),
    (4, 'Edenhotel@gmail.com', '252987123', '08:00:00', '16:00:00'),
    (5, 'Edenhotel@gmail.com', '252987123', '16:00:00', '00:00:00')
]

insert_servico_rececao = "INSERT INTO servico_rececao (nr_funcionario, email_geral, contacto_telefonico, inicio_turno, fim_turno) VALUES (%s, %s, %s, %s, %s)"

cursor.executemany(insert_servico_rececao, servico_rececao)

# Povoamento da tabela "servico_funcionario"
servico_funcionario = [
    (3,),
    (4,),
    (5,)
]

insert_servico_funcionario = "INSERT INTO servico_funcionario (nr_funcionario) VALUES (%s)"

cursor.executemany(insert_servico_funcionario, servico_funcionario)

# Povoamento da tabela "Hospede"
hospede = [
    (1, 'daniel@gmail.com', 'daniel_cracel', '915672893', '12345678901234567890126', '123456780', '1970-01-01'),
    (2, 'joao@gmail.com', 'joao_moura', '915672894', '12345678901234567890127', '123456781', '1973-04-15'),
    (3, 'francisco@gmail.com', 'francisco_afonso', '915672895', '12345678901234567890122', '123456785', '1976-08-28'),
    (4, 'tuga@gmail.com', 'tuga_batista', '915672896', '12345678901234567890129', '123456783', '1978-03-10'),
    (5, 'rafa@gmail.com', 'rafael_peixoto', '915672897', '12345678901234567890120', '123456784', '1979-11-22'),
    (6, 'rui@gmail.com', 'rui_pinto', '915672898', '12345678901234567890121', '123456786', '1979-10-22')
]

insert_hospede = "INSERT INTO hospede (id_hospede, email, nome, contacto_telefonico, NIB, NIF, data_nascimento) VALUES (%s, %s, %s, %s, %s, %s, %s)"

cursor.executemany(insert_hospede, hospede)

# Povoamento da tabela "reservas"
reserva = [
    (1, 1, 1, '2023-05-26 10:30:00', '2023-05-28 10:30:00', 'multibanco', 50, 110),
    (2, 2, 1, '2023-05-26 10:30:00', '2023-05-29 10:30:00', 'multibanco', 50, 160),
    (3, 3, 2, '2023-05-30 10:30:00', '2023-06-03 10:30:00', 'multibanco', 100, 710)
]

insert_reserva = "INSERT INTO reserva (nr_reserva, nr_pessoas, nr_quartos, check_in, check_out, metodo_pagamento, preco_quarto, preco_total) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"

cursor.executemany(insert_reserva, reserva)

# Povoamento da tabela "quarto"
quarto = [
    (1, 0, 1, 'normal'),
    (2, 0, 0, 'executivo'),
    (3, 0, 0, 'suite'),
    (4, 0, 0, 'normal'),
    (5, 1, 0, 'executivo'),
    (6, 0, 1, 'suite')
]

insert_quarto = "INSERT INTO quarto (nr_quarto, cama_extra, disponibilidade, tipo_quarto) VALUES (%s, %s, %s, %s)"

cursor.executemany(insert_quarto, quarto)

# Povoamento da tabela "hospede_reserva"
hospede_reserva = [
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 2),
    (5, 3),
    (6, 3)
]

insert_hospede_reserva = "INSERT INTO hospede_reserva (nr_hospede, nr_reserva) VALUES (%s, %s)"

cursor.executemany(insert_hospede_reserva, hospede_reserva)

# Povoamento da tabela "quarto_reserva"
quarto_reserva = [
    (2, 1),
    (3, 2),
    (4, 3),
    (5, 3)
]

insert_quarto_reserva = "INSERT INTO quarto_reserva(nr_quarto, nr_reserva) VALUES (%s, %s)"

cursor.executemany(insert_quarto_reserva, quarto_reserva)

# Povoamento da tabela "quarto_hospede"
quarto_hospede = [
    (2, 1),
    (3, 2),
    (4, 3),
    (3, 4),
    (5, 5),
    (5, 6)
]

insert_quarto_hospede = "INSERT INTO quarto_hospede(nr_quarto, id_hospede) VALUES (%s, %s)"

cursor.executemany(insert_quarto_hospede, quarto_hospede)

# Confirmar as alterações no banco de dados
cnx.commit()


# Tabelas a serem consultadas
tabelas = ["funcionario", "servico_rececao", "servico_funcionario", "hospede", "reserva", "quarto", "hospede_reserva", "quarto_reserva", "quarto_hospede"]

# Iterar sobre as tabelas e imprimir os resultados
for tabela in tabelas:
    print(f"Tabela: {tabela}")
    print("------------------")
    cursor.execute(f"SELECT * FROM {tabela}")
    for row in cursor.fetchall():
        print(row)
    print()


# Fechar o cursor e a conexão
cursor.close()
cnx.close()


# Criar o backup do banco de dados
backup_file = "backup.sql"
database_name = "Hotel"
database_user = "root"
database_password = "PMDlj2003"

command = f"mysqldump --user={database_user} --password={database_password} {database_name} > {backup_file}"
subprocess.run(command, shell=True)

print("Backup criado com sucesso.")