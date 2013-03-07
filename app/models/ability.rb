class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read,:show], Profile
    can [:edit, :update, :delete], Profile, :user_id => user.id
  end
end
