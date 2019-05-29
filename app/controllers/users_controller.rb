class UsersController < ApplicationController

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def new
    @user = User.new
    render 'users/new'
  end

  def create
    if email_or_username_reentry
      flash[:login_error] = "Email or Username unavailable, please try again"
      redirect_to root_url
    elsif invalid_email
      flash[:login_error] = "Incorrect email format"
      redirect_to root_url
    else
      @user = User.new(user_params)
      @user.save
      session[:current_user_id] = @user.id
      request.params[:id] = @user.id
      redirect_to "/users/#{@user.id}"
    end
  end

  def show
    @user = User.friendly.find(params[:id])
    if session[:current_user_id]
      @wall_posts = Post.where(wall_owner_id: params[:id])
      render 'posts/user_wall'
    else
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def invalid_email
      !(VALID_EMAIL_REGEX.match?(user_params[:email]))
  end

  def email_or_username_reentry
    user_params[:email] && User.find_by_email(user_params[:email]) || user_params[:name] && User.find_by_name(user_params[:name])
  end
end
