class Project < ApplicationRecord
	# belongs_to :user
	
	has_many :users, through: :user_projects
	has_many :steps, dependent: :destroy
	before_create :set_name
	# before_filter :secure_random


	def completed_hours
		hours = self.steps.where(status:"completed").sum(&:hours)
	end

	def total_hours
		hours = self.steps.sum(&:hours)
	end

	def set_name
		if name.blank?
			self.name = "Ex. Project Name"
		end
	end

	def secure_random
		SecureRandom.hex(13)
	end


end
