class SessionsController < ApplicationController
  def new
  end

  def index
    redirect_to posts_url
  end

  def create
    p params
    p (params[:email])
    p user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to posts_url, notice: "Logged in!"
      else
        flash.now[:danger] = "Email or password is invalid"
        render "new"
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
