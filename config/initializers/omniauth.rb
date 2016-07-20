# config/initialisers/omniauth.rb
OmniAuth.config.full_host = Rails.env.production? ? 'https://trailtracks.herokuapp.com/' : 'http://localhost:3000'
