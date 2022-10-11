# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @user = current_user
    @post.likes_counter = 0
    @post.comments_counter = 0
    @post.user = @user

    puts '================'
    puts @post.valid?
    puts @post.errors.full_messages
    if @post.valid?
      puts 'Post is valid'
      @post.save

      redirect_to user_posts_path(@user)
    else
      puts 'Post is invalid'
      redirect_to new_post_path
    end
  end

  def show
    @post = @user ? @user.posts.find(params[:id]) : Post.find(params[:id])
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
