class NotificationsController < ApplicationController
  before_action :authenticate_user!


  def index
    @notifications = current_user.passive_notifications
    @new_notifications = current_user.passive_notifications.where(checked: false)
    @checked_notifications = current_user.passive_notifications.where(checked: true)
  end

  def update
    @notification = Notification.find(params[:id])
    @notification.update(checked: true)
    if @notification.action == 'follow'
      redirect_to user_path(@notification.visitor)
    elsif @notification.action == 'site_user'
      redirect_to site_path(@notification.site)
    else
      redirect_to site_work_path(@notification.site, @notification.work)
    end
  end


end
