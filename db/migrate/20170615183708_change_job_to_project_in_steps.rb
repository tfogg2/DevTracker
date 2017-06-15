class ChangeJobToProjectInSteps < ActiveRecord::Migration[5.1]
  def change
    rename_column :steps, :job_id, :project_id
    
  end
end
