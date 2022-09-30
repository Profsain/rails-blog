# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # update like counter
  def update_likes_counter
    post.increment!(:likes_counter, 1)
  end
end
