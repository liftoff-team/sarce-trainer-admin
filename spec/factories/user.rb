FactoryGirl.define do
  factory :user do
    password = "azerty"

    first_name              Faker::Name.first_name
    last_name               Faker::Name.last_name
    sequence(:email)        { |n| "pompier#{n}@exemple.com" }
    password                password
    password_confirmation   password
    cis                     Faker::Address.city
    rank                    'sgt'
  end
end
