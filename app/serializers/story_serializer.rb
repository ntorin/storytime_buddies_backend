class StorySerializer < ActiveModel::Serializer
  attributes :id, :name, :passage, :editing, :completed, :likes
end
