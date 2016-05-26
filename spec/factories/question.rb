FactoryGirl.define do
  factory :question do
    answers_array = Faker::Lorem.words(5)
    body                     { Faker::Lorem.sentence }
    answers                  { answers_array }
    correct_answers          { answers_array.sample(2) }
    explanation              { Faker::Lorem.sentence }
    documentation_id         { Faker::Number.between(1, 5) }
  end
end
