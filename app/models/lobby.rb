class Lobby < ApplicationRecord
  has_many :users, :through => :lobby_users
end
