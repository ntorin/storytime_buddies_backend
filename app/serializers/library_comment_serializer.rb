class LibraryCommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :likes, :story_id, :user_id
end
