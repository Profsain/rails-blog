# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :update_comments_counter

  # update comment counter
  def update_comments_counter
    post.increment!(:comments_counter, 1)
  end
end
