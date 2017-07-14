class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id

  # These helper methods will help us determine what type of user
  # this is for a specific project (ex. current_user.user_type_for(@project))
  def user_type_for?(project = nil)
    return nil unless project

    user_project = user_projects.find_by_project_id(project.id)

    user_project ? user_project.user_type : nil
  end

  def client_for?(project = nil)
    user_type_for?(project) == 'client'
  end

  def developer_for?(project = nil)
    user_type_for?(project) == 'developer'
  end

  def join_project!(project = nil, user_type = 'client')
    return nil unless project

    user_projects.create(project_id: project.id, user_type: user_type)
  end
end
