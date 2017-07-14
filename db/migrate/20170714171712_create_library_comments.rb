class CreateLibraryComments < ActiveRecord::Migration[5.0]
  def change
    create_table :library_comments do |t|
      t.text :comment
      t.integer :likes
      t.integer :story_id
      t.integer :user_id

      t.timestamps
    end
  end
end
