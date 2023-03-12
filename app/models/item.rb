class Item < ApplicationRecord
  validates :items_name,         presence: true
  validates :explain,            presence: true
  validates :category_id,        presence: true
  validates :condition_id,       presence: true
  validates :tax_id,             presence: true
  validates :from_prefecture_id, presence: true
  validates :schedule_day_id,    presence: true
  validates :price,              presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :tax, :from_prefecture, :schedule_day,
end
