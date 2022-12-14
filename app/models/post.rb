# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :update_posts_counter

  # validation
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # update post counter
  def update_posts_counter
    user.increment!(:posts_counter)
  end

  # fetch recent comment
  def fetch_recent_comments
    comments.order('created_at DESC').last(5)
  end
end
