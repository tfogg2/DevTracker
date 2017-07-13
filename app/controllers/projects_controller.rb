class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects.all
  end

  def show
    @conversations = @project.conversations.all
    @message = Message.new

    set_meta_tags keywords: "projects, freelance, developer, freelance developer, freelance projects",
                  description: "Add steps to your freelance projects and let your client track your progress."
  end

  def new
    @project = current_user.projects.new
  end

  def edit
    @step = @project.steps.new
  end

  def create
    @project = current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save

        # HACK! TODO: Fix this, why is this needed........
        @project.user_projects.create(
          user: current_user,
          user_type: 'developer'
        )
        # @project.conversations.create(
        #   project_id: @project.id
        # )

        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Project was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project

    @project = current_user.projects.find(params[:project_id] || params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:hours, :name, :description)
  end
end
