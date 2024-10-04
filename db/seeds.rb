# Criando usuários
users = User.create!(
  [
    { name: 'Coordenador Teste', email: 'coordenador@teste.com', role: :coordinator },
    { name: 'Respondente Teste', email: 'respondente@teste.com', role: :respondent },
    { name: 'Respondente Teste2', email: 'respondente2@teste.com', role: :respondent }
  ]
)

coordenador = users.find { |user| user.role == 'coordinator' }
respondente = users.find { |user| user.role == 'respondent' }

# Criando pesquisa
pesquisa = Survey.create!(
  title: 'Pesquisa de Satisfação',
  start_date: 1.week.ago,
  end_date: 1.week.from_now,
  user: coordenador
)

# Criando perguntas para a pesquisa
perguntas = Question.create!(
  [
    { text: 'Qual é a sua satisfação geral com o nosso aplicativo?', question_type: 'multiple_choice', survey: pesquisa },
    { text: 'Quais funcionalidades você gostaria de ver no futuro?', question_type: 'checkbox', survey: pesquisa }
  ]
)

pergunta1, pergunta2 = perguntas

# Criando opções para a primeira pergunta
options1 = Option.create!(
  [
    { text: 'Muito satisfeito', question: pergunta1 },
    { text: 'Satisfeito', question: pergunta1 },
    { text: 'Neutro', question: pergunta1 },
    { text: 'Insatisfeito', question: pergunta1 },
    { text: 'Muito insatisfeito', question: pergunta1 }
  ]
)

# Criando opções para a segunda pergunta
options2 = Option.create!(
  [
    { text: 'Melhorar o desempenho', question: pergunta2 },
    { text: 'Adicionar novas funcionalidades', question: pergunta2 },
    { text: 'Melhorar o suporte', question: pergunta2 }
  ]
)

# Criando respostas de teste
Response.create!(
  [
    { user: respondente, question: pergunta1, selected_option: options1.find { |o| o.text == 'Satisfeito' } },
    { user: respondente, question: pergunta2, selected_option: options2.find { |o| o.text == 'Adicionar novas funcionalidades' } }
  ]
)

puts 'Dados de teste criados com sucesso!'

# utilize:
# rails db:reset 
# para resertar
# rails db:seed
# para repopular

# Limpar dados existentes
# User.destroy_all
# Survey.destroy_all
# Question.destroy_all
# Option.destroy_all
# Response.destroy_all
