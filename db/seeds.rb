require 'factory_girl'
require 'Faker'
# require all factories
Dir[Rails.root.join('spec/factories/*.rb')].each { |f| require f }


def create_sarce_trainer_minimal_stack
  create_users
  create_documentations
end

def create_users
  FactoryGirl.create_list(:user, 2)
  puts "- 2 users created"
end

def create_documentations
  FactoryGirl.create_list(:documentation, 5)
  puts "- 5 documentations created"
end

create_sarce_trainer_minimal_stack
