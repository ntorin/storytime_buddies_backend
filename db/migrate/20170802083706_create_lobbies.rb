class CreateLobbies < ActiveRecord::Migration[5.0]
  def change
    create_table :lobbies do |t|
      t.string :name
      t.integer :story_id
      t.boolean :has_password
      t.string :password
      t.integer :word_limit
      t.integer :master_user_id
      t.integer :members

      t.timestamps
    end
  end
end
