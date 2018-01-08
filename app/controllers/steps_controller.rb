class StepsController < ApplicationController
  before_action :set_project
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  def index
    @steps = @project.steps.all
  end

  def show
  end

  def new
    @step = @project.steps.new
  end

  def edit
  end

  def create
    @step = @project.steps.new(step_params)

    respond_to do |format|
      if @step.save
        format.html { redirect_to project_path(@project), notice: 'Step was successfully created.' }
        format.json { render :show, status: :created, location: @step }
      else
        format.html { redirect_to project_path(@project), notice: 'Step was successfully created.' }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to project_path(@project), notice: 'Step was successfully updated.' }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @step.destroy
    respond_to do |format|
      format.html { redirect_to project_path(@project), notice: 'Step was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def set_step
    @step = @project.steps.find(params[:step_id] || params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def step_params
    params.require(:step).permit(:title, :hours, :status, :description)
  end
end
