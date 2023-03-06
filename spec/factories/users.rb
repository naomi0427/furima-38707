FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    last_name             {'佐藤'}
    first_name            {'健'}
    last_name_kana        {'サトウ'}
    first_name_kana       {'タケル'}
    birthday              {'2000-01-01'}
  end
end