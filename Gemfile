# frozen_string_literal: true

source 'https://rubygems.org'

gem 'grpc'
gem 'hanami-model', '~> 1.3'
gem 'pg', '~> 1.0'
gem 'rake'

group :plugins do
  gem 'hanami-annotate'
end

group :test, :development do
  gem 'byebug'
  gem 'dotenv', '~> 2.4'
  gem 'faker'
  gem 'grpc-tools'
  gem 'hanami', '~> 1.3'
end

group :development do
  gem 'rubocop'
  gem 'rubocop-performance', require: false
end

group :test do
  gem 'rspec'
end
