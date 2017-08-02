json.extract! lobby, :id, :name, :has_password, :password, :word_limit, :master_user_id, :members, :created_at, :updated_at
json.url lobby_url(lobby, format: :json)
