class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable

  include DeviseTokenAuth::Concerns::User

  enum role: [:user, :moderator, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  has_many :lobbies, :through => :lobby_users
  has_many :stories, :through => :story_users
  has_many :friends, :class_name => 'User', :through => :user_users

end
