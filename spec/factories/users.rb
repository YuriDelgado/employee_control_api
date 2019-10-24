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
        create_list :attendance, 2, { user: instance } 
      end
    end

  end
end
