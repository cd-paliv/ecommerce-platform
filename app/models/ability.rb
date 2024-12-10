class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    user.admin? ? can(:manage, :all) : user.manager? ? (can(:manage, :all) && cannot(:manage, User, role: "admin")) : user.employee? ? (can(:manage, Sale) && can(:manage, Product)) : nil

    can :read, Product
  end
end
