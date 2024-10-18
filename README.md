# ProjectSurveyAPI
---
## Descrição
A **ProjectSurveyAPI** é uma API desenvolvida para fins de teste de seleção de estágio. Além disso, trata-se de uma aplicação que não é destinada ao desenvolvimento de front-end; seu único propósito é fornecer uma API e entregar dados de teste em formato JSON. Ela oferece suporte a dois tipos de usuários e permite a criação e manipulação de pesquisas.

---

## Tecnologias usadas
- Ruby-on-rails
- Ruby
- Graphql
- bcrypt
- jwt
- rspec-rails
- factory-bot-rails

---

## Executar O Projeto

Clone o repositório em sua máquina:
`$ git clone https://github.com/JonatasDVL
/project_survey_api.git`

Acesse o repositório:
`$ cd project_survey_api`

Instalando as dependências:
`$ bundle install`

Crie o banco de dados:
`$ rails db:create`

Caso tenha problemas com o comando anterior, configure o arquivo `config/database.yml` de acordo com suas configurações de conexão ao PostgreSQL.

Executando as migrations:
`$ rails db:migrate`

Caso queira adicionar dados ao banco:
`$ rails db:seed`

Inicie o servidor da API:
`$ rails s`

---

## Tipos de Usuários

Essa API oferece suporte a dois tipos de usuários: os respondentes de pesquisa e os coordenadores de pesquisa. Essa distinção é importante para controlar o acesso e as permissões dentro da API.


### Usuários (respondentes) 

São representados pelo atributo `role` com valor `1`. Os respondentes são os participantes normais do sistema e têm permissões padrão. Eles podem:

- Acessar e responder a pesquisas.
- Visualizar os resultados das pesquisas.

### Usuários (coordenadores) 

São representados pelo atributo `role` com valor `0`. Os coordenadores são os usuários que criam e gerenciam suas pesquisas e possuem permissões extras. Eles podem:

- Criar, editar e deletar pesquisas.
- Criar, editar e deletar perguntas.
- Criar, editar e deletar opções de perguntas que são de multipla escolha ou de checkbox.
- Criar, editar e deletar respostas pessoais, assim como um respondente comum.
- Visualizar os resultados das pesquisas.


### Usuário (ADM)

Há também um usuário com a permissão de ADM Root. Seu email é `admroot@gmail.com`, e ele tem acesso às queries de usuários, conseguindo visualizar todos os dados de cadastro. A implementação desse tipo de usuário foi feita de forma simplória, apenas para testar um usuário com essa permissão.

---

## Importação das Queries e Mutations pelo Insomnia

Neste repositório Git, há um arquivo chamado `Insomnia_2024-03-05.json` contendo as queries e mutations. Esse arquivo deve ser importado no Insomnia. Depois de importado, você encontrará as queries e mutations a seguir.

---

## Queries e Mutations

### Controle do acesso das Queries e Mutations:

Apenas o ADM Root pode acessar essas queries:
- `users`
- `user`

Todos os tipos de usuários podem acessar essas queries:
- `surveys`
- `survey`
- `mySurveys`
- `openSurveys`
- `myOpenSurveys`
- `closedSurveys`
- `myClosedSurveys`
- `questions`
- `question`
- `myQuestions`
- `options`
- `option`
- `myOptions`
- `responses`
- `response`
- `myResponses`
- `responseCountsByQuestion`
- `responseCountsByOption`


Apenas o ADM Root e os coordenadores podem ter acesso a essas mutations:
- `createSurvey`
- `updateSurvey`
- `deleteSurvey`
- `createQuestion`
- `updateQuestion`
- `deleteQuestion`
- `createOption`
- `updateOption`
- `deleteOption`

Todos os tipos de usuários podem ter acesso a essas mutations:
- `createUser` (não precisa fazer login/token)
- `updateUser`
- `deleteUser`
- `createResponse`
- `updateResponse`
- `deleteResponse`

### Funcionalidade das Queries e Mutations

#### Users
- **Listar todos os usuários:** `users`
- **Listar dados de um usuário específico:** `user`
- **Registrar um novo usuário:** `createUser`
- **Modificar seus dados de usuário:** `updateUser`
- **Deletar seu usuário:** `deleteUser`

#### Surveys
- **Listar todas as pesquisas:** `surveys`
- **Listar dados de uma pesquisa específica:** `survey`
- **Listar todas as minhas pesquisas:** `mySurveys`
- **Listar todas as pesquisas abertas:** `openSurveys`
- **Listar todas as minhas pesquisas abertas:** `myOpenSurveys`
- **Listar todas as pesquisas fechadas:** `closedSurveys`
- **Listar todas as minhas pesquisas fechadas:** `myClosedSurveys`
- **Criar uma nova pesquisa:** `createSurvey`
- **Editar uma de suas pesquisas:** `updateSurvey`
- **Deletar uma de suas pesquisas:** `deleteSurvey`

#### Questions
- **Listar todas as questões:** `questions`
- **Listar dados de uma questão específica:** `question`
- **Listar todas as minhas questões:** `myQuestions`
- **Criar uma nova questão:** `createQuestion`
- **Editar uma de suas questões:** `updateQuestion`
- **Deletar uma de suas questões:** `deleteQuestion`

#### Options
- **Listar todas as opções:** `options`
- **Listar dados de uma opção específica:** `option`
- **Listar todas as minhas opções:** `myOptions`
- **Criar uma nova opção:** `createOption`
- **Editar uma de suas opções:** `updateOption`
- **Deletar uma de suas opções:** `deleteOption`

#### Responses
- **Listar todas as respostas:** `responses`
- **Listar dados de uma resposta específica:** `response`
- **Listar todas as minhas respostas:** `myResponses`
- **Listar quantidade de respostas por questão**: `responseCountsByQuestion`
- **Listar quantidade de respostas por opção**: `responseCountsByOption`
- **Criar uma nova resposta:** `createResponse`
- **Editar uma de suas respostas:** `updateResponse`
- **Deletar uma de suas respostas:** `deleteResponse`

## Observações:

### Login e Token de Acesso:

Para acessar qualquer query ou mutation da API, por meio da URL `http://localhost:3000/graphiql`,  é necessário realizar o login. O primeiro passo para um novo usuário é registrar-se usando a mutation `createUser`, que é a única mutation que pode ser utilizada sem token.

O login pode ser feito no Postman ou Insomnia, enviando o email e senha do usuário cadastrado para obter um token de acesso.

Para acessar as queries, insira o token no header. Sem ele, será retornada a mensagem "Unauthorized".

exemplo:

`
{
    "Authorization": "adicione-aqui-o-token-recebido"
}
`

Para acessar o token, crie uma rota POST com a url: `http://localhost:3000/auth/login`, dentro do Postman ou Insomnia

Depois vá em **Headers**, adiciona no campo de **Key** `Content-Type` e no campo de **Value** `application/json`

Agora vá em **Body**, selecione **raw** e digite :

`
{
  "email": "coordenador@gmail.com",
  "password": "123456"
}
`

Agora basta enviar a requisição e receber o token, para então adicioná-lo no header na URL `http://localhost:3000/graphiql`