class HomeController < ApplicationController

  def home
    @user = current_user
    if @user
      if @user.projects.length > 0
        redirect_to @user
      else

      end
    end
  end


end
