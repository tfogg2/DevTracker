module StepsHelper

  def status_label(status)
    label = "Not Started" 
    label = "Completed" if status == 'completed'
    label = "In Progress" if status == 'in_progress'
    label
  end
end
