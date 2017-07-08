class HomeController < ApplicationController
  def home
    redirect_to user_path(current_user) if current_user
    set_meta_tags keywords: "freelancer, dashboard, projects, client satisfaction",
                  description: "Manage and share your freelance projects from one simple dashboard. Improve client satisfaction, organize and track your freelance projects"
    # && !current_user.projects.empty?
  end
end
