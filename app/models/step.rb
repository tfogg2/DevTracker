class Step < ApplicationRecord
  belongs_to :project
  before_create :set_status
  STATUSES = ['Not Started', 'In Progress', 'Completed']

  validates :status, inclusion: {in: STATUSES}


  def set_status
    if ! status
      self.status = "not_started"
    end
	end


end
