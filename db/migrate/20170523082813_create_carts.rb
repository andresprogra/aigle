class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.references :products, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
