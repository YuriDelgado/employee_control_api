FactoryBot.define do
  factory :jwt_blacklist do
    jti { "MyString" }
    exp { "2019-10-11 23:46:32" }
  end
end
