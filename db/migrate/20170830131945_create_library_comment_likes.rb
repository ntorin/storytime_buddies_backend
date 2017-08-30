class CreateLibraryCommentLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :library_comment_likes do |t|
      t.integer :library_comment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
