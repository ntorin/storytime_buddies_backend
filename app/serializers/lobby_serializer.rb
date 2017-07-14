class LobbySerializer < ActiveModel::Serializer
  attributes :id, :password, :word_limit, :master_user_id, :members
end
