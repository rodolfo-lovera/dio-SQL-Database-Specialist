# Exercícios de Modelagem de Banco de Dados

Este diretório contém os exercícios de modelagem de banco de dados realizados durante a formação de SQL.

## 1. Modelando uma Ordem de Serviço

### Contexto:
- Dentro de uma empresa, os clientes demandam ao helpdesk algumas ações.
- Essas ações são convertidas em ordens de serviço.
- Os clientes realizam um pedido, que é convertido em ordem de serviço caso possa ser realizado.
- O técnico executa a ordem de serviço, e após a finalização, a mesma é arquivada.

### Entidades:
- Cliente, Responsável, Pedido e Ordem de Serviço

### Relacionamentos:
- Solicita, Analisa, Executa, Arquiva

Aqui eu quero um link para colocar a imagem do modelo conceitual que gerei.

## 2. Modelando uma Universidade

### Escopo de Universidade
- Narrativas - Alunos, Disciplinas, Professores
- Perguntas para compreender os requisitos: Quais informações de aluno e professor guardar? Qual média para aprovação? Haverá restrições ou diferentes visões?

Aqui eu quero um link para colocar a imagem do modelo conceitual que gerei.

## 3. Modelando um E-commerce

### Escopo:
- Venda de produtos
- Entidades: produtos, estoque, cliente, pedido, fornecedor
- Narrativas: Produtos, Cliente, Pedido, Fornecedor e estoque

Aqui eu quero um link para colocar a imagem do modelo conceitual que gerei.

## Pontos Revisados e Melhorados:

- Cliente PJ e PF: Implementar um atributo "Tipo de Conta" (PJ ou PF) no Cliente para garantir que cada cliente possua apenas um tipo de conta.
- Pagamento: Criado uma entidade "Pagamento" para armazenar as formas de pagamento cadastradas por cada cliente (várias formas de pagamento por cliente).
- Entrega: Adicionar atributos "Status da Entrega" e "Código de Rastreio" ao Pedido para acompanhar o status da entrega.
