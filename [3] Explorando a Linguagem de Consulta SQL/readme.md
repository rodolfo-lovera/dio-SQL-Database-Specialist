# Exercícios de Modelagem de Banco de Dados

## 1. Projeto E-commerce

Este é um projeto de banco de dados para um sistema de e-commerce, que inclui a criação da estrutura do banco de dados, inserção de dados, consultas para responder perguntas relacionadas ao negócio e uma modificação nas tabelas para adicionar novos recursos.

### Desenvolvimento do Script para a Base de Dados

O script para a base de dados consiste na criação das tabelas necessárias para o funcionamento do sistema de e-commerce. Ele inclui as tabelas para clientes, produtos, pedidos, estoque, fornecedores, vendedores e relacionamentos entre essas entidades.

### Scripts para Inserção dos Dados

Os scripts de inserção de dados preenchem as tabelas criadas com exemplos de dados fictícios. Isso inclui informações de clientes, produtos, pedidos, estoque, fornecedores e vendedores.

### Scripts para Responder Perguntas

Foram desenvolvidas queries SQL para responder a diversas perguntas relacionadas ao negócio do e-commerce. As perguntas incluem consultas simples, filtros, expressões para atributos derivados, ordenação de dados e junções entre tabelas para fornecer insights mais complexos sobre os dados.

### Modificação das Tabelas
Refine o modelo apresentado acrescentando os seguintes pontos:
   * Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
   * Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
   * Entrega – Possui status e código de rastreio;

   A modificação realizada nas tabelas existentes para adicionar novos recursos ao sistema de e-commerce incluiu a adição de suporte para clientes pessoa jurídica e pessoa física, múltiplas formas de pagamento e informações de entrega para os pedidos.

    1. Cliente PJ e PF: Foi adicionado uma coluna para indicar se o cliente é pessoa jurídica ou pessoa física. Foram removida as colunas relacionadas ao CPF e CNPJ das tabelas clients e seller, já que não precisaremos mais delas.

    2. Pagamento: Foi criado uma nova tabela para armazenar as informações de pagamento. A tabela de pagamento terá uma relação muitos-para-muitos com a tabela de pedidos, já que um pedido pode ter mais de uma forma de pagamento e uma forma de pagamento pode estar associada a vários pedidos.

    3. Entrega: Foi adicionado colunas para status e código de rastreamento à tabela de pedidos.

## 2. Desafio de Projeto: Sistema de Controle de Ordens de Serviço para Oficina Mecânica

### Descrição do Projeto

Este projeto consiste na criação de um banco de dados para um sistema de controle de ordens de serviço para uma oficina mecânica. O objetivo é modelar e implementar um banco de dados que permita o gerenciamento de clientes, veículos, equipes de mecânicos, ordens de serviço, serviços prestados e peças utilizadas.

### Esquema Lógico

O esquema lógico do banco de dados foi elaborado com base nas seguintes entidades:

1. **Cliente**: Representa os clientes da oficina, com informações como nome, endereço, telefone, e-mail e tipo (Pessoa Física ou Pessoa Jurídica).
2. **Veículo**: Contém informações sobre os veículos dos clientes, incluindo placa, modelo, ano, quilometragem e a qual cliente pertence.
3. **Equipe_Mecânico**: Associa os mecânicos às ordens de serviço, permitindo a designação de tarefas a cada equipe.
4. **Mecânico**: Detalha informações sobre os mecânicos, como nome, endereço, especialidade, etc.
5. **Ordem_Serviço (OS)**: Representa as ordens de serviço emitidas pela oficina, contendo informações como número da OS, data de emissão, valor total, status, data de conclusão, cliente associado, veículo envolvido e mecânico responsável.
6. **item_OS**: Relaciona os serviços prestados e as peças utilizadas em cada ordem de serviço.
7. **Serviço**: Descreve os serviços realizados na oficina, incluindo descrição, valor e tempo estimado.
8. **Peças**: Detalha as peças utilizadas nos serviços, incluindo descrição, valor e fornecedor.