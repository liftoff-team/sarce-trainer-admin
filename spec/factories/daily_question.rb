FactoryGirl.define do
  factory :daily_question do
    question_id                    { Faker::Number.between(1, Question.count) }
    answer_counter                 { Faker::Number.between(1, 100) }
    sequence(:scheduled_at) { |n| n.days.from_now }
    question
  end
end
