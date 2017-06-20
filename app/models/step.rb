class Step < ApplicationRecord
  belongs_to :project
  before_create :set_status, :set_hours
  #STATUSES = ['Not Started', 'In Progress', 'Completed']
  STATUSES = ['not_started', 'in_progress', 'completed']

  validates :status, inclusion: {in: STATUSES}


  def set_status
    if ! status
      self.status = "not_started"
    end
	end

  def set_hours
    if ! hours
      self.hours = 0
    end
  end


end
