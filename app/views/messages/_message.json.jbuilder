json.extract! message, :id, :message, :lobby_id, :user_id, :created_at, :updated_at
json.url message_url(message, format: :json)
