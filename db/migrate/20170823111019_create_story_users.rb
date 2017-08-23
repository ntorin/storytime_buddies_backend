class CreateStoryUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :story_users do |t|
      t.belongs_to :story, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
