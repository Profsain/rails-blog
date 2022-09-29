require 'rails_helper.rb'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(
      name: 'John Doe',
      photo: 'https://picsum.photos/200/300',
      bio: 'Teacher from Nigeria',
      posts_counter: 0
    )

    @post = Post.new(
      title: 'Lorem ipsum dolor eit.',
      text: 'Lorem ipsum dolor hello world',
      user_id: @user.id,
      comments_counter: 0,
      likes_counter: 0
    )
  end

  it '@post created is valid' do 
    expect(@post).to be_valid
  end

  it '@post.title is present' do
    expect(@post.title).to be_present
  end

  it '@post.comments_counter is an integer' do
    expect(@post.comments_counter).to be_an(Integer)
  end

  it '@post.comments_counter is greater than or equal to 0' do
    expect(@post.comments_counter).to be >= 0
  end

  it '@post.likes_counter is an integer' do
    expect(@post.likes_counter).to be_an(Integer)
  end

  it '@post.likes_counter is greater than or equal to 0' do
    expect(@post.likes_counter).to be >= 0
  end

  it 'should return user last 5 comments' do
    user = User.create(
      name: 'John Doe',
      photo: 'https://picsum.photos/200/300',
      bio: 'Teacher from Nigeria',
      posts_counter: 0
    )
    8.times.collect do
      Comment.create(
        text: 'Lorem ipsum dolor hello world',
        user_id: user.id,
        post_id: @post.id
      )
    end
    expect(@post.fetch_recent_comments.count).to eq(5)
  end
end