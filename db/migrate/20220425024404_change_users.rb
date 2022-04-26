class ChangeUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :role, from: 0, to:"user"
  end
end
