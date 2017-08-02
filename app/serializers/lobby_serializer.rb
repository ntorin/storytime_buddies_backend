class LobbySerializer < ActiveModel::Serializer
  attributes :id, :name, :has_password, :password, :word_limit, :master_user_id, :members
end
