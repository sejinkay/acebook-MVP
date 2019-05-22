class UsersController < ApplicationController
  protect_from_forgery with: :exception
  
  def new
    @user = User.new
    render 'users/signup'
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to login_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
