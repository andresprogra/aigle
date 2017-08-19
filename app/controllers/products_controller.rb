class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.where('stock > ? ', 0)
    @brands = Brand.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.price = @product.price * 100
    @product.wholesale_price = @product.wholesale_price * 100
    respond_to do |format|
      if @product.save
        format.html { redirect_to inventario_path, notice: 'Se creó correctamente el producto.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to inventario_path, notice: 'Se actualizó correctamente el producto.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Se eliminó correctamente el producto.' }
    end
  end

  def stocks
    @products = Product.all
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:supplier_id, :brand_id, :name, :description, :price, :wholesale_price, :photo, :stock)
    end
end
