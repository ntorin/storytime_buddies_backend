json.extract! lobby_message, :id, :message, :lobby_id, :user_id, :created_at, :updated_at
json.url lobby_message_url(lobby_message, format: :json)
