ruby '2.3.3'
source 'https://rubygems.org'

gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'sinatra', '~> 2.0.1'
gem 'thin'
gem 'shotgun'
gem 'tux'
gem 'pry'
gem 'rake'
gem 'rspec'
gem 'rack-test'
gem 'bcrypt'
gem 'require_all'

group :development do
  gem 'sqlite3'
end

group :development, :test do
  gem 'capybara'
end

group :production do
  gem 'pg', '~> 0.20'
end
