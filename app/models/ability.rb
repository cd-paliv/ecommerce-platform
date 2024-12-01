# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, :all
    # if user.admin?
    #   can :manage, :all
    # elsif user.manager?
    #   can :manage, :all
    #   cannot :manage, User, role: "admin"
    # elsif user.employee?
    #   can :manage, Sale
    #   can :manage, Product
    # end
    # can :read, Product
    # can :read, Category
  end
end
