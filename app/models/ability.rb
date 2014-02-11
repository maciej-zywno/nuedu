class Ability
  include CanCan::Ability

  def initialize(user)

    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    if user.has_role? :admin
      can :manage, :all
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard              # grant access to the dashboard
    else
      can :read, Course
      can :manage, Course if user.has_role?(:manager, Course)
      can :create, Course if user.has_role?(:teacher)
      can :update, Course, :id => Course.with_role(:moderator, user).pluck(:id)
      can :publish, Course, :id => Course.with_role(:moderator, user).pluck(:id)
      can :draft, Course, :id => Course.with_role(:moderator, user).pluck(:id)
      can :select_categories, Course, :id => Course.with_role(:moderator, user).pluck(:id)
      can :categories, Course, :id => Course.with_role(:moderator, user).pluck(:id)

      can :read, Video if user.has_role?(:teacher)
      can :upload, Video if user.has_role?(:teacher)
      can :create, Video if user.has_role?(:teacher)

      can :save, Video, :id => Video.with_role(:moderator, user).pluck(:id)
      can :update, Video, :id => Video.with_role(:moderator, user).pluck(:id)
      can :destroy, Video, :id => Video.with_role(:moderator, user).pluck(:id)

    end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
