source 'https://rubygems.org'

ruby '2.2.2'

gem 'rails', '4.2.3'
gem 'pg', '~> 0.18.2'
gem 'sass-rails', '~> 5.0'
gem 'materialize-sass'
gem 'haml-rails'
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'puma'
gem 'thin'

gem 'foreman'

gem 'omniauth-google-oauth2'
gem 'figaro'
gem 'autoprefixer-rails', '~> 5.2.1.1'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'rails_12factor', group: :production
group :development do
  gem 'meta_request'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'byebug'
  gem 'pry'
  gem 'capybara'
  gem 'web-console', '~> 2.0'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'rspec-rails', '~> 3.0'
end

group :test do
  gem "vcr"
  gem "webmock"
  gem "faraday"
end

