class UsersController < ApplicationController
  helper_method :turn_name_to_id
  helper_method :background_colour

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze

  def new
    @user = User.new
    render 'users/new'
  end

  def create
    if email_or_username_reentry || invalid_username
      flash[:login_error] = 'Email or Username unavailable, please try again'
      redirect_to root_url
    elsif invalid_email
      flash[:login_error] = 'Incorrect email format'
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
      render file: "#{Rails.root}/public/404.html", status: :not_found
    end
  end

  def all
    if session[:current_user_id]
      @users = User.all
    else
      render file: "#{Rails.root}/public/501.html", status: :not_found
    end
  end

  def profile_update
    if invalid_profile_setting
      flash[:profile_error] = 'Please pick your setting'
      redirect_to '/profile'
    else
      @user = User.find(session[:current_user_id])
      @user.update_attributes(user_params)
      flash[:success] = 'setting saved!'
      redirect_to '/profile'
    end
  end

  def background_colour
    colours = [
      ['Blue', "linear-gradient(to top, #5ee7df 0%, #b490ca 100%)"],
      ['Red', "linear-gradient(45deg, #874da2 0%, #c43a30 100%)"],
      ['Green', "linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%)"],
      ['Black', "linear-gradient(to right, #868f96 0%, #596164 100%)"],
      ['Cherry', "linear-gradient(to top, #dbdcd7 0%, #dddcd7 24%, #e2c9cc 30%, #e7627d 46%, #b8235a 59%, #801357 71%, #3d1635 84%, #1c1a27 100%)"],
      ['Pink', "linear-gradient(to top, #fad0c4 0%, #ffd1ff 100%)"],
      ['Purple', "linear-gradient(-225deg, #5271C4 0%, #B19FFF 48%, #ECA1FE 100%)"]
    ]
  end

  private

  def validate_id
    if /^[0-9]*$/.match?(params[:id])
      @user = User.find(params[:id])
    else
      @user = User.find_by(name: params[:id])
      params[:id] = @user.id.to_s
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :bg_colour, :font)
  end

  def invalid_username
    user_params[:name] == 'all'
  end

  def invalid_email
    !VALID_EMAIL_REGEX.match?(user_params[:email])
  end

  def email_or_username_reentry
    user_params[:email] && User.find_by_email(user_params[:email]) || user_params[:name] && User.find_by_name(user_params[:name])
  end

  def turn_name_to_id(string)
    if /^[0-9]*$/.match?(string)
      string
    else
      User.find_by(name: string).id
    end
  end

  def invalid_profile_setting
    user_params[:bg_colour] == ''
    user_params[:font] == ''
  end
end
