class CreateLobbyUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :lobby_users do |t|
      t.belongs_to :lobby, index: true
      t.belongs_to :user, index: true
      t.string :username

      t.timestamps
    end
  end
end
