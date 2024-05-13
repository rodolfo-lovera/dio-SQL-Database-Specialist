show databases;

create database if not exists oficina_mecanica;

use oficina_mecanica;

-- Criação da tabela Cliente
CREATE TABLE Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY not null,
    Nome VARCHAR(255),
    Endereco VARCHAR(255),
    Celular CHAR(11) not null,
    Email VARCHAR(255),
    Tipo ENUM('PF', 'PJ')
);
-- Inserção de dados na tabela Cliente
INSERT INTO Cliente (ID_Cliente, Nome, Endereco, Celular, Email, Tipo) VALUES
(1,'João da Silva', 'Rua A, 123', '11987654321', 'joao@example.com', 'PF'),
(2,'Maria dos Santos', 'Rua B, 456', '11876543210', 'maria@example.com', 'PF'),
(3,'Empresa XYZ Ltda', 'Av. C, 789', '1176542109', 'contato@empresa.xyz', 'PJ');

-- Criação da tabela Veículo
CREATE TABLE Veiculo (
    Placa CHAR(7) PRIMARY KEY not null,
    Modelo VARCHAR(255)  not null,
    Ano INT not null,
    Quilometragem FLOAT not null,
    Cliente_ID INT not null,
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(ID_Cliente)
);
-- Inserção de dados na tabela Veiculo
INSERT INTO Veiculo (Placa, Modelo, Ano, Quilometragem, Cliente_ID) VALUES
('ABC1234', 'Fiat Uno', 2015, 60000, 1),
('XYZ5678', 'Volkswagen Gol', 2018, 40000, 1),
('DEF4321', 'Ford Fiesta', 2017, 55000, 2),
('JKL9876', 'Chevrolet Onix', 2019, 30000, 3);

-- Criação da tabela Mecanico
CREATE TABLE Mecanico (
    ID_Mecanico INT AUTO_INCREMENT PRIMARY KEY not null,
    Nome VARCHAR(255)  not null,
    Endereco VARCHAR(255),
    Especialidade VARCHAR(255)
);
-- Inserção de dados na tabela Mecanico
INSERT INTO Mecanico (ID_Mecanico, Nome, Endereco, Especialidade) VALUES
(1, 'Carlos Silva', 'Rua X, 123', 'Motor'),
(2, 'Ana Santos', 'Rua Y, 456', 'Suspensão'),
(3, 'José Oliveira', 'Rua Z, 789', 'Freios');

-- Criação da tabela Ordem_Serviço
CREATE TABLE Ordem_Servico (
    ID_OS INT AUTO_INCREMENT PRIMARY KEY not null,
    Data_Emissao DATE,
    Valor_Total DECIMAL(10, 2),
    Status VARCHAR(50),
    Data_Conclusao DATE,
    Cliente_ID_OS INT,
    Veiculo_Placa VARCHAR(10),
    FOREIGN KEY (Cliente_ID_OS) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (Veiculo_Placa) REFERENCES Veiculo(Placa)
);
-- Inserção de dados na tabela Ordem_Servico
INSERT INTO Ordem_Servico (ID_OS, Data_Emissao, Valor_Total, Status, Data_Conclusao, Cliente_ID_OS, Veiculo_Placa) VALUES
(1, '2024-05-20', 300.00, 'Em andamento', NULL, 1, 'ABC1234'),
(2, '2024-05-21', 400.00, 'Concluído', '2024-05-22', 2, 'XYZ5678'),
(3, '2024-05-22', 250.00, 'Em andamento', NULL, 3, 'DEF4321');

-- Criação da tabela Equipe_Mecânico
CREATE TABLE Equipe_Mecanico (
    ID_Equipe INT AUTO_INCREMENT PRIMARY KEY not null,
    ID_Mecanico INT not null,
    ID_OS INT not null,
    FOREIGN KEY (ID_Mecanico) REFERENCES Mecanico(ID_Mecanico),
    FOREIGN KEY (ID_OS) REFERENCES Ordem_Servico(ID_OS)
);
-- Inserção de dados na tabela Equipe_Mecanico
INSERT INTO Equipe_Mecanico (ID_Equipe, ID_mecanico, ID_Os) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- Criação da tabela Servico
CREATE TABLE Servico (
    ID_Servico INT AUTO_INCREMENT PRIMARY KEY  not null,
    Descricao VARCHAR(255),
    Valor DECIMAL(10, 2),
    Tempo_Estimado INT
);
-- Inserção de dados na tabela Servico
INSERT INTO Servico (ID_Servico, Descricao, Valor, Tempo_estimado) VALUES
(1, 'Troca de óleo', 50.00, 2),
(2, 'Reparo de motor', 200.00, 4),
(3, 'Troca de pneus', 150.00, 3);

-- Criação da tabela Peças
CREATE TABLE Pecas (
    ID_Peca INT AUTO_INCREMENT PRIMARY KEY not null,
    Descricao VARCHAR(255),
    Valor DECIMAL(10, 2),
    Fornecedor VARCHAR(255)
);

-- Inserção de dados na tabela Peca
INSERT INTO Pecas (ID_Peca, Descricao, Valor, Fornecedor) VALUES
(1, 'Filtro de óleo', 20.00, 'Fornecedor A'),
(2, 'Bateria', 150.00, 'Fornecedor B'),
(3, 'Pneu', 200.00, 'Fornecedor C');


-- Criação da tabela item_OS
CREATE TABLE Item_OS (
    ID_Item INT AUTO_INCREMENT PRIMARY KEY not null,
    ID_Servico INT,
    ID_Peca INT,
    ID_OS INT,
    FOREIGN KEY (ID_Servico) REFERENCES Servico(ID_Servico),
    FOREIGN KEY (ID_Peca) REFERENCES Pecas(ID_Peca),
    FOREIGN KEY (ID_OS) REFERENCES Ordem_Servico(ID_OS)
);

-- Inserção de dados na tabela item_OS
INSERT INTO item_OS (ID_item, ID_servico, ID_peca, ID_OS) VALUES
(1, 1, NULL, 1),
(2, NULL, 1, 1),
(3, 2, NULL, 2),
(4, NULL, 2, 2),
(5, 3, NULL, 3),
(6, NULL, 3, 3);









