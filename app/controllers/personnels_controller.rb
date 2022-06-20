class PersonnelsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @personnel = Personnel.new
    @site = Site.find(params[:site_id])
    @work = Work.find(params[:work_id])
    @site_users = @site.users
  end

  def create
    @personnel = Personnel.new(personnel_params)
    @site = Site.find(params[:site_id])
    @work = Work.find(params[:work_id])
    @site_users = @site.users
    if @form.save
      redirect_to site_work_path(@site, @work)
    else
      @personnel = Personnel.new
      @site = Site.find(params[:site_id])
      @work = Work.find(params[:work_id])
      @site_users = @site.users
      render 'new'
    end


  end

  def edit
    
  end

  def update
  end

  private

  def personnel_params
    params.require(:personnel).permit(:count, :work_id, :user_id, :company_name)
  end

end
