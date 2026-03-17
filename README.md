# Sistema de Vendas - Teste Técnico

Este projeto é um sistema simples de vendas desenvolvido em Delphi utilizando banco de dados Firebird.

## Funcionalidades

* Cadastro de clientes
* Gerenciador de Clientes
* Cadastro de produtos
* Gerenciador de Produtos
* Registro de vendas
* Consulta de vendas

## Tecnologias utilizadas

* Delphi (VCL)
* Firebird
* FireDAC
* DBGrid

## Arquitetura

O sistema utiliza uma arquitetura simples em camadas:

**Interface (Forms)**
Responsável pela interação com o usuário.

Exemplos:

* Tela de clientes
* Tela de produtos
* Tela de vendas
* Tela de consulta

**Acesso a dados**

Responsável pela comunicação com o banco de dados utilizando componentes:

* FDConnection
* FDQuery

Esses componentes executam comandos SQL para inserir, consultar e atualizar registros no banco.

## Como executar o projeto

1. Instalar o Firebird.
2. Copiar o banco de dados para a pasta (Documents\Sistema Venda Eco\BD\VENDASECOJ.FDB).
3. Abrir o projeto no Delphi.
4. Compilar e executar o arquivo `.dproj`.
5. Vou enviar o Executavel do projeto ja compilado e o arquivo com os SQLs do banco para analise se necessario.
6. Enviei em anexo tambem um video explicando as funcionalidades do sistema, estão na pasta OUTROS, junto com o sql, executavel e banco limpo
7. O Sistema foi feito em 64

## Banco de dados

O sistema utiliza as seguintes tabelas:

* CLIENTES
* PRODUTOS
* VENDAS
* VENDAS_ITENS

## Autor

Projeto desenvolvido como parte de um teste técnico.
