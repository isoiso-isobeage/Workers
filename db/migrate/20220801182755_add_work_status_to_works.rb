class AddWorkStatusToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :work_status, :boolean, default: true
  end
end
