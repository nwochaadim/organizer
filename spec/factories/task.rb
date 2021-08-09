FactoryBot.define do
  factory :task do
    name { 'Some Task' }
    notes { 'Some random notes' }
    user

    trait :started do
      starts_at { Time.now }
    end

    trait :completed do
      starts_at { Time.now - 3.hours }
      completed_at { Time.now }
    end
  end
end
