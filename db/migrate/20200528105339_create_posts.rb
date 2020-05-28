class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :header
      t.text :postBody
      t.string :author
      t.integer :authorID

      t.timestamps
    end
  end
end
