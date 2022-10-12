# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  after_save :update_likes_counter

  # update like counter
  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
