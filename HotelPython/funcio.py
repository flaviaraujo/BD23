import csv
import mysql.connector
import subprocess

# Conectar ao banco de dados MySQL
db = mysql.connector.connect(host='localhost', user='root', password='PMDlj2003', database='Hotel')
cursor = db.cursor()

# Função para povoar uma tabela com base em um arquivo CSV
def povoar_tabela(nome_tabela, nome_arquivo_csv):
    # Caminho para o arquivo CSV
    csv_file = nome_arquivo_csv

    # Ler o arquivo CSV e inserir os dados na tabela correspondente
    with open(csv_file, 'r') as file:
        csv_data = csv.reader(file)
        next(csv_data)  # Pular o cabeçalho do CSV

        for row in csv_data:
            # Escapar os valores antes de inserir na consulta
            values = [f"'{value}'" if isinstance(value, str) else str(value) for value in row]

            # Inserir os dados na tabela correspondente
            query = f"INSERT INTO {nome_tabela} VALUES ({', '.join(values)})"
            cursor.execute(query)

    print(f'Dados inseridos na tabela {nome_tabela} com sucesso!')

# Povoar as tabelas
povoar_tabela('funcionario', 'funcionarios.csv')
povoar_tabela('servico_rececao', 'servico_rececao.csv')
povoar_tabela('servico_funcionario', 'servico_funcionario.csv')
povoar_tabela('hospede', 'hospede.csv')
povoar_tabela('reserva', 'reserva.csv')
povoar_tabela('quarto', 'quarto.csv')
povoar_tabela('hospede_reserva', 'hospede_reserva.csv')
povoar_tabela('quarto_reserva', 'quarto_reserva.csv')
povoar_tabela('quarto_hospede', 'quarto_hospede.csv')

# Confirmar a transação e fechar a conexão com o banco de dados
db.commit()
db.close()

print('Povoamento de tabelas concluído com sucesso!')
