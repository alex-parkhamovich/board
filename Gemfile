source 'https://rubygems.org'

ruby "2.4.0"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rake', '< 11.0'
gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'devise'
gem 'cancan'
gem 'rolify'

gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-vkontakte'

gem 'bootstrap-sass'
gem 'devise-bootstrap-views'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'simple_form'
gem 'paperclip'
gem 'ransack'
gem 'aasm', :github => 'aasm/aasm'
gem 'whenever', :require => false
gem 'kaminari'
gem 'bootstrap-kaminari-views'

gem 'slim'
gem 'slim-rails'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'spring-commands-rspec'
  gem 'vcr'
  gem 'launchy'
end

group :test do
  gem 'webmock'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry'
  gem 'rubocop'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
