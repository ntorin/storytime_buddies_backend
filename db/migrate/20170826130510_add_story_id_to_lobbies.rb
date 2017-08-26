class AddStoryIdToLobbies < ActiveRecord::Migration[5.0]
  def change
    add_column :lobbies, :story_id, :integer
  end
end
