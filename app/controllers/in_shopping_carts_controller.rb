class InShoppingCartsController < ApplicationController  
  before_action :in_shopping_params, only: [:create]
  before_action :set_in_shopping, only: [:destroy]
  def create
    @in_shopping_cart = InShoppingCart.new(in_shopping_params)
    if @in_shopping_cart.save
      redirect_to carts_path
    end
  end
  def destroy
    @in_shopping_cart.destroy
    redirect_to carts_path
  end
  private
  def set_in_shopping
    @in_shopping_cart = InShoppingCart.find(params[:id])
  end
  def in_shopping_params
    params.require(:in_shopping).permit(:product_id, :cart_id)
  end
end