# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :fetch_user, only: %i[index show]
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end
  
  def show
    @post = @user ? @user.posts.find(params[:id]) : Post.find(params[:id])
  end

  def new; end

  def create
    @post = Post.new(post_params)
    @user = User.first
    @post.user = @user

    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to user_posts_path(@user)
    else
      redirect_to new_post_path
    end
  end

  private
  
  def fetch_user
    return nil unless params[:user_id]
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
