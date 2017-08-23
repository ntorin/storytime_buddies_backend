class Story < ApplicationRecord
  has_many :users, :through => :story_users
end
