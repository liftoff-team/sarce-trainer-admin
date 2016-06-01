FactoryGirl.define do
  factory :given_answer do
    user_id 1
    answers { Faker::Lorem.words(5).sample(2) }
    is_correct true
    question
  end
end
