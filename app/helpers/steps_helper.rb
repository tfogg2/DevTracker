module StepsHelper

  def status_label(step)
    label = "Not Started"
    if step.status == 'completed'
      label = "Completed"
    else step.status== 'in_progress'
      label = "In Progress"
    end
    label
  end
end
