class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false, default: ""
      t.integer :price,             null: false, default: 0
      t.text :description,          null: false
      t.integer :category_id,       null: false,default: 0
      t.integer :condition_id,       null: false,default: 0
      t.integer :shipping_id,        null: false,default: 0
      t.integer :region_id,          null: false,default: 0
      t.integer :day_to_ship_id,     null: false,default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
#  :name,:price,:description, :category_id,:condition_id, :shipping_id,:region_id,:day_to_ship_id, 