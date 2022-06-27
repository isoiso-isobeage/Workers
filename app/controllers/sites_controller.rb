class SitesController < ApplicationController
  before_action :authenticate_user!


  def new
  end


  def create
    @site = Site.new(site_params)
    @site.user_id = current_user.id

    if @site.save
      redirect_to site_works_path(@site)
    else
      @site = nil
      flash.now[:alert] = '作成できませんでした'
      render 'new'
    end

  end


  def index
    @my_sites = current_user.sites
    @join_sites = current_user.join_sites
  end


  def edit
    @site = Site.find(params[:id])
    if @site.user_id == current_user.id
      render 'edit'
    else
      redirect_to '/'
    end
  end


  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to site_works_path(@site)
    else
      render 'edit'
    end
  end


  def destroy
    @site = Site.find_by(params[:id])
    @site.destroy
    redirect_to sites_path
  end

  private

  def site_params
    params.require(:site).permit(:name, :description, :user_id)
  end

end
