class AddUseridToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :userid, :string
  end
end
