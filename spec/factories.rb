FactoryGirl.define do
  factory :user do
    first_name "Test"
    last_name "Person"
    email {Faker::Internet.email}
    password "francoperdon123"
    password_confirmation "francoperdon123"
  end
end
