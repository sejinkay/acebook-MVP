class SessionsController < ApplicationController
  protect_from_forgery with: :exception

  def new
    render 'users/index'
  end

  # def index
  #   redirect_to posts_url
  # end

  def create
<<<<<<< HEAD
     @user = User.find_by(email:login_params[:email])
    if @user && (@user.password == login_params[:password])

      session[:current_user_id] = @user.id

      redirect_to posts_url
    else
      flash[:login_error] = "Email or password is invalid, please try again"
      render 'users/index'
    end
=======
    params
    (params[:email])
    user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to posts_url, notice: "Logged in!"
      else
        flash.now[:danger] = "Email or password is invalid"
        render "new"
      end
>>>>>>> 4bff20437b77a12cf7a25a4572fb21122bec329d
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
