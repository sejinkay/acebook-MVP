class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    p session[:current_user_id]
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    if session[:current_user_id]
      @posts = Post.all
    else
      redirect_to root_url
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:message, :users_id)
  end
end
