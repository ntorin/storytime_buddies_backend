class CreateLobbyMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :lobby_messages do |t|
      t.text :message
      t.integer :lobby_id
      t.integer :user_id
      t.timestamps
    end
  end
end
