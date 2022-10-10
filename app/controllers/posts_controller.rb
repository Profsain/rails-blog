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
    post = Post.new(post_params)
    @user = current_user
    # post.user = @user

    respond_to do |format|
      if post.save
        format.html { redirect_to user_posts_path(@user), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: post }
      else
        format.html { render :new }
        format.json { render json: post.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
   @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  private

  def fetch_user
    return nil unless params[:user_id]

    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :text)
  end
end
