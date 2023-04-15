class Order 
  include ActiveModel::Model
  attr_accessor :post_code, :from_prefecture_id, :to_city, :to_house_number, :to_building_name, :to_telephone_number, :item_id, :user_id, :token
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}    
    validates :from_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :to_city
    validates :to_house_number
    validates :to_telephone_number, format: {with: /\A\d{10,11}\z/} 
    validates :item_id
    validates :user_id
    validates :token

  end

  validates :from_prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    # 各テーブルにデータを保存する処理を書く
    after_sale = AfterSale.create(item_id: item_id, user_id: user_id)

    SendAddress.create(post_code: post_code, from_prefecture_id: from_prefecture_id, to_city: to_city, to_house_number: to_house_number, to_building_name: to_building_name, to_telephone_number: to_telephone_number, after_sale_id: after_sale.id)
  end


end