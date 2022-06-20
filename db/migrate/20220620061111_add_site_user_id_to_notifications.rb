class AddSiteUserIdToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :site_user_id, :integer
  end
end
