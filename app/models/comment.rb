# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
 

  # update comment counter
  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
