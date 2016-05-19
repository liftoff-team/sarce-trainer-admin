FactoryGirl.define do

  factory :user do
    first_name 'John'
    last_name 'Doe'
    email 'john.doe@wanadoo.fr'
    password 'test1234'
    password_confirmation 'test1234'
    cis 'grenoble'
    rank 'sgt'
  end
end
