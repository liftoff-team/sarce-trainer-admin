# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_sarce_trainer_minimal_stack
  create_users
end

def create_users
  FactoryGirl.create_list(:user, 2)
  puts "- 2 user created"
end

create_sarce_trainer_minimal_stack