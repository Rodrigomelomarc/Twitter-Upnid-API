# Twitter-Upnid-API
API do twitter proposta pelo desafio técnico da Upnid

#Descrição
Durante a resolução deste desafio, foi desenvolvida uma API em Elixir/Erlang utilizando como framework o Phoenix Framework e
como banco o PostgreSQL. A autenticação na aplicação é feita por meio de JWT, implementado através da lib Guardian. Dentre as 
operações implementadas temos:
Criar um usuário
Logar com um usuário
Criar Tweets
Listar Tweets
Curtir tweets
Criar respostas aos tweets
Curtir respostas
Mostrar um tweet especifico e listar suas respostas
Criar um retweet
Mostrar um tweet e listar seus retweets

#Como rodar o projeto
É necessário ter um banco PostgreSQL rodando na máquina
Entrando no diretório do projeto, acessar o arquivo config/dev.exs e alterar os seguintes parametros:
  username: "postgres" <-- para o username do seu banco
  password: "development" <-- para o password do seu banco
  hostname: "localhost" <-- para o host do seu banco
Após isso, basta rodar os comando:
  mix deps.get
  mix ecto.create
  mix ecto.migrate
  mix phx.server <-- para rodar a API
