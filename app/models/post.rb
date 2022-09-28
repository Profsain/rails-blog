# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  # update post counter
  def update_posts_counter
    user.increament!(:posts_counter, 1)
  end

  # fetch recent comment
  def fetch_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
