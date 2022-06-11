class SiteUsersController < ApplicationController


  def index
    @site_users = SiteUser.new
    @site = Site.find(params[:site_id])

    # 相互フォローで現場に参加していないユーザーの配列を作成
    @add_users = @site.user?(current_user.mutual_follow_users(current_user))
  end

  def create
  end


  def destroy
  end

  private

  def site_params
    params.require(:site_users).permit(:user_id, :site_id)
  end

end
