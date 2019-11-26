class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      return true
    end

    def edit?
      record.user == user
    end

    def update?
      record.user == user
    end

  end
end
