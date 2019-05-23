class UsersController < ApplicationController
  def new
    @user = User.new
    render 'users/new'
  end

  def create
    if email_or_username_reentry
      redirect_to root_url
    else
      @user = User.new(user_params)
      @user.save
      session[:current_user_id] = @user.id
      redirect_to posts_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def email_or_username_reentry
    if user_params[:email] && User.find_by_email(user_params[:email]) || user_params[:name] && User.find_by_name(user_params[:name])
      flash[:login_error] = "Email or Username unavailable, please try again"
    end
  end
end
