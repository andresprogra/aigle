class AddProfileToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile, :integer, :default => 0
  end
end