class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :supplier
      t.references :brand
      t.string :name
      t.string :description
      t.integer :price
      t.integer :wholesale_price

      t.timestamps
    end
  end
end
