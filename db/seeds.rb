# Limpar dados existentes
# Response.destroy_all
# Option.destroy_all
# Question.destroy_all
# Survey.destroy_all
# User.destroy_all

users = User.create!(
  [
    { name: 'Adm Root', email: 'admroot@gmail.com', password: "123456", role: 0 },
    { name: 'Coordenador Teste', email: 'coordenador@gmail.com', password: "123456", role: 0 },
    { name: 'Coordenador Teste2', email: 'coordenador2@gmail.com', password: "123456", role: 0 },
    { name: 'Respondente Teste', email: 'respondente@gmail.com', password: "123456", role: 1 },
    { name: 'Respondente Teste2', email: 'respondente2@gmail.com', password: "123456", role: 1 },
    { name: 'Respondente Teste3', email: 'respondente3@gmail.com', password: "123456", role: 1 }
  ]
)

adm, coordenador1, coordenador2 = users.select { |user| user.role == 0 }  
respondente1, respondente2, respondente3 = users.select { |user| user.role == 1 }

pesquisas = Survey.create!(
  [
    { title: 'Pesquisa de Satisfação 1', start_date: Time.now, end_date: 2.weeks.from_now, user: coordenador1 },
    { title: 'Pesquisa de Satisfação 2', start_date: Time.now, end_date: 2.weeks.from_now, user: coordenador2 },
    { title: 'Pesquisa de Satisfação 3', start_date: 1.week.ago, end_date: 1.day.ago, user: coordenador1 }, 
    { title: 'Pesquisa de Satisfação 4', start_date: 1.week.from_now, end_date: 3.weeks.from_now, user: coordenador2 },
    { title: 'Pesquisa sobre Atendimento ao Cliente', start_date: Time.now, end_date: 1.month.from_now, user: coordenador1 },
    { title: 'Pesquisa sobre Novos Recursos', start_date: Time.now, end_date: 1.month.from_now, user: coordenador2 }
  ]
)

perguntas = Question.create!(
  [
    { text: 'Qual é a sua satisfação geral com o nosso aplicativo?', question_type: 'multiple_choice', survey: pesquisas.first },
    { text: 'Quais funcionalidades você gostaria de ver no futuro?', question_type: 'checkbox', survey: pesquisas.first },
    { text: 'Você recomendaria nosso aplicativo para um amigo?', question_type: 'multiple_choice', survey: pesquisas[1] },
    { text: 'Qual foi a sua experiência com o atendimento ao cliente?', question_type: 'multiple_choice', survey: pesquisas[4] },
    { text: 'Quais recursos você acha mais importantes?', question_type: 'checkbox', survey: pesquisas[5] },
    { text: 'Sugestões para melhorar nossa interface?', question_type: 'short_text', survey: pesquisas[5] }
  ]
)

pergunta1, pergunta2, pergunta3, pergunta4, pergunta5, pergunta6 = perguntas

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

options3 = Option.create!(
  [
    { text: 'Sim, com certeza', question: pergunta3 },
    { text: 'Talvez', question: pergunta3 },
    { text: 'Não recomendaria', question: pergunta3 }
  ]
)

options4 = Option.create!(
  [
    { text: 'Excelente', question: pergunta4 },
    { text: 'Bom', question: pergunta4 },
    { text: 'Regular', question: pergunta4 },
    { text: 'Ruim', question: pergunta4 }
  ]
)

options5 = Option.create!(
  [
    { text: 'Integração com outros serviços', question: pergunta5 },
    { text: 'Customização avançada', question: pergunta5 },
    { text: 'Notificações mais inteligentes', question: pergunta5 }
  ]
)

Response.create!(
  [
    { user: respondente1, question: pergunta1, selected_option: options1.find { |o| o.text == 'Satisfeito' } },
    { user: respondente1, question: pergunta2, selected_option: options2.find { |o| o.text == 'Adicionar novas funcionalidades' } },
    { user: respondente1, question: pergunta3, selected_option: options3.find { |o| o.text == 'Sim, com certeza' } },
    { user: respondente2, question: pergunta1, selected_option: options1.find { |o| o.text == 'Muito satisfeito' } },
    { user: respondente2, question: pergunta2, selected_option: options2.find { |o| o.text == 'Melhorar o suporte' } },
    { user: respondente2, question: pergunta4, selected_option: options4.find { |o| o.text == 'Bom' } },
    { user: respondente3, question: pergunta5, selected_option: options5.find { |o| o.text == 'Integração com outros serviços' } },
    { user: respondente3, question: pergunta6, text_response: 'A interface poderia ser mais intuitiva e clean.' }
  ]
)

puts 'Dados de teste criados com sucesso!'

# Utilize:
# rails db:reset 
# para resetar
# rails db:seed
# para repopular
