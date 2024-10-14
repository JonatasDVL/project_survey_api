# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



<!--

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

updateUser(input: { id: "5" , name: "nomeTeste2", email: "teste@gmail.com", password: "123456", role: 0 }) {
  user{
    name
    email
    password
    role
  }
  errors
}

deleteUser(input: { id: "5" }) {
  user{
    name
    email
    role
  }
  errors
}

--------------------------------------------

createSurvey(input: { title: "1°teste", startDate:"2024-10-07T15:02:10Z", endDate: "2024-10-09T15:02:10Z" }) {
  survey{
    id
    title
    startDate
    endDate
  }
  errors
}

updateSurvey(input: { id: "5", title: "testee"}){
  survey{
    id
    title
  }
  errors
}

deleteSurvey(input: { id: "5" }) {
  survey{
    id
    title
  }
  errors
}

--------------------------------------------

createQuestion(input: {text: "asdadadas2", surveyId: "5"}) {
  question{
    id
    text
    questionType
  }
  errors
}

updateQuestion(input: { id: "4", text: "tessssssssss"}){
  question{
    id
    text
  }
  errors
}

deleteQuestion(input: { id: "4"}) {
  question{
    id
    text 
  }
  errors
}

--------------------------------------------

createOption(input: { questionId: "2", text: "72asdadsas"}) {
  option{
    id
    text
  }
  errors
}

updateOption(input: { id: "2", text: "testeeeses"}){
  option{
    id
    text
  }
  errors
  }

deleteOption(input: { id: "10"}) {
  option{
    id
    text
  }
  errors
} 

--------------------------------------------

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
-->