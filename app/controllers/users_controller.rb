class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index
    @users = User.all
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def login

  end

  def sign_out
    session[:current_user_id] = nil
    redirect_to root_path, notice: 'Se cerró sesión correctamente.'
  end
  def sign_in
    user = User.where('email = ?', params[:email]).first
    if user != nil
      if user.password == params[:password]
        if params[:password] == user.password_confirmation
          session[:current_user_id] = user.id
          redirect_to root_path
        end
      end
    end
  end


  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
