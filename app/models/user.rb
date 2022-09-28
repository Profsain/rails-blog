# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  # validation
  validates :name, presence: true
  validates :posts_counter, numiricality: { only_integer: true, greater_than_or_equal_to: 0 }

  # fetch recent top 3 posts
  def fetch_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
