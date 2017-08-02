class AddStatsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :stories_started, :integer
    add_column :users, :stories_joined, :integer
    add_column :users, :library_comments, :integer
    add_column :users, :total_story_views, :integer
    add_column :users, :total_friends, :integer
    add_column :users, :total_profile_views, :integer
  end
end
