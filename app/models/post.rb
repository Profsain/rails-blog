# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  # validation
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :update_posts_counter

  # update post counter
  def update_posts_counter
    user.increment!(:posts_counter, 1)
  end

  # fetch recent comment
  def fetch_recent_comments
    comments.order('created_at DESC').last(5)
  end
end
