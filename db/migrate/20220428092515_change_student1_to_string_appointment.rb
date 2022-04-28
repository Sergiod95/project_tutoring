class ChangeStudent1ToStringAppointment < ActiveRecord::Migration[7.0]
  def change
    change_column :appointments, :student1, :string, default: nil
    change_column :appointments, :student2, :string, default: nil
    change_column :appointments, :student3, :string, default: nil
    change_column :appointments, :student4, :string, default: nil
    change_column :appointments, :student5, :string, default: nil
  end
end
