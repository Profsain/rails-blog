# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts/show', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Show' do
    before(:all) do
      @user = User.first
      @posts = @user.posts
    end

    it 'shows the title, text, number of commment, number of likes and post author' do
      visit user_posts_path(@user)
      @posts.each do |post|
        expect(page).to have_text(post.title)
        expect(page).to have_text(post.text)
        expect(page).to have_text(post.comments_counter)
        expect(page).to have_text(post.likes_counter)
      end
    end
  end
end
