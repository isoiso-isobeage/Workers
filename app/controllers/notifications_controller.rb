class NotificationsController < ApplicationController
  before_action :authenticate_user!


  def index
    @notifications = current_user.passive_notifications
    @new_notifications = current_user.passive_notifications.where(checked: false).page(params[:page]).per(20)
    @checked_notifications = current_user.passive_notifications.where(checked: true).page(params[:page]).per(20)
  end

  def update
    if @notification = Notification.find(params[:id])

      @notification.update(checked: true)

      # 選択した通知によって画面遷移先を変更
      if @notification.action == 'follow'
        redirect_to user_path(@notification.visitor)
      elsif @notification.action == 'site_user'
        redirect_to site_works_path(@notification.site)
      else
        redirect_to site_work_path(@notification.site, @notification.work)
      end
    else
      redirect_to request.referer
    end
  end


  # 全ての通知を確認済みにする
  def update_all
    new_notifications = current_user.passive_notifications.where(checked: false)
    new_notifications.each do |notification|
      notification.update(checked: true)
    end

    redirect_to request.referer

  end


end
