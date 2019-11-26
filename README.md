Twitter-Upnid-API
API do twitter proposta pelo desafio técnico da Upnid

## Descrição Durante a resolução deste desafio, foi desenvolvida uma API em Elixir/Erlang utilizando como framework o Phoenix Framework e como banco o PostgreSQL. A autenticação na aplicação é feita por meio de JWT, implementado através da lib Guardian. Dentre as operações implementadas temos:

* Criar um usuário
* Logar com um usuário
* Criar tweets 
* Listar tweets 
* Curtir tweet
* Criar respostas aos tweets 
* Curtir resposta
* Mostrar um tweet especifico e listar suas respostas 
* Criar um retweet 
* Mostrar um tweet e listar seus retweets

# Pré-requisitos:
  * banco PostgreSQL
  * Elixir/Erlang instalados, segue link com guia oficial da instalação:
    https://elixir-lang.org/install.html 

# Como rodar o projeto  

## Entrando no diretório do projeto, acessar o arquivo config/dev.exs e alterar os seguintes parametros:

 * username: "postgres" <-- para o username do seu banco 
 * password: "development" <-- para o password do seu banco 
 * hostname: "localhost" <-- para o host do seu banco 

## Após isso, basta rodar os comandos: 

  * mix deps.get
  * mix ecto.setup
  * mix phx.server
  
# Documentação da API:

https://web.postman.co/collections/7801271-cd0b3e19-600f-407d-b5d9-5585772e06de?version=latest&workspace=f05cfb3a-b359-4bf1-8981-931998d203a1
