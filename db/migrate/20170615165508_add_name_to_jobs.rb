class AddNameToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :name, :string
    add_column :jobs, :description, :string
  end
end
