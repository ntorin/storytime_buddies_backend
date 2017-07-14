class CreateJoinTableUserLobby < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :lobbies do |t|
      # t.index [:user_id, :lobby_id]
      # t.index [:lobby_id, :user_id]
    end
  end
end
