class AddUserIdToPersonnels < ActiveRecord::Migration[6.1]
  def change
    add_column :personnels, :user_id, :integer, null: false
  end
end
