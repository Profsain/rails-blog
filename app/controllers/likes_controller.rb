# frozen_string_literal: true

class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(like_params)
    @user = current_user
    @like.user = @user

    @like.save if @like.valid?
    redirect_to post_path @like.post
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
