class Item < ApplicationRecord
  has_one_attached :image
  validates :image,              presence: true
  belongs_to :user
  validates :items_name,         presence: true
  validates :explain,            presence: true
  validates :price,              presence: true
  validates :category_id, :condition_id, :tax_id, :from_prefecture_id, :schedule_day_id, numericality: { other_than: 1 , message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :tax
  belongs_to :from_prefecture
  belongs_to :schedule_day

  end