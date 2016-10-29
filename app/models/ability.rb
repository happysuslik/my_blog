class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, Publication
      can :create, Publication
      can :edit, Publication
      can :update, Publication
    end
  end
end
