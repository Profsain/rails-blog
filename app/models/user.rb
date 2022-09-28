# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  # fetch recent top 3 posts
  def fetch_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
