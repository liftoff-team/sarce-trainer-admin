require 'factory_girl'
require 'faker'
# require all factories
Dir[Rails.root.join('spec/factories/*.rb')].each { |f| require f }

def create_sarce_trainer_minimal_stack
  create_admin
  create_users
  create_documentations
  create_questions
  create_daily_questions
  create_given_answers
end

def create_admin
  FactoryGirl.create(:user, :admin)
  puts '- 1 admin created'
end

def create_users
  FactoryGirl.create_list(:user, 2)
  puts '- 2 users created'
end

def create_documentations
  @documentation_1 = FactoryGirl.create(:documentation, name: 'scourisme')
  FactoryGirl.create(:documentation, name: 'incendie')
  puts '- 2 documentations created'
end

def create_questions
  FactoryGirl.create_list(:question, 5, documentation: @documentation_1)
  puts '- 5 questions created'
end

def create_daily_questions
  FactoryGirl.create_list(:daily_question, 5)
  puts '- 5 daily questions created'
end

def create_given_answers
  FactoryGirl.create(:question, :with_given_answers)
  puts '- 5 given answers created for a question'
end

create_sarce_trainer_minimal_stack
