class RemoveUserIdFromPersonnels < ActiveRecord::Migration[6.1]
  def change
    remove_column :personnels, :user_id, :integer
  end
end
