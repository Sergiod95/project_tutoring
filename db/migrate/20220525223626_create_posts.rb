class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :classid
      t.string :authorid
      t.integer :replies

      t.timestamps
    end
  end
end
