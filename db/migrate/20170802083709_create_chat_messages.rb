class CreateChatMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_messages do |t|
      t.text :message
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
