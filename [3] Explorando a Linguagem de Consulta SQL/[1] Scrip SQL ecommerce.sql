create database ecommerce;
use ecommerce;

-- criação da tabela cliente. Dados inseridos
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(30),
    constraint unique_cpf_cliente unique (CPF)
);

-- criação da tabela produto. Dados inseridos
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(10) not null,
    classification_kids bool default false,
    category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
    avaliacao float default 0,
    size varchar(10)    
);


-- criação da tabela pedido.  Dados inseridos
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') not null default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,    
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
		on update cascade
);

-- criação da tabela estoque . Dados inseridos
create table productStorage(
		idProductStorage int auto_increment primary key,
        storageLocation varchar(255),
        quantity int default 0
);

-- criação da tabela fornecedor. Dados inseridos
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

-- criação da tabela vendedor. Dados inseridos
create table seller(
	idSeller int auto_increment primary	key,
    SocialName varchar(255) not null,
    CNPJ char(15),
    CPF char(9),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

select * from seller;

-- criação da tabela de relacionamento produto/vendedor.  Dados inseridos
create table productSeller(
	idPseller int,
    idProduct int,
    productQuantity int not null default 1,
    primary key (idPseller, idProduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references product (idProduct)
);

-- criação da tabela de relacionamento produto/pedido.  Dados inseridos 
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poquantity int default 1,
    poStatus enum('Disponível','Sem estoque') default 'Disponível',
    primary key (idPOproduct,idPOorder),
    constraint fk_productorder_seller foreign key(idPOproduct) references product(idProduct),
    constraint fk_productorder_prodict foreign key(idPOorder) references orders(idOrder) 
);

-- criação da tabela de relacionamento Estoque/produto
create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct,idLstorage),
    constraint fk_storageLocation_seller foreign key(idLproduct) references product(idProduct),
    constraint fk_storageLocation_product foreign key(idLstorage) references productStorage(idProductStorage)
);

-- criação da tabela de relacionamento produto/Fornecedor
create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_productsupplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_productsupplier_product foreign key (idPsProduct) references product(idProduct)
);


-- inserção de dados na tabela clients
INSERT INTO clients (Fname, Minit, Lname, CPF, Address) VALUES
('João', 'A', 'Silva', '12345678901', 'Rua A, 123'),
('Maria', 'B', 'Santos', '23456789012', 'Rua B, 456'),
('Pedro', 'C', 'Oliveira', '34567890123', 'Rua C, 789'),
('Ana', 'D', 'Ferreira', '45678901234', 'Rua D, 1011'),
('Lucas', 'E', 'Pereira', '56789012345', 'Rua E, 1213'),
('Julia', 'F', 'Rodrigues', '67890123456', 'Rua F, 1415'),
('Mateus', 'G', 'Almeida', '78901234567', 'Rua G, 1617'),
('Camila', 'H', 'Gomes', '89012345678', 'Rua H, 1819'),
('Gabriel', 'I', 'Martins', '90123456789', 'Rua I, 2021'),
('Carla', 'J', 'Lima', '01234567890', 'Rua J, 2223'),
('Felipe', 'K', 'Sousa', '98765432109', 'Rua K, 2425'),
('Amanda', 'L', 'Costa', '87654321098', 'Rua L, 2627'),
('Gustavo', 'M', 'Ribeiro', '76543210987', 'Rua M, 2829'),
('Bianca', 'N', 'Campos', '65432109876', 'Rua N, 3031'),
('Rafael', 'O', 'Silveira', '54321098765', 'Rua O, 3233');

-- inserção de dados na tabela product
INSERT INTO product (Pname, classification_kids, category, avaliacao, size) VALUES
('Celular', false, 'Eletrônico', 4.5, 'M'),
('Camiseta', false, 'Vestimenta', 4.2, 'P'),
('Bola', true, 'Brinquedos', 4.7, 'Único'),
('Arroz', true, 'Alimentos', 4.8, NULL),
('Sofá', false, 'Móveis', 4.3, 'G'),
('Tablet', false, 'Eletrônico', 4.6, 'M'),
('CalçaJeans', false, 'Vestimenta', 4.1, 'M'),
('Boneca', true, 'Brinquedos', 4.9, 'Único'),
('Feijão', true, 'Alimentos', 4.7, NULL),
('Cama', false, 'Móveis', 4.4, 'G'),
('Notebook', false, 'Eletrônico', 4.7, 'Único'),
('Vestido', false, 'Vestimenta', 4.3, 'P'),
('Bicicleta', true, 'Brinquedos', 4.8, 'G'),
('Chocolate', true, 'Alimentos', 4.6, 'Único'),
('Mesa', false, 'Móveis', 4.5, 'G');

-- inserção dos dados na tabela Orders
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) VALUES
(1, 'Confirmado', 'Reparo no motor', 50.99, false),
(2, 'Em processamento', 'Troca de tela', 80.50, false),
(3, 'Em processamento', 'Revisão geral', 120.00, true),
(4, 'Confirmado', 'Troca de bateria', 35.75, false),
(5, 'Cancelado', 'Troca de óleo', 25.00, false);

INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) VALUES
(6, 'Em processamento', 'Pedido de 2 tablets', 20.0, false),
(7, 'Em processamento', 'Pedido de 3 calças jeans', 15.5, true),
(8, 'Confirmado', 'Pedido de 4 bonecas', 20.0, false),
(9, 'Confirmado', 'Pedido de 2 pacotes de feijão', 15.5, false),
(10, 'Em processamento', 'Pedido de 1 cama', 10.0, true),
(11, 'Confirmado', 'Pedido de 1 notebook', 10.0, false),
(12, 'Em processamento', 'Pedido de 2 vestidos', 15.5, false),
(13, 'Confirmado', 'Pedido de 1 bicicleta', 10.0, false),
(14, 'Em processamento', 'Pedido de 3 chocolates', 15.5, true),
(15, 'Cancelado', 'Pedido de 1 mesa', 10.0, false),
(1, 'Em processamento', 'Pedido de 4 camisetas', 20.0, false),
(2, 'Confirmado', 'Pedido de 2 celulares', 10.0, true),
(3, 'Em processamento', 'Pedido de 3 bolas', 15.5, true),
(4, 'Em processamento', 'Pedido de 5 calças jeans', 20.0, false),
(5, 'Confirmado', 'Pedido de 2 bonecas', 15.5, true);

-- inserção dos dados na tabela ProductStorage
INSERT INTO productStorage (storageLocation, quantity) VALUES
('São Paulo', 100),
('Campinas', 150),
('São José dos Campos', 80),
('Santo André', 200),
('Santos', 120),
('Ribeirão Preto', 90),
('Sorocaba', 180),
('Osasco', 110);

INSERT INTO supplier (socialName, CNPJ, contact) VALUES
('Fornecedor A', '12345678901234', '11987654321'),
('Fornecedor B', '23456789012345', '11976543210'),
('Fornecedor C', '34567890123456', '11965432109'),
('Fornecedor D', '45678901234567', '11954321098'),
('Fornecedor E', '56789012345678', '11943210987'),
('Fornecedor F', '67890123456789', '11932109876'),
('Fornecedor G', '78901234567890', '11921098765'),
('Fornecedor H', '89012345678901', '11910987654'),
('Fornecedor I', '90123456789012', '11909876543'),
('Fornecedor J', '01234567890123', '11998765432'),
('Fornecedor K', '09876543210987', '11987654321'),
('Fornecedor L', '98765432109876', '11976543210');

INSERT INTO seller (SocialName, CNPJ, CPF, contact) VALUES
('Vendedor A', '12345678901234', NULL, '11987654321'),
('Vendedor B', '23456789012345', NULL, '11976543210'),
('Vendedor C', '34567890123456', NULL, '11965432109'),
('Vendedor D', '45678901234567', NULL, '11954321098'),
('Vendedor E', '56789012345678', NULL, '11943210987'),
('Vendedor F', '67890123456789', NULL, '11932109876'),
('Vendedor G', '78901234567890', NULL, '11921098765'),
('Vendedor H', '89012345678901', NULL, '11910987654'),
('Vendedor I', '90123456789012', NULL, '11909876543'),
('Vendedor J', '01234567890123', NULL, '11998765432'),
('Vendedor K', '09876543210987', NULL, '11987654321'),
('Vendedor L', '98765432109876', NULL, '11976543210');

INSERT INTO productSeller (idPseller, idProduct, productQuantity) VALUES
(1, 16, 10),
(1, 17, 20),
(2, 18, 15),
(2, 19, 30),
(3, 20, 25),
(3, 21, 10),
(4, 22, 20),
(4, 20, 15),
(5, 19, 10),
(5, 18, 25),
(6, 30, 15),
(6, 29, 20),
(7, 28, 10),
(7, 27, 25),
(8, 26, 20),
(8, 25, 15),
(9, 24, 10),
(9, 18, 20),
(10, 19, 25),
(10, 20, 15);

INSERT INTO productOrder (idPOproduct, idPOorder, poquantity, poStatus) VALUES
(18, 1, 2, 'Disponível'),
(19, 2, 3, 'Disponível'),
(20, 3, 5, 'Disponível'),
(21, 4, 2, 'Disponível'),
(22, 5, 1, 'Disponível'),
(23, 66, 2, 'Disponível'),
(24, 67, 3, 'Disponível'),
(25, 68, 4, 'Disponível'),
(26, 69, 2, 'Disponível'),
(27, 70, 5, 'Disponível'),
(28, 71, 1, 'Disponível'),
(29, 72, 2, 'Disponível'),
(30, 73, 3, 'Disponível');

-- Dados para a tabela storageLocation
INSERT INTO storageLocation (idLproduct, idLstorage, location) VALUES
(18, 1, 'São Paulo'),
(19, 2, 'Campinas'),
(20, 3, 'São José dos Campos'),
(21, 4, 'Santo André'),
(22, 5, 'Santos'),
(23, 6, 'Ribeirão Preto'),
(24, 7, 'Sorocaba'),
(25, 8, 'Osasco'),
(26, 1, 'São Paulo'),
(27, 2, 'Campinas'),
(28, 3, 'São José dos Campos'),
(29, 4, 'Santo André'),
(30, 5, 'Santos'),
(18, 6, 'Ribeirão Preto'),
(19, 7, 'Sorocaba'),
(20, 8, 'Osasco'),
(21, 1, 'São Paulo'),
(22, 2, 'Campinas'),
(23, 3, 'São José dos Campos'),
(24, 4, 'Santo André');

