FactoryGirl.define do
  factory :documentation do
    sequence(:name)       { |n| "documentation#{n}" }
    sequence(:short_name) { |n| "DOC#{n}" }
    sequence(:cover_path) { |n| "assets/images/covers/DOC#{n}.jpg" }
  end
end
