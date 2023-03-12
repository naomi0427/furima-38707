class Item < ApplicationRecord
  validates :items_name,
  validates :explain,
  validates :category_id, 
  validates :condition_id, 
  validates :tax_id, 
  validates :from_prefecture_id, 
  validates :schedule_day_id,
  validates :price,

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :tax, :from_prefecture, :schedule_day,
end
