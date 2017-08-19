class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :brand
  has_many :inshoppingcarts
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :wholesale_price, presence: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  def to_price
    return "$#{ price / 100}"
  end
end
