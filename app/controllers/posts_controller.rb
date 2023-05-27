class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] # ログインしているユーザーのみに投稿を許可します

  def index
    @posts = Post.order(created_at: :desc)
    @users = User.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "Post was successfully created."
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy 
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:text, :image)
  end
end
