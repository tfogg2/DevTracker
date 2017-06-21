class ProjectInvitesController < ApplicationController
  before_action :set_project, except: [:join]

  def new
    @invite = @project.project_invites.new
  end

  def show
    # @project = current_user.projects.find(params[:project_id])

  end

  def join
    redirect_to new_user_registration_path if !current_user

  end

  def create
    # @project = current_user.projects.find(params[:project_id])
    @invite = @project.project_invites.new(invite_params)

    respond_to do |format|
      if @invite.save
        format.html { redirect_to invite_path(@invite), notice: 'Invite successfully created.' }
        format.json { render :show, status: :created, location: @invite }
      else
        format.html { redirect_to invite_path(@invite), notice: 'Invite successfully created.' }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end

  end

  def set_project
    redirect_to new_user_registration_path if !current_user
    @project = current_user.projects.find(params[:project_id] || params[:id])
  end

  def invite_params
    params.require(:project_invite).permit(:share_token, :email, :project_id)
  end


end
