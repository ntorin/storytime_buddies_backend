class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :name
      t.text :passage
      t.boolean :editing
      t.boolean :completed
      t.integer :likes

      t.timestamps
    end
  end
end
