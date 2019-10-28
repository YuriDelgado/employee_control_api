FactoryBot.define do

  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    
    trait :with_employees do
      after(:create) do |instance|
        create :user, { admin: instance, role: :employee }
        create :user, :with_attendances, { admin: instance, role: :employee } 
      end
    end

    trait :with_attendances do
      after(:create) do |instance|
        create :attendance, { user: instance, updated_at: DateTime.now + 30.minutes, status: :lunch, diff_in_seconds: 1800 }
        create :attendance, { user: instance, status: :check_in }
      end
    end

  end
end
