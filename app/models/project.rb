class Project < ApplicationRecord
	has_many :user_projects, dependent: :destroy
	has_many :users, through: :user_projects, dependent: :destroy
	has_many :steps, dependent: :destroy
	has_many :project_invites
	has_many :conversations, dependent: :destroy

	validates :name, presence: true



	def completed_hours
		steps.where(status: 'completed').sum(&:hours)
	end

	def total_hours
		steps.sum(&:hours)
	end

	def self.search(search)
		if search
			where('name iLIKE ?', "%#{search}%").order("name ASC")
		else
			all
		end
	end

end
