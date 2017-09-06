class ChatMessageSerializer < ActiveModel::Serializer
  attributes :id, :message, :sender_id, :recipient_id, :connection_id, :username, :created_at, :updated_at
end
