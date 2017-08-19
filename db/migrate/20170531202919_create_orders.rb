class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :cart, foreign_key: true
      t.string :total
      t.text :notes

      t.timestamps
    end
  end
end
