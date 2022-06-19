class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id
      t.integer :visited_id
      t.integer :site_id
      t.integer :work_id
      t.integer :follower_id
      t.integer :followed_id
      t.string :action, default: "", null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
