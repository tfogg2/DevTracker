class RemoveStepsFromJobs < ActiveRecord::Migration[5.1]
  def change
  	remove_column :jobs, :steps, :string
  end
end
