class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  before_action :user_signed_in
  before_action :set_cart

  
  private
  
  


  def user_signed_in
    notice = 'Hola'
    @user_signed_in =  !@current_user.nil? ? true : false
  end

  def current_user
    @current_user = session[:current_user_id] ? User.find(session[:current_user_id]) : nil
  end

  def set_cart
    if cookies[:cart_id] != nil && Cart.find(cookies[:cart_id]).incomplete?
      @cart_id = cookies[:cart_id]
      @cart_session = Cart.find(cookies[:cart_id])
    else
      @cart_session = Cart.new(status: false)
      if @cart_session.save
        @cart_session.incomplete!
        cookies[:cart_id] = @cart_session.id
        @cart_id = cookies[:cart_id]
      else
        puts "El error es: #{@cart_session.errors.full_messages}"
        puts "\n\n\n\n error"
      end
    end
    
  end
end
