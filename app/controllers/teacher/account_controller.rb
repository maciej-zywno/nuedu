module Teacher
  class AccountController < ApplicationController
    def show
      if current_user && (current_user.has_role? :teacher)
        @courses = Course.with_role(:moderator, current_user)
        puts "courses #{@courses.count}"
        puts current_user.inspect
        @videos = Video.with_role(:moderator, current_user)
      else
        redirect_to root_path, notice: 'Unauthorized'
      end
    end

  end
end

