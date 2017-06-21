class UserProject < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates_presence_of :user_id, :project_id
  validates :user_type, inclusion: { in: %w(developer client) }, :allow_nil => true
  validates_uniqueness_of :user_id, scope: [:project_id]

  def users
    UserProject.where(project: project)
  end
end
