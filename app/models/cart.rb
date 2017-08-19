class Cart < ApplicationRecord
  has_many :products
  has_many :in_shopping_carts

  enum status: [:incomplete, :complete]

  def status_cart
    Order.where(cart_id: id).blank? ? "<span class='label label-danger'>Abandonado</span>" : "<span class='label label-success'>Completado</span>"
  end

  def total
    total = 0
    self.in_shopping_carts.each do |cr|
      total += cr.product ? cr.product.price / 100 : 0
    end
    return "$#{total} MXN"
  end
end
