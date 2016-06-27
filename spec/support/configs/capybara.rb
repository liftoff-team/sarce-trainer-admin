require 'capybara/rails'
require 'capybara/rspec'

# To run Capybara with PhantomJS
require 'capybara/poltergeist'
require "pry"

# Capybara browser selection
# Possibilities: :selenium, :poltergeist
Capybara.javascript_driver = ENV['CAPYBARA_BROWSER'] ? ENV['CAPYBARA_BROWSER'].to_sym : :selenium
puts "* Running tests with javascript driver: #{Capybara.javascript_driver}"

Capybara.register_driver :poltergeist do |app|
  options = {
    window_size: [1600, 900]
  }
  Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.default_max_wait_time = 4