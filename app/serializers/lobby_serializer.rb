class LobbySerializer < ActiveModel::Serializer
  attributes :id, :name, :story_id, :has_password, :password, :word_limit, :master_user_id, :members
end
