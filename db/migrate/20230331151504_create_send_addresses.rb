class CreateSendAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :send_addresses do |t|
      t.string          :post_code,          null: false
      t.integer         :from_prefecture_id, null: false
      t.string          :to_city,            null: false
      t.string          :to_house_number,    null: false
      t.string          :to_building_name
      t.string          :to_telephone_number, null: false
      t.references      :after_sale,          null: false,   foreign_key: true
      t.timestamps
    end
  end
end
