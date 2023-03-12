class Item < ApplicationRecord







  validates : category_id, condition_id, tax_id, from_prefecture_id, schedule_day_id
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :tax, :from_prefecture, :schedule_day,
end
