source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'pg'
gem 'bootstrap-sass'
gem 'haml'
gem 'haml-rails', '~> 0.9'
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'ffaker'
gem 'kaminari'
gem 'carrierwave'
gem 'mini_magick'
gem 'rails_admin', '~> 1.0'
gem 'cancancan'
gem 'figaro'
gem 'aasm'
gem 'rails_admin_aasm'
gem 'wicked'
gem 'rubocop', '~> 0.47.1', require: false
gem 'fog'
gem 'draper', '3.0.0.pre1'

gem 'rails_12factor', group: :production

group :development, :test do
  gem 'rspec-rails'
  gem 'foreman'
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'
  gem "launchy"
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
  gem 'poltergeist'
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
end

group :development do
 
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
