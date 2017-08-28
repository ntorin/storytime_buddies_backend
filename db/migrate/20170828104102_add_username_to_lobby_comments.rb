class AddUsernameToLobbyMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :lobby_messages, :username, :string
  end
end
