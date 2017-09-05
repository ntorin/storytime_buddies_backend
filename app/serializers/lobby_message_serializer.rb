class LobbyMessageSerializer < ActiveModel::Serializer
  attributes :id, :username, :message, :lobby_id, :user_id
end
