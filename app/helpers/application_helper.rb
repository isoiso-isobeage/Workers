module ApplicationHelper

  # 未確認通知があるかどうか
  def unchecked_notifications
    @unchecked_notifications = current_user.passive_notifications.where(checked: false)
  end
end
