class ChangeBooleanIntegerStatusToCarts < ActiveRecord::Migration[5.0]
  def change
    change_column :carts, :status, :integer
  end
end
