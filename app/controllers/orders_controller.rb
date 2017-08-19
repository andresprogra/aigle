class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  def index
    @orders = Order.where(user_id: @current_user.id)
  end

  def orders
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url
  end

  def newOrder
    @order = Order.new(cart_id: params[:id_cart], user_id: params[:user])
    @order.total = @order.cart.total

    @order.cart.in_shopping_carts.each do |in_s|
      product = Product.find(in_s.product.id)
      product.stock -= 1
      product.save
    end
    if @order.save
      @order.cart.complete!
      Status.create!(order_id: @order.id)
      redirect_to @order, notice: '¡Genial! Gracias por tu compra.' 
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:user_id, :cart_id, :total, :notes)
    end
end
