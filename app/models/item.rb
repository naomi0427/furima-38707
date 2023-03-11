class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :tax, :from_prefecture, :schedule_day,
end
