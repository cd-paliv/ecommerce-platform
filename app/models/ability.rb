# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.manager?
      can :manage, :all
      cannot :manage, User, role: "admin"
    elsif user.employee?
      can :read, Product
      # can :manage, Sale
    end
  end
end
