class AddUsernameToLobbyComments < ActiveRecord::Migration[5.0]
  def change
    add_column :lobby_comments, :username, :string
  end
end
