json.extract! story, :id, :name, :author_id, :passage, :editing, :completed, :likes, :views, :created_at, :updated_at
json.url story_url(story, format: :json)
