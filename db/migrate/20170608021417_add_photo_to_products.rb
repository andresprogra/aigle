class AddPhotoToProducts < ActiveRecord::Migration[5.0]
  def change
    add_attachment :products, :photo
  end
end
