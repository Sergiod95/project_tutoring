class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.string :tutor_id
      t.string :student1
      t.string :student2
      t.string :student3
      t.string :student4
      t.string :student5
      t.string :faculty
      t.string :professor_id
      t.integer :number_students, default: 0

      t.timestamps
    end
  end
end
