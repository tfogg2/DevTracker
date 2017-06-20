class Project < ApplicationRecord
	belongs_to :user
	has_many :steps, dependent: :destroy
	before_create :set_name



	def completed_hours
		hours = self.steps.where(status:"completed").sum(&:hours)
	end

	def total_hours
		hours = self.steps.sum(&:hours)
	end

	def set_name
		if ! name
			self.name = "Project Name"
		end
	end


end
