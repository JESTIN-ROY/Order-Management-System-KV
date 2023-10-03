# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.8"

# Use Postgres as the database for Active Record
gem "pg", "~> 1.5", ">= 1.5.4"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]

  # For auto-generating demo data
  gem "faker"

  # RuboCop is a static code analyzer which analyzes the code based on
  # the best practices followed by the Ruby developers around the world
  # and defined on the community Ruby style guide.
  gem "rubocop", "~> 1.56", ">=1.56.3", require: false
  # A collection of RuboCop cops to check for performance optimizations in Ruby code.
  gem "rubocop-performance", "~> 1.19", ">= 1.19.1", require: false
  #  RuboCop extension focused on enforcing Rails best practices and coding conventions.
  gem "rubocop-rails", "~> 2.21", ">= 2.21.1", require: false

  # Use Fasterer to check various places in your code that could be faster.
  gem "fasterer", "~> 0.10.1"

  # Reek is a tool that examines Ruby classes, modules and methods and reports any code smells it finds
  # gem "reek", "~> 6.1", ">= 6.1.4"

  # For configuration of git hooks
  gem "overcommit", "~> 0.60.0"

  # gem 'rails_best_practices', '~> 1.23', '>= 1.23.2'
  gem "bundle-audit", "~> 0.1.0"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # For linting ERB files
  gem "erb_lint", require: false, git: "https://github.com/Shopify/erb-lint.git", branch: "main"
end

gem "dotenv-rails", "~> 2.8", ">= 2.8.1"
gem "pagy", "~> 6.0"

group :test do
  gem "database_cleaner", "~> 2.0", ">= 2.0.2"
  gem "database_cleaner-active_record"
  gem "factory_bot_rails", "~> 6.2"
  gem "rails-healthcheck"
  gem "rspec-rails", "~> 6.0", ">= 6.0.3"
  gem "simplecov", require: false
end
