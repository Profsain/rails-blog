class PostsController < ApplicationController

  before_action :fetch_author, only: %i[index show]

  def index
    @posts = @user ? @user.posts.includes(:comments, :user) : Post.includes(:comments, :user).all
  end

  def show
    @post = @user ? @user.posts.find(params[:id]) : Post.find(params[:id])
  end

  def new; end

  def create
    @post = Post.new post_params
    @user = current_user
    @post.user = @user

    if @post.valid?
      @post.save

      redirect_to user_posts_path(@user)
    else
      redirect_to new_post_path
    end
  end

  def destroy
    Post.destroy(params[:id])

    redirect_to @user ? user_posts_path(@user) : posts_path
  end

  private

  def fetch_author
    return nil unless params[:user_id]

    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end