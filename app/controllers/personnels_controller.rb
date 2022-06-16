class PersonnelsController < ApplicationController
  def new
    @personnel = Personnel.new
    @site = Site.find(params[:site_id])
    @work = Work.find(params[:work_id])
    @site_users = @site.users
  end
end
