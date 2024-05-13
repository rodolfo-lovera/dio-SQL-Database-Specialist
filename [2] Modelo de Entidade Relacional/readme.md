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

![Modelo Conceitual da Ordem de Serviço](https://github.com/rodolfo-lovera/dio-SQL-Database-Specialist/blob/main/%5B2%5D%20Modelo%20de%20Entidade%20Relacional/Imagem01.png)


## 2. Modelando uma Universidade

### Escopo de Universidade
- Narrativas - Alunos, Disciplinas, Professores
- Perguntas para compreender os requisitos: Quais informações de aluno e professor guardar? Qual média para aprovação? Haverá restrições ou diferentes visões?

![Modelo Conceitual da universidade](https://github.com/rodolfo-lovera/dio-SQL-Database-Specialist/blob/main/%5B2%5D%20Modelo%20de%20Entidade%20Relacional/Imagem02.png)

## 3. Modelando um E-commerce

### Escopo:
- Venda de produtos
- Entidades: produtos, estoque, cliente, pedido, fornecedor


![Modelo Conceitual do E-Commerce](https://github.com/rodolfo-lovera/dio-SQL-Database-Specialist/blob/main/%5B2%5D%20Modelo%20de%20Entidade%20Relacional/Imagem03a.png)

## Pontos Revisados e Melhorados:

- Cliente PJ e PF: Implementar um atributo "Tipo de Conta" (PJ ou PF) no Cliente para garantir que cada cliente possua apenas um tipo de conta.
- Pagamento: Criado uma entidade "Pagamento" para armazenar as formas de pagamento cadastradas por cada cliente (várias formas de pagamento por cliente).
- Entrega: Adicionar atributos "Status da Entrega" e "Código de Rastreio" ao Pedido para acompanhar o status da entrega.

![Modelo Conceitual do E-Commerce Refinado](https://github.com/rodolfo-lovera/dio-SQL-Database-Specialist/blob/main/%5B2%5D%20Modelo%20de%20Entidade%20Relacional/Imagem03b.png)

## 4. Controle de Ordens de Serviço em Oficina Mecânica

### Contexto:

O objetivo deste exercício é criar um esquema conceitual que represente as entidades, atributos e relacionamentos do sistema de controle de ordens de serviço.

- Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões periódicas.
- Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
- A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra.
- O valor de cada peça também irá compor a OS.
- O cliente autoriza a execução dos serviços.
- A mesma equipe avalia e executa os serviços.
- Os mecânicos possuem código, nome, endereço e especialidade.
- Cada OS possui: número da OS, data de emissão, valor, status e uma data para conclusão dos trabalhos.

![Modelo Conceitual da Oficina](https://github.com/rodolfo-lovera/dio-SQL-Database-Specialist/blob/main/%5B2%5D%20Modelo%20de%20Entidade%20Relacional/Imagem04.png)


