class RenameUserTutorToRole < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :tutor, :role
    change_column :users, :role, :string
  end
end
