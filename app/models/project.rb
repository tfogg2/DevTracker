class Project < ApplicationRecord
	belongs_to :user
	has_many :steps, dependent: :destroy



	def completed_hours
		hours = self.steps.where(status:"completed").sum(&:hours)
	end

	def total_hours
		hours = self.steps.sum(&:hours)
	end


end
