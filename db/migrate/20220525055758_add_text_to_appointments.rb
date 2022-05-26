class AddTextToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :topic, :text
    add_column :appointments, :comments, :text
  end
end
