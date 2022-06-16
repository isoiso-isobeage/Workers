class RemoveCountFromPersonnels < ActiveRecord::Migration[6.1]
  def change
    remove_column :personnels, :count, :integer
  end
end
