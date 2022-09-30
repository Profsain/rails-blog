# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.new(
      name: 'John Doe',
      photo: 'https://picsum.photos/200/300',
      bio: 'Teacher from Nigeria',
      posts_counter: 0
    )
  end

  it '@user created is valid' do
    expect(@user).to be_valid
  end

  it '@user.name is present' do
    expect(@user.name).to be_present
  end

  it '@user.posts_counter is an integer' do
    expect(@user.posts_counter).to be_an(Integer)
  end

  it '@user.posts_counter is greater than or equal to 0' do
    expect(@user.posts_counter).to be >= 0
  end

  it '@user.fetch_recent_posts returns 3 posts' do
    User.create(
      name: 'John Doe',
      photo: 'https://picsum.photos/200/300',
      bio: 'Teacher from Nigeria',
      posts_counter: 0
    )
  end

  it 'should return user last 3 posts' do
    user = User.create(
      name: 'John Doe',
      photo: 'https://picsum.photos/200/300',
      bio: 'Teacher from Nigeria',
      posts_counter: 0
    )

    8.times.collect do
      Post.create(
        title: 'Lorem ipsum dolor eit.',
        text: 'Lorem ipsum dolor hello world',
        user_id: user.id,
        comments_counter: 0,
        likes_counter: 0
      )
    end
    expect(user.fetch_recent_posts.count).to eq(3)
  end
end
