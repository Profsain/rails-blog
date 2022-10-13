# frozen_string_literal: true

class User < ApplicationRecord
  after_initialize :set_defaults
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts
  has_many :comments
  has_many :likes

  # validation
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # fetch recent top 3 posts
  def fetch_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  private

  def set_defaults
    self.posts_counter = 0 if posts_counter.nil?
    self.photo = 'https://i.imgur.com/3ZQZ9Zm.png' if photo.nil?
  end
end
