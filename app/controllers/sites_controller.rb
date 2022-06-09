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
    @my_sites = Site.where(user_id: current_user.id)
    @join_sites = Site.all
  end


  def show
    @site = Site.find(params[:id])
  end


  def edit
  end


  def update
  end


  def destroy
  end

  private

  def site_params
    params.require(:site).permit(:name, :description)
  end

end
