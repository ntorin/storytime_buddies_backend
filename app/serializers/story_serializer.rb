class StorySerializer < ActiveModel::Serializer
  attributes :id, :name, :author_id, :passage, :editing, :completed, :likes
end
