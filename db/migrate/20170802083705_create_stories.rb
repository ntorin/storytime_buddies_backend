class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :name
      t.integer :author_id
      t.text :passage
      t.boolean :editing
      t.boolean :completed
      t.integer :likes
      t.integer :views

      t.timestamps
    end
  end
end
