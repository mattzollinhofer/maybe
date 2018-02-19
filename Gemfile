source 'https://rubygems.org'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap-datepicker'
end

gem 'font-awesome-rails'
#test

gem 'bootsnap', require: false

gem 'rails', '~> 5.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'
gem 'local_time'
gem 'turbolinks'
gem 'pg', '~> 0.18'

gem 'ledermann-rails-settings'

gem 'simple_form'
gem 'bootstrap-sass'
gem 'select2-rails'

gem 'puma'

#Auth
gem 'devise'
gem 'omniauth-google-oauth2'

#gem "skylight"

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'launchy'
  gem 'bullet'
end

group :development do
  gem 'rack-mini-profiler'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rubocop', require: false
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'spring-commands-rspec'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

