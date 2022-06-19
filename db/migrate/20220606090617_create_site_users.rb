class CreateSiteUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :site_users do |t|
      t.integer :user_id, null: false
      t.integer :site_id, null: false

      t.timestamps
    end
  end
end
