source "https://rubygems.org"

ruby "3.4.7" 

gem "rails", "~> 8.0.1"
gem "propshaft"
gem "pg", "~> 1.5"
gem "puma", ">= 6.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "jbuilder"
gem "redis", ">= 5.0"
gem "bootsnap", require: false

# Markdown support (Obsidian-like)
gem "redcarpet"
gem "rouge"
gem "nokogiri", "~> 1.16"

# Search functionality
gem "pg_search"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  
  # RSpec
  gem "rspec-rails", "~> 8.0"
  gem "factory_bot_rails"
  gem "faker"
  
  # Linting
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-performance", require: false
end

group :development do
  gem "web-console"
  gem "annotate"
  gem "bullet"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "simplecov", require: false
end