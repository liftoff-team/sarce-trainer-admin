source 'https://rubygems.org'

gem 'rails',                  '>= 5.0.0.rc1',  '< 5.1'
gem 'puma',                   '~> 3.0'            # Use Puma as the app server
gem 'pg',                     '~> 0.18'           # Use postgresql as the database for Active Record

gem 'devise',                 '~> 4.1'            # Authentication solution
gem 'devise-i18n'
gem 'haml-rails',             '~> 0.9'            # Templating engine for HTML.
gem 'bootstrap-sass',         '~> 3.3.6'          # Bootstrap 4 ruby gem for Ruby on Rails

gem 'sass-rails',             '~> 5.0'            # Use SCSS for stylesheets
gem 'uglifier',               '>= 1.3'            # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails',           '~> 4.1'            # Use CoffeeScript for .coffee assets and views
gem 'jquery-rails',           '~> 4.1'            # Use jquery as the JavaScript library
gem 'turbolinks',             '~> 5.x'            # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'jbuilder',               '~> 2.0'            # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

group :development, :test do
  gem 'byebug',               '~> 9.0', platform: :mri          # Byebug is a Ruby 2 debugger.
  gem 'database_cleaner',     '~> 1.5'            # Strategies for cleaning databases. Can be used to ensure a clean state for testing.
  gem 'rspec-rails',          '~> 3.5.0.beta4'    # rspec-rails is a testing framework for Rails 3.x and 4.x.
  gem 'guard-rails',          require: false      # Restart Rails when things change in your app
end

group :test do
  gem 'shoulda-matchers',     '~> 3.1'            # Shoulda Matchers provides RSpec one-liners that test common Rails functionality
  gem 'factory_girl_rails',   '~> 4.7'            # factory_girl_rails provides integration between factory_girl and rails
  gem 'faker',                '~> 1.6'            # Faker is used to easily generate fake data: names, addresses, phone numbers, etc
  gem 'capybara',             '~> 2.7'            # Capybara is an integration testing tool for rack based web applications. It simulates how a user would interact with a website
  gem 'poltergeist'
  gem 'phantomjs',            require: 'phantomjs/poltergeist'
  gem 'codeclimate-test-reporter'
end


group :development do
  gem 'web-console',          '~> 3.1'            # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen',               '~> 3.0'            # The Listen gem listens to file modifications and notifies you about the changes. Works everywhere!
  gem 'spring',               '~> 1.7'            # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0'           # Makes spring watch files using the listen gem.
  gem 'annotate',             '~> 2.7'            # Add a comment summarizing the current schema to the top of the files
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
