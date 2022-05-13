# RECIPE PER NOTE

Recipe per note é um projeto de um sistema de organização pessoal, e também o TCC no Tecnico em Desenvolvimento de sistemas.

- Sobre
  - Techs Usadas
  - O que é o Projeto?
- Desenvolvimento
  - _Primeira Parte_
  - _Segunda Parte_
  - _Terceira Parte_
  - Pastas
    - teste-htcss
      - pages
      - models
      - styles
    - teste-code
    - recipe_per_note
  - Contribuir
    - Instalação
    - Contribuição
- Autores

___
## Sobre

Com dito acima, esse é um projeto de TCC, que irá utilizar o Elixir e Phoenix como Backend//Frontend,

PostgreSQL com banco de dados, o ngrok pra hosteamento do server, e outras coisa que mais pra frente vai ser mais definido que agora.
___
### Techs usadas

Elixir

Phoenix

PostgreSQL
___
### O que é o Projeto?

_ToDo_



## Desenvolvimento
___
### _Primeira Parte_

​	A primeira parte do desenvolvimento consiste em iniciar o projeto, fazendo o sistema de login

com o ```mix gen.auth```, configurar o banco, coisas desse tipo, começar a dar corpo pro projeto, com o html/css.

> A gente ainda não começou a fazer o desenvolvimento em si, só umas organizações
___
### _Segunda Parte_

​	A segunda parte do desenvolvimento se dá pela criação das abas `Notes`,`ToDo`,`WatchLater`,`Day`. Mas antes disso, a gente mexeu com o `Mailer`, para fazer o envio de emails para o usuário criado quando necessário.

Usando `mix gen.live`, criando as abas a serem desenvolvidas.

Na parte do `Day` é um resumo geral das aplicações do Recipe Per Note, nele você encontra o `Notes`,`ToDo` && `WatchLater`
___
### _Terceira Parte_

Basicamente, terminamos o projeto e eu demorei um tempão pra subir ele.
___
### Pastas

**Teste-htcss** : Onde vai ficar os arquivos brutos do Html e Css

- Pages: onde fica as outras paginas fora index
- Models: onde fica os models
- Styles: css

**Teste-code** : Vai ficar um "Projeto paralelo"(ou não) pra ir testando umas coisas antes de passar projeto final

**Recipe_per_note**: É a pasta principal do projeto

> Spoiler, é a pasta do projeto final, quem diria.
___
### Contribuir 

Para poder contribuir, primeiro você deveria conseguir rodar o projeto primeiro.

#### Instalação

Bem, será necessário a instalação do Elixir e do PostgreSQL, fora uns detalhes a mais, enfim

- Elixir (https://elixir-lang.org/install.html)
- PostgreSQL (https://www.postgresql.org/download/)
- NodeJS v12.22.5 (https://nodejs.org/download/release/latest-erbium/)

Tendo isso instalado, abra um terminal e rode o comando 

```bash
mix archive.install hex phx_new 1.5.12
```

feito isso, e com o PostgreSQL iniciado, abra a pasta `\recipe_per_note` no terminal e rode os comandos:

``` bash
mix setup

iex -S mix phx.server
#ou 
mix phx.server
```

e tcharam, está on o seu lado do projeto.



> ​	O banco de dados é local, consequentemente não era pro seu lado do projeto interferir no banco em que eu estiver usando.

#### Contribuição

Para contribuir com esse projeto do balacobaco, você:

- Irá criar um fork do projeto;
- Criar um branch com o seguinte padrão: `feature/commit-help-dos-brodi`;
- Fazer a correção ou criar o conteúdo novo;
- Criar um pull-request no repositório;
- E esperar a avaliação do mesmo. Detalhe, até a aprovação desse projeto, quem pode contribuir está restrito aos membros do grupo.

E Pronto, a contribuição estará feita!

___
### More About It.
Lê o pdf :)
___
## Autores

_Murilo Vidor Dias_ - PokemonGO player & Developer

_Rafael Salandin Moraes_ - Quantum Alchemist & a Bad Musician

_Wesley Amadeu Stefano_ - Developer & Big Chico's friend

___

> OBS.: devido a demora de subir o resto do projeto, coisas poderam não funcionar