source "https://rubygems.org"

ruby "3.2.2"

# Use the latest stable version of Rails 7.1.x
gem "rails", "~> 7.1.3", ">= 7.1.3.4"

gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server for serving the app
gem "puma", ">= 5.0"

# Use bcrypt for handling secure passwords
gem "bcrypt", "~> 3.1.7"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Time zone data for Windows and JRuby environments
gem "tzinfo-data", platforms: %i[windows jruby]

# Gems adicionadas para funcionalidades específicas
gem 'graphql',"~> 2.3"  # Adiciona suporte a GraphQL
gem "graphiql-rails", group: :development
gem 'faker'  # Geração de dados fictícios para testes
gem 'jwt'  # Para autenticação via JSON Web Tokens

group :development, :test do
  # Debugging tools
  gem "debug", platforms: %i[mri windows]
  gem 'rspec-rails' # Para testes com RSpec
  gem 'shoulda-matchers', '~> 5.0'

  # Consider adding these for development/test environments
  gem "pry-rails"  # Para uma melhor experiência de console no Rails
  gem "factory_bot_rails"  # Para criação de objetos de teste
end

group :development do
  # Speed up commands on slow machines / big apps
  # gem "spring"
end

# Comentários ou Gems que podem ser ativadas conforme necessário:
# gem "jbuilder"  # Para construir JSON APIs
# gem "rack-cors"  # Para lidar com CORS
# gem "redis", ">= 4.0.1"  # Para usar o Redis no Action Cable ou Kredis
# gem "kredis"  # Para tipos de dados de alto nível em Redis
# gem "image_processing", "~> 1.2"  # Para manipulação de imagens com Active Storage