FactoryBot.define do
  factory :order do
    post_code             {'123-4567'}
    from_prefecture_id    {20}
    to_city               {'沖縄市山内'}
    to_house_number       {'1-1'}
    to_building_name      {'赤木ビル'}
    to_telephone_number   {'09012345678'}
    
  end
end
