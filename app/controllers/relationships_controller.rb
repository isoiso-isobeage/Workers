class RelationshipsController < ApplicationController
  before_action :authenticate_user!


  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    current_user.create_notification_follow(current_user, @user)
  end


  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
  end


  def index
    @user = User.find(params[:user_id])
    if @user == current_user
      @followings = current_user.followings
      @followers = current_user.followers
      render 'index'
    else
      redirect_to user_path(current_user)
    end

  end


end
