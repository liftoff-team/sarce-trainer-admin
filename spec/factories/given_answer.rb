FactoryGirl.define do
  factory :given_answer do
    question_id { Faker::Number.between(1, Question.count) }
    user_id { Faker::Number.between(1, User.count) }
    answers { 1.upto(5).to_a.sample((Faker::Number.between(1, 5))) }
    is_correct { Faker::Boolean.boolean }
    question
  end
end
