class Project < ApplicationRecord
	# belongs_to :user
	has_many :user_projects, dependent: :destroy
	has_many :users, through: :user_projects, dependent: :destroy
	has_many :steps, dependent: :destroy
	before_create :set_name
	validates :share_token, presence: true
	validates :share_token, uniqueness: true
	before_validation :generate_token, on: :create
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

	def generate_token
		begin
			self.share_token = SecureRandom.hex(13)
		end while self.class.find_by(share_token: share_token)
	end

	def to_param
		share_token
	end


end
