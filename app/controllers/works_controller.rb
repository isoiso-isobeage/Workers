class WorksController < ApplicationController


  def new
    @work = Work.new
    @site = Site.find(params[:site_id])
  end


  def create
    site = Site.find(params[:site_id])
    work = Work.new(work_params)
    work.site_id = site.id

    if work.save
      redirect_to new_site_work_personnel_path(site, work)
    else
      @site = Site.find(params[:site_id])
      render 'new'
    end
  end

  def index
    @site = Site.find(params[:site_id])
    @works = @site.works
  end


  def show
    @work = Work.find(params[:id])
    @personnels = @work.personnels
    @site = @work.site
  end


  def edit
  end


  def update
    work = Work.find(params[:id])
    site = Site.find(work.site_id)
    # 現場を作成したユーザーのみ変更可能
    if site.user_id == current_user.id
      if work.update(start_date: params[:start_date], end_date: params[:end_date])
         redirect_to site_works_path(site)
      end
    else
      @works = site.works
      render 'index'
    end
  end

  def destroy
  end

  def work_params
    params.require(:work).permit(
      :site_id, :name, :content, :start_date, :end_date,
      personnels_attributes: [:user_id, :company_name, :count]
      )
  end

end
