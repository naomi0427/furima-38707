class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table   :items do |t|
      t.string     :items_name,         null: false
      t.text       :explain,            null: false
      t.integer    :category_id,        null: false
      t.integer    :condition_id,       null: false
      t.integer    :tax_id,             null: false
      t.integer    :from_prefecture_id, null: false
      t.integer    :schedule_day_id,    null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
