class SiteUsersController < ApplicationController
  before_action :authenticate_user!


  def index
    @site_user = SiteUser.new
    @site = Site.find(params[:site_id])
    if @site.user_id == current_user.id
      # 現場に参加しているユーザーを取得
      @site_users = @site.users
      # 相互フォローを取得
      @mutual_follow_users = current_user.mutual_follow_users(current_user)
      # 相互フォローで現場に参加していないユーザーの配列を作成。mutual_follow_users(user)は相互フォローを確認するメソッド
      @add_users = @mutual_follow_users - @site_users

      render 'index'

    else
      redirect_to '/'
    end

  end

  def create
    site_user = SiteUser.new(site_user_params)
    if site_user.save
      site = site_user.site
      user = site_user.user
      current_user.create_notification_site_user(current_user, user, site)
    end
    redirect_to request.referer
  end


  def site_user_destroy
    @site = Site.find(params[:site_id])
    @site_users = @site.users
    SiteUser.find_by(site_id: @site, user_id: params[:user_id]).destroy
    redirect_to request.referer

  end

  def show
    @user = User.find(params[:id])
  end

  private

  def site_user_params
    params.require(:site_user).permit(:user_id, :site_id)
  end

end
