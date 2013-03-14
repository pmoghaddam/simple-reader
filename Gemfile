source 'https://rubygems.org'

gem 'rails', '3.2.12'

gem "haml-rails", '0.4' # Cleaner mark-up
gem 'feedzirra', '0.2.0.rc2' # Parsing feeds
gem "draper", "1.1.0" # Decorator for views
gem 'compass-rails', '1.0.1' # Compass (required before Foundation)
gem 'zurb-foundation', '3.2.5' # Foundation front-end
gem 'devise', '2.2.3' # User authentication
gem "cells", "3.8.8" # Cells for widgets
gem 'kaminari', '0.14.1' # Pagination

gem 'grape', '0.3.2' # API integration

group :production do
  gem 'newrelic_rpm', '~> 3.5.5.38' # Instrumenting
  gem "pg", '0.14.1' # PostgreSQL for Heroku
end

group :development, :test do
  gem 'annotate' # Annotate models with DB information
  gem 'sqlite3' # Temporarily until local PostgreSQL setup
  gem 'rspec-rails' # RSpec for testing

  # Enable dummy objects for seeding / testing
  gem 'factory_girl_rails', '4.2.1'
  gem 'faker', '1.1.2'

  # Development improvement
  gem "better_errors"
  gem "binding_of_caller"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
