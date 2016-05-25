FactoryGirl.define do
  factory :user do
    # We don't generate the password with Faker, because we'll use this
    # factory in the seed file, and we want to be able to log in with this user later. :)
    password = "pomplar"

    first_name              Faker::Name.first_name
    last_name               Faker::Name.last_name
    sequence(:email)        { |n| "pompier#{n}@exemple.com" }
    password                password
    password_confirmation   password
    cis                     Faker::Address.city
    rank                    'sgt'

    factory :admin do
      is_admin true
    end
  end

end
