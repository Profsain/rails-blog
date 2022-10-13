# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  # Get all users
  def index
    @users = User.all
  end

  # Get single user by id
  def show
    @user = User.find(params[:id])
  end
end
