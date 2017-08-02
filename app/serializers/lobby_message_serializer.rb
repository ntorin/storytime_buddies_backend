class LobbyMessageSerializer < ActiveModel::Serializer
  attributes :id, :message, :lobby_id, :user_id
end
