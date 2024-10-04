# Limpar dados existentes
# Response.destroy_all
# Option.destroy_all
# Question.destroy_all
# Survey.destroy_all
# User.destroy_all

# Criando usuários
users = User.create!(
  [
    { name: 'Coordenador Teste', email: 'coordenador@gmail.com', password: "123456", role: 0 },
    { name: 'Coordenador Teste2', email: 'coordenador2@gmail.com', password: "123456", role: 0 },
    { name: 'Respondente Teste', email: 'respondente@gmail.com', password: "123456", role: 1 },
    { name: 'Respondente Teste2', email: 'respondente2@gmail.com', password: "123456", role: 1 }
  ]
)

coordenador1, coordenador2 = users.select { |user| user.role == 0 }
respondente1, respondente2 = users.select { |user| user.role == 1 }

# Criando pesquisas
pesquisas = Survey.create!(
  [
    { title: 'Pesquisa de Satisfação 1', start_date: Time.now, end_date: 2.weeks.from_now, user: coordenador1 },
    { title: 'Pesquisa de Satisfação 2', start_date: Time.now, end_date: 2.weeks.from_now, user: coordenador2 },
    { title: 'Pesquisa de Satisfação 3', start_date: Time.now, end_date: 2.weeks.from_now, user: coordenador1 },
    { title: 'Pesquisa de Satisfação 4', start_date: Time.now, end_date: 2.weeks.from_now, user: coordenador2 }
  ]
)

# Criando perguntas para a primeira pesquisa
perguntas = Question.create!(
  [
    { text: 'Qual é a sua satisfação geral com o nosso aplicativo?', question_type: 'multiple_choice', survey: pesquisas.first },
    { text: 'Quais funcionalidades você gostaria de ver no futuro?', question_type: 'checkbox', survey: pesquisas.first },
    { text: 'Sei lá kkkk?', question_type: 'text', survey: pesquisas.first }
  ]
)

pergunta1, pergunta2, pergunta3 = perguntas

# Criando opções para a primeira e segunda perguntas
options1 = Option.create!(
  [
    { text: 'Muito satisfeito', question: pergunta1 },
    { text: 'Satisfeito', question: pergunta1 },
    { text: 'Neutro', question: pergunta1 },
    { text: 'Insatisfeito', question: pergunta1 },
    { text: 'Muito insatisfeito', question: pergunta1 }
  ]
)

options2 = Option.create!(
  [
    { text: 'Melhorar o desempenho', question: pergunta2 },
    { text: 'Adicionar novas funcionalidades', question: pergunta2 },
    { text: 'Melhorar o suporte', question: pergunta2 }
  ]
)

# Criando respostas de teste para o respondente1
Response.create!(
  [
    { user: respondente1, question: pergunta1, selected_option: options1.find { |o| o.text == 'Satisfeito' } },
    { user: respondente1, question: pergunta2, selected_option: options2.find { |o| o.text == 'Adicionar novas funcionalidades' } },
    { user: respondente1, question: pergunta3, text_response: 'Achei tudo muito bom!' }
  ]
)

puts 'Dados de teste criados com sucesso!'

# utilize:
# rails db:reset 
# para resertar
# rails db:seed
# para repopular
