class StorySerializer < ActiveModel::Serializer
  attributes :id, :name, :author_id, :passage, :editing, :completed, :views, :likes, :created_at, :updated_at
end
