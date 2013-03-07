class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Profile, :user_id => user.id
  end
end
