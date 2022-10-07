# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    @comment.save if @comment.valid?
    redirect_to post_path(@comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
