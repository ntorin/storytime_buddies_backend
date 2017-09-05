class CreateUserUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :friend, class_name: 'User', index: true
      t.string :username
      t.string :friendname

      t.timestamps
    end
  end
end
