class ProjectInvitesController < ApplicationController
  before_action :set_project, only: [:new]
  before_action :find_invite, only: [:join]

  def new
    # We need to actually create one each time so the token is stored
    # in the db and we can use it later
    @invite = @project.project_invites.create(email: 'test')
  end

  def join
    #session[:join_project_id] = @project.id
    # First, find the project...
    @project = @invite.project
    # If there is a current user, check if they are the developer
    if current_user
      # There is a current user already, we either want them to join our project
      # or if they are the developer or client, we do nothing. Obviously.
      if current_user.user_type_for?(@project) # (this will either be developer or client if they have access)
        redirect_to project_path(@project), notice: 'You already have access to this project!'

      elsif current_user.join_project!(@project)
        # If not, let them join the project and redirect them there!
        redirect_to project_path(@project), success: 'You have successfully joined this project!'
      end
    else
      # We have no current user so save this project_id for later
      session[:join_project_id] = @project.id
      redirect_to new_user_registration_path, notice: 'Please signup or login'
    end
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id] || params[:id])
  end

  def find_invite
    # If we have no param to look it up by, redirect
    redirect_to new_user_registration_path and return if params[:t].blank?
    # Find the invite
    @invite = ProjectInvite.find_by_share_token(params[:t])
    # If we don't an invite... (aka invalid params[:t]) redirect
    redirect_to new_user_registration_path and return unless @invite
  end
end
