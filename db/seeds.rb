# TODO (Arnaud Lenglet): Find a way to include FactoryGirl synthax helpers
# which would prevent from typing "FactoryGirl.create..." over and over.
require 'factory_girl'
require 'faker'
Dir[Rails.root.join('spec/factories/*.rb')].each { |f| require f }

def create_sarce_trainer_minimal_stack
  create_admin
  create_users
  create_documentations
  create_questions
  create_daily_questions
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
  @documentation_1 = FactoryGirl.create(:documentation, name: 'secourisme')
  FactoryGirl.create(:documentation, name: 'incendie')
  puts '- 2 documentations created'
end

def create_questions
  FactoryGirl.create_list(:question, 5,
                          :with_given_answers,
                          documentation: @documentation_1)
  puts '- 5 questions created'
end

def create_daily_questions
  FactoryGirl.create_list(:daily_question, 5)
  puts '- 5 daily questions created'
end

create_sarce_trainer_minimal_stack
