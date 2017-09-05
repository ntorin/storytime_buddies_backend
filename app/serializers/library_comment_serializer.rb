class LibraryCommentSerializer < ActiveModel::Serializer
  attributes :id, :username, :comment, :likes, :story_id, :user_id
end
