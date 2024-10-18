### Queries

#### User:

`
query {
  users {
    id
    name
    email
    role
  }
}
`

`
query {
  user(id: "1") {
    id
    name
    email
    role
  }
}
`

--------------------------------------------

#### Survey: 

`
query {
  surveys{
    id
    title
    userId
    createdAt
    updatedAt
    questions{
      id
      text
      questionType
      createdAt
      updatedAt
      options{
        text
        id
        createdAt
        updatedAt
      }
      responses{
        id
        userId
        questionId
        textResponse
        selectedOptionId
        createdAt
        updatedAt
      }
    }
  }
}
`

`
query {
  survey(id: "1"){
    title
    userId
    createdAt
    updatedAt
    questions{
      id
      text
      questionType
      createdAt
      updatedAt
      options{
        text
        id
        createdAt
        updatedAt
      }
      responses{
        id
        userId
        textResponse
        selectedOptionId
        createdAt
        updatedAt
      }
    }
  }
}
`

`
query {
  mySurveys{
    id
    title
    userId
    createdAt
    updatedAt
    questions{
      id
      text
      questionType
      createdAt
      updatedAt
      options{
        text
        id
        createdAt
        updatedAt
      }
      responses{
        id
        userId
        questionId
        textResponse
        selectedOptionId
        createdAt
        updatedAt
      }
    }
  }
}
`

`
query {
  myClosedSurveys{
    id
    title
    userId
    createdAt
    updatedAt
    questions{
      id
      text
      questionType
      createdAt
      updatedAt
      options{
        text
        id
        createdAt
        updatedAt
      }
      responses{
        id
        userId
        questionId
        textResponse
        selectedOptionId
        createdAt
        updatedAt
      }
    }
  }
}
`

` 
query {
  myOpenSurveys{
    id
    title
    userId
    createdAt
    updatedAt
    questions{
      id
      text
      questionType
      createdAt
      updatedAt
      options{
        text
        id
        createdAt
        updatedAt
      }
      responses{
        id
        userId
        questionId
        textResponse
        selectedOptionId
        createdAt
        updatedAt
      }
    }
  }
}
`

`
query {
	closedSurveys{
    id
    title
    userId
    createdAt
    updatedAt
    questions{
      id
      text
      questionType
      createdAt
      updatedAt
      options{
        text
        id
        createdAt
        updatedAt
      }
      responses{
        id
        userId
        questionId
        textResponse
        selectedOptionId
        createdAt
        updatedAt
      }
    }
  }
}
`

`
query {
  openSurveys{
    id
    title
    userId
    createdAt
    updatedAt
    questions{
      id
      text
      questionType
      createdAt
      updatedAt
      options{
        text
        id
        createdAt
        updatedAt
      }
      responses{
        id
        userId
        questionId
        textResponse
        selectedOptionId
        createdAt
        updatedAt
      }
    }
  }
}
`

--------------------------------------------

#### Question: 

`
query {
  questions{
    id
    text
    questionType
    surveyId
    createdAt
    updatedAt
    options{
      text
      id
      createdAt
      updatedAt
    }
    responses{
      id
      userId
      textResponse
      selectedOptionId
      createdAt
      updatedAt
    }
  }
}
`

`
query {
  question(id: "1") {
    text
    questionType
    surveyId
    createdAt
    updatedAt
    options{
      text
      id
      createdAt
      updatedAt
    }
    responses{
      id
      userId
      textResponse
      selectedOptionId
      createdAt
      updatedAt
    }
  }
}
`

`
query {
  myQuestions{
    id
    text
    questionType
    surveyId
    createdAt
    updatedAt
    options{
      text
      id
      createdAt
      updatedAt
    }
    responses{
      id
      userId
      textResponse
      selectedOptionId
      createdAt
      updatedAt
    }
  }
}
`

--------------------------------------------

#### Option: 

`
query {
  options {
    id
    text
    questionId
    createdAt
    updatedAt
  }
}
`

`
query {
  option(id: "1") {
    text
    questionId
    createdAt
    updatedAt
  }
}
`

`
query {
  myOptions {
    id
    text
    questionId
    createdAt
    updatedAt
  }
}
`

--------------------------------------------

#### Response: 

`
query {
  responses{
    id
    userId
    questionId
    textResponse
    selectedOptionId
    createdAt
    updatedAt
  }
}
`

