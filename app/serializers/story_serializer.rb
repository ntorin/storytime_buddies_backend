class StorySerializer < ActiveModel::Serializer
  attributes :id, :name, :author_id, :passage, :editing, :completed, :likes, :views, :created_at, :updated_at
end
