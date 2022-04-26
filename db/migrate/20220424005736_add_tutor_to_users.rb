class AddTutorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tutor, :boolean
  end
end
