# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new; end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if post.valid?
      @post.save
      redirect_to user_posts_path(current_user)
    else
      redirect_to new_user_post_path(current_user)
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