-- Dados para a tabela productSupplier
INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES
(1, 18, 100),
(2, 19, 150),
(3, 20, 80),
(4, 21, 200),
(5, 22, 120),
(6, 23, 90),
(7, 24, 180),
(8, 25, 110),
(9, 26, 100),
(10, 27, 150),
(11, 28, 80),
(12, 29, 200),
(1, 30, 120),
(2, 21, 90),
(3, 22, 180),
(4, 23, 110),
(5, 24, 100),
(6, 18, 150),
(7, 19, 80),
(8, 20, 200);

-- Algumas das perguntas que podes fazer para embasar as queries SQL:

	-- Qual é a média de avaliação dos produtos em cada categoria?
	SELECT category, AVG(avaliacao) AS media_avaliacao
		FROM product
		GROUP BY category;
	
    -- Quais são os produtos que têm uma classificação de avaliação acima de 4.5?
	SELECT Pname, category, avaliacao
		FROM product
		WHERE avaliacao > 4.5;
	
    -- Quais são os clientes que fizeram pedidos e pagaram em dinheiro?
	SELECT c.Fname, c.Lname
		FROM clients c
		JOIN orders o ON c.idClient = o.idOrderClient
		WHERE o.paymentCash = true;
	
    -- Quais são os vendedores que não têm CPF registrado?	
	SELECT SocialName
		FROM seller
		WHERE CPF IS NULL;
	
    -- Quantos pedidos foram confirmados em cada localização de armazenamento?
	SELECT ps.location, COUNT(*) AS total_pedidos_confirmados
		FROM orders o
		JOIN storageLocation ps ON o.idPOorder = ps.idLstorage
		WHERE o.orderStatus = 'Confirmado'
		GROUP BY ps.location;
    
	-- Qual é o valor total de vendas para cada cliente?
	SELECT c.Fname, c.Lname, SUM(o.sendValue) AS total_vendas
		FROM clients c
		JOIN orders o ON c.idClient = o.idOrderClient
		GROUP BY c.idClient;
	
    -- Quais são os produtos que estão com estoque abaixo de 50 unidades?
	SELECT Pname, quantity
		FROM productStorage
		WHERE quantity < 50;
    
	-- Qual é o fornecedor com o maior número de produtos fornecidos?
	SELECT s.socialName, COUNT(ps.idPsProduct) AS total_produtos_fornecidos
		FROM supplier s
		JOIN productSupplier ps ON s.idSupplier = ps.idPsSupplier
		GROUP BY s.socialName
		ORDER BY total_produtos_fornecidos DESC
		LIMIT 1;
	
    -- Quais são os produtos que foram pedidos mais de uma vez?
	SELECT Pname, COUNT(*) AS total_pedidos
		FROM productOrder po
		JOIN product p ON po.idPOproduct = p.idProduct
		GROUP BY po.idPOproduct
		HAVING COUNT(*) > 1;
	
    -- Quais são os clientes que fizeram mais de um pedido cancelado?
	SELECT c.Fname, c.Lname, COUNT(*) AS total_pedidos_cancelados
		FROM clients c
		JOIN orders o ON c.idClient = o.idOrderClient
		WHERE o.orderStatus = 'Cancelado'
		GROUP BY c.idClient
		HAVING COUNT(*) > 1;

-- Melhorias sugeridas
	-- 1 Modificação das tabelas existentes:
		-- Adicionando coluna para tipo de cliente (Pessoa Física ou Pessoa Jurídica) na tabela clients
		ALTER TABLE clients
		ADD COLUMN clientType ENUM('PF', 'PJ') NOT NULL;

		-- Removendo colunas relacionadas a CPF e CNPJ da tabela clients
		ALTER TABLE clients
		DROP COLUMN CPF;

		-- Removendo colunas relacionadas a CPF e CNPJ da tabela seller
		ALTER TABLE seller
		DROP COLUMN CPF;
	-- 2 Criação da nova tabela para Pagamento:
		-- Criação da tabela de Pagamento
		CREATE TABLE payment (
			idPayment INT AUTO_INCREMENT PRIMARY KEY,
			idOrder INT,
			paymentMethod VARCHAR(50) NOT NULL,
			amount FLOAT NOT NULL,
			FOREIGN KEY (idOrder) REFERENCES orders(idOrder)
		);
	-- 3 Adição de colunas para Entrega na tabela de pedidos:
		-- Adicionando coluna para status de entrega na tabela orders
		ALTER TABLE orders
		ADD COLUMN deliveryStatus ENUM('Pendente', 'Em trânsito', 'Entregue', 'Atrasado') DEFAULT 'Pendente';

		-- Adicionando coluna para código de rastreio na tabela orders
		ALTER TABLE orders
		ADD COLUMN trackingCode VARCHAR(50);