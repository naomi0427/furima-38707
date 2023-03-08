FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    last_name             {"佐藤"}
    first_name            {"健"}
    last_name_kana        {"サトウ"}
    first_name_kana       {"タケル"}
    birthday              {Faker::Date.birthday}
  end
end