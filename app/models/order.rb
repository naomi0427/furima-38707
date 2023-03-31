class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :post_code, :from_prefecture_id, :to_city, :to_house_number, :to_building_name, :to_telephone_number, :item_id, :user_id, :token
   # ここにバリデーションの処理を書く
  validates :post_code,                presence: true
  validates :from_prefecture_id,       presence: true
  validates :to_city,                  presence: true
  validates :to_house_number,          presence: true
  validates :to_telephone_number,      presence: true
  validates :item_id,                  presence: true
  validates :user_id,                  presence: true
  validates :token                     presence: true
   def save
    # 各テーブルにデータを保存する処理を書く
    after_sale = AfterSale.create(item_id: item_id, user_id: user_id)

    SendAddress.create(post_code: post_code, from_prefecture_id: from_prefecture_id, to_city: to_city, to_house_number: to_house_number, to_building_name: to_building_name, to_telephone_number: to_telephone_number, after_sale_id: after_sale.id)
  end


end