`
query {
  response(id: "1") {
    userId
    questionId
    textResponse
    selectedOptionId
    createdAt
    updatedAt
  }
}
`

`
query{
  myResponses{
    id
    userId
    questionId
    textResponse
    selectedOptionId
    createdAt
    updatedAt
  }
}
`


`
query{
  responseCountsByQuestion{
    questionId
    questionText
    count
  }
}
`

`
query{
  responseCountsByOption {
    optionId
    optionText
    questionId
    questionText
    count
  }
}
`

--------------------------------------------

### Mutations: 

#### User: 

`
mutation {
  createUser(input: { name: "nomeTeste", email: "teste@gmail.com", password: "123456", role: 0 }) {
    user{
      name
      email
      password
      role
    }
    errors
  }
} 
`

`
mutation {
  updateUser(input: { id: "5" , name: "nomeTeste2", email: "teste@gmail.com", password: "123456", role: 0 }) {
    user{
      name
      email
      password
      role
    }
    errors
  }
}
`

`
mutation {
  deleteUser(input: { id: "5" }) {
    user{
      name
      email
      role
    }
    errors
  }
} 
`

--------------------------------------------

#### Survey: 

`
mutation {
  createSurvey(input: { title: "1°teste", startDate:"2024-10-07T15:02:10Z", endDate: "2024-10-09T15:02:10Z" }) {
    survey{
      id
      title
      startDate
      endDate
    }
    errors
  }
} 
`

`
mutation {
  updateSurvey(input: { id: "5", title: "testee"}){
    survey{
      id
      title
    }
    errors
  }
} 
`

`
mutation {
  deleteSurvey(input: { id: "5" }) {
    survey{
      id
      title
    }
    errors  
  }
} 
`

--------------------------------------------

#### Question: 

`
mutation {
  createQuestion(input: {text: "asdadadas2", surveyId: "5", questionType: "checkbox"}) {
    question{
      id
      text
      questionType
    }
    errors
  }
} 
`

`
mutation {
  updateQuestion(input: { id: "4", text: "tessssssssss"}){
    question{
      id
      text
      questionType
    }
    errors
  }
} 
`

`
mutation {
  deleteQuestion(input: { id: "4"}) {
    question{
      id
      text 
    }
    errors
  }
} 
`

--------------------------------------------

#### Option: 

`
mutation {
  createOption(input: { questionId: "2", text: "72asdadsas"}) {
    option{
      id
      text
    }
    errors
  }
} 
`

`
mutation {
  updateOption(input: { id: "2", text: "testeeeses"}){
    option{
      id
      text
    }
    errors
  }
} 
`

`
mutation {
  deleteOption(input: { id: "10"}) {
    option{
      id
      text
    }
    errors
  } 
} 
`

--------------------------------------------

#### Response: 

`
mutation {
  createResponse(input: { questionId: "5", selectedOptionId: "72asdadsas", textResponse: ""}) {
    response{
      id
      userId
      questionId
      textResponse
      selectedOptionId
    }
    errors
  }
} 
`

`
mutation {
  updateResponse(input: { id: "", selectedOptionId: "72asdadsas", textResponse: "" }) {
    response{
      id
      userId
      questionId
      textResponse
      selectedOptionId
    }
    errors
  }
} 
`

`
mutation {
  deleteResponse(input: { id: "" }) {
    response{
      id
      userId
      questionId
      textResponse
      selectedOptionId
    }
    errors
  }
} 
`

--------------------------------------------

## Controle do acesso das Queries e Mutations:

Apenas o ADM Root consegui acessar essas queries básicas:
- users
- user

Todos os tipos de usuários podem acessar essas queries:
- surveys
- survey
- mySurveys
- openSurveys
- myOpenSurveys
- closedSurveys
- myClosedSurveys
- questions
- question
- myQuestions
- options
- option
- myOptions
- responses
- response
- myResponses
- responseCountsByQuestion
- responseCountsByOption


Apenas o ADM Root e os coordenadores podem ter acesso a essas mutations:
- createSurvey
- updateSurvey
- deleteSurvey
- createQuestion
- updateQuestion
- deleteQuestion
- createOption
- updateOption
- deleteOption

Todos os tipos de usuários podem ter acesso a essas mutations:
- createUser (não precisa fazer login/token)
- updateUser
- deleteUser
- createResponse
- updateResponse
- deleteResponse