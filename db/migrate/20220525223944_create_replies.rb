class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.text :content
      t.string :postid
      t.string :authorid
      t.datetime :creation_date

      t.timestamps
    end
  end
end
