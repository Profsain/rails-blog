# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts testing', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Index' do
    before(:all) do
      @user = User.first
      @posts = @user.posts
    end

    it 'shows all the properties (title, text, number of comment and likes) of each post' do
      visit user_posts_path(@user)

      @posts.each do |post|
        expect(page).to have_text(post.title)
        expect(page).to have_text(post.text)
        expect(page).to have_text(post.comments_counter)
        expect(page).to have_text(post.likes_counter)
      end
    end

    it 'shows the user name, photo, and number of posts' do
      visit user_posts_path(@user)

      expect(page).to have_text(@user.name)
      expect(page).to have_css("img[src*=\"#{@user.photo}\"]")
      expect(page).to have_text("#{@user.posts_counter} post") if @user.posts_counter > 0
    end

    it 'shows the first comments on a post' do
      visit user_posts_path(@user)

      @posts.each do |post|
        post.fetch_recent_comments.each do |comment|
          expect(page).to have_text(comment.text)
        end
      end
    end

    it 'redirect to post show page when clicking the post' do
      visit user_posts_path(@user)

      @posts.each do |post|
        click_on post.title, match: :first
        expect(page).to have_current_path user_post_path(@user, post)
      end
    end
  end
end
