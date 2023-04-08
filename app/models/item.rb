class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :after_sale

  validates :image,              presence: true
  validates :items_name,         presence: true
  validates :explain,            presence: true
  validates :category_id, :condition_id, :tax_id, :from_prefecture_id, :schedule_day_id, numericality: { other_than: 1 , message: "can't be blank"}

  with_options presence: true, format:{ with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:9_999_999 },
                  presence: { message: "can't be blank" }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :tax
  belongs_to :from_prefecture
  belongs_to :schedule_day

  end