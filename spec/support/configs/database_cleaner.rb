RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    # Use of truncation strategy for models with uniqueness validations
    DatabaseCleaner.strategy = :truncation, {:only => %w[users daily_questions]}
    DatabaseCleaner.clean
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
