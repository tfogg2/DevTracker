class ConversationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project

    def index
      # @conversation = @project.conversations.new
      # @conversation = @project.conversations.find_by(conversation_params)
      @conversation = @project.conversations.all
      # @user_projects.each do |p|
      #   find_or_create_conversation(p)
      # end
    end

    def new
      @conversation = @project.conversations.new
    end

    def create
      @conversation = @project.conversations.new(conversation_params)
      if @conversation.save
        respond_to do |format|
          format.html { redirect_to @project }
          format.js
        end
      else

      end
    end

    def show
      # @projects = current_user.projects.all
      @projects = current_user.projects.search(params[:search])
      @conversation = @project.conversations.find_by(project_id: params[:project_id])
      @message = Message.new
      @skip_footer = true
    end
    #  redirect_to conversation_messages_path(@conversation)
    def set_project
      @project = current_user.projects.find(params[:project_id] || params[:id])
    end

    private
      def conversation_params
        params.require(:conversation).permit(:project_id)
      end
end
