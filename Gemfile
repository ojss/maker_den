source 'https://rubygems.org'


ruby "2.2.4"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'faker',                   '1.4.2'
gem 'carrierwave',             '0.10.0'
gem 'mini_magick',             '3.8.0'
gem 'fog',                     '1.36.0'
gem 'will_paginate',           '3.0.7'
gem 'materialize-sass'
gem 'will_paginate-materialize'
gem 'font-awesome-sass'
gem 'jquery-turbolinks'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'web-console', group: :development

group :development, :test do
  gem 'spring'
  gem 'sqlite3'
  gem 'byebug'
  gem 'terminal-notifier-guard'
  gem 'guard-livereload', '~> 2.4', require: false
  gem "rack-livereload"
end
group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
end
group :production do
  gem 'pg',             '0.17.1'
  gem 'rails_12factor'
  gem 'passenger'
end

