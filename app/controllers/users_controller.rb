class UsersController < ApplicationController
  before_action :authenticate_user!


  def show
    @user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render 'edit'
    else
      redirect_to '/'
    end
  end


  def update
    @user =User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '更新が完了しました'
    else
      render 'edit', alert: '更新することができませんでした'
    end
  end

  private

  def user_params
    params.require(:user).permit(:family_name, :name, :kana_family_name, :kana_name, :phone_number, :company_name, :profile_image)
  end


end
