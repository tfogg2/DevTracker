class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects, dependent: :destroy

  # These helper methods will help us determine what type of user
  # this is for a specific project (ex. current_user.user_type_for(@project))
  def user_type_for?(project = nil)
    return nil if !project

    user_project = user_projects.find(project_id: project.id)

    user_project ? user_project.user_type : nil
  end

  def is_client_for?(project = nil)
    user_type_for?(project) == 'client'
  end

  def is_developer_for?(project = nil)
    user_type_for?(project) == 'developer'
  end
end
