# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(
      name: 'John Doe',
      photo: 'https://picsum.photos/200/300',
      bio: 'Teacher from Nigeria',
      posts_counter: 0
    )

    @post = Post.create(
      title: 'Lorem ipsum dolor eit.',
      text: 'Lorem ipsum dolor hello world',
      user_id: @user.id,
      comments_counter: 0,
      likes_counter: 0
    )

    it 'like counter should be incremented by 1' do
      Like.create(
        user_id: @user.id,
        post_id: @post.id
      )
      expect(@post.likes_counter).to eq(1)
    end
  end
end
