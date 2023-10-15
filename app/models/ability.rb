class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Group do |group|
      group.user == user
    end

    can :manage, Expense do |expense|
      expense.user == user
    end

    can [:create, :read], Group
    can [:create, :read], Expense
  end
end

