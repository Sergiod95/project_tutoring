class TutorChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :tutor, :boolean, default: false
  end
end
