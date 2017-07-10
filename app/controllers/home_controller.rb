class HomeController < ApplicationController
  def home
    redirect_to user_path(current_user) if current_user
    set_meta_tags title: "Freelance Dashboard",
                  keywords: "freelancer, dashboard, projects, client satisfaction, freedash, developer",
                  description: "Manage and share your freelance projects from one simple dashboard. Improve client satisfaction, organize and track your freelance projects"
    # && !current_user.projects.empty?
  end
end
