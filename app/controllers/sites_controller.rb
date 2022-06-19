class SitesController < ApplicationController


  def new
  end


  def create
    @site = Site.new(site_params)
    @site.user_id = current_user.id
    if @site.save
      redirect_to site_path(@site)
    else
      render 'new'
    end
  end


  def index
    @my_sites = current_user.sites
    @join_sites = current_user.join_sites
  end


  def show
    @site = Site.find(params[:id])
    @works = @site.works
  end


  def edit
    @site = Site.find(params[:id])
  end


  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to site_path(@site)
    else
      render 'edit'
    end
  end


  def destroy
    @site = Site.find_by(params[:id])
    @site.destroy
    redirect_to user_path(current_user)
  end

  private

  def site_params
    params.require(:site).permit(:name, :description)
  end

end
