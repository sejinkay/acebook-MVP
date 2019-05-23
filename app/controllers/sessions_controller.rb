class SessionsController < ApplicationController
  def new
    render 'users/index'
  end

  def create
    @user = User.find_by(email:login_params[:email])
    if @user && (@user.password == login_params[:password])
      session[:current_user_id] = @user.id
      redirect_to posts_url
    else
      flash[:login_error] = "Email or password is invalid, please try again"
      render 'users/index'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url, notice:"Logged out!"
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end

end
