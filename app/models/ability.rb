class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    end
    if user.moderator?
      can :read, :all
    end
    if user.user?
    end
  end
end
