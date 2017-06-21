class Step < ApplicationRecord
  belongs_to :project
  before_create :set_status, :set_hours

  validates :status, inclusion: { in: statuses }

  def set_status
    self.status = 'not_started' if status.blank?
  end

  def set_hours
    self.hours = 0 if hours.empty?
  end

  def self.statuses
    %w(not_started in_progress completed)
  end
end
