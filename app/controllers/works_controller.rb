class WorksController < ApplicationController


  def new
    @work = Work.new
    @work.personnels.build
    @site = Site.find(params[:site_id])
    @site_users = @site.users
  end


  def create
    site = Site.find(params[:site_id])
    work = Work.new(work_params)
    work.site_id = site.id

    if !duplicate_company? && work.save
      redirect_to site_work_path(site, work)
    else
      @work = Work.new
      @work.personnels.build
      @site = Site.find(params[:site_id])
      @site_users = @site.users
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
    @site = Site.find(params[:site_id])
    @work = Work.find(params[:id])
    @site_users = @site.users
  end


  # ドラッグドロップ用のアップデートアクション
  def update
    work = Work.find(params[:id])
    site = work.site
    # 現場を作成したユーザーのみ変更可能
    if site.user_id == current_user.id
      work.update(start_date: params[:start_date], end_date: params[:end_date])
    end
  end


  def update_all
    work = Work.find(params[:id])
    site = Site.find(work.site_id)
    # 現場を作成したユーザーのみ変更可能
    if work.update(work_params) && site.user_id == current_user.id && !duplicate_company?
      redirect_to site_work_path(site, work)
    else
      @site = Site.find(params[:site_id])
      @work = Work.find(params[:id])
      @site_users = @site.users
      render 'edit'
    end
  end


  def destroy
  end


  private

  def work_params
    params.require(:work).permit(
      :site_id, :name, :content, :start_date, :end_date,
      personnels_attributes: [:id, :work_id, :company_name, :count, :_destroy])
  end

  # 送られてきた会社名が同じかどうか
  def duplicate_company?
    work_params[:personnels_attributes].to_h
                                       .map {|k, hash| hash[:company_name]}
                                       .group_by {|e|e}.select {|k,v| v.size > 1}
                                       .any? {|k, v|v.size>1}
  end

end
