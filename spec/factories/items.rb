FactoryBot.define do
  factory :item do
    items_name            {Faker::Lorem.sentence}
    explain               {Faker::Lorem.sentence}
    category_id           {2}
    condition_id          {2}
    tax_id                {2}
    from_prefecture_id    {2}
    schedule_day_id       {2}
    price                 {3000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end
