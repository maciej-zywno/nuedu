module Teacher
  class AccountController < ApplicationController

    def show
      @courses = Course.with_role(:moderator, current_user)
      # @videos = Video.with_role(:moderator, current_user)
      @videos = Video.all
    end

  end
end
