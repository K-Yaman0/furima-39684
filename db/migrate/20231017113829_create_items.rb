class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name,             null: false, default: ""
      t.text :description,             null: false
      t.integer :category_id,          null: false
      t.integer :item_condition_id,    null: false
      t.integer :freight_id,           null: false
      t.integer :prefecture_id,        null: false
      t.integer :ship_date_id,         null: false
      t.integer :price,                null: false
      t.timestamps
    end
  end
end
