class CreateProfessors < ActiveRecord::Migration[7.0]
  def change
    create_table :professors do |t|
      t.string :prof_id
      t.string :email
      t.string :name
      t.string :lastname
      t.string :faculty

      t.timestamps
    end
  end
end
