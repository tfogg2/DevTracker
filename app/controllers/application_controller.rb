class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def after_sign_in_path_for(user)
    # If they have this in the session, make them join the project, then send them there
    if session[:join_project_id]
      # Find the project
      project = Project.find(session[:join_project_id])

      # Join it
      user.join_project!(project)
      session[:join_project_id] = nil

      # Now send them there!
      project_path(project)
    else
      # If not, send them to the normal user path
      user_path(user)
    end
  end

  def after_sign_up_path_for(user)
    # If they have this in the session, make them join the project, then send them there
    if session[:join_project_id]
      # Find the project
      project = Project.find(session[:join_project_id])

      # Join it
      user.join_project!(project)
      session[:join_project_id] = nil

      # Now send them there!
      project_path(project)
    else
      # If not, send them to the normal user path
      user_path(user)
    end
  end
end
