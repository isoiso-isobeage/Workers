class SiteUsersController < ApplicationController


  def index
    @site_user = SiteUser.new

    @site = Site.find(params[:site_id])

    # 現場に参加しているユーザーを取得
    @site_users = @site.users

    # 相互フォローを取得
    @mutual_follow_users = current_user.mutual_follow_users(current_user)

    # 相互フォローで現場に参加していないユーザーの配列を作成。mutual_follow_users(user)は相互フォローを確認するメソッド
    @add_users = @mutual_follow_users - @site_users

  end

  def create
    @site_user = SiteUser.new(site_user_params)
    if @site_user.save
      redirect_to '/'
    else
      redirect_to '/'
    end
  end


  def site_user_destroy
    @site = Site.find(params[:site_id])
    @site_users = @site.users
    SiteUser.find_by(site_id: @site, user_id: params[:user_id]).destroy
    redirect_to '/'

  end

  private

  def site_user_params
    params.require(:site_user).permit(:user_id, :site_id)
  end

end
