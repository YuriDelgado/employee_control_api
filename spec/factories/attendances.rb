FactoryBot.define do
  factory :attendance do
    status { "check_in" }
    note { "MyString" }
    user { nil }
  end
end
