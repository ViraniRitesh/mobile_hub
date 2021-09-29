class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :colour
      t.string :ram
      t.string :storage
      t.string :os
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
