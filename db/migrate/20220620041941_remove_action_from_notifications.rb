class RemoveActionFromNotifications < ActiveRecord::Migration[6.1]
  def change
    remove_column :notifications, :action, :string
  end
end
