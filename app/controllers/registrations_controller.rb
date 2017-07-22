class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for # (@user)
    project_path(@project) if session[:join_project_id].exists?
  end


end
