class Step < ApplicationRecord
  belongs_to :project
  before_create :set_status


  def set_status
    if ! status
      self.status = "not_started"
    end
	end
end
