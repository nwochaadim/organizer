FactoryBot.define do
  factory :user do
    name { 'Test User' }
    sequence(:email) { |n| "email#{n}@email.com" }
    password { 'password' }
  end
end
