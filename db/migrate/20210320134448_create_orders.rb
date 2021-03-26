class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string  :postal_code,         null: false
      t.integer :prefecture_id,      null: false 
      t.string  :city,                null: false 
      t.string  :address_number,      null: false 
      t.string  :name_of_building
      t.string  :tell,                null: false 
      t.integer :buy_id,              null: false,foreign_key: true
      t.timestamps
    end
  end
end