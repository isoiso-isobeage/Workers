class CreatePersonnels < ActiveRecord::Migration[6.1]
  def change
    create_table :personnels do |t|
      t.integer :work_id
      t.string :company_name
      t.integer :count

      t.timestamps
    end
  end
end
