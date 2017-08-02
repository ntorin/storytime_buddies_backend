class ChatMessageSerializer < ActiveModel::Serializer
  attributes :id, :message, :sender_id, :recipient_id
end
