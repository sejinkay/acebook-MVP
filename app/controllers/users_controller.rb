class UsersController < ApplicationController
  helper_method :turn_name_to_id

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
    if User.find_by(id: params[:id]) || User.find_by(name: params[:id])
      validate_id
      if session[:current_user_id]
        @wall_posts = Post.where(wall_owner_id: params[:id])
        render 'posts/user_wall'
      else
        redirect_to root_url
      end
    else
      render file: "#{Rails.root}/public/404.html" , status: :not_found
    end
  end

  private

  def validate_id
    if (/^[0-9]*$/).match?(params[:id])
    @user = User.find(params[:id])
    else
      @user = User.find_by(name:params[:id])
      params[:id] = @user.id.to_s
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def invalid_email
      !(VALID_EMAIL_REGEX.match?(user_params[:email]))
  end

  def email_or_username_reentry
    user_params[:email] && User.find_by_email(user_params[:email]) || user_params[:name] && User.find_by_name(user_params[:name])
  end

  def turn_name_to_id(string)
    if  (/^[0-9]*$/).match?(string)
      return  string
    else
      return User.find_by(name:string).id
    end
  end
  
end
