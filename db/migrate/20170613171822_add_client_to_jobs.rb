class AddClientToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :client, :string
    add_column :jobs, :time, :integer
  end
end
