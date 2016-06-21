FactoryGirl.define do
  factory :question do
    answers_array = Faker::Lorem.words(5)
    body                     { Faker::Lorem.sentence }
    answers                  { answers_array }
    correct_answers          { answers_array.sample(2) }
    explanation              { Faker::Lorem.sentence }
    documentation_id         { Faker::Number.between(1, Documentation.count) }

  end

  trait :with_given_answers do
    transient do
      given_answers_count 5
    end

    after(:create) do |question, evaluator|
      create_list(:given_answer, evaluator.given_answers_count,
                  question: question)
    end
  end
end
