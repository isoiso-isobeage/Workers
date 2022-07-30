class SitesController < ApplicationController
  before_action :authenticate_user!


  def new
    @site = Site.new
    @site_nav = false
  end


  def create
    @site = Site.new(site_params)
    @site.user_id = current_user.id

    if @site.save
      redirect_to site_works_path(@site), notice: '新規現場を作成しました'
    else
      flash.now[:alert] = '作成できませんでした'
      render 'new'
    end

  end


  def index
    @site_nav = false
    @my_sites = current_user.sites
    @join_sites = current_user.join_sites
  end


  def edit
    @site = Site.find(params[:id])
    @site_nav = true
    if @site.user_id == current_user.id
      render 'edit'
    else
      redirect_to '/'
    end
  end


  def update
    @site = Site.find(params[:id])
    @site_nav = true
    if @site.update(site_params)
      redirect_to site_works_path(@site), notice: '更新しました'
    else
      flash.now[:alert] = '更新できませんでした'
      render 'edit'
    end
  end


  def destroy
    site = Site.find(params[:id])
    site.destroy
    redirect_to sites_path, notice: '削除しました'
  end

  private

  def site_params
    params.require(:site).permit(:name, :description, :user_id)
  end

end
