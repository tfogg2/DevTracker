class JobsTableToProjectsTable < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :jobs, :projects
  end

  def self.down
    rename_table :projects, :jobs
  end
end
