class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


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

  def configure_permitted_parameters
   added_attrs = [ :email, :password, :password_confirmation, :remember_me, :name]
   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def signed_user_id
    @signed_user_id ||= crypt.encrypt_and_sign(current_user.id) if current_user
  end

  def crypt
    @crypt ||= ActiveSupport::MessageEncryptor.new(
      Rails.application.secrets.secret_key_base,
    )
  end
end
