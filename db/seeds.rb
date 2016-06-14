require 'factory_girl'
require 'faker'
# require all factories
# Dir[Rails.root.join('spec/factories/*.rb')].each { |f| require f }

def create_sarce_trainer_minimal_stack
  create_users
  create_documentations
  create_questions
  create_daily_questions
  create_given_answers
end

def create_users
  FactoryGirl.create_list(:user, 2)
  puts '- 2 users created'
end

def create_documentations
  FactoryGirl.create_list(:documentation, 5)
  puts '- 5 documentations created'
end

def create_questions
  FactoryGirl.create_list(:question, 30)
  puts '- 30 questions created'
end

def create_daily_questions
  FactoryGirl.create_list(:daily_question, 30)
  puts '- 30 daily questions created'
end

def create_given_answers
  FactoryGirl.create_list(:given_answer, 100)
  puts "- 100 given answers created"
end

create_sarce_trainer_minimal_stack
